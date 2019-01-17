with Gtk.Widget;      use Gtk.Widget;
with Gtk.Main;
with game; use game;
with Ada.Text_IO; use Ada.Text_IO;

procedure main_quit (Self : access Gtk_Widget_Record'Class) is
begin

   Game_Control.EndGame;
   delay 0.1;
   Gtk.Main.Main_Quit;
end main_quit;
