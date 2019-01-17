with Gdk.Pixbuf;       use Gdk.Pixbuf;
with Ada.Numerics.Discrete_Random;

generic
   -- pozwala sprecyzowac wielkosc mapy / rozne rozdzielczosci?
   NR_ROWS : Positive;
   NR_COLUMNS : Positive;
   PIXEL_WIDTH : Positive;

package submarine_generic with SPARK_Mode is

   -- typ do okreslania kursu lodzi
   type Course_t is mod 360;

   --typ przechowujacy predkosc lodzi
   --rozbity na skladowa pozioma i pionowa
   -- skladowe wyrazone w pikselach/tick
   type Velocity_t is
      record
         --predkosc w pionie
         vertical_velocity : Float := 0.0;

         --predkosc w poziomie
         horizontal_velocity : Float := 0.0;
      end record;


   -- typ przechowujacy wartosc predkosci, typ dyskretny
   -- funkcja SpeedToVelocity rozbija wartosc speed na skladowe biorac pod uwage course
   --typ wyliczeniowy mamy trzy opcje STOP, HALF i FULL
   --STOP = 0, HALF = 1 FULL = 2, GOBACK = -1 przynajmniej na poczatek
   type Speed_t is (GOBACK, STOP, HALF, FULL);

   type Depth_t is new Integer range 0..10;

   -- pole na mapie moze byc woda, wybrzeze lub przeszkoda
   -- to czym jest okresla typ state
   type State_t is (WATER, COAST, OBSTACLE, TARGET);

   --Spark nieogarnia tablic 2D wiec linearyzujemy do 1D
   -- typ reprezentujacy zakres zlinearyzowanej tablicy
   subtype Table_Range_1D_t is Positive range 1 .. NR_COLUMNS*NR_ROWS;

   package rand is new Ada.Numerics.Discrete_Random (Table_Range_1D_t);
   use rand;

   --typ do indeksowania kolumn
   subtype Column_t is Table_Range_1D_t range Table_Range_1D_t'First .. NR_COLUMNS;

   --Typ do indeksowania wierszy
   subtype Row_t is Table_Range_1D_t range Table_Range_1D_t'First .. NR_ROWS;

   --typ do przechowywania informacji o polozeniu na planszy wyrazony w wierszach i kolumnach
   type Position_t is
      record
         row : Row_t;
         column : Column_t;
         --opcjonalnie pozniej mozna dodac zanurzenie/glebokosc przeszkody
         --depth : Positive;
         --real_row : Float := Float(row);
         --real_column : Flow := Float(column);
      end record;

   type Submarine_Position_t is
      record
         row : Row_t;
         column : Column_t;
         real_row : Float;
         real_column : Float;
      end record;


   --typ reprezentujacy jeden pixel mapy
   --przedrostek p dla kazdego pola jest dodany, zeby na pewno nie bylo kolizji z czyms co juz jest w adzie
   type Pixel_t is
      record

         --stan piksela czy jest brzegiem woda, ladem  czy przeszkoda
         p_state : State_t := WATER;

         --polozenie piksela wyrazone we wspolrzednych 2D
         p_Position : Position_t := (Row_t'First, Column_t'First);
      end record;

   -- typ reprezentujacy planze po ktorej plywa lodz
   type Board_t is array (Table_Range_1D_t) of Pixel_t;

   --funkcje
   function IsWon return Boolean;

   function IsLost return Boolean;


   --funkcja zamieniajaca wspolrzedna 2D na rekord w naszej tablicy 1D
   function PositionToLinear (row_and_column_position : Position_t) return Table_Range_1D_t;



   --procedury

   --procedura, ktora przypisuje wszystkim pixelom na planszy ich koordynary
   -- we wspolrzednych wiersz kolumna
   procedure SetPixelsOnBoard;
   --tutaj powinno byc with global etc ale to na koncu

   --procedura tworzaca wybrzerze
   procedure SetRandomCoast;

   --procedura generujaca przeszkody
   procedure SetObstacle;

   --procedura robiaca jeden tick
   procedure DoTick;

   --procedura obslugujaca menu
   --procedure DoMenu;

   --procedura resetujaca gre
   procedure Reset;

   --procedura ustawiajaca nowa predkosc submarine speed
   procedure SetSubmarineSpeed(new_speed : Speed_t);

   --procedura ustawiajaca nowa predkosc submarine_velocity
   procedure SetSubmarineVelocity;

   --procedura ustawiajaca nowy kurs submarine course
   procedure SetSubmarineCourse(new_course : Course_t);

   function CalculateRealSpeedFromVelocity return Float;

   --zmienna reprezentujaca obrany kurs
   Submarine_Course : Course_t := 0;
   --aktualna pozycja
   Submarine_Position : Submarine_Position_t := (Row_t'Last, Column_t'First, Float(Row_t'Last), Float(Column_t'First));
   --aktualna predkosc w pikselach/tick
   Submarine_Velocity : Velocity_t;
   --aktualna predkosc (w dostepnych poziomach)
   Submarine_Speed : Speed_t := STOP;

   --flagi gry
   is_running : Boolean := False;
   is_lost    : Boolean := False;
   is_won     : Boolean := False;

   --plansza
   Board : Board_t;
   Submarine_k : Float := 4.0;
   Submarine_goback_zero : Boolean := False;
   Submarine_straight_zero : Boolean := False;

   game_seed : rand.Generator;

   Submarine_achieved_targets : Integer := 0;
   All_targets_number : Integer := 8;
   type All_targets_collection is array(Table_Range_1D_t) of Integer range 0..All_targets_number;
   All_targets_list : All_targets_collection := (others => 0);
   first_reset : Boolean := True;

   Obstacle_number : Integer := 15;

   is_brum : Boolean:= False;

   Submarine_depth : Depth_t := 0;

   Submarine_real_depth : Float := 0.0;

   Submarine_Oxygeb : Float := 100.0;

   procedure DecreaseSubmarineSpeed;

   procedure IncreaseSubmarineSpeed;

   procedure IncreaseSubmarineCourseValue;

   procedure DecreaceSubmarineCourseValue;

   procedure DecreaseSubmarineDepth;

   procedure IncreaseSubmarineDepth;

   task type TaskSetSubmarineVelocity;

   task type TaskSetRealSubmarineDepth;

end submarine_generic;
