
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

with main_quit;

procedure Main is
   Win   : Gtk_Window;
   color : Gdk_Color;
   GameControl : constant game_control_a := GetGameControl;
   Timeout : G_Source_Id;
begin
   --  Initialize GtkAda.
   Gtk.Main.Init;

   --  Create a window with a size of 400x400
   Gtk_New (Win);
   Win.Set_Title ("Yellow Submarine - Katarzyna Rugiello, Jakub Kleszcz");
   Win.Set_Border_Width (6);
   Set_Rgb (color, 16#14ff#, 16#eaff#, 16#fdff#);
   Win.Modify_Bg (State_Normal, color);
   Win.Set_Resizable (True);

   --  Add the drawing area
   Gtk.Drawing_Area.Gtk_New (game.Draw);
   --game.Draw.Set_Size_Request (462, 286);
   Win.Set_Default_Size (500, 300);
   game.Draw.On_Draw (On_Draw'Access);
   Win.Add (game.Draw);

   -- connect the "destroy" signal
   Win.On_Destroy (main_quit'Access);

   --  Show the window
   Win.Show_All;
   Win.On_Key_Press_Event (On_Key_Press'Access, Win);

   --- Redraws have to be triggered from the Main thread (GTK not thread safe)
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
