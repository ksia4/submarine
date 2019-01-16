
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Main;
with Gtk.Window;      use Gtk.Window;
with Gtk.Drawing_Area; use Gtk.Drawing_Area;
with game; use game;
with Gdk.Color; use Gdk.Color;
with Gtk.Enums; use Gtk.Enums;
with GNAT; use GNAT;
with GNAT.OS_Lib;
with Glib.Main; use Glib.Main;

with game_spark;
with main_quit;
use Glib;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   Win   : Gtk_Window;
   color : Gdk_Color;
   --GameControl : constant game_control_a := GetGameControl;
   Timeout : G_Source_Id;

begin
   Put_Line(Positive'Last'Img);
   --  Initialize GtkAda.
   Gtk.Main.Init;
   --  Create a window with a size of 400x400
   Gtk_New (Win);
   -- Set title
   Win.Set_Title ("Yellow Submarine - Katarzyna Rugiello, Jakub Kleszcz");
   --set border
   --Win.Set_Border_Width (6);
   -- set color
   Set_Rgb (color, 16#14ff#, 16#eaff#, 16#fdff#);
   -- set background
   Win.Modify_Bg (State_Normal, color);
   -- mozna zmieniac wielkkosc okienka gry
   Win.Set_Resizable (True);

   --  Add the drawing area
   Gtk.Drawing_Area.Gtk_New (game.Draw);

   Win.Set_Default_Size (300 + game_spark.submarine.Column_t'Range_Length, game_spark.submarine.Row_t'Range_Length);
   game.Draw.On_Draw (OnDraw'Access);
   Win.Add (game.Draw);

   -- connect the "destroy" signal
   Win.On_Destroy (main_quit'Access);

   --  Show the window
   Win.Show_All;
   --trzeba stworzyc te metode on_key_press
   Win.On_Key_Press_Event (OnKeyPress'Access, Win);

   --- Redraws have to be triggered from the Main thread (GTK not thread safe)
   -- Co tyle bedzie sie rysowac na nowo plansza
   --trzeba stworzyc metode trigger redraw
   Timeout := Glib.Main.Timeout_Add (50, TriggerRedraw'Access);

   --- Start our game now that everything has been set up
   GameControl.start;

   ---  Start the Gtk+ main loop
   Gtk.Main.Main;

   --- Cleanup the timer
   Remove (Timeout);

   --- Let's just do an exit, as there is no way to terminate tasks with SPARK
   GNAT.OS_Lib.OS_Exit (0);
end Main;
