
with Glib.Object; use Glib.Object;
with Gdk.Event; use Gdk.Event;
with Gtk.Widget; use Gtk.Widget;
with Gtk.Drawing_Area; use Gtk.Drawing_Area;
with game_spark; use game_spark;
with Cairo; use Cairo;

package game is

   --funkcja do obslugi klawiszy
   function OnKeyPress (Ent   : access GObject_Record'Class;
                          Event : Gdk_Event_Key) return Boolean;

   --funkcja do rysowania gry
   function OnDraw (Self : access Gtk_Widget_Record'Class;
                     Cr   : Cairo.Cairo_Context) return Boolean;

   --typ zadaniowy
   task type Game_Task is
   end Game_Task;

   --typ do kontroli gry
   protected type Game_Control_t is
      procedure Start;
      function IsStarted return Boolean;
      --function IsMenu return Boolean;

      --- serialize access to out SPARK implementation
      procedure DoTick;
      procedure Reset;

      function IsWon return Boolean;
      function IsLost return Boolean;

      procedure SetSubmarineCourse (new_course : submarine.Course_t);

      procedure DecreaseSubmarineSpeed;
      procedure IncreaseSubmarineSpeed;
      procedure IncreaseSubmarineCourseValue;
      procedure DecreaceSubmarineCourseValue;
   private
      started : Boolean := False;
      --menu : Boolean := False;
   end Game_Control_t;

   type Game_Control_a is access all Game_Control_t;

   function GameControl return Game_Control_a;

   function TriggerRedraw return Boolean;

   Draw : Gtk_Drawing_Area;

private
   Game_tasks : Game_Task;
   Game_Control : aliased Game_Control_t;

end game;
