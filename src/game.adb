with Gdk.Types;                  use Gdk.Types;
with Gdk.Types.Keysyms;          use Gdk.Types.Keysyms;
with Ada.Real_Time; use Ada.Real_Time;
with Gtk.Main;
with Gdk; use Gdk;
with Glib; use Glib;
with Ada.Numerics;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Text_IO; use Ada.Text_IO;

package body game is
   use submarine;
   package Elem_Fun_Float is new Ada.Numerics.Generic_Elementary_Functions (Float);
   use Elem_Fun_Float;

   package rand is new Ada.Numerics.Discrete_Random (Table_Range_1D_t);
   seed : rand.Generator;

   -- obsluga klawiatury
   function OnKeyPress (Ent   : access GObject_Record'Class;
                        Event : Gdk_Event_Key) return Boolean is
      pragma Unreferenced (Ent);
   begin
      if Event.Keyval = GDK_KP_Down
        or else Event.Keyval = GDK_Down
        or else Event.Keyval = GDK_LC_s
      then
         Game_Control.DecreaseSubmarineSpeed;
      elsif Event.Keyval = GDK_KP_Up
        or else Event.Keyval = GDK_Up
        or else Event.Keyval = GDK_LC_w
      then
         Game_Control.IncreaseSubmarineSpeed;
      elsif Event.Keyval = GDK_KP_Right
        or else Event.Keyval = GDK_Right
        or else Event.Keyval = GDK_LC_d
      then
         Game_Control.IncreaseSubmarineCourseValue;
      elsif Event.Keyval = GDK_KP_Left
        or else Event.Keyval = GDK_Left
        or else Event.Keyval = GDK_LC_a
      then
         Game_Control.DecreaceSubmarineCourseValue;
      elsif Event.Keyval = GDK_LC_r then
         Game_Control.Reset;
      end if;

      return False;
   end OnKeyPress;

   procedure Draw_compas (Cr : Cairo.Cairo_Context; dlugosc_strzalki : Float) is
      begin
      Cairo.Move_To (Cr, Gdouble (Float(Column_t'Range_Length) + 50.0 + 80.0 + 30.0 + dlugosc_strzalki * Sin(Float(Submarine_Course), Cycle => 360.0)), Gdouble (0.1*Float(Row_t'Range_Length) + 60.0 - dlugosc_strzalki * Cos(Float(Submarine_Course), Cycle => 360.0)));
      Cairo.Line_To(Cr, Gdouble (Column_t'Range_Length + 50 + 80 + 30), Gdouble (0.1*Row_t'Range_Length + 60.0));
      Cairo.Stroke(Cr => Cr);

      Cairo.Move_To (Cr, Gdouble(Float(Column_t'Range_Length) + 50.0 + 80.0 + 30.0 - 5.0 + (dlugosc_strzalki + 15.0) * Sin(0.0, Cycle => 360.0)), Gdouble (0.1*Float(Row_t'Range_Length) + 60.0 - (dlugosc_strzalki + 15.0) * Cos(Float(0), Cycle => 360.0)));
      Cairo.Set_Font_Size (Cr, Gdouble(15));
      Cairo.Show_Text (Cr, "N");

      Cairo.Move_To (Cr, Gdouble(Float(Column_t'Range_Length) + 50.0 + 80.0 + 30.0 - 5.0 + (dlugosc_strzalki + 15.0) * Sin(45.0, Cycle => 360.0)), Gdouble (0.1*Float(Row_t'Range_Length) + 60.0 - (dlugosc_strzalki + 15.0) * Cos(Float(45), Cycle => 360.0)));
      Cairo.Set_Font_Size (Cr, Gdouble(10));
      Cairo.Show_Text (Cr, "NE");

      Cairo.Move_To (Cr, Gdouble(Float(Column_t'Range_Length) + 50.0 + 80.0 + 30.0 - 5.0 + (dlugosc_strzalki + 15.0) * Sin(90.0, Cycle => 360.0)), Gdouble (0.1*Float(Row_t'Range_Length) + 60.0 - (dlugosc_strzalki + 15.0) * Cos(Float(90), Cycle => 360.0)));
      Cairo.Set_Font_Size (Cr, Gdouble(15));
      Cairo.Show_Text (Cr, "E");

      Cairo.Move_To (Cr, Gdouble(Float(Column_t'Range_Length) + 50.0 + 80.0 + 30.0 - 5.0 + (dlugosc_strzalki + 15.0) * Sin(135.0, Cycle => 360.0)), Gdouble (0.1*Float(Row_t'Range_Length) + 60.0 - (dlugosc_strzalki + 15.0) * Cos(Float(135), Cycle => 360.0)));
      Cairo.Set_Font_Size (Cr, Gdouble(10));
      Cairo.Show_Text (Cr, "SE");

      Cairo.Move_To (Cr, Gdouble(Float(Column_t'Range_Length) + 50.0 + 80.0 + 30.0 - 5.0 + (dlugosc_strzalki + 15.0) * Sin(180.0, Cycle => 360.0)), Gdouble (0.1*Float(Row_t'Range_Length) + 60.0 - (dlugosc_strzalki + 15.0) * Cos(Float(180), Cycle => 360.0)));
      Cairo.Set_Font_Size (Cr, Gdouble(15));
      Cairo.Show_Text (Cr, "S");

      Cairo.Move_To (Cr, Gdouble(Float(Column_t'Range_Length) + 50.0 + 80.0 + 30.0 - 5.0 + (dlugosc_strzalki + 15.0) * Sin(225.0, Cycle => 360.0)), Gdouble (0.1*Float(Row_t'Range_Length) + 60.0 - (dlugosc_strzalki + 15.0) * Cos(Float(225), Cycle => 360.0)));
      Cairo.Set_Font_Size (Cr, Gdouble(10));
      Cairo.Show_Text (Cr, "SW");

      Cairo.Move_To (Cr, Gdouble(Float(Column_t'Range_Length) + 50.0 + 80.0 + 30.0 - 5.0 + (dlugosc_strzalki + 15.0) * Sin(270.0, Cycle => 360.0)), Gdouble (0.1*Float(Row_t'Range_Length) + 60.0 - (dlugosc_strzalki + 15.0) * Cos(Float(270), Cycle => 360.0)));
      Cairo.Set_Font_Size (Cr, Gdouble(15));
      Cairo.Show_Text (Cr, "W");

      Cairo.Move_To (Cr, Gdouble(Float(Column_t'Range_Length) + 50.0 + 80.0 + 30.0 - 5.0 + (dlugosc_strzalki + 15.0) * Sin(315.0, Cycle => 360.0)), Gdouble (0.1*Float(Row_t'Range_Length) + 60.0 - (dlugosc_strzalki + 15.0) * Cos(Float(315), Cycle => 360.0)));
      Cairo.Set_Font_Size (Cr, Gdouble(10));
      Cairo.Show_Text (Cr, "NW");

      end Draw_compas;

   procedure Draw_speed(Cr : Cairo.Cairo_Context) is
      real_speed : Float := CalculateRealSpeedFromVelocity;
   begin
      Cairo.Set_Font_Size (Cr, Gdouble(20));
      Cairo.Move_To (Cr, Gdouble (Column_t'Range_Length + 15), Gdouble (0.28*Row_t'Range_Length));
      Cairo.Show_Text (Cr, "PREDKOSC");

      Cairo.Rectangle (Cr => Cr, X=> Gdouble(Column_t'Range_Length + 50), Y => Gdouble (0.3*Row_t'Range_Length), width => Gdouble (40), Height => Gdouble(3*40));
      Cairo.Set_Source_Rgb (Cr, 0.0, 0.0, 115.0/255.0);
      Cairo.Fill(Cr);

      if Submarine_Speed = FULL then
         Cairo.Set_Source_Rgb (Cr, 1.0, 1.0, 224.0/255.0);
         Cairo.Rectangle(Cr => Cr, X=> Gdouble(Column_t'Range_Length + 20 - 6), Y => Gdouble (0.3*Row_t'Range_Length)-12.0, width => Gdouble (24), Height => Gdouble(24));
         Cairo.Fill(Cr);
         Cairo.Set_Source_Rgb (Cr, 0.0, 0.0, 115.0/255.0);

      end if;

      Cairo.Move_To(Cr, Gdouble(Column_t'Range_Length + 20), Gdouble (0.3*Row_t'Range_Length) + 8.0);
      Cairo.Show_Text (Cr, "2");

      if Submarine_Speed = HALF then
         Cairo.Set_Source_Rgb (Cr, 1.0, 1.0, 224.0/255.0);
         Cairo.Rectangle(Cr => Cr, X=> Gdouble(Column_t'Range_Length + 20 - 6), Y => Gdouble (0.3*Row_t'Range_Length)-12.0 + 40.0, width => Gdouble (24), Height => Gdouble(24));
         Cairo.Fill(Cr);
         Cairo.Set_Source_Rgb (Cr, 0.0, 0.0, 115.0/255.0);

      end if;

      Cairo.Move_To(Cr, Gdouble(Column_t'Range_Length + 20), Gdouble (0.3*Row_t'Range_Length) + 8.0 + 40.0);
      Cairo.Show_Text (Cr, "1");

      if Submarine_Speed = STOP then
         Cairo.Set_Source_Rgb (Cr, 1.0, 1.0, 224.0/255.0);
         Cairo.Rectangle(Cr => Cr, X=> Gdouble(Column_t'Range_Length + 20 - 6), Y => Gdouble (0.3*Row_t'Range_Length)-12.0 + 2.0 * 40.0, width => Gdouble (24), Height => Gdouble(24));
         Cairo.Fill(Cr);
         Cairo.Set_Source_Rgb (Cr, 0.0, 0.0, 115.0/255.0);

      end if;

      Cairo.Move_To(Cr, Gdouble(Column_t'Range_Length + 20), Gdouble (0.3*Row_t'Range_Length) + 8.0 + 2.0 * 40.0);
      Cairo.Show_Text (Cr, "0");

      if Submarine_Speed = GOBACK then
         Cairo.Set_Source_Rgb (Cr, 1.0, 1.0, 224.0/255.0);
         Cairo.Rectangle(Cr => Cr, X=> Gdouble(Column_t'Range_Length + 20 - 6), Y => Gdouble (0.3*Row_t'Range_Length)-12.0 + 3.0 * 40.0, width => Gdouble (24), Height => Gdouble(24));
         Cairo.Fill(Cr);
         Cairo.Set_Source_Rgb (Cr, 0.0, 0.0, 115.0/255.0);

      end if;

      Cairo.Move_To(Cr, Gdouble(Column_t'Range_Length + 20), Gdouble (0.3*Row_t'Range_Length) + 8.0 + 3.0 * 40.0);
      Cairo.Show_Text (Cr, "R");

      case Submarine_Speed is
         when GOBACK =>
            Submarine_goback_zero := True;
            if Submarine_straight_zero and real_speed > 0.0 then
               Cairo.Rectangle(Cr => Cr, X=> Gdouble(Column_t'Range_Length + 50), Y => Gdouble (0.3*Row_t'Range_Length) + 2.0 * 40.0, width => Gdouble (40), Height => Gdouble (-abs(real_speed/(Submarine_k * 2.0) * 80.0)));
               Put_Line("Kuku");
            elsif real_speed < 0.0 then
               Submarine_straight_zero := False;
               Put_Line("Wyzerowalem!");
            else

               Cairo.Rectangle(Cr => Cr, X=> Gdouble(Column_t'Range_Length + 50), Y => Gdouble (0.3*Row_t'Range_Length) + 2.0 * 40.0, width => Gdouble (40), Height => Gdouble (abs(real_speed/(Submarine_k * 2.0) * 80.0)));

            end if;

         when others =>
            if Submarine_Speed = HALF then
               Submarine_straight_zero := True;
            end if;

            if Submarine_goback_zero and real_speed > 0.0 then
               Cairo.Rectangle(Cr => Cr, X=> Gdouble(Column_t'Range_Length + 50), Y => Gdouble (0.3*Row_t'Range_Length) + 2.0 * 40.0, width => Gdouble (40), Height => Gdouble (abs(real_speed/(Submarine_k * 2.0) * 80.0)));

            elsif real_speed = 0.0 then
               Submarine_goback_zero := False;
               Submarine_straight_zero := False;
            else
               Cairo.Rectangle(Cr => Cr, X=> Gdouble(Column_t'Range_Length + 50), Y => Gdouble (0.3*Row_t'Range_Length) + 2.0 * 40.0, width => Gdouble (40), Height => Gdouble (-abs(real_speed/(Submarine_k * 2.0) * 80.0)));

            end if;


      end case;

   end Draw_speed;

   function OnDraw (Self : access Gtk_Widget_Record'Class;
                    Cr   : Cairo.Cairo_Context) return Boolean is
      pragma Unreferenced (Self);
      x : Integer;
      y : Integer;
      dlugosc_strzalki : Float := 30.0;
   begin
      --czyszczenie powierzchni
      Set_Source_Rgb(Cr, 0.0, 191.0/255.0, 1.0);
      Cairo.Paint(Cr);

      --rysowanie wybrzeza (obrzeza)
      Set_Source_Rgb(Cr, 1.0, 1.0, 224.0/255.0);
      for r in Row_t'Range
      loop
         for c in Column_t'Range
         loop
            x := Integer(c);
            y := Integer(r);
            if Board(PositionToLinear((y, x))).p_state = COAST then
               Cairo.Rectangle (Cr => Cr, X => Gdouble(x-1), Y => Gdouble(y-1),
                                Width => Gdouble(1), Height => Gdouble (1));
               Cairo.Fill (Cr);
            --elsif Board(PositionToLinear((y,x))).p_state = OBSTACLE then
            --   Cairo.Rectangle (Cr => Cr, X => Gdouble(x-1), Y => Gdouble(y-1),
            --                    Width => Gdouble(1), Height => Gdouble (1));
            --   Cairo.Fill (Cr);
            end if;

         end loop;
      end loop;

      --rysowanie_wskaznika
      Cairo.Set_Font_Size (Cr, Gdouble(20));
      Cairo.Move_To (Cr, Gdouble (Column_t'Range_Length + 50), Gdouble (Row_t'Range_Length/20));
      Cairo.Show_Text (Cr, "PARAMETRY OKRETU");

      --Cairo.Set_Font_Size (Cr, Gdouble(15));
      Cairo.Move_To (Cr, Gdouble (Column_t'Range_Length + 50 + 80), Gdouble (0.1*Row_t'Range_Length));
      Cairo.Show_Text (Cr, "KURS");

      Draw_compas(Cr, dlugosc_strzalki);

      Draw_speed(Cr);



      if Game_Control.IsLost or Game_Control.IsWon then
         Cairo.Set_Font_Size (Cr, Gdouble(50));
         Cairo.Move_To (Cr, Gdouble (Column_t'Range_Length/2), Gdouble (Row_t'Range_Length/2));
         if game_control.IsLost then
            Cairo.Show_Text (Cr, "GAME OVER");
         else
            Cairo.Show_Text (Cr, "! YOU WON !");
         end if;
         return False;
      end if;

      --draw submarine (and obstacles)

      Cairo.Rectangle (Cr => Cr, X => Gdouble(Submarine_Position.column - 1),
                       Y => Gdouble(Submarine_Position.row - 1), Width => Gdouble(10),
                       Height => Gdouble(10));
      Set_Source_Rgb(Cr, 1.0, 0.0, 0.0);
      Cairo.Fill(Cr);

      return False;
   end OnDraw;

   protected body Game_Control_t is
      procedure Start is
      begin
         started := True;
      end Start;

      function IsStarted return Boolean is
      begin
         return started;
      end IsStarted;

      --function IsMenu return Boolean is
      --begin
      --   return menu;
      --end IsMenu;

      --- serialize access to out SPARK implementation
      procedure DoTick is
      begin
         game_spark.submarine.DoTick;
      end DoTick;

      procedure Reset is
      begin
         game_spark.submarine.Reset;
      end Reset;

      function IsWon return Boolean is
      begin
         return game_spark.submarine.IsWon;
      end IsWon;

      function IsLost return Boolean is
      begin
         return game_spark.submarine.IsLost;
      end IsLost;

      procedure SetSubmarineCourse (new_course : submarine.Course_t) is
      begin
         game_spark.submarine.SetSubmarineCourse(new_course);
      end SetSubmarineCourse;

      procedure DecreaseSubmarineSpeed is
      begin
         game_spark.submarine.DecreaseSubmarineSpeed;
      end DecreaseSubmarineSpeed;

      procedure IncreaseSubmarineSpeed is
      begin
         game_spark.submarine.IncreaseSubmarineSpeed;
      end IncreaseSubmarineSpeed;

      procedure IncreaseSubmarineCourseValue is
      begin
         game_spark.submarine.IncreaseSubmarineCourseValue;
      end IncreaseSubmarineCourseValue;

      procedure DecreaceSubmarineCourseValue is
      begin
         game_spark.submarine.DecreaceSubmarineCourseValue;
      end DecreaceSubmarineCourseValue;

   end Game_Control_t;

   task body Game_Task is
      next : Time := Clock;
   begin
      Reset;

      loop
         next := next + Milliseconds (100);
         delay until next;
         if Game_Control.IsStarted then
            DoTick;
         --elsif Game_Control.IsMenu then
         --   DoMenu;
         else Put_Line("IsStarted sie wylaczylo");
         end if;

      end loop;
   end Game_Task;

   function TriggerRedraw return Boolean is
   begin
      Draw.Queue_Draw;
      return True;
   end TriggerRedraw;

   function GameControl return game_control_a is
   begin
      return Game_Control'Unchecked_Access;
   end GameControl;

end game;
