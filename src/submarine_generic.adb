with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Text_IO; use Ada.Text_IO;
package body submarine_generic with SPARK_Mode is

    package Elem_Fun_Float is new Ada.Numerics.Generic_Elementary_Functions (Float);
   use Elem_Fun_Float;

   function IsWon return Boolean is
   begin
      return is_won;
   end IsWon;

   function IsLost return Boolean is
   begin
      return is_lost;
   end IsLost;

   function PositionToLinear (row_and_column_position : Position_t) return Table_Range_1D_t is
   begin
      return (row_and_column_position.row -1) * Column_t'Last + row_and_column_position.column;
   end PositionToLinear;

   --procedura przypisujaca pixelom ich wspolrzedne
   procedure SetPixelsOnBoard is
      row : Row_t := Row_t'First;
      col : Column_t := Column_t'First;
   begin
      row := Row_t'First;
      col := Column_t'First;
      for i in Table_Range_1D_t
      loop
         Board(i).p_Position := (row => row, column => col);
         --Put_Line("row: " &row'Img &" col := " &col'Img);
         if col = Column_t'Last then
            col := Column_t'First;
            if row < Row_t'Last then
               row := row + 1;
            end if;
         else
            col := col + 1;
         end if;

      end loop;

   end SetPixelsOnBoard;

   --procedura generujaca ziemie
   procedure SetRandomCoast is
   begin
      for i in Table_Range_1D_t
      loop
         if Board(i).p_Position.row = Row_t'First or
           Board(i).p_Position.row = Row_t'Last or
           Board(i).p_Position.column = Column_t'First or
           Board(i).p_Position.column = Column_t'Last then
            Board(i).p_state := COAST;
         end if;
      end loop;

   end SetRandomCoast;

   procedure SetObstacle is
   begin
      null;
   end SetObstacle;

   --funkcja do obliczania realnej predkosci na podstawie skladowych pionowych i poziomych
   function CalculateRealSpeedFromVelocity return Float is
   begin
      return Sqrt(Submarine_Velocity.vertical_velocity **2 + Submarine_Velocity.horizontal_velocity ** 2);
   end CalculateRealSpeedFromVelocity;

   procedure MoveSubmarine is
      new_row         : Row_t;
      new_column      : Column_t;
      real_new_row    : Float;
      real_new_column : Float;
      warunek_col : Boolean := False;
      warunek_row : Boolean := False;
   begin
      SetSubmarineVelocity;
      real_new_row := Submarine_Position.real_row + Submarine_Velocity.vertical_velocity;
      real_new_column := Submarine_Position.real_column + Submarine_Velocity.horizontal_velocity;

      if real_new_row >= Float(Row_t'Last) then
         real_new_row := Float(Row_t'Last);
         new_row := Row_t'Last;
         Put_Line("Ostatni wiersz");
         warunek_row := True;
      end if;

      if real_new_row < 1.0 then
         real_new_row := 1.0;
         new_row := 1;
         Put_Line("Pierwszy wiersz");
         warunek_row := True;

      end if;

      if real_new_column >= Float(Column_t'Last) then
         real_new_column := Float(Column_t'Last);
         new_column := Column_t'Last;
         Put_Line("Ostatnia kolumna");
         warunek_col := True;
      end if;

      if real_new_column < 1.0 then
         real_new_column := 1.0;
         new_column := 1;
         Put_Line("Pierwsza kolumna");
         warunek_col := True;
      end if;

      if real_new_column >= 1.0 and real_new_column < Float(Column_t'Last) then
         new_column := Column_t(Float'Rounding(real_new_column));
         Put_Line("Kolumna w srodku");
         warunek_col := True;
      end if;

      if real_new_row >= 1.0 and real_new_row < Float(Row_t'Last) then
         new_row := Row_t(Float'Rounding(real_new_row));
         Put_Line("Wiersz w srodku");
           warunek_row := True;
      end if;
      if not warunek_col then
         Put_Line("Cos nie pyklo w movesubmarine kolumna nie trafila w nic");
      end if;

      if not warunek_row then
         Put_Line("Cos nie pyklo w movesubmarine wiersz nie trafil w nic");
         Put_Line("real_new_row = " & real_new_row'Img);
         Put_Line("Row_t'Last = " & Row_t'Last'Img);
      end if;

      Submarine_Position := (row => new_row, column => new_column, real_row => real_new_row, real_column => real_new_column);
   end MoveSubmarine;


   procedure DoTick is
      linear_submarine_position : Table_Range_1D_t;
      max_parking_speed : Float := 100.0;
   begin
      Put_Line("Jestem w DOTICK");
      --jesli wygral albo gra nie dziala albo przegral to nie robimy tick
      if not is_running or is_won or is_lost then
         Put_Line("Nie tickam");
         return;
      end if;

      --Put_Line("Przeszedlem ifa!")
      Put_Line("Submarine position row = " & Submarine_Position.row'Img);
      Put_Line("Submarine_Position column = " & Submarine_Position.column'Img);
      linear_submarine_position := PositionToLinear((Submarine_Position.row, Submarine_Position.column));
      --Put_Line("Wyszedlem z funkcji")
      --Put_Line("kolumna: " & Submarine_Position.column'Img)
      --Put_Line("Wiersz : " & Submarine_Position.row'Img)
      Put_Line("Powierzchnia : " & Board(linear_submarine_position).p_state'Img);
      --jesli statek wplynal na przeszkode => umarto
      if Board(linear_submarine_position).p_state = OBSTACLE then
         is_lost := True;
         is_running := False;
         Put_Line("Przeszkoda");
      end if;

      if Board(linear_submarine_position).p_state = COAST then
         Put_Line("Dobilem do brzegu");
         if CalculateRealSpeedFromVelocity > max_parking_speed then
            is_lost := True;
            is_running := False;
         --elsif Submarine_Velocity /= (0.0, 0.0) then
            --Submarine_Velocity := (0.0, 0.0);
            --Submarine_Speed := STOP;
         end if;
      end if;

      if is_lost then
         pragma Assert (not is_running);
         return;
      end if;

      --jesli przezylismy to wszystko to przesuwamy lodz
      Put_Line("Przesuwam lodz");
      MoveSubmarine;
   end DoTick;

   --procedure DoMenu is
   --begin
   --   null;
   --end DoMenu;

   procedure Reset is
   begin
      Put_Line("Reset");
      is_running := True;
      is_won := False;
      is_lost := False;

      --czyszczenie planszy
      for i in Board'Range
      loop
         Board(i) := (WATER, (Row_t'First, Column_t'First));
      end loop;
      SetPixelsOnBoard;
      SetRandomCoast;
      SetObstacle;

      Submarine_Course := 0;
      Submarine_Position := (Row_t'Last/2, Column_t'Last/2, Float(Row_t'Last/2), Float(Column_t'Last/2));
      Submarine_Velocity := (0.0, 0.0);
      Submarine_Speed := STOP;

   end Reset;

   --funkcja zamieniajaca speed na konkretne wartosci w pix/tic
   function SpeedToValue return Float is
      k : Float := Submarine_k;
   begin
      case Submarine_Speed is
         when GOBACK => return k*(-1.0);
         when STOP => return 0.0;
         when HALF => return k*1.0;
         when FULL => return k*2.0;
         when others => return 0.0;
      end case;
   end SpeedToValue;

   --funkcja do ustawiania zadanej speed naszej lodzi (w speed_t)
   procedure SetSubmarineSpeed(new_speed : Speed_t) is
   begin
      Submarine_Speed := new_speed;
   end SetSubmarineSpeed;


   --funkcja do obliczania realnego kursu okretu na podstawie jego predkosci wyrazonego w course_t
   function CalculateRealCourseFromVelocity return Course_t is
      real_speed : Float;
      --w radianach
      real_course : Float;
      Cycle : Float  := 360.0;
      calculate_course : Course_t := 0;
   begin

      --sprawdzamy, czy ktoras skladowa jest == 0
      if Submarine_Velocity.vertical_velocity = 0.0 then
         if Submarine_Velocity.horizontal_velocity > 0.0 then
            return 90;
         elsif Submarine_Velocity.horizontal_velocity < 0.0 then
               return 270;
         else return Submarine_Course;
         end if;
      elsif Submarine_Velocity.horizontal_velocity = 0.0 then
         if Submarine_Velocity.vertical_velocity > 0.0 then
            return 180;
         elsif Submarine_Velocity.vertical_velocity < 0.0 then
            return 0;
         else return Submarine_Course;
         end if;
      end if;

      --realna wypadkowa wartosc predkosci
      --mozna by uzyc submarine_speed ale tak wydaje mi sie, ze bedzie lepiej :D
      real_speed := CalculateRealSpeedFromVelocity;
      --skoro zadna ze skladowych nie jest zerowa => jestesmy w ktorejs cwiartce
      if Submarine_Velocity.vertical_velocity < 0.0 and Submarine_Velocity.horizontal_velocity > 0.0 then
         -- jestesmy w pierwszej cwiartce
         real_course := Arcsin(X => (Submarine_Velocity.horizontal_velocity / real_speed), Cycle => Cycle);
      elsif Submarine_Velocity.vertical_velocity > 0.0 and Submarine_Velocity.horizontal_velocity > 0.0 then
         -- jestesmy w drugiej cwiartce
         real_course := 90.0 + Arcsin (X => (Submarine_Velocity.vertical_velocity / real_speed), Cycle => Cycle);
      elsif Submarine_Velocity.vertical_velocity > 0.0 and Submarine_Velocity.horizontal_velocity < 0.0 then
         --jestesmy w trzeciej cwiartce
         real_course := 180.0 + Arccos(X => (Submarine_Velocity.vertical_velocity / real_speed), Cycle => Cycle);
      elsif Submarine_Velocity.vertical_velocity < 0.0 and Submarine_Velocity.horizontal_velocity < 0.0 then
         --jestesmy w czwartej cwiartce
         real_course := 270.0 + Arcsin(X => (-1.0 * Submarine_Velocity.horizontal_velocity / real_speed), Cycle => Cycle);
      end if;

      calculate_course := Course_t(Float'Rounding(real_course));
      return  calculate_course;
   end CalculateRealCourseFromVelocity;

   --oblicza predkosc rozbita na skladowe poziom i pionowe z jaka teoretycznie powinna poruszac sie lodz
   -- na podstawie kursu i speeda
   function CalculateTargetVelocity return Velocity_t is
      target_horizontal_velocity : Float := 0.0;
      target_vertical_velocity : Float := 0.0;
      target_velocity : Velocity_t;
      Cycle : Float := 360.0;
   begin
      if Submarine_Course = 0 then
         target_velocity := (vertical_velocity => -1.0 * SpeedToValue, horizontal_velocity => 0.0);
      elsif Submarine_Course = 90 then
         target_velocity := (vertical_velocity => 0.0, horizontal_velocity => SpeedToValue);
      elsif Submarine_Course = 180 then
         target_velocity := (vertical_velocity => SpeedToValue, horizontal_velocity => 0.0);
      elsif Submarine_Course = 270 then
         target_velocity := (vertical_velocity => 0.0, horizontal_velocity => -1.0 * SpeedToValue);
      elsif Submarine_Course > 0 and Submarine_Course < 90 then
         -- pierwsza cwiartka
         target_horizontal_velocity :=        SpeedToValue * Sin(X => Float(Submarine_Course), Cycle => Cycle);
         target_vertical_velocity   := -1.0 * SpeedToValue * Cos(X => Float(Submarine_Course), Cycle => Cycle);
         target_velocity := (vertical_velocity => target_vertical_velocity, horizontal_velocity => target_horizontal_velocity);
      elsif Submarine_Course > 90 and Submarine_Course < 180 then
         --druga cwiartka
         target_horizontal_velocity := SpeedToValue * Cos(X => Float(Submarine_Course - 90), Cycle => Cycle);
         target_vertical_velocity   := SpeedToValue * Sin(X => Float(Submarine_Course - 90), Cycle => Cycle);
         target_velocity := (vertical_velocity => target_vertical_velocity, horizontal_velocity => target_horizontal_velocity);
      elsif Submarine_Course > 180 and Submarine_Course < 270 then
         --trzecia cwiartka
         target_horizontal_velocity := -1.0 * SpeedToValue * Sin(X => Float(Submarine_Course - 180), Cycle => Cycle);
         target_vertical_velocity   :=        SpeedToValue * Cos(X => Float(Submarine_Course - 180), Cycle => Cycle);
         target_velocity := (vertical_velocity => target_vertical_velocity, horizontal_velocity => target_horizontal_velocity);
      elsif Submarine_Course > 270 then
         --czwartacwiartka
         target_horizontal_velocity := -1.0 * SpeedToValue * Cos(X => Float(Submarine_Course - 270), Cycle => Cycle);
         target_vertical_velocity   := -1.0 * SpeedToValue * Sin(X => Float(Submarine_Course - 270), Cycle => Cycle);
         target_velocity := (vertical_velocity => target_vertical_velocity, horizontal_velocity => target_horizontal_velocity);
      else
         Put_Line("CalculateTargedVelocity - submarine_generic - cos nie pyklo :/ kurs to: " & Submarine_Course'Img);
      end if;

      return target_velocity;
   end CalculateTargetVelocity;


   procedure SetSubmarineVelocity is
      --przyspieszenie w pix/tic^2
      --moznaby dorobic funkcje,zeby zalezalo od predkosci i sie na biezaco wyliczalo...
      a                         : Float       := 1.0;
      target_velocity           : Velocity_t;
      real_course               : Course_t;
      real_speed                : Float;
      horizontal_delta_velocity : Float       := 0.0;
      vertical_delta_velocity   : Float       := 0.0;
      delta_tick                : Float       := 1.0;

   begin
      real_course := CalculateRealCourseFromVelocity;
      real_speed  := CalculateRealSpeedFromVelocity;

      if real_course /= Submarine_Course or real_speed /= SpeedToValue then
         target_velocity := CalculateTargetVelocity;
         horizontal_delta_velocity := target_velocity.horizontal_velocity - Submarine_Velocity.horizontal_velocity;
         vertical_delta_velocity   := target_velocity.vertical_velocity   - Submarine_Velocity.vertical_velocity;

         --jesli skok predkosci spowodowalby przeskoczenie do zbyt malej wartosci
         -- to mielibysmy przeregulowanie
         -- a to zla symulacja by byla
         -- wiec jesli bylby za duzy skok to ustaw dobra wartosc
         -- to tez gwarantuje, ze zawsze w koncu dobra wartosc zostanie ustawiona
         if a * delta_tick > abs(horizontal_delta_velocity) then
            Submarine_Velocity.horizontal_velocity := target_velocity.horizontal_velocity;
         else
            --horizontal/abd(horizontal_ jest po to zeby dostac znak
            Submarine_Velocity.horizontal_velocity := Submarine_Velocity.horizontal_velocity + (horizontal_delta_velocity/(abs(horizontal_delta_velocity))) * a * delta_tick;
         end if;

         --to samo dla vertical
         if a * delta_tick > abs(vertical_delta_velocity) then
            Submarine_Velocity.vertical_velocity := target_velocity.vertical_velocity;
         else
            Submarine_Velocity.vertical_velocity := Submarine_Velocity.vertical_velocity + (vertical_delta_velocity/(abs(vertical_delta_velocity)) * a * delta_tick);
         end if;

      end if;

   end SetSubmarineVelocity;

   procedure SetSubmarineCourse(new_course : Course_t) is
   begin
      Submarine_Course := new_course;
   end SetSubmarineCourse;

   procedure DecreaseSubmarineSpeed is
   begin
      if Submarine_Speed /= GOBACK then
         SetSubmarineSpeed(Speed_t'Pred(Submarine_Speed));
      end if;
      Put_Line(Submarine_Speed'Img);
   end DecreaseSubmarineSpeed;

   procedure IncreaseSubmarineSpeed is
   begin
      if Submarine_Speed /= FULL then
         SetSubmarineSpeed(Speed_t'Succ(Submarine_Speed));
      end if;
      Put_Line(Submarine_Speed'Img);
   end IncreaseSubmarineSpeed;

   procedure IncreaseSubmarineCourseValue is
   begin
      SetSubmarineCourse(Submarine_Course + 1);
      Put_Line(Submarine_Course'Image);
   end IncreaseSubmarineCourseValue;

   procedure DecreaceSubmarineCourseValue is
   begin
      SetSubmarineCourse(Submarine_Course - 1);
      Put_Line(Submarine_Course'Image);
   end DecreaceSubmarineCourseValue;

  -- function Load_Pixbufs return Boolean is
     -- Error : Glib.Error.GError;
  -- begin
      --Gdk_New_From_File (Background, Background_Name, Error);

      --if Background = null then
         --return False;
      --end if;

      --Back_Width  := Get_Width (Background);
      --Back_Height := Get_Height (Background);

      --for J in Images'Range loop
       --  Gdk_New_From_File (Images (J), Image_Names (J).all, Error);
       --  if Images (J) = null then
       --     return False;
      --   end if;
    --  end loop;
    --  return True;
  -- end Load_Pixbufs;
end submarine_generic;
