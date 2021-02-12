unit Mahjong_3D;{28.02.2017}

  //
  // MIT License
  //
  // Copyright (c) 2017 Jacek Mulawka
  //
  // j.mulawka@interia.pl
  //
  // https://github.com/jacek-mulawka
  //


  // For the issue by limelect (12.02.2021).



// Do zrobienia: nic.

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,Vcl.Samples.Spin,
  System.StrUtils, System.IniFiles, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg, System.Math,
  GLScene, GLObjects, GLCoordinates, GLWin32Viewer, GLCrossPlatform, GLBaseClasses,
  GLSpaceText, GLColor, GLSkyBox, GLMaterial, GLTexture;

type
  TTabela_RGB = array[ 1..3 ] of integer;

  TKostka_Obrazek = class;

  TGLSpaceText_M = class;

  TKostka = class( TGLCube )
  private
    { Private declarations }
    szeroko��,
    wysoko��,
    grubo��,
    g�ra,
    lewo
      : real;
    x,
    y,
    z,
    korekta_x,
    korekta_y
      : integer;
    zaznaczona : boolean;
    symbol : string;
    //Szkie�ko,
    Obrazek
      : TKostka_Obrazek;
    Opis_Kostki : TGLSpaceText_M;
    procedure Przerysuj_Kostk�();
    procedure Wczytaj_Obrazek( const adres_katalogu : string );
    procedure Klikni�cie_Oznacz( const zaznaczona : boolean );
  public
    { Public declarations }
    constructor Create( AOwner : TComponent );
    destructor Destroy(); override;
  end;

  TKostka_Obrazek = class( TGLCube )
  private
    { Private declarations }
    Kostka : TKostka;
  public
    { Public declarations }
    constructor Create( AOwner : TComponent );
    destructor Destroy(); override;
  end;

  TGLSpaceText_M = class( TGLSpaceText )  // uses GLSpaceText.
  private
    { Private declarations }
    Kostka : TKostka;
  public
    { Public declarations }
    constructor Create( AOwner : TComponent );
    destructor Destroy(); override;
  end;

  //TKeyScrollBox = class( TScrollBox )
  //published
  //  property OnKeyDown;
  //  property OnKeyPress;
  //  property OnKeyUp;
  //end;

  TCofnij_R = record
    x_1,
    y_1,
    z_1,
    x_2,
    y_2,
    z_2
      : integer;
    symbol : string;
    pozycja_1,
    pozycja_2
      : Char;
  end;

  TMahjong_3D_Form = class( TForm )
    MainMenu1: TMainMenu;
    Gra_MenuItem: TMenuItem;
    Gra__Demo_MenuItem: TMenuItem;
    Gra__Cofnij_MenuItem: TMenuItem;
    Gra__Nowa_Gra_MenuItem: TMenuItem;
    Gra__Podpowiedz_MenuItem: TMenuItem;
    Gra__Przetasuj_MenuItem: TMenuItem;
    Gra__Wyczysc_Plansze_MenuItem: TMenuItem;
    Gra__Wyjdz_MenuItem: TMenuItem;
    N1: TMenuItem;
    Gra__Zaprezentuj_Kostki_MenuItem: TMenuItem;
    Uklady_Kostek_MenuItem: TMenuItem;
    Obrazki_Kostek_MenuItem: TMenuItem;
    Opcje_MenuItem: TMenuItem;
    Pomoc_MenuItem: TMenuItem;
    Kamera_Ruch_Ciagly_MenuItem: TMenuItem;
    Pelny_Ekran_MenuItem: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Opcje_Panel: TPanel;
    Opcje_Splitter: TSplitter;
    PageControl1: TPageControl;
    Opcje_TabSheet: TTabSheet;
    Pomoc_TabSheet: TTabSheet;
    O_Programie_TabSheet: TTabSheet;
    Tlumaczenia_TabSheet: TTabSheet;
    Opcje_ScrollBox: TScrollBox;
    Zapisz_Ustawienia_Button: TButton;
    Opcje_Ukryj_Button: TButton;
    Opcje_Przyciskij_Panel: TPanel;
    Wyswietlanie_Czasu_RadioGroup: TRadioGroup;
    Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox: TCheckBox;
    Margines_Planszy_Etykieta_Label: TLabel;
    Margines_Planszy_SpinEdit: TSpinEdit;
    Szerokosc_Kostek_Etykieta_Label: TLabel;
    Szerokosc_Kostek_SpinEdit: TSpinEdit;
    Wysokosc_Kostek_Etykieta_Label: TLabel;
    Wysokosc_Kostek_SpinEdit: TSpinEdit;
    Grubosc_Kostek_Etykieta_Label: TLabel;
    Grubosc_Kostek_SpinEdit: TSpinEdit;
    Szybkosc_Kamery_Etykieta_Label: TLabel;
    Szybkosc_Kamery_SpinEdit: TSpinEdit;
    Szybkosc_Zegara_Etykieta_Label: TLabel;
    Szybkosc_Zegara_SpinEdit: TSpinEdit;
    Wartosci_Domyslne_Button: TButton;
    Wczytaj_Ustawienia_Button: TButton;
    Uklad_Kostek_Nazwa_Label: TLabel;
    Uklad_Kostek_Nazwa_Wyczysc_Button: TButton;
    Kamera_Wspolrzedne_Etykieta_Label: TLabel;
    Kamera_Wspolrzedne_Label: TLabel;
    Kamera_Na_Srodek_Ukladu_Kostek_CheckBox: TCheckBox;
    Automatyczne_Wczytywanie_Ukladu_Kostek_CheckBox: TCheckBox;
    Wczytuj_Konfiguracje_Kostek_CheckBox: TCheckBox;
    Kostki_Kwiatkow_CheckBox: TCheckBox;
    Podpowiadaj_Tylko_Jeden_Ruch_CheckBox: TCheckBox;
    Pelny_Ekran_CheckBox: TCheckBox;
    Przyblizenie_CheckBox: TCheckBox;
    Obrazek_Tla_Planszy__Bok_Panel: TPanel;
    Obrazek_Tla_Planszy__Gora_RadioButton: TRadioButton;
    Obrazek_Tla_Planszy__Lewo_RadioButton: TRadioButton;
    Obrazek_Tla_Planszy__Przod_RadioButton: TRadioButton;
    Obrazek_Tla_Planszy__Prawo_RadioButton: TRadioButton;
    Obrazek_Tla_Planszy__Dol_RadioButton: TRadioButton;
    Obrazek_Tla_Planszy__Tyl_RadioButton: TRadioButton;
    Obrazek_Tla_Planszy__Chmury_RadioButton: TRadioButton;
    Obrazek_Tla_Planszy__Wszystkie_RadioButton: TRadioButton;
    Obrazek_Tla_Planszy__Sciezki_Wzgledne_CheckBox: TCheckBox;
    Obrazek_Tla_Planszy__Wybierz_Button: TButton;
    Obrazek_Tla_Planszy__Wyswietl_CheckBox: TCheckBox;
    Obrazek_Tla_Planszy__Brak_Button: TButton;
    Tlumaczenia_Panel: TPanel;
    Tlumaczenia_Odswiez_Button: TButton;
    Tlumaczenia_Zastosuj_Button: TButton;
    Tlumaczenia_Domyslne_Button: TButton;
    Tlumaczenia_ListBox: TListBox;
    Pomoc_Memo: TMemo;
    OpenDialog1: TOpenDialog;
    O_Programie_Label: TLabel;
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCamera1: TGLCamera;
    GLLightSource1: TGLLightSource;
    Test_GLCube: TGLCube;
    Test_GLSphere: TGLSphere;
    Kamera_Na_GLDummyCube: TGLDummyCube;
    Przyblizenie_Panel: TPanel;
    Przyblizenie_Splitter: TSplitter;
    Tlo_GLSkyBox: TGLSkyBox;
    GLMaterialLibrary1: TGLMaterialLibrary;
    procedure FormShow( Sender: TObject );
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure Zapisz_Ustawienia( Sender : TObject );
    procedure Wczytaj_List�_T�umacze�( Sender : TObject );
    procedure Uk�ady_Kostek__Uk�ad_Kostek_MenuItemClick( Sender: TObject );
    procedure Obrazki_Kostek__Obrazek_Kostek_MenuItemClick( Sender: TObject );
    procedure KostkaClick( klikni�ty_obiekt : TGLSceneObject );
    procedure PlanszaKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    procedure PerspektywaKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    procedure GLSceneViewer1Click( Sender: TObject );
    procedure GLSceneViewer1MouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure GLSceneViewer1MouseWheel( Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean );
    procedure GLSceneViewer1MouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure GLSceneViewer1Gesture( Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean );
    procedure Kamera_Ruch_Ciagly_MenuItemClick( Sender: TObject );
    procedure Pelny_Ekran_MenuItemClick( Sender: TObject );
    procedure ScrollBoxMouseWheel( Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean );
    procedure Przyblizenie_PanelMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure Przyblizenie_PanelMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure Gra__Demo_MenuItemClick( Sender: TObject );
    procedure Gra__Cofnij_MenuItemClick( Sender: TObject );
    procedure Gra__Nowa_Gra_MenuItemClick( Sender: TObject );
    procedure Gra__Podpowiedz_MenuItemClick( Sender: TObject );
    procedure Gra__Przetasuj_MenuItemClick( Sender: TObject );
    procedure Gra__Wyczysc_Plansze_MenuItemClick( Sender: TObject );
    procedure Gra__Wyjdz_MenuItemClick( Sender: TObject );
    procedure Gra__Zaprezentuj_Kostki_MenuItemClick( Sender: TObject );
    procedure Opcje_MenuItemClick( Sender: TObject );
    procedure Opcje_Ukryj_ButtonClick( Sender: TObject );
    procedure Kostki_SpinEditChange( Sender: TObject );
    procedure Szybkosc_Zegara_SpinEditChange( Sender: TObject );
    procedure Wartosci_Domyslne_ButtonClick( Sender: TObject );
    procedure Wczytaj_Ustawienia_ButtonClick( Sender: TObject );
    procedure Uklad_Kostek_Nazwa_Wyczysc_ButtonClick( Sender: TObject );
    procedure Pelny_Ekran_CheckBoxClick( Sender: TObject );
    procedure Przyblizenie_CheckBoxClick( Sender: TObject );
    procedure Tlumaczenia_Zastosuj_ButtonClick( Sender: TObject );
    procedure Tlumaczenia_Domyslne_ButtonClick( Sender: TObject );
    procedure Tlumaczenia_ListBoxDblClick( Sender: TObject );
    procedure Tlumaczenia_ListBoxKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    procedure Obrazek_Tla_Planszy__Wybierz_ButtonClick( Sender: TObject );
    procedure Obrazek_Tla_Planszy__Wyswietl_CheckBoxClick( Sender: TObject );
    procedure Obrazek_Tla_Planszy__Brak_ButtonClick( Sender: TObject );
    procedure Timer1Timer( Sender: TObject );
  private
    { Private declarations }
    uk�ad_x, // Wymiary tablicy uk�adu (ilo�� ko�ci w liniach uk�adu wynosi + 1).
    uk�ad_y,
    uk�ad_z,
    przetasowania_ilo��,
    podpowiedzi_ilo��,
    cofni�cia_ilo��,
    par_do_zdj�cia_ilo��,
    przybli�enie_mysz_start_y
      : integer;
    kamera_�rodek_x, // Wsp�rz�dne pocz�tkowe kamery.
    kamera_�rodek_y,
    kamera_�rodek_z,
    kamera_na_�rodek_x, // Wsp�rz�dne pocz�tkowe punktu, na kt�ry spogl�da kamera.
    kamera_na_�rodek_y,
    kamera_punkt_kopia_z
      : single;
    wczytany_uk�ad_kostek_nazwa_pliku,
    obrazki_kostek_nazwa_katalogu,
    kamera_ruch_ci�g�y_tre��
      : string;
    mysz_start_punkt,
    kamera_punkt_kopia
      : TPointFloat;
    kostka_klikni�ta,
    kostka_podpowied�_1,
    kostka_podpowied�_2,
    kostka_demo
      : TKostka;
    uk�ad_kostek_t : array of array of array of Char; // w, k, z; x, y, z
    kostki_t : array of array of array of TKostka; // w, k, z; x, y, z
    gra_czas_start,
    gra_czas_koniec
      : TDateTime;
    blokuj_rysowanie_kostek : boolean;
    cofnij_t_r,
    podpowied�_poprzednia_t_r
      : array of TCofnij_R;
    {$region 'T�umaczenia.'}
    t__od�wie�_list�_uk�ad�w_kostek,
    t__od�wie�_list�_obrazk�w_kostek,
    t__brak_obrazk�w_kostek,
    t__domy�lne_obrazki_kostek,
    t__uk�ad_kostek_nazwa,
    t__uk�ad_kostek_nazwa__brak,

    t__b��d,
    t__gratulacje,
    t__komunikat,
    t__potwierdzenie,

    t__nie_odnaleziono_pliku_uk�adu_kostek,
    t__nie_odnaleziono_pliku_t�umaczenia,
    t__nie_odnaleziono_pliku_pomocy,
    t__nie_odnaleziono_katalogu_obrazk�w_kostek,

    t__koniec_gry,
    t__nie_odnaleziono_kostek_do_�ci�gni�cia,
    t__nie_odnaleziono_kostek_do_�ci�gni�cia_czy_przetasowa�,

    t__brak_zdefiniowanych_uk�ad�w_kostek,
    t__brak_zdefiniowanych_obrazk�w_kostek,
    t__rozpocz��_gr�_od_nowa,
    t__wyczy�ci�_plansz�,
    t__zako�czy�_dzia�anie_programu,
    t__zapisa�_ustawienia,
    t__zaprezentowa�_kostki,
    t__przetasowania_ilo��,
    t__podpowiedzi_ilo��,
    t__cofni�cia_ilo��,
    t__par_do_zdj�cia,

    t__ustawi�_pusty_obrazek_t�a_planszy,
    t__obrazek_t�a_planszy_filtr
      : string;
    {$endregion 'T�umaczenia.'}
    procedure Wczytaj_List�_Uk�ad�w_Kostek( Sender : TObject );
    procedure Wczytaj_Uk�ad_Kostek( const nazwa_pliku : string; const zwolnij : boolean = false );
    procedure Utw�rz_Kostk�( var kostka_f : TKostka; pozycja : Char );
    function Czy_Kostk�_Mo�na_Zdj��( kostka_f : TKostka ) : boolean;
    function Czy_Kostki_Pasuj�_Do_Siebie( kostka_1_f, kostka_2_f : TKostka ) : boolean;
    procedure Zdejmij_Kostki( kostka_f : TKostka );
    function Kostek_Na_Planszy() : integer;
    function Par_Do_Zdj�cia() : integer;
    procedure Wczytaj_Ustawienia();
    procedure Wczytaj_T�umaczenie( const nazwa_pliku : string );
    procedure Wczytaj_List�_Obrazk�w_Kostek( Sender : TObject );
    procedure Wczytaj_Obrazki_Kostek( const nazwa_katalogu : string; pomi�_ini : boolean = false );
    procedure Wczytaj_Ini_Obrazk�w_Kostek( const adres_pliku : string );
    procedure Wczytaj_Pomoc( const nazwa_pliku : string );
    procedure Tekstury_Zasobnik_Zmodyfikuj( nazwa_tekstury, adres_pliku : string );
    procedure Wczytaj_T�o_Planszy( const adres_pliku : string; nie_zapisuj : boolean = false );
    procedure Kamera_Ustawienie_Pocz�tkowe( const wymu�_wyliczenie : boolean = false );
    procedure Kamera_Wsp�rz�dne_Wypisz();

    procedure Color_To_RGB( const color : integer; out r, g, b : integer );
  public
    { Public declarations }
  end;

const
  dzielnik_skalowania = 1; // Nie 0; ?

var
  Mahjong_3D_Form: TMahjong_3D_Form;

implementation

{$R *.dfm}

{ TKostka }

//Konstruktor klasy TKostka.
constructor TKostka.Create( AOwner : TComponent );
begin

  inherited Create( AOwner );

  zaznaczona := false;

  Self.szeroko�� := 50;
  Self.wysoko�� := 70;
  Self.grubo�� := 10;
  Self.g�ra := 0;
  Self.lewo := 0;

  //Self.Material.Texture.Enabled := true;//????

  x := -1;
  y := -1;
  z := -1;

  korekta_x := 0;
  korekta_y := 0;

  symbol := '';

  //Self.Szkie�ko := TKostka_Obrazek.Create( AOwner );
  //Self.Szkie�ko.Kostka := Self;

  Self.Obrazek := TKostka_Obrazek.Create( AOwner );
  Self.Obrazek.Kostka := Self;
  Self.Obrazek.Visible := true;

  Self.Opis_Kostki := TGLSpaceText_M.Create( AOwner );
  Self.Opis_Kostki.Kostka := Self;

end;//---//Konstruktor klasy TKostka.

//Destruktor klasy TKostka.
destructor TKostka.Destroy();
begin

  //FreeAndNil( Self.Szkie�ko );
  FreeAndNil( Self.Obrazek );
  FreeAndNil( Self.Opis_Kostki );

  inherited;

end;//---//Destruktor klasy TKostka.

//Funkcja Przerysuj_Kostk�().
procedure TKostka.Przerysuj_Kostk�();
begin

  //
  // Funkcja okre�la wzajemne po�o�enie element�w kostki wzgl�dem siebie.
  //

  //????Self.Szkie�ko.Parent := Self.Parent;

  //Self.szeroko��_ramka// 6 -> -3 | 3 Od �rodka po r�wno w obie strony rozchodzi si� szeroko�� linii.

  // Wsp�rz�dne �rodka kostki (prostopad�o�cianu).

  Self.CubeWidth := Self.szeroko��;
  Self.CubeHeight := Self.wysoko��;
  Self.CubeDepth := Self.grubo��;
  Self.Position.Y := -Self.g�ra - Self.wysoko�� / 2; // Korekta aby g�rny lewy r�g kostki by� w miejscu jej wsp�rz�dnych (domy�lnie jest �rodek kostki).
  Self.Position.X := Self.lewo + Self.szeroko�� / 2; // Korekta aby g�rny lewy r�g kostki by� w miejscu jej wsp�rz�dnych (domy�lnie jest �rodek kostki).
  Self.Position.Z := Self.z * Self.grubo�� + Self.grubo�� / 2; // Korekta aby sp�d kostki dolnej by� na wsp�rz�dnej zero (domy�lnie jest �rodek kostki).


  Self.Opis_Kostki.Parent := Self.Parent;

  Self.Opis_Kostki.Position := Self.Position;
  Self.Opis_Kostki.Position.X := Self.Opis_Kostki.Position.X - Self.CubeWidth / 2 + Self.CubeWidth / 10; // Korekta o szeroko�� kostki, lekkie przesuni�cie.
  Self.Opis_Kostki.Position.Z := Self.Opis_Kostki.Position.Z + Self.CubeDepth / 2 + Self.CubeDepth / 100; // Korekta o grubo�� kostki, lekkie wysuni�cie.

  Self.Opis_Kostki.TextHeight := Self.szeroko�� / Length( Self.Opis_Kostki.Text );


  Self.Obrazek.Parent := Self.Parent;

  Self.Obrazek.CubeWidth := Self.CubeWidth - Self.CubeWidth / 100;
  Self.Obrazek.CubeHeight := Self.CubeHeight - Self.CubeHeight / 100;
  Self.Obrazek.CubeDepth := Self.CubeDepth / 1000;
  Self.Obrazek.Position := Self.Position;
  Self.Obrazek.Position.Z := Self.Obrazek.Position.Z + Self.CubeDepth / 2 + Self.CubeDepth / 1000;

end;//---//Funkcja Przerysuj_Kostk�().

//Funkcja Wczytaj_Obrazek().
procedure TKostka.Wczytaj_Obrazek( const adres_katalogu : string );

  //Funkcja Czy_Istnieje_Plik_Obrazka() w Wczytaj_Obrazek().
  function Czy_Istnieje_Plik_Obrazka( const rozszerzenie_pliku_f : string; const nazwa_pliku_f : string = '' ) : boolean;
  var
    search_rec : TSearchRec;
    nazwa_pliku : string;
  begin

    Result := false;


    if Trim( nazwa_pliku_f ) <> '' then
      nazwa_pliku := nazwa_pliku_f
    else//if Trim( nazwa_pliku_f ) <> '' then
      nazwa_pliku := Self.symbol;


    //Je�eli znajdzie plik zwraca 0, je�eli nie znajdzie zwraca numer b��du.
    if FindFirst( adres_katalogu + '\' + nazwa_pliku + '.' + rozszerzenie_pliku_f, faAnyFile, search_rec ) = 0 then //Application potrzebuje w uses Forms.
      begin

        Result := true;

      end;
    //---//if FindFirst( adres_katalogu + '\' + nazwa_pliku + '.' + rozszerzenie_pliku_f, faAnyFile, search_rec ) = 0 then //Application

    FindClose( search_rec );

  end;//---//Funkcja Czy_Istnieje_Plik_Obrazka() w Wczytaj_Obrazek().

  //Funkcja Brak_Obrazka() w Wczytaj_Obrazek().
  procedure Brak_Obrazka( kostka_f : TKostka );
  begin

    //
    // Funkcja (je�eli nie odnaleziono pliku obrazka) wype�nia bitmap� kolorem i umieszcza napis z symbolem kostki.
    //

    kostka_f.Opis_Kostki.Text := Self.symbol;
    Self.Opis_Kostki.Visible := true;

  end;//---//Funkcja Brak_Obrazka() w Wczytaj_Obrazek().

var
  obrazek_jpg : TJPEGImage; //Potrzebuje w uses JPEG.
  obrazek_png : TPngImage; //Potrzebuje w uses pngimage.
  obrazek_gif : TGIFImage; //Potrzebuje w uses GIFImg.
  wic_image : TWICImage;
  bit_map : TBitmap;
  opis_b��du,
  opis_b��du_zaznaczenie,
  rozszerzenie_pliku
    : string;
  X, Y: Integer;
const
  tekstura_�cianki = '�cianka';
begin//Funkcja Wczytaj_Obrazek().

  opis_b��du := '';
  opis_b��du_zaznaczenie := '';

  Self.Material.Texture.Enabled := false;
  Self.Obrazek.Material.Texture.Enabled := false;

  if adres_katalogu <> '' then // Brak.
    begin

      {$region 'Obrazek.'}
      rozszerzenie_pliku := '';

      {$region 'Sprawdza czy istnieje plik obrazka z danym rozszerzeniem.'}
      if Czy_Istnieje_Plik_Obrazka( 'png' ) then
        rozszerzenie_pliku := 'png'
      else//if Czy_Istnieje_Plik_Obrazka( 'png' ) then
      if Czy_Istnieje_Plik_Obrazka( 'jpg' ) then
        rozszerzenie_pliku := 'jpg'
      else//if Czy_Istnieje_Plik_Obrazka( 'jpg' ) then
      if Czy_Istnieje_Plik_Obrazka( 'jpeg' ) then
        rozszerzenie_pliku := 'jpeg'
      else//if Czy_Istnieje_Plik_Obrazka( 'jpeg' ) then
      if Czy_Istnieje_Plik_Obrazka( 'gif' ) then
        rozszerzenie_pliku := 'gif'
      else//if Czy_Istnieje_Plik_Obrazka( 'gif' ) then
      if Czy_Istnieje_Plik_Obrazka( 'bmp' ) then
        rozszerzenie_pliku := 'bmp'
      else//if Czy_Istnieje_Plik_Obrazka( 'bmp' ) then
      if Czy_Istnieje_Plik_Obrazka( 'tif' ) then
        rozszerzenie_pliku := 'tif'
      else//if Czy_Istnieje_Plik_Obrazka( 'tif' ) then
      if Czy_Istnieje_Plik_Obrazka( 'tiff' ) then
        rozszerzenie_pliku := 'tiff'
      else//if Czy_Istnieje_Plik_Obrazka( 'tiff' ) then
        rozszerzenie_pliku := ''; //???
      {$endregion 'Sprawdza czy istnieje plik obrazka z danym rozszerzeniem.'}


      bit_map := TBitmap.Create();

      {$region 'Wczytuje w odpowiedni spos�b obrazek.'}
      if rozszerzenie_pliku = 'png' then
        begin

          obrazek_png := TPngImage.Create();
          obrazek_png.LoadFromFile( adres_katalogu + '\' + Self.symbol + '.' + rozszerzenie_pliku );
          bit_map.Assign( obrazek_png );
          obrazek_png.Free();

        end
      else//if Pos(  'png', AnsiLowerCase( zts_1 )  ) > 0 then
      if   ( rozszerzenie_pliku = 'jpg' )
        or ( rozszerzenie_pliku = 'jpeg' ) then
        begin

          obrazek_jpg := TJPEGImage.Create();
          obrazek_jpg.LoadFromFile( adres_katalogu + '\' + Self.symbol + '.' + rozszerzenie_pliku );
          bit_map.Assign( obrazek_jpg );
          obrazek_jpg.Free();

        end
      else//if   ( rozszerzenie_pliku = 'jpg' ) (...)
      if rozszerzenie_pliku = 'gif' then
        begin

          obrazek_gif := TGIFImage.Create();
          obrazek_gif.LoadFromFile( adres_katalogu + '\' + Self.symbol + '.' + rozszerzenie_pliku );
          bit_map.Assign( obrazek_gif );
          obrazek_gif.Free();

        end
      else//if rozszerzenie_pliku = 'gif' then
      if rozszerzenie_pliku = 'bmp' then
        begin

          bit_map.LoadFromFile( adres_katalogu + '\' + Self.symbol + '.' + rozszerzenie_pliku );

        end
      else//if rozszerzenie_pliku = 'bmp' then
      if   ( rozszerzenie_pliku = 'tif' )
        or ( rozszerzenie_pliku = 'tiff' ) then
        begin

          wic_image := TWICImage.Create();
          wic_image.LoadFromFile( adres_katalogu + '\' + Self.symbol + '.' + rozszerzenie_pliku );
          bit_map.Assign( wic_image );
          wic_image.Free();

        end
      else//if   (   rozszerzenie_pliku = 'tif' ) (...)
        try
          //bit_map.LoadFromFile( zts + '\B1.bmp' );
          bit_map.LoadFromFile( adres_katalogu + '\' + Self.symbol + '.bmp' );
        except
          on E : Exception do
            begin

              if adres_katalogu <> '' then
                opis_b��du := E.Message;

            end;
          //---//on E : Exception do

        end;
        //---//try
      {$endregion 'Wczytuje w odpowiedni spos�b obrazek.'}


      if not bit_map.Empty then
        begin

          Self.Obrazek.Material.Texture.Image.Assign( bit_map );
          Self.Obrazek.Material.Texture.Enabled := true;

          Self.Opis_Kostki.Visible := false;

        end
      else//if not bit_map.Empty then
        begin

          Brak_Obrazka( Self );

        end;
      //---//if not bit_map.Empty then

      bit_map.Free();
      {$endregion 'Obrazek.'}


      {$region '�cianka.'}
      rozszerzenie_pliku := '';

      {$region 'Sprawdza czy istnieje plik obrazka z danym rozszerzeniem.'}
      if Czy_Istnieje_Plik_Obrazka( 'png', tekstura_�cianki ) then
        rozszerzenie_pliku := 'png'
      else//if Czy_Istnieje_Plik_Obrazka( 'png', tekstura_�cianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'jpg', tekstura_�cianki ) then
        rozszerzenie_pliku := 'jpg'
      else//if Czy_Istnieje_Plik_Obrazka( 'jpg', tekstura_�cianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'jpeg', tekstura_�cianki ) then
        rozszerzenie_pliku := 'jpeg'
      else//if Czy_Istnieje_Plik_Obrazka( 'jpeg', tekstura_�cianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'gif', tekstura_�cianki ) then
        rozszerzenie_pliku := 'gif'
      else//if Czy_Istnieje_Plik_Obrazka( 'gif', tekstura_�cianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'bmp', tekstura_�cianki ) then
        rozszerzenie_pliku := 'bmp'
      else//if Czy_Istnieje_Plik_Obrazka( 'bmp', tekstura_�cianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'tif', tekstura_�cianki ) then
        rozszerzenie_pliku := 'tif'
      else//if Czy_Istnieje_Plik_Obrazka( 'tif', tekstura_�cianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'tiff', tekstura_�cianki ) then
        rozszerzenie_pliku := 'tiff'
      else//if Czy_Istnieje_Plik_Obrazka( 'tiff', tekstura_�cianki ) then
        rozszerzenie_pliku := ''; //???
      {$endregion 'Sprawdza czy istnieje plik obrazka z danym rozszerzeniem.'}


      bit_map := TBitmap.Create();

      {$region 'Wczytuje w odpowiedni spos�b obrazek.'}
      if rozszerzenie_pliku = 'png' then
        begin

          obrazek_png := TPngImage.Create();
          obrazek_png.LoadFromFile( adres_katalogu + '\' + tekstura_�cianki + '.' + rozszerzenie_pliku );
          bit_map.Assign( obrazek_png );
          obrazek_png.Free();

        end
      else//if Pos(  'png', AnsiLowerCase( zts_1 )  ) > 0 then
      if   ( rozszerzenie_pliku = 'jpg' )
        or ( rozszerzenie_pliku = 'jpeg' ) then
        begin

          obrazek_jpg := TJPEGImage.Create();
          obrazek_jpg.LoadFromFile( adres_katalogu + '\' + tekstura_�cianki + '.' + rozszerzenie_pliku );
          bit_map.Assign( obrazek_jpg );
          obrazek_jpg.Free();

        end
      else//if   ( rozszerzenie_pliku = 'jpg' ) (...)
      if rozszerzenie_pliku = 'gif' then
        begin

          obrazek_gif := TGIFImage.Create();
          obrazek_gif.LoadFromFile( adres_katalogu + '\' + tekstura_�cianki + '.' + rozszerzenie_pliku );
          bit_map.Assign( obrazek_gif );
          obrazek_gif.Free();

        end
      else//if rozszerzenie_pliku = 'gif' then
      if rozszerzenie_pliku = 'bmp' then
        begin

          bit_map.LoadFromFile( adres_katalogu + '\' + tekstura_�cianki + '.' + rozszerzenie_pliku );

        end
      else//if rozszerzenie_pliku = 'bmp' then
      if   ( rozszerzenie_pliku = 'tif' )
        or ( rozszerzenie_pliku = 'tiff' ) then
        begin

          wic_image := TWICImage.Create();
          wic_image.LoadFromFile( adres_katalogu + '\' + tekstura_�cianki + '.' + rozszerzenie_pliku );
          bit_map.Assign( wic_image );
          wic_image.Free();

        end
      else//if   (   rozszerzenie_pliku = 'tif' ) (...)
        try
          //bit_map.LoadFromFile( zts + '\B1.bmp' );
          bit_map.LoadFromFile( adres_katalogu + '\' + tekstura_�cianki + '.bmp' );
        except
          on E : Exception do
            begin

            end;
          //---//on E : Exception do

        end;
        //---//try
      {$endregion 'Wczytuje w odpowiedni spos�b obrazek.'}


      if not bit_map.Empty then
        begin

          Self.Material.Texture.Image.Assign( bit_map );
          Self.Material.Texture.Enabled := true;

        end;
      //---//if not bit_map.Empty then

      bit_map.Free();
      {$endregion '�cianka.'}

    end
  else//if adres_katalogu <> 'Brak' then
    begin

      Brak_Obrazka( Self );

    end;
  //---//if adres_katalogu <> 'Brak' then

  Self.Obrazek.Visible := not Self.Opis_Kostki.Visible;


  if opis_b��du <> '' then
    raise Exception.Create( opis_b��du );


  if opis_b��du_zaznaczenie <> '' then
    raise Exception.Create( opis_b��du_zaznaczenie );

end;//---//Funkcja Wczytaj_Obrazek().

//Funkcja Klikni�cie_Oznacz().
procedure TKostka.Klikni�cie_Oznacz( const zaznaczona : boolean );
begin

  Self.zaznaczona := zaznaczona;


  if zaznaczona then
    begin

      // Zaznacza klikni�t� kostk�.

      Self.Material.Texture.ImageGamma := 2;

      Self.Obrazek.Material.Texture.ImageGamma := 2;

      Self.Opis_Kostki.Font.Style := Self.Opis_Kostki.Font.Style + [ fsBold ];
      Self.Opis_Kostki.Material.FrontProperties.Diffuse.Color := GLColor.clrGreen;

    end
  else//if zaznaczona then
    begin

      // Odznacza poprzednio klikni�t� kostk�.

      Self.Material.Texture.ImageGamma := 1;

      Self.Obrazek.Material.Texture.ImageGamma := 1;

      Self.Opis_Kostki.Font.Style := Self.Opis_Kostki.Font.Style - [ fsBold ];
      Self.Opis_Kostki.Material.FrontProperties.Diffuse.Color := GLColor.clrGray80;

    end;
  //---//if zaznaczona then

end;//---//Funkcja Klikni�cie_Oznacz().


{ TKostka_Obrazek }


//Konstruktor klasy TKostka_Obrazek.
constructor TKostka_Obrazek.Create( AOwner : TComponent );
begin

  inherited Create( AOwner );

end;//---//Konstruktor klasy TKostka_Obrazek.

//Destruktor klasy TKostka_Obrazek.
destructor TKostka_Obrazek.Destroy();
begin

  inherited;

end;//---//Destruktor klasy TKostka_Obrazek.


{ TGLSpaceText_M }


//Konstruktor klasy TGLSpaceText_M.
constructor TGLSpaceText_M.Create( AOwner : TComponent );
begin

  inherited Create( AOwner );

  Self.Text := '';
  Self.TextHeight := 1;
  Self.Material.FrontProperties.Ambient.Color := GLColor.clrWhite;
  //Self.TurnAngle := 0;
  //Self.Visible := true;

end;//---//Konstruktor klasy TGLSpaceText_M.

//Destruktor klasy TGLSpaceText_M.
destructor TGLSpaceText_M.Destroy();
begin

  inherited;

end;//---//Destruktor klasy TGLSpaceText_M.

{ TMahjong_3D_Form }


//      ***      Funkcje      ***      //

//Funkcja Wczytaj_List�_Uk�ad�w_Kostek().
procedure TMahjong_3D_Form.Wczytaj_List�_Uk�ad�w_Kostek( Sender : TObject );
var
  zts : string;
  zti : integer;
  search_rec : TSearchRec;
  menu_item : TMenuItem;
begin

  for zti := Uklady_Kostek_MenuItem.Count - 1 downto 0 do
    Uklady_Kostek_MenuItem.Items[ zti ].Free();


  if Sender = nil then // Tylko zwalnia pami��.
    Exit;

  Screen.Cursor := crHourGlass;

  zti := 0;

  //Je�eli znajdzie plik zwraca 0, je�eli nie znajdzie zwraca numer b��du. Na pocz�tku znajduje '.' '..' potem list� plik�w.
  if FindFirst(  ExtractFilePath( Application.ExeName ) + 'Uk�ady kostek\*.txt', faAnyFile, search_rec  ) = 0 then //Application potrzebuje w uses Forms.
    begin

      repeat

        zts := search_rec.Name;
        zts := ReverseString( zts );
        Delete(  zts, 1, Pos( '.', zts )  );
        zts := ReverseString( zts );

        inc( zti );

        menu_item := TMenuItem.Create( Application );
        menu_item.Name := 'Uk�ady_Kostek__Uk�ad_Kostek_' + IntToStr( zti ) + '_MenuItem';
        menu_item.Caption := zts;
        menu_item.Hint := zts;
        menu_item.OnClick := Uk�ady_Kostek__Uk�ad_Kostek_MenuItemClick;

        Uklady_Kostek_MenuItem.Add( menu_item );

      until FindNext( search_rec ) <> 0 //Zwraca dane kolejnego pliku zgodnego z parametrami wcze�niej wywo�anej funkcji FindFirst. Je�eli mo�na przej�� do nast�pnego znalezionego pliku zwraca 0.

    end;
  //---//if FindFirst(  ExtractFilePath( Application.ExeName ) + 'Uk�ady kostek\*.txt', faAnyFile, search_rec  ) = 0 then //Application

  FindClose( search_rec );

  //menu_item := TMenuItem.Create( Application );
  menu_item := TMenuItem.Create( Mahjong_3D_Form ); // Dla FindComponent().
  menu_item.Name := 'Uk�ady_Kostek__Od�wie�_List�_MenuItem';
  //menu_item.Caption := 'Od�wie� list� uk�ad�w kostek';
  menu_item.Caption := t__od�wie�_list�_uk�ad�w_kostek;
  menu_item.OnClick := Wczytaj_List�_Uk�ad�w_Kostek;

  Uklady_Kostek_MenuItem.Add( menu_item );

  Screen.Cursor := crDefault;


  if    ( Sender <> nil )
    //and ( TComponent(Sender).Name = Uk�ady_Kostek__Od�wie�_List�_MenuItem.Name )
    and ( TComponent(Sender).Name <> Mahjong_3D_Form.Name )
    and ( Uklady_Kostek_MenuItem.Count < 2 ) then
    //Application.MessageBox( 'Brak zdefiniowanych uk�ad�w kostek.', 'B��d', MB_ICONEXCLAMATION + MB_OK );
    Application.MessageBox(  PChar( t__brak_zdefiniowanych_uk�ad�w_kostek ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK  );

end;//---//Funkcja Wczytaj_List�_Uk�ad�w_Kostek().

//Funkcja Wczytaj_Uk�ad_Kostek().
procedure TMahjong_3D_Form.Wczytaj_Uk�ad_Kostek( const nazwa_pliku : string; const zwolnij : boolean = false );
var
  symbole_kostek_t : array of string;
  czy_zaprezentowa�_kostki : boolean;

  //Funkcja Przygotuj_Symbole_Kostek() w Wczytaj_Uk�ad_Kostek().
  procedure Przygotuj_Symbole_Kostek( const czytaj_parametry_kostek : boolean = false );
  var
    czy_bambusy,
    czy_kropki,
    czy_liczby,
    czy_wiatry,
    czy_smoki,
    czy_pory_roku,
    czy_kwiaty
      : boolean;

    //Funkcja Wczytaj_Ini_Uk�adu_Kostek() w Przygotuj_Symbole_Kostek() w Wczytaj_Uk�ad_Kostek().
    procedure Wczytaj_Ini_Uk�adu_Kostek( const czytaj_parametry_kostek : boolean );
    var
      search_rec : TSearchRec;
      plik_ini : TIniFile;
      zti : integer;
      zts : string;
    begin

      //
      // Funkcja wczyta parametry uk�adu kostek.
      //

      if czytaj_parametry_kostek then
        begin

          kamera_�rodek_x := 0;
          kamera_�rodek_y := 0;
          kamera_�rodek_z := 0;

          kamera_na_�rodek_x := 0;
          kamera_na_�rodek_y := 0;

        end;
      //---//if czytaj_parametry_kostek then


      zts := ExtractFilePath( Application.ExeName ) + 'Uk�ady kostek\' + nazwa_pliku + '.ini';

      if FindFirst( zts, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
        begin

          plik_ini := TIniFile.Create( zts );


          if czytaj_parametry_kostek then
            begin

              if Wczytuj_Konfiguracje_Kostek_CheckBox.Checked then
                begin

                  blokuj_rysowanie_kostek := true;


                  zti := plik_ini.ReadInteger( 'Kostki', 'Margines_Planszy', Margines_Planszy_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Wy�wietlanie_Czasu_RadioGroup.ItemIndex.

                  if    ( zti >= Margines_Planszy_SpinEdit.MinValue )
                    and ( zti <= Margines_Planszy_SpinEdit.MaxValue ) then
                    Margines_Planszy_SpinEdit.Value := zti;



                  zti := plik_ini.ReadInteger( 'Kostki', 'Szeroko��_Kostek', Szerokosc_Kostek_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Szerokosc_Kostek_SpinEdit.Value.

                  if    ( zti >= Szerokosc_Kostek_SpinEdit.MinValue )
                    and ( zti <= Szerokosc_Kostek_SpinEdit.MaxValue ) then
                    Szerokosc_Kostek_SpinEdit.Value := zti;


                  zti := plik_ini.ReadInteger( 'Kostki', 'Wysoko��_Kostek', Wysokosc_Kostek_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Wysokosc_Kostek_SpinEdit.Value.

                  if    ( zti >= Wysokosc_Kostek_SpinEdit.MinValue )
                    and ( zti <= Wysokosc_Kostek_SpinEdit.MaxValue ) then
                    Wysokosc_Kostek_SpinEdit.Value := zti;


                  zti := plik_ini.ReadInteger( 'Kostki', 'Grubo��_Kostek', Grubosc_Kostek_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Grubosc_Kostek_SpinEdit.Value.

                  if    ( zti >= Grubosc_Kostek_SpinEdit.MinValue )
                    and ( zti <= Grubosc_Kostek_SpinEdit.MaxValue ) then
                    Grubosc_Kostek_SpinEdit.Value := zti;


                  kamera_�rodek_x := plik_ini.ReadFloat( 'Kostki', 'Kamera_X', kamera_�rodek_x ); // Je�eli nie znajdzie to podstawia warto�� kamera_�rodek_x.
                  kamera_�rodek_y := plik_ini.ReadFloat( 'Kostki', 'Kamera_Y', kamera_�rodek_y ); // Je�eli nie znajdzie to podstawia warto�� kamera_�rodek_y.
                  kamera_�rodek_z := plik_ini.ReadFloat( 'Kostki', 'Kamera_Z', kamera_�rodek_z ); // Je�eli nie znajdzie to podstawia warto�� kamera_�rodek_z.

                  kamera_na_�rodek_x := plik_ini.ReadFloat( 'Kostki', 'Kamera_Na_X', kamera_na_�rodek_x ); // Je�eli nie znajdzie to podstawia warto�� kamera_na_�rodek_x.
                  kamera_na_�rodek_y := plik_ini.ReadFloat( 'Kostki', 'Kamera_Na_Y', kamera_na_�rodek_y ); // Je�eli nie znajdzie to podstawia warto�� kamera_na_�rodek_y.


                  blokuj_rysowanie_kostek := false;

                end;
              //---//if Wczytuj_Konfiguracje_Kostek_CheckBox.Checked then

            end;
          //---//if czytaj_parametry_kostek then


          czy_bambusy := plik_ini.ReadBool( 'Kostki_Symbole', 'Bambusy', czy_bambusy ); // Je�eli nie znajdzie to podstawia warto�� czy_bambusy.
          czy_kropki := plik_ini.ReadBool( 'Kostki_Symbole', 'Kropki', czy_kropki ); // Je�eli nie znajdzie to podstawia warto�� czy_kropki.
          czy_liczby := plik_ini.ReadBool( 'Kostki_Symbole', 'Liczby', czy_liczby ); // Je�eli nie znajdzie to podstawia warto�� czy_liczby.
          czy_wiatry := plik_ini.ReadBool( 'Kostki_Symbole', 'Wiatry', czy_wiatry ); // Je�eli nie znajdzie to podstawia warto�� czy_wiatry.
          czy_smoki := plik_ini.ReadBool( 'Kostki_Symbole', 'Smoki', czy_smoki ); // Je�eli nie znajdzie to podstawia warto�� czy_smoki.
          czy_pory_roku := plik_ini.ReadBool( 'Kostki_Symbole', 'Pory_Roku', czy_pory_roku ); // Je�eli nie znajdzie to podstawia warto�� czy_pory_roku.
          czy_kwiaty := plik_ini.ReadBool( 'Kostki_Symbole', 'Kwiaty', czy_kwiaty ); // Je�eli nie znajdzie to podstawia warto�� czy_kwiaty.


          plik_ini.Free();

        end;
      //---//if FindFirst( zts, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.

      FindClose( search_rec );

    end;//---//Funkcja Wczytaj_Ini_Uk�adu_Kostek() w Przygotuj_Symbole_Kostek() w Wczytaj_Uk�ad_Kostek().

  var
    i,
    j
      : integer;
  begin//Funkcja Przygotuj_Symbole_Kostek() w Wczytaj_Uk�ad_Kostek().

    //
    // Ka�dy kamie� wyst�puje w grze w czterech kopiach, zatem ka�dy kolor sk�ada si� z 36 kamieni (9�4).
    // Pe�ny zestaw p�ytek do gry mad�ong liczy 144 p�ytki.
    //
    // Bambusy_ 9 * 4 = 36
    // Kropki_ 9 * 4 = 36
    // Liczby_ 9 * 4 = 36
    //
    // Wiatry_ 4 * 4 = 16
    //
    // Smoki_ 3 * 4 = 12
    //
    // Pory_Roku_ 4 * 2 = 8 (38 r�ne kostki)
    // Lub
    // Pory_Roku_ 4 * 1 = 4 + Kwiaty_ 4 * 1 = 4 = 8 (42 r�ne kostki)
    //
    // = 144
    //

    SetLength( symbole_kostek_t, 0 );

    czy_bambusy := true;
    czy_kropki := true;
    czy_liczby := true;
    czy_wiatry := true;
    czy_smoki := true;
    czy_pory_roku := true;
    czy_kwiaty := true;


    Wczytaj_Ini_Uk�adu_Kostek( czytaj_parametry_kostek );


    if not czy_zaprezentowa�_kostki then
      i := 4
    else//if not czy_zaprezentowa�_kostki then
      i := 1;

    //for j := 1 to 4 do
    for j := 1 to i do
      begin

        if czy_bambusy then
          for i := 1 to 9 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Bambusy_' + IntToStr( i );

              if czy_zaprezentowa�_kostki then
                uk�ad_kostek_t[ i - 1 ][ 0 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 9 do

        if czy_kropki then
          for i := 1 to 9 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Kropki_' + IntToStr( i );

              if czy_zaprezentowa�_kostki then
                uk�ad_kostek_t[ i - 1 ][ 1 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 9 do

        if czy_liczby then
          for i := 1 to 9 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Liczby_' + IntToStr( i );

              if czy_zaprezentowa�_kostki then
                uk�ad_kostek_t[ i - 1 ][ 2 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 9 do


        if czy_wiatry then
          for i := 1 to 4 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Wiatry_' + IntToStr( i );

              if czy_zaprezentowa�_kostki then
                uk�ad_kostek_t[ i - 1 ][ 3 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 4 do


          if czy_smoki then
            for i := 1 to 3 do
              begin

                SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
                symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Smoki_' + IntToStr( i );

                if czy_zaprezentowa�_kostki then
                uk�ad_kostek_t[ i - 1 ][ 4 ][ 0 ] := '1';

              end;
            //---//for i := 1 to 4 do

      end;
    //---//for j := 1 to i do


    if not Kostki_Kwiatkow_CheckBox.Checked then
      begin

        if not czy_zaprezentowa�_kostki then
          i := 2
        else//if not czy_zaprezentowa�_kostki then
          i := 1;

        if czy_pory_roku then
          //for j := 1 to 2 do
          for j := 1 to i do
            for i := 1 to 4 do
              begin

                SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
                symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Pory_Roku_' + IntToStr( i );

                if czy_zaprezentowa�_kostki then
                  uk�ad_kostek_t[ i - 1 ][ 5 ][ 0 ] := '1';

              end;
            //---//for i := 1 to 4 do

      end
    else//if not Kostki_Kwiatkow_CheckBox.Checked then
      begin

        if czy_pory_roku then
          for i := 1 to 4 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Pory_Roku_' + IntToStr( i );

              if czy_zaprezentowa�_kostki then
                uk�ad_kostek_t[ i - 1 ][ 5 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 4 do


        if czy_kwiaty then
          for i := 1 to 4 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Kwiaty_' + IntToStr( i );

              if czy_zaprezentowa�_kostki then
                uk�ad_kostek_t[ i - 1 ][ 6 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 4 do

      end;
    //---//if not Kostki_Kwiatkow_CheckBox.Checked then

  end;//---//Funkcja Przygotuj_Symbole_Kostek() w Wczytaj_Uk�ad_Kostek().

var
  x,
  y,
  z,
  i,
  zti
    : integer;
  zts,
  zts_1
    : string;
  search_rec : TSearchRec;
  plik_tekstowy : TextFile;
begin//Funkcja Wczytaj_Uk�ad_Kostek().

  Screen.Cursor := crHourGlass;

  kostka_klikni�ta := nil;
  kostka_podpowied�_1 := nil;
  kostka_podpowied�_2 := nil;
  kostka_demo := nil;


  gra_czas_koniec := 0;


  SetLength( podpowied�_poprzednia_t_r, 0 );


  czy_zaprezentowa�_kostki := nazwa_pliku = '*:?:*<>"\|/'; // Zaprezentuj kostki.

  {$region 'Zwalnianie element�w.'}
  for x := Length( uk�ad_kostek_t ) - 1 downto 0 do
    begin

      for y := Length( uk�ad_kostek_t[ 0 ] ) - 1 downto 0 do
        SetLength( uk�ad_kostek_t[ x ][ y ], 0 );

      SetLength( uk�ad_kostek_t[ x ], 0 );

    end;
  //---//for x := 0 to Length( uk�ad_kostek_t ) - 1 do

  SetLength( uk�ad_kostek_t, 0 );


  uk�ad_x := 0;
  uk�ad_y := 0;
  uk�ad_z := 0;


  for x := Length( kostki_t ) - 1 downto 0 do
    begin

      for y := Length( kostki_t[ 0 ] ) - 1 downto 0 do
        begin

          for z := Length( kostki_t[ 0 ][ 0 ] ) - 1 downto 0 do
            if kostki_t[ x ][ y ][ z ] <> nil then
              begin

                //FreeAndNil( kostki_t[ x ][ y ][ z ].Szkie�ko );
                FreeAndNil( kostki_t[ x ][ y ][ z ] );
                //kostki_t[ x ][ y ][ z ].Free();

              end;
            //---//if kostki_t[ x ][ y ][ z ] <> nil then

          SetLength( kostki_t[ x ][ y ], 0 );

        end;
      //---//for y := Length( kostki_t[ 0 ] ) - 1 downto 0 do

      SetLength( kostki_t[ x ], 0 );

    end;
  //---//for x := 0 to Length( kostki_t ) - 1 do

  SetLength( kostki_t, 0 );
  SetLength( cofnij_t_r, 0 );
  Gra__Cofnij_MenuItem.Enabled := false;
  {$endregion 'Zwalnianie element�w.'}


  if zwolnij then
    begin

      Screen.Cursor := crDefault;
      Exit;

    end;
  //---//if zwolnij then


  if not czy_zaprezentowa�_kostki then
    begin

      {$region 'Wczytywanie pliku.'}
      zts := ExtractFilePath( Application.ExeName ) + 'Uk�ady kostek\' + nazwa_pliku + '.txt';

      if FindFirst( zts, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
        begin

          FindClose( search_rec );
          //Application.MessageBox(  PChar( 'Nie odnaleziono pliku uk�adu kostek: ' + zts + '.' ), 'B��d', MB_ICONEXCLAMATION + MB_OK  );
          Screen.Cursor := crDefault;
          Application.MessageBox(  PChar( t__nie_odnaleziono_pliku_uk�adu_kostek + zts + '.' ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK  );
          Exit;

        end;
      //---//if FindFirst( zts, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.

      FindClose( search_rec );

      AssignFile( plik_tekstowy, zts );

      wczytany_uk�ad_kostek_nazwa_pliku := nazwa_pliku;
      //Uk�ad_Kostek_Nazwa_Label.Caption := 'Nazwa uk�adu kostek: ' + wczytany_uk�ad_kostek_nazwa_pliku + '.';
      Uklad_Kostek_Nazwa_Label.Caption := t__uk�ad_kostek_nazwa + wczytany_uk�ad_kostek_nazwa_pliku + '.';

      x := 0;
      y := 0;
      z := 0;
      zti := 0;


      Reset( plik_tekstowy );

      while not Eof( plik_tekstowy ) do
        begin

          Readln( plik_tekstowy, zts ); //Czyta ca�� lini�.

          // Komentarze '//(...)', '    //(...)'.
          zts_1 := Trim( zts );

          if    ( Length( zts_1 ) > 1 )
            and ( zts_1[ 1 ] = '*' )
            and ( zts_1[ 2 ] = '*' ) then
            zts_1 := 'Komentarze'
          else//if    ( Length( zts_1 ) > 1 ) (...)
            zts_1 := '';


          if zts_1 <> 'Komentarze' then
            begin

              if x < Length( zts ) then // Okre�la najd�u�szy wiersz x.
                x := Length( zts );

              if Trim( zts ) = '' then
                begin

                  inc( z );

                  if y < zti then // Okre�la najd�u�sz� kolumn� y.
                    y := zti;

                  zti := 0; // Okre�la ilo�� poziom�w.

                end
              else//if Trim( zts ) = '' then
                begin

                  inc( zti );

                  if z <= 0 then // Pierwsza warstwa.
                    z := 1;

                end;
              //---//if Trim( zts ) = '' then

            end;
          //---//if zts_1 <> 'Komentarze' then

        end;
      //---//while not Eof( plik_tekstowy ) do

      if y < zti then // Okre�la najd�u�sz� kolumn� y.
        y := zti;


      uk�ad_x := x - 1;
      uk�ad_y := y - 1;
      uk�ad_z := z - 1;


      SetLength( uk�ad_kostek_t, x, y, z );
      SetLength( kostki_t, x, y, z );


      for x := 0 to Length( uk�ad_kostek_t ) - 1 do
        for y := 0 to Length( uk�ad_kostek_t[ 0 ] ) - 1 do
          for z := 0 to Length( uk�ad_kostek_t[ 0 ][ 0 ] ) - 1 do
            uk�ad_kostek_t[ x ][ y ][ z ] := '0';


      Reset( plik_tekstowy );

      y := -1;
      z := 0;

      while not Eof( plik_tekstowy ) do
        begin

          Readln( plik_tekstowy, zts ); //Czyta ca�� lini�.

          // Komentarze '//(...)', '    //(...)'.
          zts_1 := Trim( zts );

          if    ( Length( zts_1 ) > 1 )
            and ( zts_1[ 1 ] = '*' )
            and ( zts_1[ 2 ] = '*' ) then
            zts_1 := 'Komentarze'
          else//if    ( Length( zts_1 ) > 1 ) (...)
            zts_1 := '';


          if zts_1 <> 'Komentarze' then
            begin

              inc( y );

              if Trim( zts ) = '' then
                begin

                  inc( z );
                  y := -1;

                end
              else//if Trim( zts ) = '' then
                for x := 0 to Length( zts ) - 1 do
                  if CharInSet( zts[ x + 1 ], [ '1', 'v', '^', '<', '>', '\', '/', '[', ']' ] ) then
                  //if zts[ x + 1 ] in [ '1', 'v', '^', '<', '>', '\', '/', '[', ']' ] then
                    uk�ad_kostek_t[ x ][ y ][ z ] := zts[ x + 1 ];
                  //else//if zts[ x + 1 ] = '1' then
                  //  uk�ad_kostek_t[ x ][ y ][ z ] := '0';

            end;
          //---//if zts_1 <> 'Komentarze' then

        end;
      //---//while not Eof( plik_tekstowy ) do


      CloseFile( plik_tekstowy ); //Dopiero po zamkni�ciu zapisuje zmiany.
      {$endregion 'Wczytywanie pliku.'}

    end
  else//if not czy_zaprezentowa�_kostki then
    begin

      x := 9;

      if not Kostki_Kwiatkow_CheckBox.Checked then
        y := 6
      else//if not Kostki_Kwiatkow_CheckBox.Checked then
        y := 7;

      z := 1;

      uk�ad_x := x - 1;
      uk�ad_y := y - 1;
      uk�ad_z := z - 1;


      SetLength( uk�ad_kostek_t, x, y, z );
      SetLength( kostki_t, x, y, z );


      for x := 0 to Length( uk�ad_kostek_t ) - 1 do
        for y := 0 to Length( uk�ad_kostek_t[ 0 ] ) - 1 do
          for z := 0 to Length( uk�ad_kostek_t[ 0 ][ 0 ] ) - 1 do
            uk�ad_kostek_t[ x ][ y ][ z ] := '0';

    end;
  //---//if not czy_zaprezentowa�_kostki then

  //x := 4;
  //y := 3;
  //z := 1;

  //SetLength( uk�ad_kostek_t, x, y, z );
  //SetLength( uk�ad_kostek_t, 4, 3, 2 );

  //SetLength( kostki_t, x, y, z );
  //SetLength( kostki_t, 1, 1, 1 );
  //kostki_t[ 0 ][ 0 ][ 0 ] := TKostka.Create();
  //kostki_t[ 0 ][ 0 ][ 0 ].Parent := ScrollBox1;
  //FreeAndNil( kostki_t[ 0 ][ 0 ][ 0 ] );


//  uk�ad_kostek_t[ 0 ][ 0 ][ 0 ] := 1;
//  uk�ad_kostek_t[ 1 ][ 0 ][ 0 ] := 1;
//  uk�ad_kostek_t[ 2 ][ 1 ][ 0 ] := 1;


  {$region 'Tworzenie uk�adu kostek.'}
  Przygotuj_Symbole_Kostek( true );

  Randomize();

  if    (  Length( uk�ad_kostek_t ) > 0  )
    and (  Length( uk�ad_kostek_t[ 0 ] ) > 0  ) then
    for z := 0 to Length( uk�ad_kostek_t[ 0 ][ 0 ] ) - 1 do // Najpierw jest z aby zachowa� wizualizacj� warstw uk�adaj�c kostki od do�u do g�ry.
      for y := 0 to Length( uk�ad_kostek_t[ 0 ] ) - 1 do // Najpierw jest y aby najpierw uk�ada� wiersze.
        for x := 0 to Length( uk�ad_kostek_t ) - 1 do
          if uk�ad_kostek_t[ x ][ y ][ z ] <> '0' then
            begin

              Utw�rz_Kostk�( kostki_t[ x ][ y ][ z ], uk�ad_kostek_t[ x ][ y ][ z ] );

              kostki_t[ x ][ y ][ z ].x := x;
              kostki_t[ x ][ y ][ z ].y := y;
              kostki_t[ x ][ y ][ z ].z := z;


              if Length( symbole_kostek_t ) <= 0 then
                Przygotuj_Symbole_Kostek(); // Je�eli kostek w uk�adzie b�dzie wi�cej ni� dost�pnych symboli kostek.


              if not czy_zaprezentowa�_kostki then
                zti := Random(  Length( symbole_kostek_t )  )
              else//if not czy_zaprezentowa�_kostki then
                zti := 0;

              if Length( symbole_kostek_t ) > 0 then
                begin

                  kostki_t[ x ][ y ][ z ].symbol := symbole_kostek_t[ zti ]; //??? Ma by� odkomentowane.
                  //kostki_t[ x ][ y ][ z ].Caption := symbole_kostek_t[ zti ];
                  //kostki_t[ x ][ y ][ z ].Caption := IntToStr( x ) + IntToStr( y ) + IntToStr( z ); //???

                end;
              //---//if Length( symbole_kostek_t ) > 0 then



              for i := zti to Length( symbole_kostek_t ) - 2 do
                symbole_kostek_t[ i ] := symbole_kostek_t[ i + 1 ];

              if Length( symbole_kostek_t ) >= 1 then
                SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) - 1  );

            end;
          //---//if uk�ad_kostek_t[ x ][ y ][ z ] <> '0' then

  SetLength( symbole_kostek_t, 0 );
  {$endregion 'Tworzenie uk�adu kostek.'}


  //Kostki_SpinEditChange( nil ); //???

  Screen.Cursor := crHourGlass;

  StatusBar1.Panels[ 1 ].Text := IntToStr( Kostek_Na_Planszy() );

  par_do_zdj�cia_ilo�� := Par_Do_Zdj�cia();

  //Wczytaj_Obrazki_Kostek( '' );
  //Wczytaj_Obrazki_Kostek( obrazki_kostek_nazwa_katalogu, true ); // true - aby warto�ci z pliku ini nie blokowa�y zmian kostek.
  Wczytaj_Obrazki_Kostek( obrazki_kostek_nazwa_katalogu );
    //Kamera_Ustawienie_Pocz�tkowe(); //???

  przetasowania_ilo�� := 0;
  podpowiedzi_ilo�� := 0;
  cofni�cia_ilo�� := 0;


  Kostki_SpinEditChange( nil );


  Kamera_Ustawienie_Pocz�tkowe();


  if not czy_zaprezentowa�_kostki then
    gra_czas_start := Now();

  Screen.Cursor := crDefault;

end;//---//Funkcja Wczytaj_Uk�ad_Kostek().

//Funkcja Utw�rz_Kostk�().
procedure TMahjong_3D_Form.Utw�rz_Kostk�( var kostka_f : TKostka; pozycja : Char );
begin

  if kostka_f <> nil then
    Exit;


  kostka_f := TKostka.Create( Application );

  kostka_f.Parent := GLScene1.Objects;

  //????kostka_f.Przerysuj_Kostk�();

  //zti := 0;
  //
  //if CharInSet( pozycja, [ '<', '>', '\', '/', '[', ']' ] ) then
  ////if pozycja in [ '<', '>', '\', '/', '[', ']' ] then
  //  begin
  //
  //    zti := Round( kostka_f.Width / 2 );
  //
  //    if CharInSet( pozycja, [ '<', '\', ']' ] ) then
  //    //if pozycja in [ '<', '\', ']' ] then
  //      zti := -zti;
  //
  //  end;
  ////---//if pozycja in [ '<', '>' ] then
  //
  //kostka_f.Left := x * kostka_f.Width + zti;
  //
  //
  //zti := 0;
  //
  //if CharInSet( pozycja, [ 'v', '^', '\', '/', '[', ']' ] ) then
  ////if pozycja in [ 'v', '^', '\', '/', '[', ']' ] then
  //  begin
  //
  //    zti := Round( kostka_f.Height / 2 );
  //
  //    if CharInSet( pozycja, [ '^', '\', '/' ] ) then
  //    //if pozycja in [ '^', '\', '/' ] then
  //      zti := -zti;
  //
  //  end;
  ////---//if pozycja in [ '<', '>' ] then
  //
  //kostka_f.Top := y * kostka_f.Height + zti;


  if CharInSet( pozycja, [ '<', '>', '\', '/', '[', ']' ] ) then
  //if pozycja in [ '<', '>', '\', '/', '[', ']' ] then
    begin

      kostka_f.korekta_x := 1;

      if CharInSet( pozycja, [ '<', '\', ']' ] ) then
      //if pozycja in [ '<', '\', ']' ] then
        kostka_f.korekta_x := -kostka_f.korekta_x;

    end;
  //---//if pozycja in [ '<', '>' ] then

  if CharInSet( pozycja, [ 'v', '^', '\', '/', '[', ']' ] ) then
  //if pozycja in [ 'v', '^', '\', '/', '[', ']' ] then
    begin

      kostka_f.korekta_y := 1;

      if CharInSet( pozycja, [ '^', '\', '/' ] ) then
      //if pozycja in [ '^', '\', '/' ] then
        kostka_f.korekta_y := -kostka_f.korekta_y;

    end;
  //---//if pozycja in [ '<', '>' ] then

  kostka_f.Przerysuj_Kostk�();//????

end;//---//Funkcja Utw�rz_Kostk�().

//Funkcja Czy_Kostk�_Mo�na_Zdj��().
function TMahjong_3D_Form.Czy_Kostk�_Mo�na_Zdj��( kostka_f : TKostka ): boolean;
begin

  Result := false;

  if kostka_f = nil then
    Exit;

  //Caption := IntToStr( kostka_f.x ) + ' ' + IntToStr( kostka_f.y ) + ' ' + IntToStr( kostka_f.z ); //???

  // Nad.
  if    (  kostka_f.z < uk�ad_z  )
    and (
             ( uk�ad_kostek_t[ kostka_f.x ][ kostka_f.y ][ kostka_f.z + 1 ] <> '0' ) // Kostka bezpo�rednio nad.
          or (
                   (  kostka_f.x < uk�ad_x  )
               and ( uk�ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = '<' ) // Kostka nad po L przesuni�ta w P.
             )
          or (
                   ( kostka_f.x > 0 )
               and ( uk�ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = '>' ) // Kostka nad po P przesuni�ta w L.
             )
          or (
                   ( kostka_f.y < uk�ad_y )
               and ( uk�ad_kostek_t[ kostka_f.x ][ kostka_f.y + 1 ][ kostka_f.z + 1 ] = '^' ) // Kostka nad D przesuni�ta w G.
             )
          or (
                   ( kostka_f.y > 0 )
               and ( uk�ad_kostek_t[ kostka_f.x ][ kostka_f.y - 1 ][ kostka_f.z + 1 ] = 'v' ) // Kostka nad G przesuni�ta w D.
             )
        ) then
    Exit;


  // Nad skos.
  if    (  kostka_f.z < uk�ad_z  )
    and (
          // Kostka nad D przesuni�ta w LG.
            (
                   ( kostka_f.y < uk�ad_y )
               and ( uk�ad_kostek_t[ kostka_f.x ][ kostka_f.y + 1 ][ kostka_f.z + 1 ] = '\' ) // Kostka z D.
             )
          or (
                   ( kostka_f.x < uk�ad_x )
               and ( uk�ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = '\' ) // Kostka z P.
             )
          or (
                   ( kostka_f.x < uk�ad_x )
               and ( kostka_f.y < uk�ad_y )
               and ( uk�ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y + 1 ][ kostka_f.z + 1 ] = '\' ) // Kostka z PD.
             )

          // Kostka nad D przesuni�ta w PG.
          or (
                   ( kostka_f.y < uk�ad_y )
               and ( uk�ad_kostek_t[ kostka_f.x ][ kostka_f.y + 1 ][ kostka_f.z + 1 ] = '/' ) // Kostka z D.
             )
          or (
                   ( kostka_f.x > 0 )
               and ( uk�ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = '/' ) // Kostka z L.
             )
          or (
                   ( kostka_f.x > 0 )
               and ( kostka_f.y < uk�ad_y )
               and ( uk�ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y + 1 ][ kostka_f.z + 1 ] = '/' ) // Kostka z LD.
             )


          // Kostka nad G przesuni�ta w LD.
          or (
                   ( kostka_f.y > 0 )
               and ( uk�ad_kostek_t[ kostka_f.x ][ kostka_f.y - 1 ][ kostka_f.z + 1 ] = '[' ) // Kostka z G.
             )
          or (
                   ( kostka_f.x > 0 )
               and ( uk�ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = '[' ) // Kostka z P.
             )
          or (
                   ( kostka_f.x > 0 )
               and ( kostka_f.y > 0 )
               and ( uk�ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y - 1 ][ kostka_f.z + 1 ] = '[' ) // Kostka z PG.
             )

          // Kostka nad G przesuni�ta w PD.
          or (
                   ( kostka_f.y > 0 )
               and ( uk�ad_kostek_t[ kostka_f.x ][ kostka_f.y - 1 ][ kostka_f.z + 1 ] = ']' ) // Kostka z G.
             )
          or (
                   ( kostka_f.x < uk�ad_x )
               and ( uk�ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = ']' ) // Kostka z L.
             )
          or (
                   ( kostka_f.x < uk�ad_x )
               and ( kostka_f.y > 0 )
               and ( uk�ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y - 1 ][ kostka_f.z + 1 ] = ']' ) // Kostka z LG.
             )

        ) then
    Exit;


  // S�siednie.
  if    (
              ( kostka_f.x > 0 )
          and ( kostka_f.x < uk�ad_x )
          and (
                   ( uk�ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y ][ kostka_f.z ] <> '0' ) // Kostka z L.
                or (
                         (  kostka_f.y < uk�ad_y  )
                     and ( uk�ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y + 1 ][ kostka_f.z ] = '^' ) // Kostka z L przesuni�ta w G.
                   )
                or (
                         ( kostka_f.y > 0 )
                     and ( uk�ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y - 1 ][ kostka_f.z ] = 'v' ) // Kostka Z L przesuni�ta w D.
                   )
              )
          and (
                   ( uk�ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y ][ kostka_f.z ] <> '0' ) // Kostka z P.
                or (
                         (  kostka_f.y < uk�ad_y  )
                     and ( uk�ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y + 1 ][ kostka_f.z ] = '^' ) // Kostka z P przesuni�ta w G.
                   )
                or (
                         ( kostka_f.y > 0 )
                     and ( uk�ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y - 1 ][ kostka_f.z ] = 'v' ) // Kostka Z P przesuni�ta w D.
                   )
              )
        )
         then
    Exit;


  Result := true;

end;//---//Funkcja Czy_Kostk�_Mo�na_Zdj��().

//Funkcja Czy_Kostki_Pasuj�_Do_Siebie().
function TMahjong_3D_Form.Czy_Kostki_Pasuj�_Do_Siebie( kostka_1_f, kostka_2_f : TKostka ) : boolean;
begin

  Result := false;

  if   ( kostka_1_f = nil )
    or ( kostka_2_f = nil ) then
    Exit;


  if   ( kostka_1_f.symbol = kostka_2_f.symbol )
    or (
             (  Pos( 'Pory_Roku_', kostka_1_f.symbol ) > 0  )
         and (  Pos( 'Pory_Roku_', kostka_2_f.symbol ) > 0  )
       )
    or (
             (  Pos( 'Kwiaty_', kostka_1_f.symbol ) > 0  )
         and (  Pos( 'Kwiaty_', kostka_2_f.symbol ) > 0  )
       ) then
    Result := true;

end;//---//Funkcja Czy_Kostki_Pasuj�_Do_Siebie().

//Funkcja Zdejmij_Kostki().
procedure TMahjong_3D_Form.Zdejmij_Kostki( kostka_f : TKostka );
var
  x,
  y,
  z
    : integer;
begin

  //Caption := Caption + 'Z'; //???

  SetLength( cofnij_t_r, Length( cofnij_t_r ) + 1  );
  cofnij_t_r[ Length( cofnij_t_r ) - 1 ].symbol := '';

  if kostka_klikni�ta <> nil then
    begin

      x := kostka_klikni�ta.x;
      y := kostka_klikni�ta.y;
      z := kostka_klikni�ta.z;

      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].symbol := kostka_klikni�ta.symbol;
      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_1 := uk�ad_kostek_t[ x ][ y ][ z ];

      //FreeAndNil( kostka_klikni�ta.Szkie�ko );
      FreeAndNil( kostka_klikni�ta );

      uk�ad_kostek_t[ x ][ y ][ z ] := '0';
      kostki_t[ x ][ y ][ z ] := nil;

      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].x_1 := x;
      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].y_1 := y;
      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].z_1 := z;

    end;
  //---//if kostka_klikni�ta <> nil then


  if kostka_f <> nil then
    begin

      x := kostka_f.x;
      y := kostka_f.y;
      z := kostka_f.z;

      if cofnij_t_r[ Length( cofnij_t_r ) - 1 ].symbol = '' then
        cofnij_t_r[ Length( cofnij_t_r ) - 1 ].symbol := kostka_f.symbol;

      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_2 := uk�ad_kostek_t[ x ][ y ][ z ];

      //FreeAndNil( kostka_f.Szkie�ko );
      FreeAndNil( kostka_f );

      uk�ad_kostek_t[ x ][ y ][ z ] := '0';
      kostki_t[ x ][ y ][ z ] := nil;

      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].x_2 := x;
      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].y_2 := y;
      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].z_2 := z;

    end;
  //---//if kostka_f <> nil then

  if not Gra__Demo_MenuItem.Checked then
    Gra__Cofnij_MenuItem.Enabled := true;

  x := Kostek_Na_Planszy();

  StatusBar1.Panels[ 1 ].Text := IntToStr( x );

  par_do_zdj�cia_ilo�� := Par_Do_Zdj�cia();


  SetLength( podpowied�_poprzednia_t_r, 0 );


  if x <= 1 then
    begin

      gra_czas_koniec := Now();

      if Gra__Demo_MenuItem.Checked then
        Gra__Demo_MenuItem.Checked := false;

      //Application.MessageBox( 'Koniec gry.', 'Gratulacje', MB_ICONINFORMATION + MB_OK );
      Application.MessageBox(  PChar( t__koniec_gry ), PChar( t__gratulacje ), MB_ICONINFORMATION + MB_OK  );

    end;
  //---//if x <= 1 then


  if    ( x > 2 )
    and ( par_do_zdj�cia_ilo�� <= 0 )
    and ( Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked )
    and ( not Gra__Demo_MenuItem.Checked ) then
    //if Application.MessageBox( 'Nie odnaleziono kostek do �ci�gni�cia.' + #13 + 'Czy przetasowa�?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO ) = IDYES then
    if Application.MessageBox(  PChar( t__nie_odnaleziono_kostek_do_�ci�gni�cia_czy_przetasowa� ), PChar( t__potwierdzenie ), MB_ICONQUESTION + MB_YESNO  ) = IDYES then
       Gra__Przetasuj_MenuItemClick( nil );

end;//---//Funkcja Zdejmij_Kostki().

//Funkcja Kostek_Na_Planszy().
function TMahjong_3D_Form.Kostek_Na_Planszy() : integer;
var
  x,
  y,
  z
    : integer;
begin

  Result := 0;

  for x := 0 to Length( kostki_t ) - 1 do
    for y := 0 to Length( kostki_t[ 0 ] ) - 1 do
      for z := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
        if kostki_t[ x ][ y ][ z ] <> nil then
          inc( Result );

end;//---//Funkcja Kostek_Na_Planszy().

//Funkcja Par_Do_Zdj�cia().
function TMahjong_3D_Form.Par_Do_Zdj�cia() : integer;
var
  x_1,
  y_1,
  z_1,
  x_2,
  y_2,
  z_2
    : integer;
begin

  Result := 0;

  for x_1 := 0 to Length( kostki_t ) - 1 do
    for y_1 := 0 to Length( kostki_t[ 0 ] ) - 1 do
      for z_1 := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
        if    ( kostki_t[ x_1 ][ y_1 ][ z_1 ] <> nil )
          and (  Czy_Kostk�_Mo�na_Zdj��( kostki_t[ x_1 ][ y_1 ][ z_1 ] )  ) then
          begin

            for x_2 := 0 to Length( kostki_t ) - 1 do
              for y_2 := 0 to Length( kostki_t[ 0 ] ) - 1 do
                for z_2 := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
                  if    ( kostki_t[ x_2 ][ y_2 ][ z_2 ] <> nil )
                    and ( kostki_t[ x_1 ][ y_1 ][ z_1 ] <> kostki_t[ x_2 ][ y_2 ][ z_2 ] )
                    //and ( kostki_t[ x_1 ][ y_1 ][ z_1 ].symbol = kostki_t[ x_2 ][ y_2 ][ z_2 ].symbol )
                    and (  Czy_Kostki_Pasuj�_Do_Siebie( kostki_t[ x_1 ][ y_1 ][ z_1 ], kostki_t[ x_2 ][ y_2 ][ z_2 ] )  )
                    and (  Czy_Kostk�_Mo�na_Zdj��( kostki_t[ x_2 ][ y_2 ][ z_2 ] )  ) then
                    begin

                      inc( Result );

                    end;
                  //---//if    ( kostki_t[ x_2 ][ y_2 ][ z_2 ] <> nil ) (...)

          end;
        //---//if    ( kostki_t[ x_1 ][ y_1 ][ z_1 ] <> nil ) (...)

  if Result > 0 then
    Result := Round( Result / 2 );

end;//---//Funkcja Par_Do_Zdj�cia().

//Funkcja Wczytaj_Ustawienia().
procedure TMahjong_3D_Form.Wczytaj_Ustawienia();

  //Funkcja RGB_Napis_W_Color() w Wczytaj_Ustawienia().
  function RGB_Napis_W_Color( napis_f : string ) : integer;
  var
    zt_rgb_t_f : TTabela_RGB;
    zti : integer;
    zts : string;
  begin

    zt_rgb_t_f[ 1 ] := 0;
    zt_rgb_t_f[ 2 ] := 0;
    zt_rgb_t_f[ 3 ] := 0;

    napis_f := napis_f + '.';
    
    zti := Pos( '.', napis_f );
    zts := Copy( napis_f, 1, zti - 1 );
    Delete( napis_f, 1, zti );

    try
      zt_rgb_t_f[ 1 ] := StrToInt( zts );
    except
    end;
    //---//try

    zti := Pos( '.', napis_f );
    zts := Copy( napis_f, 1, zti - 1 );
    Delete( napis_f, 1, zti );

    try
      zt_rgb_t_f[ 2 ] := StrToInt( zts );
    except
    end;
    //---//try

    zti := Pos( '.', napis_f );
    zts := Copy( napis_f, 1, zti - 1 );
    Delete( napis_f, 1, zti );

    try
      zt_rgb_t_f[ 3 ] := StrToInt( zts );
    except
    end;
    //---//try        

    Result := RGB( zt_rgb_t_f[ 1 ], zt_rgb_t_f[ 2 ], zt_rgb_t_f[ 3 ] );

  end;//---//Funkcja RGB_Napis_W_Color() w Wczytaj_Ustawienia().

  //Funkcja Invert_Color() w Wczytaj_Ustawienia().
  function Invert_Color( const color : TColor ) : TColor;
  begin

    Result := TColor(Winapi.Windows.RGB(
      255 - GetRValue( Color ),
      255 - GetGValue( Color ),
      255 - GetBValue( Color )
      ));

  end;//---//Funkcja Invert_Color() w Wczytaj_Ustawienia().

var
  plik_ini : TIniFile;
  tekst_l : TStringList;
  search_rec : TSearchRec;
  zti_1,
  zti_2
   : integer;
  zts_1,
  zts_2
    : string;
  zt_component : TComponent;
begin//Funkcja Wczytaj_Ustawienia().

  // Tutaj jeszcze nie ma wczytanych t�umacze� (w ustawieniach jest okre�lone wybrane t�umaczenie).

  {$region 'Plik ini.'}
  plik_ini := TIniFile.Create(  ExtractFilePath( Application.ExeName ) + 'Mahjong.ini'  );

  blokuj_rysowanie_kostek := true;

  if not plik_ini.ValueExists( 'Opcje', 'Wy�wietlanie_Czasu' ) then
    plik_ini.WriteInteger( 'Opcje', 'Wy�wietlanie_Czasu', Wyswietlanie_Czasu_RadioGroup.ItemIndex )
  else//if not plik_ini.ValueExists( 'Opcje', 'Wy�wietlanie_Czasu' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Wy�wietlanie_Czasu', Wyswietlanie_Czasu_RadioGroup.ItemIndex ); // Je�eli nie znajdzie to podstawia warto�� Wyswietlanie_Czasu_RadioGroup.ItemIndex.

      if    ( zti_1 >= 0 )
        and ( zti_1 <= Wyswietlanie_Czasu_RadioGroup.Items.Count ) then
        Wyswietlanie_Czasu_RadioGroup.ItemIndex := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Wy�wietlanie_Czasu' ) then


  if not plik_ini.ValueExists( 'Opcje', 'Wy�wietlanie_Ilo�ci_Par_Do_Zdj�cia' ) then
    plik_ini.WriteBool( 'Opcje', 'Wy�wietlanie_Ilo�ci_Par_Do_Zdj�cia', Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked )
  else
    Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Wy�wietlanie_Ilo�ci_Par_Do_Zdj�cia', Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked ); // Je�eli nie znajdzie to podstawia warto�� Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked.



  if not plik_ini.ValueExists( 'Opcje', 'Margines_Planszy' ) then
    plik_ini.WriteInteger( 'Opcje', 'Margines_Planszy', Margines_Planszy_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Margines_Planszy' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Margines_Planszy', Margines_Planszy_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Wyswietlanie_Czasu_RadioGroup.ItemIndex.

      if    ( zti_1 >= Margines_Planszy_SpinEdit.MinValue )
        and ( zti_1 <= Margines_Planszy_SpinEdit.MaxValue ) then
        Margines_Planszy_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Margines_Planszy' ) then



  if not plik_ini.ValueExists( 'Opcje', 'Szeroko��_Kostek' ) then
    plik_ini.WriteInteger( 'Opcje', 'Szeroko��_Kostek', Szerokosc_Kostek_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Szeroko��_Kostek' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Szeroko��_Kostek', Szerokosc_Kostek_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Szerokosc_Kostek_SpinEdit.Value.

      if    ( zti_1 >= Szerokosc_Kostek_SpinEdit.MinValue )
        and ( zti_1 <= Szerokosc_Kostek_SpinEdit.MaxValue ) then
        Szerokosc_Kostek_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Szeroko��_Kostek' ) then



  if not plik_ini.ValueExists( 'Opcje', 'Wysoko��_Kostek' ) then
    plik_ini.WriteInteger( 'Opcje', 'Wysoko��_Kostek', Wysokosc_Kostek_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Wysoko��_Kostek' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Wysoko��_Kostek', Wysokosc_Kostek_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Wysokosc_Kostek_SpinEdit.Value.

      if    ( zti_1 >= Wysokosc_Kostek_SpinEdit.MinValue )
        and ( zti_1 <= Wysokosc_Kostek_SpinEdit.MaxValue ) then
        Wysokosc_Kostek_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Wysoko��_Kostek' ) then



  if not plik_ini.ValueExists( 'Opcje', 'Grubo��_Kostek' ) then
    plik_ini.WriteInteger( 'Opcje', 'Grubo��_Kostek', Grubosc_Kostek_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Grubo��_Kostek' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Grubo��_Kostek', Grubosc_Kostek_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Grubosc_Kostek_SpinEdit.Value.

      if    ( zti_1 >= Grubosc_Kostek_SpinEdit.MinValue )
        and ( zti_1 <= Grubosc_Kostek_SpinEdit.MaxValue ) then
        Grubosc_Kostek_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Grubo��_Kostek' ) then



  if not plik_ini.ValueExists( 'Opcje', 'Szybko��_Zegara' ) then
    plik_ini.WriteInteger( 'Opcje', 'Szybko��_Zegara', Szybkosc_Zegara_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Szybko��_Zegara' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Szybko��_Zegara', Szybkosc_Zegara_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Szybkosc_Zegara_SpinEdit.Value.

      if    ( zti_1 >= Szybkosc_Zegara_SpinEdit.MinValue )
        and ( zti_1 <= Szybkosc_Zegara_SpinEdit.MaxValue ) then
        Szybkosc_Zegara_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Szybko��_Zegara' ) then




  if not plik_ini.ValueExists( 'Opcje', 'Szybko��_Kamery' ) then
    plik_ini.WriteInteger( 'Opcje', 'Szybko��_Kamery', Szybkosc_Kamery_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Szybko��_Kamery' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Szybko��_Kamery', Szybkosc_Kamery_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Szybkosc_Kamery_SpinEdit.Position.

      if    ( zti_1 >= Szybkosc_Kamery_SpinEdit.MinValue )
        and ( zti_1 <= Szybkosc_Kamery_SpinEdit.MaxValue ) then
        Szybkosc_Kamery_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Szybko��_Kamery' ) then



  if not plik_ini.ValueExists( 'Opcje', 'Kamera_Na_�rodek_Uk�adu_Kostek' ) then
    plik_ini.WriteBool( 'Opcje', 'Kamera_Na_�rodek_Uk�adu_Kostek', Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Checked )
  else
    Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Kamera_Na_�rodek_Uk�adu_Kostek', Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Checked ); // Je�eli nie znajdzie to podstawia warto�� Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Automatyczne_Wczytywanie_Uk�adu_Kostek' ) then
    plik_ini.WriteBool( 'Opcje', 'Automatyczne_Wczytywanie_Uk�adu_Kostek', Automatyczne_Wczytywanie_Ukladu_Kostek_CheckBox.Checked )
  else
    Automatyczne_Wczytywanie_Ukladu_Kostek_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Automatyczne_Wczytywanie_Uk�adu_Kostek', Automatyczne_Wczytywanie_Ukladu_Kostek_CheckBox.Checked ); // Je�eli nie znajdzie to podstawia warto�� Automatyczne_Wczytywanie_Ukladu_Kostek_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Wczytuj_Konfiguracj�_Kostek' ) then
    plik_ini.WriteBool( 'Opcje', 'Wczytuj_Konfiguracj�_Kostek', Wczytuj_Konfiguracje_Kostek_CheckBox.Checked )
  else
    Wczytuj_Konfiguracje_Kostek_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Wczytuj_Konfiguracj�_Kostek', Wczytuj_Konfiguracje_Kostek_CheckBox.Checked ); // Je�eli nie znajdzie to podstawia warto�� Wczytuj_Konfiguracje_Kostek_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Kostki_Kwiatk�w' ) then
    plik_ini.WriteBool( 'Opcje', 'Kostki_Kwiatk�w', Kostki_Kwiatkow_CheckBox.Checked )
  else
    Kostki_Kwiatkow_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Kostki_Kwiatk�w', Kostki_Kwiatkow_CheckBox.Checked ); // Je�eli nie znajdzie to podstawia warto�� Kostki_Kwiatkow_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Podpowiadaj_Tylko_Jeden_Ruch' ) then
    plik_ini.WriteBool( 'Opcje', 'Podpowiadaj_Tylko_Jeden_Ruch', Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked )
  else
    Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Podpowiadaj_Tylko_Jeden_Ruch', Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked ); // Je�eli nie znajdzie to podstawia warto�� Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Pe�ny_Ekran' ) then
    plik_ini.WriteBool( 'Opcje', 'Pe�ny_Ekran', Pelny_Ekran_CheckBox.Checked )
  else
    Pelny_Ekran_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Pe�ny_Ekran', Pelny_Ekran_CheckBox.Checked ); // Je�eli nie znajdzie to podstawia warto�� Pelny_Ekran_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Przybli�enie' ) then
    plik_ini.WriteBool( 'Opcje', 'Przybli�enie', Przyblizenie_CheckBox.Checked )
  else
    Przyblizenie_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Przybli�enie', Przyblizenie_CheckBox.Checked ); // Je�eli nie znajdzie to podstawia warto�� Przyblizenie_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Obrazek_T�a_Planszy__�cie�ki_Wzgl�dne' ) then
    plik_ini.WriteBool( 'Opcje', 'Obrazek_T�a_Planszy__�cie�ki_Wzgl�dne', Obrazek_Tla_Planszy__Sciezki_Wzgledne_CheckBox.Checked )
  else
    Obrazek_Tla_Planszy__Sciezki_Wzgledne_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Obrazek_T�a_Planszy__�cie�ki_Wzgl�dne', Obrazek_Tla_Planszy__Sciezki_Wzgledne_CheckBox.Checked ); // Je�eli nie znajdzie to podstawia warto�� Obrazek_Tla_Planszy__Sciezki_Wzgledne_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Obrazek_T�a_Planszy__Wy�wietl' ) then
    plik_ini.WriteBool( 'Opcje', 'Obrazek_T�a_Planszy__Wy�wietl', Obrazek_Tla_Planszy__Wyswietl_CheckBox.Checked )
  else
    Obrazek_Tla_Planszy__Wyswietl_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Obrazek_T�a_Planszy__Wy�wietl', Obrazek_Tla_Planszy__Wyswietl_CheckBox.Checked ); // Je�eli nie znajdzie to podstawia warto�� Obrazek_Tla_Planszy__Wyswietl_CheckBox.Checked.

  //if not plik_ini.ValueExists( 'Opcje', 'uk�ad_kostek_nazwa' ) then
  //  plik_ini.WriteString( 'Opcje', 'uk�ad_kostek_nazwa', wczytany_uk�ad_kostek_nazwa_pliku )
  //else
  //  wczytany_uk�ad_kostek_nazwa_pliku := plik_ini.ReadString( 'Opcje', 'uk�ad_kostek_nazwa', wczytany_uk�ad_kostek_nazwa_pliku ); //Je�eli nie znajdzie to podstawia warto�� wczytany_uk�ad_kostek_nazwa_pliku.
  //
  //
  //
  //if    ( T�umaczenia_ListBox.ItemIndex >= 0 )
  //  and ( T�umaczenia_ListBox.ItemIndex <= T�umaczenia_ListBox.Items.Count - 1 ) then
  //  zts_1 := T�umaczenia_ListBox.Items[ T�umaczenia_ListBox.ItemIndex ]
  //else//if    ( T�umaczenia_ListBox.ItemIndex >= 0 ) (...)
  //  zts_1 := '';
  //
  //if not plik_ini.ValueExists( 'Opcje', 't�umaczenie_nazwa' ) then
  //  plik_ini.WriteString( 'Opcje', 't�umaczenie_nazwa', zts_1 )
  //else
  //  zts_1 := plik_ini.ReadString( 'Opcje', 't�umaczenie_nazwa', zts_1 ); //Je�eli nie znajdzie to podstawia warto�� zts_1.
  //
  //for zti_1 := T�umaczenia_ListBox.Items.Count - 1 downto 0 do
  //  if T�umaczenia_ListBox.Items[ zti_1 ] = zts_1 then
  //    begin
  //
  //      T�umaczenia_ListBox.ItemIndex := zti_1;
  //      Break;
  //
  //    end;
  //  //---//if T�umaczenia_ListBox.Items[ zti_1 ] = zts_1 then


  blokuj_rysowanie_kostek := false;

  plik_ini.Free();
  {$endregion 'Plik ini.'}


  tekst_l := TStringList.Create();


  {$region 'Uk�ady kostek.'}
  zts_1 := ExtractFilePath( Application.ExeName ) + 'Uk�ady kostek\Uk�ady kostek.ini';

  if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      // Je�eli pliku nie ma to nie trzeba wczytywa�, mo�na od razu dodawa� linie.

      FindClose( search_rec );

      if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then
        Application.MessageBox(   PChar(  'Nie odnaleziono katalogu uk�ad�w kostek: ' + ExtractFileDir( zts_1 ) + '.'  ), 'B��d', MB_ICONEXCLAMATION + MB_OK   )
        //Application.MessageBox(   PChar(  t__nie_odnaleziono_katalogu + ExtractFileDir( zts_1 ) + '.'  ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK   )
      else//if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then
        begin

          tekst_l.Text := wczytany_uk�ad_kostek_nazwa_pliku;
          tekst_l.SaveToFile( zts_1, TEncoding.UTF8 );

        end;
      //---//if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then

    end
  else//if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      // Plik jest.

      tekst_l.LoadFromFile( zts_1 );
      wczytany_uk�ad_kostek_nazwa_pliku := tekst_l.Text;
      wczytany_uk�ad_kostek_nazwa_pliku := StringReplace( wczytany_uk�ad_kostek_nazwa_pliku, #$D#$A, '', [ rfReplaceAll ] );

      zts_1 := '?';

      for zti_1 := Uklady_Kostek_MenuItem.Count - 1 downto 0 do
        if    ( Uklady_Kostek_MenuItem.Items[ zti_1 ].Name <> 'Uk�ady_Kostek__Od�wie�_List�_MenuItem' )
          //and (  StringReplace( Uklady_Kostek_MenuItem.Items[ zti_1 ].Caption, '&', '', [ rfReplaceAll ] ) = wczytany_uk�ad_kostek_nazwa_pliku  ) then
          and ( Uklady_Kostek_MenuItem.Items[ zti_1 ].Hint = wczytany_uk�ad_kostek_nazwa_pliku ) then
          begin

            zts_1 := '';
            Break;

          end;
        //---//if StringReplace( Uklady_Kostek_MenuItem.Items[ zti_1 ].Caption, '&', '', [ rfReplaceAll ] ) = wczytany_uk�ad_kostek_nazwa_pliku then

      if zts_1 <> '' then
        wczytany_uk�ad_kostek_nazwa_pliku := '';

    end;
  //---//if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.

  FindClose( search_rec );
  {$endregion 'Uk�ady kostek.'}


  {$region 'T�umaczenia.'}
  zts_1 := ExtractFilePath( Application.ExeName ) + 'T�umaczenia\T�umaczenia.ini';

  if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      // Je�eli pliku nie ma to nie trzeba wczytywa�, mo�na od razu dodawa� linie.

      FindClose( search_rec );

      if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then
        Application.MessageBox(   PChar(  'Nie odnaleziono katalogu t�umacze�: ' + ExtractFileDir( zts_1 ) + '.'  ), 'B��d', MB_ICONEXCLAMATION + MB_OK   )
        //Application.MessageBox(   PChar(  t__nie_odnaleziono_katalogu + ExtractFileDir( zts_1 ) + '.'  ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK   )
      else//if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then
        begin

          tekst_l.Text := '';
          tekst_l.SaveToFile( zts_1, TEncoding.UTF8 );

        end;
      //---//if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then

    end
  else//if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      // Plik jest.

      tekst_l.LoadFromFile( zts_1 );
      zts_1 := tekst_l.Text;
      zts_1 := StringReplace( zts_1, #$D#$A, '', [ rfReplaceAll ] );

      for zti_1 := Tlumaczenia_ListBox.Items.Count - 1 downto 0 do
        if Tlumaczenia_ListBox.Items[ zti_1 ] = zts_1 then
          begin

            Tlumaczenia_ListBox.ItemIndex := zti_1;
            Break;

          end;
        //---//if Tlumaczenia_ListBox.Items[ zti_1 ] = zts_1 then

    end;
  //---//if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.

  FindClose( search_rec );
  {$endregion 'T�umaczenia.'}


  {$region 'Obrazki kostek.'}
  zts_1 := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\Obrazki kostek.ini';

  if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      // Je�eli pliku nie ma to nie trzeba wczytywa�, mo�na od razu dodawa� linie.

      FindClose( search_rec );

      if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then
        Application.MessageBox(   PChar(  'Nie odnaleziono katalogu obrazk�w kostek: ' + ExtractFileDir( zts_1 ) + '.'  ), 'B��d', MB_ICONEXCLAMATION + MB_OK   )
        //Application.MessageBox(   PChar(  t__nie_odnaleziono_katalogu_obrazk�w_kostek + ExtractFileDir( zts_1 ) + '.'  ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK   )
      else//if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then
        begin

          tekst_l.Text := obrazki_kostek_nazwa_katalogu;
          tekst_l.SaveToFile( zts_1, TEncoding.UTF8 );

        end;
      //---//if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then

    end
  else//if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      // Plik jest.

      tekst_l.LoadFromFile( zts_1 );
      obrazki_kostek_nazwa_katalogu := tekst_l.Text;
      obrazki_kostek_nazwa_katalogu := StringReplace( obrazki_kostek_nazwa_katalogu, #$D#$A, '', [ rfReplaceAll ] );

      if Trim( obrazki_kostek_nazwa_katalogu ) = '' then
        obrazki_kostek_nazwa_katalogu := 'Domy�lne';

      if obrazki_kostek_nazwa_katalogu = '*:?:*<>"\|/' then // Brak obrazk�w kostek.
        begin

          zt_component := nil;
          zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Brak_MenuItem' );

          if zt_component <> nil then
            TMenuItem(zt_component).Checked := true;

        end
      else//if obrazki_kostek_nazwa_katalogu = '*:?:*<>"\|/' then
        for zti_1 := Obrazki_Kostek_MenuItem.Count - 1 downto 0 do
          if    ( Obrazki_Kostek_MenuItem.Items[ zti_1 ].Name <> 'Obrazki_Kostek__Od�wie�_List�_MenuItem' )
            and ( Obrazki_Kostek_MenuItem.Items[ zti_1 ].Hint = obrazki_kostek_nazwa_katalogu ) then
            begin

              Obrazki_Kostek_MenuItem.Items[ zti_1 ].Checked := true;
              Break;

            end;
          //---//if Tlumaczenia_ListBox.Items[ zti_1 ] = zts_1 then

    end;
  //---//if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.

  FindClose( search_rec );
  {$endregion 'Obrazki kostek.'}


  {$region 'T�o planszy.'}
  zts_1 := ExtractFilePath( Application.ExeName ) + 'Plansza t�o.ini';

  if FindFirst( zts_1, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
    begin

      // Plik ini jest.

      Screen.Cursor := crHourGlass;

      tekst_l.LoadFromFile( zts_1 );

      for zti_1 := 0 to tekst_l.Count - 1 do
        begin

          zts_1 := tekst_l[ zti_1 ];

          zts_1 := StringReplace( zts_1, #$D#$A, '', [ rfReplaceAll ] );

          zti_2 := Pos( '*', zts_1 );

          zts_2 := Copy( zts_1, 1, zti_2 - 1 ); // Nazwa tekstury.
          Delete( zts_1, 1, zti_2 ); // Adres pliku.

          if FindFirst( zts_1, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
            begin

              // Plik obrazka t�a jest.

              //Wczytaj_T�o_Planszy( zts_1, true );
              Tekstury_Zasobnik_Zmodyfikuj( zts_2, zts_1 );

            end;
          //---//if FindFirst( zts_1, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.

          FindClose( search_rec );

        end;
      //---//for i := 0 to tekst_l.Count - 1 do

      Screen.Cursor := crDefault;

    end;
  //---//if FindFirst( zts_1, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.

  FindClose( search_rec );
  {$endregion 'T�o planszy.'}

  tekst_l.Clear();

  tekst_l.Free();

end;//---//Funkcja Wczytaj_Ustawienia().

//Funkcja Zapisz_Ustawienia().
procedure TMahjong_3D_Form.Zapisz_Ustawienia( Sender : TObject );
var
  plik_ini : TIniFile;
  tekst_l : TStringList;
begin

  //if Application.MessageBox( 'Zapisa� ustawienia?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) <> IDYES then
  if Application.MessageBox(  PChar( t__zapisa�_ustawienia ), PChar( t__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) <> IDYES then
    Exit;


  plik_ini := TIniFile.Create(  ExtractFilePath( Application.ExeName ) + 'Mahjong.ini'  );


  plik_ini.WriteInteger( 'Opcje', 'Wy�wietlanie_Czasu', Wyswietlanie_Czasu_RadioGroup.ItemIndex );
  plik_ini.WriteBool( 'Opcje', 'Wy�wietlanie_Ilo�ci_Par_Do_Zdj�cia', Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked );

  plik_ini.WriteInteger( 'Opcje', 'Margines_Planszy', Margines_Planszy_SpinEdit.Value );
  plik_ini.WriteInteger( 'Opcje', 'Szeroko��_Kostek', Szerokosc_Kostek_SpinEdit.Value );
  plik_ini.WriteInteger( 'Opcje', 'Wysoko��_Kostek', Wysokosc_Kostek_SpinEdit.Value );

  plik_ini.WriteInteger( 'Opcje', 'Grubo��_Kostek', Grubosc_Kostek_SpinEdit.Value );

  plik_ini.WriteInteger( 'Opcje', 'Szybko��_Zegara', Szybkosc_Zegara_SpinEdit.Value );

  plik_ini.WriteInteger( 'Opcje', 'Szybko��_Kamery', Szybkosc_Kamery_SpinEdit.Value );
  plik_ini.WriteBool( 'Opcje', 'Kamera_Na_�rodek_Uk�adu_Kostek', Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Automatyczne_Wczytywanie_Uk�adu_Kostek', Automatyczne_Wczytywanie_Ukladu_Kostek_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Wczytuj_Konfiguracj�_Kostek', Wczytuj_Konfiguracje_Kostek_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Kostki_Kwiatk�w', Kostki_Kwiatkow_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Podpowiadaj_Tylko_Jeden_Ruch', Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Pe�ny_Ekran', Pelny_Ekran_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Przybli�enie', Przyblizenie_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Obrazek_T�a_Planszy__�cie�ki_Wzgl�dne', Obrazek_Tla_Planszy__Sciezki_Wzgledne_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Obrazek_T�a_Planszy__Wy�wietl', Obrazek_Tla_Planszy__Wyswietl_CheckBox.Checked );

  //plik_ini.WriteString( 'Opcje', 'uk�ad_kostek_nazwa', wczytany_uk�ad_kostek_nazwa_pliku );
  //
  //if    ( Tlumaczenia_ListBox.ItemIndex >= 0 )
  //  and ( Tlumaczenia_ListBox.ItemIndex <= Tlumaczenia_ListBox.Items.Count - 1 ) then
  //  plik_ini.WriteString( 'Opcje', 't�umaczenie_nazwa', Tlumaczenia_ListBox.Items[ Tlumaczenia_ListBox.ItemIndex ] )
  //else//if    ( Tlumaczenia_ListBox.ItemIndex >= 0 )
  //  plik_ini.WriteString( 'Opcje', 't�umaczenie_nazwa', '' );


  plik_ini.Free();



  tekst_l := TStringList.Create();

  tekst_l.Text := wczytany_uk�ad_kostek_nazwa_pliku;
  tekst_l.SaveToFile(  ExtractFilePath( Application.ExeName ) + 'Uk�ady kostek\Uk�ady kostek.ini', TEncoding.UTF8  );
  tekst_l.Clear();


  if    ( Tlumaczenia_ListBox.ItemIndex >= 0 )
    and ( Tlumaczenia_ListBox.ItemIndex <= Tlumaczenia_ListBox.Items.Count - 1 ) then
    tekst_l.Text := Tlumaczenia_ListBox.Items[ Tlumaczenia_ListBox.ItemIndex ];

  tekst_l.SaveToFile(  ExtractFilePath( Application.ExeName ) + 'T�umaczenia\T�umaczenia.ini', TEncoding.UTF8  );
  tekst_l.Clear();


  tekst_l.Text := obrazki_kostek_nazwa_katalogu;
  tekst_l.SaveToFile(  ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\Obrazki kostek.ini', TEncoding.UTF8  );
  tekst_l.Clear();


  tekst_l.Free();

end;//---//Funkcja Zapisz_Ustawienia().

//Funkcja Wczytaj_List�_T�umacze�().
procedure TMahjong_3D_Form.Wczytaj_List�_T�umacze�( Sender : TObject );
var
  zts : string;
  search_rec : TSearchRec;
begin

  Tlumaczenia_ListBox.Items.Clear();

  //Je�eli znajdzie plik zwraca 0, je�eli nie znajdzie zwraca numer b��du. Na pocz�tku znajduje '.' '..' potem list� plik�w.
  if FindFirst(  ExtractFilePath( Application.ExeName ) + 'T�umaczenia\*.txt', faAnyFile, search_rec  ) = 0 then //Application potrzebuje w uses Forms.
    begin

      repeat

        zts := search_rec.Name;
        zts := ReverseString( zts );
        Delete(  zts, 1, Pos( '.', zts )  );
        zts := ReverseString( zts );

        Tlumaczenia_ListBox.Items.Add( zts );

      until FindNext( search_rec ) <> 0 //Zwraca dane kolejnego pliku zgodnego z parametrami wcze�niej wywo�anej funkcji FindFirst. Je�eli mo�na przej�� do nast�pnego znalezionego pliku zwraca 0.

    end;
  //---//if FindFirst(  ExtractFilePath( Application.ExeName ) + 'Uk�ady kostek\*.txt', faAnyFile, search_rec  ) = 0 then //Application

  FindClose( search_rec );

end;//---//Funkcja Wczytaj_List�_T�umacze�().

//Funkcja Wczytaj_T�umaczenie().
procedure TMahjong_3D_Form.Wczytaj_T�umaczenie( const nazwa_pliku : string );
var
  tekst_l : TStringList;
  search_rec : TSearchRec;
  zt_component : TComponent;
  i,
  zti_1,
  zti_2
    : integer;
  zts_1,
  zts_2,
  nazwa
  //t�umaczenie
    : string;
  czy_podpowied� : boolean;
begin


  zts_1 := ExtractFilePath( Application.ExeName ) + 'T�umaczenia\' + nazwa_pliku + '.txt';

  if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      FindClose( search_rec );
      //Application.MessageBox(  PChar( 'Nie odnaleziono pliku t�umaczenia: ' + zts_1 + '.' ), 'B��d', MB_ICONEXCLAMATION + MB_OK  );
      Application.MessageBox(  PChar( t__nie_odnaleziono_pliku_t�umaczenia + zts_1 + '.' ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK  );
      Wczytaj_Pomoc( nazwa_pliku );
      Exit;

    end;
  //---//if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.

  Screen.Cursor := crHourGlass;

  FindClose( search_rec );


  tekst_l := TStringList.Create();
  tekst_l.LoadFromFile( zts_1 ); // Je�eli pliku nie ma to nie trzeba wczytywa�, mo�na od razu dodawa� linie.

  for i := 0 to tekst_l.Count - 1 do
    begin

      zts_1 := tekst_l[ i ];

      if Trim( zts_1 ) <> '' then
        begin

          zti_1 := Pos( '=', zts_1 );

          // Te pozycje menu nie podlegaj� t�umaczeniu.
          if   (  Pos( 'Uk�ady_Kostek__Uk�ad_Kostek_', zts_1 ) > 0  )
            or (  Pos( 'Obrazki_Kostek__Obrazek_Kostek_', zts_1 ) > 0  )
            or (
                     (  Pos( 'T�umaczenia_Panel', zts_1 ) > 0  ) // Etykieta panelu t�umaczenia nie podlega t�umaczeniu.
                 and (  Pos( '=Podpowied�=', zts_1 ) <= 0  )

               ) then
            zti_1 := -1;

          // Komentarze '//(...)', '    //(...)'.
          zts_2 := Trim( zts_1 );

          if    ( Length( zts_2 ) > 1 )
            and ( zts_2[ 1 ] = '*' )
            and ( zts_2[ 2 ] = '*' ) then
            zti_1 := -1;

          if zti_1 > 1 then
            begin

              if Pos( 't__', zts_1 ) <= 0 then
                begin

                  {$region 'Komponenty.'}
                  if Pos( '=Podpowied�=', zts_1 ) > 0 then
                    begin

                      czy_podpowied� := true;
                      zts_1 := StringReplace( zts_1, '=Podpowied�', '', [] );
                      zti_1 := Pos( '=', zts_1 );

                    end
                  else//if Pos( '=Podpowied�=', zts_1 ) > 0 then
                    czy_podpowied� := false;


                  nazwa := Copy( zts_1, 1, zti_1 - 1 );
                  Delete( zts_1, 1, zti_1 );

                  zt_component := nil;

                  zt_component := Mahjong_3D_Form.FindComponent( nazwa );


                  if czy_podpowied� then
                    begin

                      // Te podpowiedzi pozycji menu nie podlegaj� t�umaczeniu.
                      if   (  Pos( 'Obrazki_Kostek__Domy�lne_MenuItem', nazwa ) > 0  )
                        or (  Pos( 'Obrazki_Kostek__Brak_MenuItem', nazwa ) > 0  ) then
                        zt_component := nil;

                    end;
                  //---//if czy_podpowied� then


                  if zt_component <> nil then
                    begin

                      zts_1 := StringReplace( zts_1, '__#13__', #13, [ rfReplaceAll ] );

                      if Pos( '_Button', nazwa ) > 0 then
                        begin

                          if not czy_podpowied� then
                            TButton(zt_component).Caption := zts_1
                          else//if not czy_podpowied� then
                            TButton(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_CheckBox', nazwa ) > 0 then
                        begin

                          if not czy_podpowied� then
                            TCheckBox(zt_component).Caption := zts_1
                          else//if not czy_podpowied� then
                            TCheckBox(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_Label', nazwa ) > 0 then
                        begin

                          if not czy_podpowied� then
                            TLabel(zt_component).Caption := zts_1
                          else//if not czy_podpowied� then
                            TLabel(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_MenuItem', nazwa ) > 0 then
                        begin

                          if not czy_podpowied� then
                            TMenuItem(zt_component).Caption := zts_1
                          else//if not czy_podpowied� then
                            TMenuItem(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_Panel', nazwa ) > 0 then
                        begin

                          if not czy_podpowied� then
                            TPanel(zt_component).Caption := zts_1
                          else//if not czy_podpowied� then
                            TPanel(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_RadioButton', nazwa ) > 0 then
                        begin

                          if not czy_podpowied� then
                            TRadioButton(zt_component).Caption := zts_1
                          else//if not czy_podpowied� then
                            TRadioButton(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_RadioGroup', nazwa ) > 0 then
                        begin

                          if not czy_podpowied� then
                            begin

                              zti_1 := Pos( 'Elementy=', zts_1 );

                              if zti_1 <= 0 then
                                TRadioGroup(zt_component).Caption := zts_1
                              else//if zti_1 <= 0 then
                                begin

                                  zti_2 := TRadioGroup(zt_component).ItemIndex;

                                  zti_1 := Pos( '=', zts_1 );
                                  Delete( zts_1, 1, zti_1 );

                                  TRadioGroup(zt_component).Items.Clear();

                                  zti_1 := Pos( ';', zts_1 );

                                  while zti_1 > 0 do
                                    begin

                                      zts_2 := Copy( zts_1, 1, zti_1 - 1 );
                                      Delete( zts_1, 1, zti_1 );

                                      zts_2 := StringReplace( zts_2, #13, '', [ rfReplaceAll ] );

                                      TRadioGroup(zt_component).Items.Add( zts_2 );

                                      zti_1 := Pos( ';', zts_1 );

                                    end;
                                  //---//while zti_1 > 0 do

                                  if    ( zti_2 >= 0 )
                                    and ( zti_2 <= TRadioGroup(zt_component).Items.Count - 1 ) then
                                    TRadioGroup(zt_component).ItemIndex := zti_2;

                                end;
                              //---//if zti_1 <= 0 then

                            end
                          else//if not czy_podpowied� then
                            TRadioGroup(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_ScrollBox', nazwa ) > 0 then
                        begin

                          if czy_podpowied� then
                            TScrollBox(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_TabSheet', nazwa ) > 0 then
                        begin

                          if not czy_podpowied� then
                            TTabSheet(zt_component).Caption := zts_1
                          else//if not czy_podpowied� then
                            TTabSheet(zt_component).Hint := zts_1;

                        end
                      else
                        ;

                    end;
                  //---//if zt_component <> nil then
                  {$endregion 'Komponenty.'}

                end
              else//if Pos( 't__', zts_1 ) <= 0 then
                begin

                  {$region 'Komunikaty.'}
                  nazwa := Copy( zts_1, 1, zti_1 - 1 );
                  Delete( zts_1, 1, zti_1 );

                  zts_1 := StringReplace( zts_1, '__#13__', #13, [ rfReplaceAll ] );

                  if nazwa = 't__od�wie�_list�_uk�ad�w_kostek' then
                    t__od�wie�_list�_uk�ad�w_kostek := zts_1
                  else
                  if nazwa = 't__od�wie�_list�_obrazk�w_kostek' then
                    t__od�wie�_list�_obrazk�w_kostek := zts_1
                  else
                  if nazwa = 't__brak_obrazk�w_kostek' then
                    t__brak_obrazk�w_kostek := zts_1
                  else
                  if nazwa = 't__domy�lne_obrazki_kostek' then
                    t__domy�lne_obrazki_kostek := zts_1
                  else
                  if nazwa = 't__uk�ad_kostek_nazwa' then
                    t__uk�ad_kostek_nazwa := zts_1
                  else
                  if nazwa = 't__uk�ad_kostek_nazwa__brak' then
                    t__uk�ad_kostek_nazwa__brak := zts_1
                  else

                  if nazwa = 't__b��d' then
                    t__b��d := zts_1
                  else
                  if nazwa = 't__gratulacje' then
                    t__gratulacje := zts_1
                  else
                  if nazwa = 't__komunikat' then
                    t__komunikat := zts_1
                  else
                  if nazwa = 't__potwierdzenie' then
                    t__potwierdzenie := zts_1
                  else

                  if nazwa = 't__nie_odnaleziono_pliku_uk�adu_kostek' then
                    t__nie_odnaleziono_pliku_uk�adu_kostek := zts_1
                  else
                  if nazwa = 't__nie_odnaleziono_pliku_t�umaczenia' then
                    t__nie_odnaleziono_pliku_t�umaczenia := zts_1
                  else
                  if nazwa = 't__nie_odnaleziono_pliku_pomocy' then
                    t__nie_odnaleziono_pliku_pomocy := zts_1
                  else
                  if nazwa = 't__nie_odnaleziono_katalogu_obrazk�w_kostek' then
                    t__nie_odnaleziono_katalogu_obrazk�w_kostek := zts_1
                  else

                  if nazwa = 't__koniec_gry' then
                    t__koniec_gry := zts_1
                  else
                  if nazwa = 't__nie_odnaleziono_kostek_do_�ci�gni�cia' then
                    t__nie_odnaleziono_kostek_do_�ci�gni�cia := zts_1
                  else
                  if nazwa = 't__nie_odnaleziono_kostek_do_�ci�gni�cia_czy_przetasowa�' then
                    t__nie_odnaleziono_kostek_do_�ci�gni�cia_czy_przetasowa� := zts_1
                  else

                  if nazwa = 't__brak_zdefiniowanych_uk�ad�w_kostek' then
                    t__brak_zdefiniowanych_uk�ad�w_kostek := zts_1
                  else
                  if nazwa = 't__brak_zdefiniowanych_obrazk�w_kostek' then
                    t__brak_zdefiniowanych_obrazk�w_kostek := zts_1
                  else
                  if nazwa = 't__rozpocz��_gr�_od_nowa' then
                    t__rozpocz��_gr�_od_nowa := zts_1
                  else
                  if nazwa = 't__wyczy�ci�_plansz�' then
                    t__wyczy�ci�_plansz� := zts_1
                  else
                  if nazwa = 't__zako�czy�_dzia�anie_programu' then
                    t__zako�czy�_dzia�anie_programu := zts_1
                  else
                  if nazwa = 't__zapisa�_ustawienia' then
                    t__zapisa�_ustawienia := zts_1
                  else
                  if nazwa = 't__zaprezentowa�_kostki' then
                    t__zaprezentowa�_kostki := zts_1
                  else
                  if nazwa = 't__przetasowania_ilo��' then
                    t__przetasowania_ilo�� := zts_1
                  else
                  if nazwa = 't__podpowiedzi_ilo��' then
                    t__podpowiedzi_ilo�� := zts_1
                  else
                  if nazwa = 't__cofni�cia_ilo��' then
                    t__cofni�cia_ilo�� := zts_1
                  else
                  if nazwa = 't__par_do_zdj�cia' then
                    t__par_do_zdj�cia := zts_1
                  else

                  if nazwa = 't__ustawi�_pusty_obrazek_t�a_planszy' then
                    t__ustawi�_pusty_obrazek_t�a_planszy := zts_1
                  else
                  if nazwa = 't__obrazek_t�a_planszy_filtr' then
                    t__obrazek_t�a_planszy_filtr := zts_1
                  else
                    ;
                  {$endregion 'Komunikaty.'}

                end;
              //---//if Pos( 't__', zts_1 ) <= 0 then

            end;
          //---//if zti_1 > 1 then

        end;
      //---//if Trim( zts_1 ) <> '' then

    end;
  //---//for i := 0 to tekst_l.Count - 1 do

  tekst_l.Free();


  if wczytany_uk�ad_kostek_nazwa_pliku <> '' then
    //Uklad_Kostek_Nazwa_Label.Caption := 'Nazwa uk�adu kostek: ' + wczytany_uk�ad_kostek_nazwa_pliku + '.'
    Uklad_Kostek_Nazwa_Label.Caption := t__uk�ad_kostek_nazwa + wczytany_uk�ad_kostek_nazwa_pliku + '.'
  else//if wczytany_uk�ad_kostek_nazwa_pliku <> '' then
    //Uklad_Kostek_Nazwa_Label.Caption := 'Nazwa uk�adu kostek: <brak>.';
    Uklad_Kostek_Nazwa_Label.Caption := t__uk�ad_kostek_nazwa + t__uk�ad_kostek_nazwa__brak + '.';

  zt_component := nil;
  zt_component := Mahjong_3D_Form.FindComponent( 'Uk�ady_Kostek__Od�wie�_List�_MenuItem' );

  if zt_component <> nil then
    TMenuItem(zt_component).Caption := t__od�wie�_list�_uk�ad�w_kostek;


  zt_component := nil;
  zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Od�wie�_List�_MenuItem' );

  if zt_component <> nil then
    TMenuItem(zt_component).Caption := t__od�wie�_list�_obrazk�w_kostek;


  zt_component := nil;
  zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Brak_MenuItem' );

  if zt_component <> nil then
    TMenuItem(zt_component).Caption := t__brak_obrazk�w_kostek;


  zt_component := nil;
  zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Domy�lne_MenuItem' );

  if zt_component <> nil then
    TMenuItem(zt_component).Caption := t__domy�lne_obrazki_kostek;


  Screen.Cursor := crDefault;


  Wczytaj_Pomoc( nazwa_pliku );


  kamera_ruch_ci�g�y_tre�� := Kamera_Ruch_Ciagly_MenuItem.Caption;
  Kamera_Ruch_Ciagly_MenuItemClick( nil ); // Aby zaktualizowa� wy�wietlanie aktywno�ci funkcji na etykiecie.

end;//---//Funkcja Wczytaj_T�umaczenie().

//T�umaczenia_Domy�lne_ButtonClick().
procedure TMahjong_3D_Form.Tlumaczenia_Domyslne_ButtonClick( Sender: TObject );
var
  zt_component : TComponent;
  zti : integer;
begin

  {$region 'T�umaczenia.'}
  t__od�wie�_list�_uk�ad�w_kostek := 'Od�wie� list� uk�ad�w kostek';
  t__od�wie�_list�_obrazk�w_kostek := 'Od�wie� list� obrazk�w kostek';
  t__brak_obrazk�w_kostek := 'Brak';
  t__domy�lne_obrazki_kostek := 'Domy�lne';
  t__uk�ad_kostek_nazwa := 'Nazwa uk�adu kostek: ';
  t__uk�ad_kostek_nazwa__brak := '<brak>';

  t__b��d := 'B��d';
  t__gratulacje := 'Gratulacje';
  t__komunikat := 'Komunikat';
  t__potwierdzenie := 'Potwierdzenie';

  t__nie_odnaleziono_pliku_uk�adu_kostek := 'Nie odnaleziono pliku uk�adu kostek: ';
  t__nie_odnaleziono_pliku_t�umaczenia := 'Nie odnaleziono pliku t�umaczenia: ';
  t__nie_odnaleziono_pliku_pomocy := 'Nie odnaleziono pliku pomocy: ';
  t__nie_odnaleziono_katalogu_obrazk�w_kostek := 'Nie odnaleziono katalogu obrazk�w kostek: ';

  t__koniec_gry := 'Koniec gry.';
  t__nie_odnaleziono_kostek_do_�ci�gni�cia := 'Nie odnaleziono kostek do �ci�gni�cia.';
  t__nie_odnaleziono_kostek_do_�ci�gni�cia_czy_przetasowa� := 'Nie odnaleziono kostek do �ci�gni�cia.' + #13 + 'Czy przetasowa�?';

  t__brak_zdefiniowanych_uk�ad�w_kostek := 'Brak zdefiniowanych uk�ad�w kostek.';
  t__brak_zdefiniowanych_obrazk�w_kostek := 'Brak zdefiniowanych obrazk�w kostek.';
  t__rozpocz��_gr�_od_nowa := 'Rozpocz�� gr� od nowa?';
  t__wyczy�ci�_plansz� := 'Wyczy�ci� plansz�?';
  t__zako�czy�_dzia�anie_programu := 'Zako�czy� dzia�anie programu?';
  t__zapisa�_ustawienia := 'Zapisa� ustawienia?';
  t__zaprezentowa�_kostki := 'Zaprezentowa� kostki?' + #13 + 'Zako�czy to trwaj�c� gr�.';

  t__przetasowania_ilo�� := 'Przetasowania ';
  t__podpowiedzi_ilo�� := 'Podpowiedzi ';
  t__cofni�cia_ilo�� := 'Cofni�cia ';
  t__par_do_zdj�cia := 'Par do zdj�cia ';

  t__ustawi�_pusty_obrazek_t�a_planszy := 'Ustawi� pusty obrazek t�a planszy?';
  t__obrazek_t�a_planszy_filtr := 'Obrazki|*.bmp; *.gif; *.jpg; *.jpeg; *.png; *.tif; *.tiff|Wszystkie pliki|*.*';
  {$endregion 'T�umaczenia.'}

  if    ( Sender <> nil )
    and (
             ( TComponent(Sender).Name = Tlumaczenia_Domyslne_Button.Name )
          or ( TComponent(Sender).Name = Tlumaczenia_Zastosuj_Button.Name ) // Je�eli w t�umaczeniu czego� zabraknie to zostanie warto�� domy�lna.
        ) then
    begin

      if TComponent(Sender).Name = Tlumaczenia_Domyslne_Button.Name then // Je�eli w t�umaczeniu czego� zabraknie to zostanie warto�� domy�lna.
        Tlumaczenia_ListBox.ItemIndex := -1;

      Tlumaczenia_ListBox.Hint := '';


      Gra_MenuItem.Caption := 'Gra';
      Gra__Demo_MenuItem.Caption := 'Demo';
      Gra__Cofnij_MenuItem.Caption := 'Cofnij';
      Gra__Nowa_Gra_MenuItem.Caption := 'Nowa gra';
      Gra__Podpowiedz_MenuItem.Caption := 'Podpowied�';
      Gra__Przetasuj_MenuItem.Caption := 'Przetasuj';
      Gra__Wyczysc_Plansze_MenuItem.Caption := 'Wyczy�� plansz�';
      Gra__Wyjdz_MenuItem.Caption := 'Wyjd�';
      Gra__Zaprezentuj_Kostki_MenuItem.Caption := 'Zaprezentuj kostki';
      Uklady_Kostek_MenuItem.Caption := 'Uk�ady kostek';
      Obrazki_Kostek_MenuItem.Caption := 'Obrazki kostek';
      Opcje_MenuItem.Caption := 'Opcje';
      Pomoc_MenuItem.Caption := 'Pomoc';
      kamera_ruch_ci�g�y_tre�� := 'Ci�g�y ruch kamery';
      //Kamera_Ruch_Ciagly_MenuItem.Caption := kamera_ruch_ci�g�y_tre��; // Zaktualizuje si� w Kamera_Ruch_Ci�g�y_MenuItemClick( nil ).
      Pelny_Ekran_MenuItem.Caption := 'Pe�ny ekran';

      Opcje_TabSheet.Caption := 'Opcje';
      Opcje_TabSheet.Hint := '';
      Pomoc_TabSheet.Caption := 'Pomoc';
      Pomoc_TabSheet.Hint := '';
      Tlumaczenia_TabSheet.Caption := 'T�umaczenia';
      Tlumaczenia_TabSheet.Hint := '';
      O_Programie_TabSheet.Caption := 'O programie';
      O_Programie_TabSheet.Hint := '';

      Zapisz_Ustawienia_Button.Caption := 'Zapisz ustawienia';
      Zapisz_Ustawienia_Button.Hint := '';
      Opcje_Ukryj_Button.Hint := 'Ukryj opcje.';

      Opcje_ScrollBox.Hint := '';
      Wyswietlanie_Czasu_RadioGroup.Caption := 'Wy�wietlanie czasu';

      zti := Wyswietlanie_Czasu_RadioGroup.ItemIndex;
      Wyswietlanie_Czasu_RadioGroup.Items.Clear();
      Wyswietlanie_Czasu_RadioGroup.Items.Add( 'Brak' );
      Wyswietlanie_Czasu_RadioGroup.Items.Add( 'Czas gry' );
      Wyswietlanie_Czasu_RadioGroup.Items.Add( 'Czas' );

      if    ( zti >= 0 )
        and ( zti <= Wyswietlanie_Czasu_RadioGroup.Items.Count ) then
        Wyswietlanie_Czasu_RadioGroup.ItemIndex := zti;

      Wyswietlanie_Czasu_RadioGroup.Hint := '';


      Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Caption := 'Wy�wietlanie ilo�ci par do zdj�cia';

      Szerokosc_Kostek_Etykieta_Label.Caption := 'Szeroko�� kostek';
      Szerokosc_Kostek_Etykieta_Label.Hint := '';
      Szerokosc_Kostek_SpinEdit.Hint := '';
      Wysokosc_Kostek_Etykieta_Label.Caption := 'Wysoko�� kostek';
      Wysokosc_Kostek_Etykieta_Label.Hint := '';
      Wysokosc_Kostek_SpinEdit.Hint := '';
      Grubosc_Kostek_Etykieta_Label.Caption := 'Grubo�� kostek';
      Grubosc_Kostek_Etykieta_Label.Hint := '';
      Grubosc_Kostek_SpinEdit.Hint := '';
      Szybkosc_Kamery_Etykieta_Label.Caption := 'Szybko�� ruchu kamery';
      Szybkosc_Kamery_Etykieta_Label.Hint := '';
      Szybkosc_Kamery_SpinEdit.Hint := '';
      Szybkosc_Zegara_Etykieta_Label.Caption := 'Szybko�� zegara';
      Szybkosc_Zegara_Etykieta_Label.Hint := '';
      Szybkosc_Zegara_SpinEdit.Hint := '';
      Margines_Planszy_Etykieta_Label.Caption := 'Margines planszy';
      Margines_Planszy_Etykieta_Label.Hint := '';
      Margines_Planszy_SpinEdit.Hint := '';

      Wartosci_Domyslne_Button.Caption := 'Warto�ci domy�lne';
      Wartosci_Domyslne_Button.Hint := '';
      Wczytaj_Ustawienia_Button.Caption := 'Wczytaj ustawienia';
      Wczytaj_Ustawienia_Button.Hint := '';
      Uklad_Kostek_Nazwa_Wyczysc_Button.Caption := 'Nazwa uk�adu kostek - wyczy��';
      Uklad_Kostek_Nazwa_Wyczysc_Button.Hint := '';
      Szybkosc_Kamery_SpinEdit.Hint := '';
      Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Caption := 'Kamera na �rodek uk�adu kostek';
      Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Hint := '';
      Automatyczne_Wczytywanie_Ukladu_Kostek_CheckBox.Caption := 'Automatyczne wczytywanie uk�adu kostek.';
      Automatyczne_Wczytywanie_Ukladu_Kostek_CheckBox.Hint := 'Automatyczne wczytywanie zapisanego uk�adu kostek po uruchomieniu gry.';
      Wczytuj_Konfiguracje_Kostek_CheckBox.Caption := 'Wczytuj konfiguracj� kostek';
      Wczytuj_Konfiguracje_Kostek_CheckBox.Hint := '';
      Kostki_Kwiatkow_CheckBox.Caption := 'Kostki kwiatk�w';
      Kostki_Kwiatkow_CheckBox.Hint := 'Zamiast dw�ch zestaw�w kostek p�r roku u�yj jednego zestawu kostek p�r roku i jednego zestawu kostek kwiatk�w.';
      Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Caption := 'Podpowiadaj tylko jeden ruch';
      Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Hint := '';
      Pelny_Ekran_CheckBox.Caption := 'Pe�ny ekran';
      Pelny_Ekran_CheckBox.Hint := '';
      Przyblizenie_CheckBox.Caption := 'Panel przybli�enia';
      Przyblizenie_CheckBox.Hint := 'Wy�wietl panel przybli�enia.';
      Obrazek_Tla_Planszy__Bok_Panel.Caption := '';
      Obrazek_Tla_Planszy__Bok_Panel.Hint := 'Wska� cz�� t�a do zmodyfikowania.';
      Obrazek_Tla_Planszy__Gora_RadioButton.Caption := 'G�ra';
      Obrazek_Tla_Planszy__Gora_RadioButton.Hint := '';
      Obrazek_Tla_Planszy__Lewo_RadioButton.Caption := 'Lewo';
      Obrazek_Tla_Planszy__Lewo_RadioButton.Hint := '';
      Obrazek_Tla_Planszy__Przod_RadioButton.Caption := 'Prz�d';
      Obrazek_Tla_Planszy__Przod_RadioButton.Hint := '';
      Obrazek_Tla_Planszy__Prawo_RadioButton.Caption := 'Prawo';
      Obrazek_Tla_Planszy__Prawo_RadioButton.Hint := '';
      Obrazek_Tla_Planszy__Dol_RadioButton.Caption := 'D�';
      Obrazek_Tla_Planszy__Dol_RadioButton.Hint := '';
      Obrazek_Tla_Planszy__Tyl_RadioButton.Caption := 'Ty�';
      Obrazek_Tla_Planszy__Tyl_RadioButton.Hint := '';
      Obrazek_Tla_Planszy__Chmury_RadioButton.Caption := 'Chmury';
      Obrazek_Tla_Planszy__Chmury_RadioButton.Hint := '';
      Obrazek_Tla_Planszy__Wszystkie_RadioButton.Caption := 'Wszystkie';
      Obrazek_Tla_Planszy__Wszystkie_RadioButton.Hint := '';
      Obrazek_Tla_Planszy__Sciezki_Wzgledne_CheckBox.Caption := 'Wzgl�dne �cie�ki obrazk�w';
      Obrazek_Tla_Planszy__Sciezki_Wzgledne_CheckBox.Hint := 'Pr�buj zapisa� �cie�ki do plik�w obrazk�w w postaci wzgl�dnej.';
      Obrazek_Tla_Planszy__Wybierz_Button.Caption := 'Wybierz obrazek t�a planszy';
      Obrazek_Tla_Planszy__Wybierz_Button.Hint := '';
      Obrazek_Tla_Planszy__Wyswietl_CheckBox.Caption := 'Wy�wietl obrazek t�a planszy';
      Obrazek_Tla_Planszy__Wyswietl_CheckBox.Hint := '';
      Obrazek_Tla_Planszy__Brak_Button.Caption := 'Brak obrazka t�a planszy';
      Obrazek_Tla_Planszy__Brak_Button.Hint := '';
      Kamera_Wspolrzedne_Etykieta_Label.Caption := 'Wsp�rz�dne kamery i jej celu';
      Kamera_Wspolrzedne_Etykieta_Label.Hint := '';
      Kamera_Wspolrzedne_Label.Hint := '';

      Tlumaczenia_Panel.Hint := '';
      Tlumaczenia_Odswiez_Button.Caption := 'Od�wie�';
      Tlumaczenia_Odswiez_Button.Hint := '';
      Tlumaczenia_Zastosuj_Button.Caption := 'Zastosuj';
      Tlumaczenia_Zastosuj_Button.Hint := '';
      Tlumaczenia_Domyslne_Button.Caption := 'Domy�lne';
      Tlumaczenia_Domyslne_Button.Hint := 'Ustaw domy�lne t�umaczenie.';

      Pomoc_Memo.Hint := '';


      if wczytany_uk�ad_kostek_nazwa_pliku <> '' then
        //Uklad_Kostek_Nazwa_Label.Caption := 'Nazwa uk�adu kostek: ' + wczytany_uk�ad_kostek_nazwa_pliku + '.'
        Uklad_Kostek_Nazwa_Label.Caption := t__uk�ad_kostek_nazwa + wczytany_uk�ad_kostek_nazwa_pliku + '.'
      else//if wczytany_uk�ad_kostek_nazwa_pliku <> '' then
        //Uklad_Kostek_Nazwa_Label.Caption := 'Nazwa uk�adu kostek: <brak>.';
        Uklad_Kostek_Nazwa_Label.Caption := t__uk�ad_kostek_nazwa + t__uk�ad_kostek_nazwa__brak + '.';

      Uklad_Kostek_Nazwa_Label.Hint := '';


      Przyblizenie_Panel.Caption := '^...v';
      Przyblizenie_Panel.Hint := 'Przybli�enie.';


      zt_component := nil;
      zt_component := Mahjong_3D_Form.FindComponent( 'Uk�ady_Kostek__Od�wie�_List�_MenuItem' );

      if zt_component <> nil then
        TMenuItem(zt_component).Caption := t__od�wie�_list�_uk�ad�w_kostek;


      zt_component := nil;
      zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Od�wie�_List�_MenuItem' );

      if zt_component <> nil then
        TMenuItem(zt_component).Caption := t__od�wie�_list�_obrazk�w_kostek;


      zt_component := nil;
      zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Brak_MenuItem' );

      if zt_component <> nil then
        TMenuItem(zt_component).Caption := t__brak_obrazk�w_kostek;


      zt_component := nil;
      zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Domy�lne_MenuItem' );

      if zt_component <> nil then
        TMenuItem(zt_component).Caption := t__domy�lne_obrazki_kostek;

    end;
  //---//if    ( Sender <> nil ) (...)


  Wczytaj_Pomoc( '*:?:*<>"\|/' ); // Plik domy�lny.


  Kamera_Ruch_Ciagly_MenuItemClick( nil ); // Aby zaktualizowa� wy�wietlanie aktywno�ci funkcji na etykiecie.

end;//---//T�umaczenia_Domy�lne_ButtonClick().

//Funkcja Wczytaj_List�_Obrazk�w_Kostek().
procedure TMahjong_3D_Form.Wczytaj_List�_Obrazk�w_Kostek( Sender : TObject );
var
  zts : string;
  zti : integer;
  search_rec : TSearchRec;
  menu_item : TMenuItem;
begin

  for zti := Obrazki_Kostek_MenuItem.Count - 1 downto 0 do
    Obrazki_Kostek_MenuItem.Items[ zti ].Free();


  if Sender = nil then // Tylko zwalnia pami��.
    Exit;

  Screen.Cursor := crHourGlass;

  //menu_item := TMenuItem.Create( Application );
  menu_item := TMenuItem.Create( Mahjong_3D_Form ); // Dla FindComponent().
  menu_item.Name := 'Obrazki_Kostek__Brak_MenuItem';
  //menu_item.Caption := 'Brak';
  menu_item.Caption := t__brak_obrazk�w_kostek;
  menu_item.Hint := 'Brak';
  menu_item.AutoCheck := true;
  menu_item.RadioItem := true;
  menu_item.OnClick := Obrazki_Kostek__Obrazek_Kostek_MenuItemClick;

  Obrazki_Kostek_MenuItem.Add( menu_item );


  //menu_item := TMenuItem.Create( Application );
  menu_item := TMenuItem.Create( Mahjong_3D_Form ); // Dla FindComponent().
  menu_item.Name := 'Obrazki_Kostek__Domy�lne_MenuItem';
  //menu_item.Caption := 'Domy�lne';
  menu_item.Caption := t__domy�lne_obrazki_kostek;
  menu_item.Hint := 'Domy�lne';
  menu_item.AutoCheck := true;
  menu_item.RadioItem := true;
  menu_item.OnClick := Obrazki_Kostek__Obrazek_Kostek_MenuItemClick;

  Obrazki_Kostek_MenuItem.Add( menu_item );


  zti := 0;

  // Je�eli znajdzie plik zwraca 0, je�eli nie znajdzie zwraca numer b��du. Na pocz�tku znajduje '.' '..' potem list� plik�w.
  if FindFirst(  ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\*', faDirectory, search_rec  ) = 0 then //Application potrzebuje w uses Forms.
    begin

      repeat

        if    ( search_rec.Attr = faDirectory )
          and ( search_rec.Name <> '.' )
          and ( search_rec.Name <> '..' )
          and (  AnsiLowerCase( search_rec.Name ) <> 'brak'  ) // Te nazwy katalog�w s� zastrze�one.
          and (  AnsiLowerCase( search_rec.Name)  <> 'domy�lne'  ) then // Te nazwy katalog�w s� zastrze�one.
          begin

            zts := search_rec.Name;

            inc( zti );

            menu_item := TMenuItem.Create( Application );
            menu_item.Name := 'Obrazki_Kostek__Obrazek_Kostek_' + IntToStr( zti ) + '_MenuItem';
            menu_item.Caption := zts;
            menu_item.Hint := zts;
            menu_item.AutoCheck := true;
            menu_item.RadioItem := true;
            menu_item.OnClick := Obrazki_Kostek__Obrazek_Kostek_MenuItemClick;

            if menu_item.Hint = obrazki_kostek_nazwa_katalogu then
              menu_item.Checked := true;


            Obrazki_Kostek_MenuItem.Add( menu_item );

          end;
        //---//if    ( search_rec.Attr = faDirectory )


      until FindNext( search_rec ) <> 0 //Zwraca dane kolejnego pliku zgodnego z parametrami wcze�niej wywo�anej funkcji FindFirst. Je�eli mo�na przej�� do nast�pnego znalezionego pliku zwraca 0.

    end;
  //---//if FindFirst(  ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\', faDirectory, search_rec  ) = 0 then //Application

  FindClose( search_rec );

  //menu_item := TMenuItem.Create( Application );
  menu_item := TMenuItem.Create( Mahjong_3D_Form ); // Dla FindComponent().
  menu_item.Name := 'Obrazki_Kostek__Od�wie�_List�_MenuItem';
  //menu_item.Caption := 'Od�wie� list� obrazk�w kostek';
  menu_item.Caption := t__od�wie�_list�_obrazk�w_kostek;
  menu_item.OnClick := Wczytaj_List�_Obrazk�w_Kostek;

  Obrazki_Kostek_MenuItem.Add( menu_item );

  Screen.Cursor := crDefault;


  if    ( Sender <> nil )
    //and ( TComponent(Sender).Name = Obrazki_Kostek__Od�wie�_List�_MenuItem.Name )
    and ( TComponent(Sender).Name <> Mahjong_3D_Form.Name )
    and ( Obrazki_Kostek_MenuItem.Count < 3 ) then
    //Application.MessageBox( 'Brak zdefiniowanych obrazk�w kostek.', 'B��d', MB_ICONEXCLAMATION + MB_OK );
    Application.MessageBox(  PChar( t__brak_zdefiniowanych_obrazk�w_kostek ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK  );

end;//---//Funkcja Wczytaj_List�_Obrazk�w_Kostek().

//Funkcja Wczytaj_Obrazki_Kostek().
procedure TMahjong_3D_Form.Wczytaj_Obrazki_Kostek( const nazwa_katalogu : string; pomi�_ini : boolean = false );
var
  search_rec : TSearchRec;
  x,
  y,
  z
    : integer;
  zts,
  komunikaty
    : string;
begin

  //
  // Funkcja wczyta obrazki kostek.
  //
  // Parametry:
  //   nazwa_katalogu
  //   pomi�_ini:
  //     true - wczyta wszystkie parametry obrazk�w kostek.
  //     false - wczyta tylko warto�ci przezroczysto�ci zaznaczenia.
  //

  if nazwa_katalogu <> 'Brak' then
    begin

      if nazwa_katalogu <> '' then
        zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\' + nazwa_katalogu
      else//if nazwa_katalogu <> '' then
        zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\Domy�lne';


      if FindFirst( zts, faDirectory, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
        begin

          FindClose( search_rec );
          //Application.MessageBox(  PChar( 'Nie odnaleziono katalogu obrazk�w kostek: ' + zts + '.' ), 'B��d', MB_ICONEXCLAMATION + MB_OK  );
          Application.MessageBox(  PChar( t__nie_odnaleziono_katalogu_obrazk�w_kostek + zts + '.' ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK  );
          Exit;

        end;
      //---//if FindFirst( zts, faDirectory, search_rec ) <> 0 then // Sprawdza czy istnieje plik.


      Screen.Cursor := crHourGlass;

      FindClose( search_rec );


      //if nazwa_katalogu <> '' then
      //  komunikaty := zts + '\' + nazwa_katalogu + '.ini' // Tutaj tymczasowo jako adres pliku.
      //else//if nazwa_katalogu <> '' then
      //  komunikaty := zts + '\Domy�lne.ini';
      //
      //if    ( not pomi�_ini )
      //  and ( Wczytuj_Konfiguracje_Kostek_CheckBox.Checked ) then
      //  begin
      //
      //    Wczytaj_Ini_Obrazk�w_Kostek( komunikaty );
      //
      //  end;
      ////---//if    ( not pomi�_ini ) (...)

    end;
  //---//if nazwa_katalogu <> 'Brak' then


  obrazki_kostek_nazwa_katalogu := nazwa_katalogu;


  komunikaty := '';

  for x := 0 to Length( kostki_t ) - 1 do
    for y := 0 to Length( kostki_t[ 0 ] ) - 1 do
      for z := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
        if kostki_t[ x ][ y ][ z ] <> nil then
          begin

            try
              kostki_t[ x ][ y ][ z ].Wczytaj_Obrazek( zts );
            except
              on E : Exception do
                begin

                  if nazwa_katalogu <> 'Brak' then
                    if Pos( E.Message, komunikaty ) <= 0 then
                      begin

                        if komunikaty <> '' then
                          komunikaty := komunikaty + #13;

                        komunikaty := komunikaty + E.Message + ' ' + IntToStr( E.HelpContext );

                      end;
                    //---//if Pos( E.Message, komunikaty ) <= 0 then

                end;
              //---//on E : Exception do
            end;
            //---//try

          end;
        //---//if kostki_t[ x ][ y ][ z ] <> nil then


  Screen.Cursor := crDefault;

  if komunikaty <> '' then
    //Application.MessageBox(  PChar(  komunikaty + '.' ), 'B��d', MB_OK + MB_ICONEXCLAMATION  );
    Application.MessageBox(   PChar(  komunikaty + '.' ), PChar( t__b��d ), MB_OK + MB_ICONEXCLAMATION   );

end;//---//Funkcja Wczytaj_Obrazki_Kostek().

//Funkcja Wczytaj_Ini_Obrazk�w_Kostek().
procedure TMahjong_3D_Form.Wczytaj_Ini_Obrazk�w_Kostek( const adres_pliku : string );
var
  search_rec : TSearchRec;
  plik_ini : TIniFile;
  zti : integer;
begin

  Exit;

  //
  // Funkcja wczyta parametry obrazk�w kostek.
  //
  // Zwraca warto�ci przezroczysto�ci zaznaczenia.
  //
  // Parametry:
  //   adres_pliku
  //

  kamera_�rodek_x := 0;
  kamera_�rodek_y := 0;
  kamera_�rodek_z := 0;

  kamera_na_�rodek_x := 0;
  kamera_na_�rodek_y := 0;


  if FindFirst( adres_pliku, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
    begin

      {$region 'Plik ini.'}
      plik_ini := TIniFile.Create( adres_pliku );

      blokuj_rysowanie_kostek := true;


      zti := plik_ini.ReadInteger( 'Obrazki', 'Margines_Planszy', Margines_Planszy_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Wyswietlanie_Czasu_RadioGroup.ItemIndex.

      if    ( zti >= Margines_Planszy_SpinEdit.MinValue )
        and ( zti <= Margines_Planszy_SpinEdit.MaxValue ) then
        Margines_Planszy_SpinEdit.Value := zti;



      zti := plik_ini.ReadInteger( 'Obrazki', 'Szeroko��_Kostek', Szerokosc_Kostek_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Szerokosc_Kostek_SpinEdit.Value.

      if    ( zti >= Szerokosc_Kostek_SpinEdit.MinValue )
        and ( zti <= Szerokosc_Kostek_SpinEdit.MaxValue ) then
        Szerokosc_Kostek_SpinEdit.Value := zti;


      zti := plik_ini.ReadInteger( 'Obrazki', 'Wysoko��_Kostek', Wysokosc_Kostek_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Wysokosc_Kostek_SpinEdit.Value.

      if    ( zti >= Wysokosc_Kostek_SpinEdit.MinValue )
        and ( zti <= Wysokosc_Kostek_SpinEdit.MaxValue ) then
        Wysokosc_Kostek_SpinEdit.Value := zti;


      zti := plik_ini.ReadInteger( 'Obrazki', 'Grubo��_Kostek', Grubosc_Kostek_SpinEdit.Value ); // Je�eli nie znajdzie to podstawia warto�� Grubosc_Kostek_SpinEdit.Value.

      if    ( zti >= Grubosc_Kostek_SpinEdit.MinValue )
        and ( zti <= Grubosc_Kostek_SpinEdit.MaxValue ) then
        Grubosc_Kostek_SpinEdit.Value := zti;


      kamera_�rodek_x := plik_ini.ReadFloat( 'Obrazki', 'Kamera_X', kamera_�rodek_x ); // Je�eli nie znajdzie to podstawia warto�� kamera_�rodek_x.
      kamera_�rodek_y := plik_ini.ReadFloat( 'Obrazki', 'Kamera_Y', kamera_�rodek_y ); // Je�eli nie znajdzie to podstawia warto�� kamera_�rodek_y.
      kamera_�rodek_z := plik_ini.ReadFloat( 'Obrazki', 'Kamera_Z', kamera_�rodek_z ); // Je�eli nie znajdzie to podstawia warto�� kamera_�rodek_z.

      kamera_na_�rodek_x := plik_ini.ReadFloat( 'Obrazki', 'Kamera_Na_X', kamera_na_�rodek_x ); // Je�eli nie znajdzie to podstawia warto�� kamera_na_�rodek_x.
      kamera_na_�rodek_y := plik_ini.ReadFloat( 'Obrazki', 'Kamera_Na_Y', kamera_na_�rodek_y ); // Je�eli nie znajdzie to podstawia warto�� kamera_na_�rodek_y.


      blokuj_rysowanie_kostek := false;

      plik_ini.Free();
      {$endregion 'Plik ini.'}

    end;
  //---//if FindFirst( adres_pliku, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.

  FindClose( search_rec );


  Kamera_Ustawienie_Pocz�tkowe();

end;//---//Funkcja Wczytaj_Ini_Obrazk�w_Kostek().

//Funkcja Wczytaj_Pomoc().
procedure TMahjong_3D_Form.Wczytaj_Pomoc( const nazwa_pliku : string );
var
  tekst_l : TStringList;
  search_rec : TSearchRec;
  zt_component : TComponent;
  i,
  zti
    : integer;
  zts,
  nazwa
  //t�umaczenie
    : string;
  czy_podpowied� : boolean;
begin

  if nazwa_pliku = '*:?:*<>"\|/' then // Plik domy�lny.
    zts := ExtractFilePath( Application.ExeName ) + 'Pomoc\Pomoc.txt'
  else//if nazwa_pliku = '*:?:*<>"\|/' then
    zts := ExtractFilePath( Application.ExeName ) + 'Pomoc\' + nazwa_pliku + ' Pomoc.txt';

  if FindFirst( zts, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      FindClose( search_rec );
      //Application.MessageBox(  PChar( 'Nie odnaleziono pliku t�umaczenia: ' + zts + '.' ), 'B��d', MB_ICONEXCLAMATION + MB_OK  );
      Application.MessageBox(  PChar( t__nie_odnaleziono_pliku_pomocy + zts + '.' ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK  );

      if zts = ExtractFilePath( Application.ExeName ) + 'Pomoc\Pomoc.txt' then // Plik domy�lny.
        Exit;


      zts := ExtractFilePath( Application.ExeName ) + 'Pomoc\Pomoc.txt'

    end;
  //---//if FindFirst( zts, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.

  Screen.Cursor := crHourGlass;

  FindClose( search_rec );

  try
    Pomoc_Memo.Lines.LoadFromFile( zts );
  except
    on E : Exception do
      Application.MessageBox(   PChar(  t__nie_odnaleziono_pliku_pomocy + zts + ' [2].' + #13 + E.Message + ' ' + IntToStr( E.HelpContext )  ), PChar( t__b��d ), MB_OK + MB_ICONEXCLAMATION   );
  end;
  //---//try

  Screen.Cursor := crDefault;

end;//---//Funkcja Wczytaj_Pomoc().

//Funkcja Tekstury_Zasobnik_Zmodyfikuj().
procedure TMahjong_3D_Form.Tekstury_Zasobnik_Zmodyfikuj( nazwa_tekstury, adres_pliku : string );
var
  zt_gl_texture : TGLTexture;
  zt_gl_libMaterial : TGLLibMaterial;
begin

  try
    zt_gl_texture := GLMaterialLibrary1.TextureByName( nazwa_tekstury );
  except
    zt_gl_texture := nil;
  end;
  //---//try

  if zt_gl_texture <> nil then // Wyczy�ci tekstur� i zast�pi j� now�.
    GLMaterialLibrary1.Materials.Delete(  GLMaterialLibrary1.Materials.GetTextureIndex( zt_gl_texture )  );


  if adres_pliku = '' then
    Exit;


  zt_gl_libMaterial := GLMaterialLibrary1.AddTextureMaterial( nazwa_tekstury, adres_pliku );
  zt_gl_libMaterial.Material.Texture.Disabled := false;
  zt_gl_libMaterial.Material.Texture.TextureMode := GLTexture.tmDecal;

  //zt_gl_libMaterial.TextureScale.X := 10;
  //Reszt_gl_libMaterialult.TextureScale.Y := 10;

  zt_gl_libMaterial.Material.BlendingMode := bmTransparency;

  if nazwa_tekstury = 'Chmury' then
    zt_gl_libMaterial.Material.FrontProperties.Diffuse.Alpha := 0.75
  else//if nazwa_tekstury = 'Chmury' then
    zt_gl_libMaterial.Material.FrontProperties.Diffuse.Alpha := 1; // 0 - nie wida�, 1 - brak przezroczysto�ci.

end;//---//Funkcja Tekstury_Zasobnik_Zmodyfikuj().

//Funkcja Wczytaj_T�o_Planszy().
procedure TMahjong_3D_Form.Wczytaj_T�o_Planszy( const adres_pliku : string; nie_zapisuj : boolean = false );
var
  tekstury_t : array of string;

  //Funkcja Zmodyfikuj_Tekstur�() w Wczytaj_T�o_Planszy().
  procedure Zmodyfikuj_Tekstur�( nazwa_tekstury, adres_pliku_f : string );
  begin

    Tekstury_Zasobnik_Zmodyfikuj( nazwa_tekstury, adres_pliku_f );


    SetLength(  tekstury_t, Length( tekstury_t ) + 1  );

    tekstury_t[ Length( tekstury_t ) - 1 ] := nazwa_tekstury + '*' + adres_pliku_f;

  end;//---//Funkcja Zmodyfikuj_Tekstur�() w Wczytaj_T�o_Planszy().

var
  adres_pliku_ini,
  zts_1,
  zts_2
    : string;
  i,
  j,
  zti
    : integer;
  tekst_l : TStringList;
  search_rec : TSearchRec;
  czy_w_pliku_jest_informacja_o_teksturze : boolean;
begin//Funkcja Wczytaj_T�o_Planszy().

  Screen.Cursor := crHourGlass;


  SetLength( tekstury_t, 0 );

  if   ( Obrazek_Tla_Planszy__Gora_RadioButton.Checked )
    or ( Obrazek_Tla_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Tekstur�( 'G�ra', adres_pliku );

  if   ( Obrazek_Tla_Planszy__Lewo_RadioButton.Checked )
    or ( Obrazek_Tla_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Tekstur�( 'Lewo', adres_pliku );

  if   ( Obrazek_Tla_Planszy__Przod_RadioButton.Checked )
    or ( Obrazek_Tla_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Tekstur�( 'Prz�d', adres_pliku ); // Za kostkami.

  if   ( Obrazek_Tla_Planszy__Prawo_RadioButton.Checked )
    or ( Obrazek_Tla_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Tekstur�( 'Prawo', adres_pliku );

  if   ( Obrazek_Tla_Planszy__Dol_RadioButton.Checked )
    or ( Obrazek_Tla_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Tekstur�( 'D�', adres_pliku );

  if   ( Obrazek_Tla_Planszy__Tyl_RadioButton.Checked )
    or ( Obrazek_Tla_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Tekstur�( 'Ty�', adres_pliku );

  if   ( Obrazek_Tla_Planszy__Chmury_RadioButton.Checked )
    or ( Obrazek_Tla_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Tekstur�( 'Chmury', adres_pliku );



  {$region 'Zapisuje adres wczytanego pliku t�a planszy.'}
  if not nie_zapisuj then
    begin

      adres_pliku_ini := ExtractFilePath( Application.ExeName ) + 'Plansza t�o.ini';

      tekst_l := TStringList.Create();


      if FindFirst( adres_pliku_ini, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
        begin

          // Plik jest.

          FindClose( search_rec );

          tekst_l.LoadFromFile( adres_pliku_ini, TEncoding.UTF8 ); // Lepiej wskaza� kodowanie.

          for i := 0 to Length( tekstury_t ) - 1 do // Dla wszystkich modyfikowanych tekstur.
            begin

              czy_w_pliku_jest_informacja_o_teksturze := false;


              zts_1 := tekstury_t[ i ];

              zts_1 := StringReplace( zts_1, #$D#$A, '', [ rfReplaceAll ] );

              zti := Pos( '*', zts_1 );

              zts_2 := Copy( zts_1, 1, zti - 1 ); // Nazwa tekstury nowej.
              Delete( zts_1, 1, zti ); // Adres pliku.


              for j := 0 to tekst_l.Count - 1 do // Por�wnuje i ewentualnie zmienia zawarto�� pliku ini.
                begin

                  zts_1 := tekst_l[ j ];


                  zts_1 := StringReplace( zts_1, #$D#$A, '', [ rfReplaceAll ] );

                  zti := Pos( '*', zts_1 );

                  zts_1 := Copy( zts_1, 1, zti - 1 ); // Nazwa tekstury z pliku ini.


                  if zts_1 = zts_2 then
                    begin

                      tekst_l[ j ] := tekstury_t[ i ];
                      czy_w_pliku_jest_informacja_o_teksturze := true;
                      Break;

                    end;
                  //---//if zts_1 = zts_2 then

                end;
              //---//for i := 0 to tekst_l.Count - 1 do


              if not czy_w_pliku_jest_informacja_o_teksturze then // Ewentualnie dopisuje nowe dane do pliku ini.
                tekst_l.Add( tekstury_t[ i] );

            end;
          //---//for i := 0 to tekst_l.Count - 1 do

          tekst_l.SaveToFile( adres_pliku_ini, TEncoding.UTF8 );

        end
      else//if FindFirst( adres_pliku_ini, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
        begin

          // Je�eli pliku nie ma to nie trzeba wczytywa�, mo�na od razu dodawa� linie.


          for i := 0 to Length( tekstury_t ) - 1 do
            begin

              tekst_l.Add( tekstury_t[ i] );

            end;
          //---//for i := 0 to tekst_l.Count - 1 do


          tekst_l.SaveToFile( adres_pliku_ini, TEncoding.UTF8 );

        end;
      //---//if FindFirst( adres_pliku_ini, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.


      FindClose( search_rec );


      tekst_l.Clear();

      tekst_l.Free();

    end;
  //---//if not nie_zapisuj then
  {$endregion 'Zapisuje adres wczytanego pliku t�a planszy.'}


  SetLength( tekstury_t, 0 );

  Screen.Cursor := crDefault;

end;//---//Funkcja Wczytaj_T�o_Planszy().

//Funkcja Kamera_Ustawienie_Pocz�tkowe().
procedure TMahjong_3D_Form.Kamera_Ustawienie_Pocz�tkowe( const wymu�_wyliczenie : boolean = false );
var
  kamera_�rodek_x_l, // Wsp�rz�dne pocz�tkowe kamery.
  kamera_�rodek_y_l,
  kamera_�rodek_z_l,
  kamera_na_�rodek_x_l, // Wsp�rz�dne pocz�tkowe punktu, na kt�ry spogl�da kamera.
  kamera_na_�rodek_y_l
    : single;
begin

  //
  // Funkcja wylicza ustawienie kamery tak aby obj�a wszystkie kostki.
  //
  // Parametry:
  //   wymu�_wyliczenie:
  //     true - wylicza ustawienie kamery.
  //     false - podstawia warto�ci wczytane z pliku ini obraz�w kostek.
  //

  if   ( wymu�_wyliczenie )
    or (
             ( kamera_na_�rodek_x = 0 )
         and ( kamera_na_�rodek_x = kamera_�rodek_x )
         and ( kamera_na_�rodek_x = kamera_na_�rodek_y )
       ) then
    begin

      // Je�eli nie zdefiniowano pozycji punktu kamera patrzy na oszacuje pozycj� automatycznie.

      //kamera_na_�rodek_x_l := (  uk�ad_x * ( Szerokosc_Kostek_SpinEdit.Value / dzielnik_skalowania )  ) / 2;
      //kamera_na_�rodek_y_l := (  uk�ad_y * ( Wysokosc_Kostek_SpinEdit.Value / dzielnik_skalowania )  ) / 2;
      kamera_na_�rodek_x_l := (  uk�ad_x * ( Szerokosc_Kostek_SpinEdit.Value / dzielnik_skalowania )  ) / 2 + ( Szerokosc_Kostek_SpinEdit.Value / dzielnik_skalowania ) / 2 + Margines_Planszy_SpinEdit.Value / dzielnik_skalowania;
      kamera_na_�rodek_y_l := (  uk�ad_y * ( Wysokosc_Kostek_SpinEdit.Value / dzielnik_skalowania )  ) / 2 + ( Wysokosc_Kostek_SpinEdit.Value / dzielnik_skalowania ) / 2 + Margines_Planszy_SpinEdit.Value / dzielnik_skalowania;

    end;
  //---//if    ( wymu�_wyliczenie ) (...)


  if   ( wymu�_wyliczenie )
    or (
              ( kamera_�rodek_x = 0 )
          and ( kamera_�rodek_x = kamera_�rodek_y )
          and ( kamera_�rodek_x = kamera_�rodek_z )
       ) then
    begin

      // Je�eli nie zdefiniowano pozycji kamery oszacuje pozycj� automatycznie.

      kamera_�rodek_x_l := kamera_na_�rodek_x_l;
      kamera_�rodek_y_l := kamera_na_�rodek_y_l;
      kamera_�rodek_z_l := (   ( uk�ad_z + 1 ) * (  ( Grubosc_Kostek_SpinEdit.Value + 1 ) / ( dzielnik_skalowania * 10 )  )   ) + 4 * Max( Szerokosc_Kostek_SpinEdit.Value, Wysokosc_Kostek_SpinEdit.Value );
      //kamera_�rodek_z_l := Round(     (    uk�ad_z * (   Max(  Max( Wysokosc_Kostek_SpinEdit.Value, Szerokosc_Kostek_SpinEdit.Value ), Grubosc_Kostek_SpinEdit.Value  ) / 1   )    ) * 2     );

    end;
  //---//if    ( wymu�_wyliczenie ) (...)


  // Je�eli w pliku ini obraz�w kostek nie zdefiniowano pozycji kamery podstawi wyliczone warto�ci.
  if    ( kamera_na_�rodek_x = 0 )
    and ( kamera_na_�rodek_x = kamera_�rodek_x )
    and ( kamera_na_�rodek_x = kamera_na_�rodek_y ) then
    begin

      kamera_na_�rodek_x := kamera_na_�rodek_x_l;
      kamera_na_�rodek_y := kamera_na_�rodek_y_l;

    end;
  //---//if    ( kamera_na_�rodek_x = 0 ) (...)

  if    ( kamera_�rodek_x = 0 )
    and ( kamera_�rodek_x = kamera_�rodek_y )
    and ( kamera_�rodek_x = kamera_�rodek_z ) then
    begin

      kamera_�rodek_x := kamera_�rodek_x_l;
      kamera_�rodek_y := kamera_�rodek_y_l;
      kamera_�rodek_z := kamera_�rodek_z_l;

    end;
  //---//if    ( kamera_�rodek_x = 0 ) (...)
  //---// Je�eli w pliku ini obraz�w kostek nie zdefiniowano pozycji kamery podstawi wyliczone warto�ci.


  if wymu�_wyliczenie then
    begin

      GLCamera1.Position.X := kamera_�rodek_x_l;
      GLCamera1.Position.Y := -kamera_�rodek_y_l;
      GLCamera1.Position.Z := kamera_�rodek_z_l;

      Kamera_Na_GLDummyCube.Position.X := kamera_na_�rodek_x_l; // GLCamera1.Position.X
      Kamera_Na_GLDummyCube.Position.Y := -kamera_na_�rodek_y_l; // GLCamera1.Position.Y
      Kamera_Na_GLDummyCube.Position.Z := 0;

    end
  else//if wymu�_wyliczenie then
    begin

      GLCamera1.Position.X := kamera_�rodek_x;
      GLCamera1.Position.Y := -kamera_�rodek_y;
      GLCamera1.Position.Z := kamera_�rodek_z;

      Kamera_Na_GLDummyCube.Position.X := kamera_na_�rodek_x; // GLCamera1.Position.X
      Kamera_Na_GLDummyCube.Position.Y := -kamera_na_�rodek_y; // GLCamera1.Position.Y
      Kamera_Na_GLDummyCube.Position.Z := 0;

    end;
  //---//if wymu�_wyliczenie then


  if Kamera_Ruch_Ciagly_MenuItem.Checked then
    Kamera_Ruch_Ciagly_MenuItemClick( nil ); // Gdy jest aktywna funkcja ci�g�ego ruchu kamery aktualizuje wsp�rz�dne do przeliczania ruchu.

  Kamera_Wsp�rz�dne_Wypisz();

end;//---//Funkcja Kamera_Ustawienie_Pocz�tkowe().

//Funkcja Kamera_Wsp�rz�dne_Wypisz().
procedure TMahjong_3D_Form.Kamera_Wsp�rz�dne_Wypisz();
begin

  Kamera_Wspolrzedne_Label.Caption :=
    'x: ' + FloatToStr( GLCamera1.Position.X ) + '   ' + FloatToStr( Kamera_Na_GLDummyCube.Position.X ) + #13 +
    'y: ' + FloatToStr( GLCamera1.Position.Y ) + '   ' + FloatToStr( Kamera_Na_GLDummyCube.Position.Y ) + #13 +
    'z: ' + FloatToStr( GLCamera1.Position.Z ) + '   ' + FloatToStr( Kamera_Na_GLDummyCube.Position.Z );

end;//---//Funkcja Kamera_Wsp�rz�dne_Wypisz().


//Funkcja Color_To_RGB().
procedure TMahjong_3D_Form.Color_To_RGB( const color : integer; out r, g, b : integer );
begin

  r := Color and $FF;
  g := ( Color shr 8 ) and $FF;
  b := ( Color shr 16 ) and $FF;

end;//---//Funkcja Color_To_RGB().

//---//      ***      Funkcje      ***      //---//


//FormShow().
procedure TMahjong_3D_Form.FormShow( Sender: TObject );
var
//  ztk : TKostka;
  zts : string;
begin

  //ztk := TKostka.Create( Application );
  //ztk.Free();
  //FreeAndNil( ztk );

  kostka_klikni�ta := nil;
  kostka_podpowied�_1 := nil;
  kostka_podpowied�_2 := nil;
  kostka_demo := nil;

  blokuj_rysowanie_kostek := false;

  wczytany_uk�ad_kostek_nazwa_pliku := '';
  obrazki_kostek_nazwa_katalogu := 'Domy�lne';
  gra_czas_start := 0;
  gra_czas_koniec := 0;

  przetasowania_ilo�� := 0;
  podpowiedzi_ilo�� := 0;
  cofni�cia_ilo�� := 0;


  kamera_na_�rodek_x := 0;
  kamera_na_�rodek_y := 0;
  kamera_�rodek_x := 0;
  kamera_�rodek_y := 0;
  kamera_�rodek_z := 10;

  Test_GLSphere.Visible := false;
  Test_GLCube.Visible := false;

  SetLength( podpowied�_poprzednia_t_r, 0 );

  Tlumaczenia_Domyslne_ButtonClick( Sender ); // Podstawi warto�ci zmiennym t�umacze�.

  Wczytaj_List�_Uk�ad�w_Kostek( Sender );

  Wczytaj_List�_Obrazk�w_Kostek( Sender );

  Wczytaj_List�_T�umacze�( Sender );

  Wczytaj_Ustawienia();

  Pelny_Ekran_CheckBoxClick( Sender );

  Przyblizenie_CheckBoxClick( Sender );

  Tlumaczenia_Zastosuj_ButtonClick( Sender );


  if Uklady_Kostek_MenuItem.Count < 2 then
    //Application.MessageBox( 'Brak zdefiniowanych uk�ad�w kostek.', 'B��d', MB_ICONEXCLAMATION + MB_OK );
    Application.MessageBox(  PChar( t__brak_zdefiniowanych_uk�ad�w_kostek ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK  );

  if Obrazki_Kostek_MenuItem.Count < 2 then
    //Application.MessageBox( 'Brak zdefiniowanych obrazk�w kostek.', 'B��d', MB_ICONEXCLAMATION + MB_OK );
    Application.MessageBox(  PChar( t__brak_zdefiniowanych_obrazk�w_kostek ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK  );



  PageControl1.ActivePage := Opcje_TabSheet; //???

  if    ( Opcje_ScrollBox.VertScrollBar.Visible )
    and ( Opcje_ScrollBox.VertScrollBar.Position <> 0 ) then
    Opcje_ScrollBox.VertScrollBar.Position := 0;


  if    ( Automatyczne_Wczytywanie_Ukladu_Kostek_CheckBox.Checked )
    and (  Trim( wczytany_uk�ad_kostek_nazwa_pliku ) <> ''  ) then
    begin

      //if Wczytuj_Konfiguracje_Kostek_CheckBox.Checked then
      //  begin
      //
      //    if obrazki_kostek_nazwa_katalogu <> '' then
      //      zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\' + obrazki_kostek_nazwa_katalogu + '\' + obrazki_kostek_nazwa_katalogu + '.ini'
      //    else//if nazwa_katalogu <> '' then
      //      zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\Domy�lne\Domy�lne.ini';
      //
      //
      //    Wczytaj_Ini_Obrazk�w_Kostek( zts );
      //
      //  end;
      ////---//if Wczytuj_Konfiguracje_Kostek_CheckBox.Checked then


      Wczytaj_Uk�ad_Kostek( wczytany_uk�ad_kostek_nazwa_pliku );

    end;
  //---//if    ( Automatyczne_Wczytywanie_Ukladu_Kostek_CheckBox.Checked ) (...)


  // Zainicjowanie warto�ci gdyby wczytanie ustawie� nie wywo�a�o zdarzenia.f
  Obrazek_Tla_Planszy__Wyswietl_CheckBoxClick( Sender );

  GLSceneViewer1.Align := alClient;

  Kamera_Ustawienie_Pocz�tkowe();

end;//---//FormShow().

//FormClose().
procedure TMahjong_3D_Form.FormClose( Sender: TObject; var Action: TCloseAction );
begin

  Wczytaj_Uk�ad_Kostek( '', true );

  Wczytaj_List�_Uk�ad�w_Kostek( nil );

  Wczytaj_List�_Obrazk�w_Kostek( nil );

end;//---//FormClose().

//Uk�ady_Kostek__Uk�ad_Kostek_MenuItemClick().
procedure TMahjong_3D_Form.Uk�ady_Kostek__Uk�ad_Kostek_MenuItemClick( Sender : TObject );
begin

  if Sender = nil then
    Exit;

  //Wczytaj_Uk�ad_Kostek(  StringReplace( TMenuItem(Sender).Caption, '&', '', [ rfReplaceAll ] )  );
  Wczytaj_Uk�ad_Kostek( TMenuItem(Sender).Hint );

end;//---//Uk�ady_Kostek__Uk�ad_Kostek_MenuItemClick().

//Obrazki_Kostek__Obrazek_Kostek_MenuItemClick().
procedure TMahjong_3D_Form.Obrazki_Kostek__Obrazek_Kostek_MenuItemClick( Sender : TObject );
var
  zti : integer;
  czy_zaznaczone : boolean;
begin

  if Sender = nil then
    Exit;

  //Wczytaj_Obrazki_Kostek(  StringReplace( TMenuItem(Sender).Caption, '&', '', [ rfReplaceAll ] )  );
  Wczytaj_Obrazki_Kostek( TMenuItem(Sender).Hint );

//???  if TComponent(Sender).Name <> Obrazki_Kostek__Brak_MenuItem.Name then
//    Wczytaj_Obrazki_Kostek( TMenuItem(Sender).Hint )
//  else//if TComponent(Sender).Name <> Obrazki_Kostek__Brak_MenuItem.Name then
//    Wczytaj_Obrazki_Kostek( '', true );


  // Gdy kliknie si� ponownie to samo pole kropka zaznaczenia znika.
  czy_zaznaczone := false;

  for zti := Obrazki_Kostek_MenuItem.Count - 1 downto 0 do
    if Obrazki_Kostek_MenuItem.Items[ zti ].Checked then
      begin

        czy_zaznaczone := true;
        Break;

      end;
    //---//if Obrazki_Kostek_MenuItem.Items[ zti ].Checked then


  if not czy_zaznaczone then
    for zti := Obrazki_Kostek_MenuItem.Count - 1 downto 0 do
      if Obrazki_Kostek_MenuItem.Items[ zti ].Hint = obrazki_kostek_nazwa_katalogu then
        begin

          Obrazki_Kostek_MenuItem.Items[ zti ].Checked := true;
          Break;

        end;
      //---//if Obrazki_Kostek_MenuItem.Items[ zti ].Checked then


  if Wczytuj_Konfiguracje_Kostek_CheckBox.Checked then
    Kostki_SpinEditChange( nil );

end;//---//Obrazki_Kostek__Obrazek_Kostek_MenuItemClick().

//KostkaClick().
procedure TMahjong_3D_Form.KostkaClick( klikni�ty_obiekt : TGLSceneObject );
begin

  if klikni�ty_obiekt = nil then
    Exit;


  if klikni�ty_obiekt is TGLSpaceText_M then
    klikni�ty_obiekt := TGLSpaceText_M(klikni�ty_obiekt).Kostka
  else//if klikni�ty_obiekt is TGLSpaceText_M then
  if klikni�ty_obiekt is TKostka_Obrazek then
    klikni�ty_obiekt := TKostka_Obrazek(klikni�ty_obiekt).Kostka;


  //if not ( klikni�ty_obiekt is TKostka ) then
  //  Exit;



  if not Czy_Kostk�_Mo�na_Zdj��( TKostka(klikni�ty_obiekt) ) then
    Exit;



  if    ( kostka_podpowied�_1 <> nil )
    and ( kostka_podpowied�_1 <> kostka_klikni�ta )
    and ( kostka_podpowied�_1 <> klikni�ty_obiekt ) then
    kostka_podpowied�_1.Klikni�cie_Oznacz( false );


  if    ( kostka_podpowied�_2 <> nil )
    and ( kostka_podpowied�_2 <> kostka_klikni�ta )
    and ( kostka_podpowied�_2 <> klikni�ty_obiekt ) then
    kostka_podpowied�_2.Klikni�cie_Oznacz( false );

  kostka_podpowied�_1 := nil;
  kostka_podpowied�_2 := nil;


  SetLength( podpowied�_poprzednia_t_r, 0 );


  if kostka_klikni�ta = TKostka(klikni�ty_obiekt) then
    begin

      // Klikni�to t� sam� kostk� - odznacza j�.

      TKostka(klikni�ty_obiekt).Klikni�cie_Oznacz( false );

      kostka_klikni�ta := nil;

      Exit;

    end
  else//if kostka_klikni�ta_t[ kostka_klikni�ta_indeks ] = TKostka(klikni�ty_obiekt) then
    if kostka_klikni�ta <> nil then
      begin

        // Odznacza poprzednio klikni�t� kostk�.

        kostka_klikni�ta.Klikni�cie_Oznacz( false );

      end;
    //---//if kostka_klikni�ta <> nil then


  // Zaznacza klikni�t� kostk�.

  TKostka(klikni�ty_obiekt).Klikni�cie_Oznacz( true );
  //TKostka(klikni�ty_obiekt).Klikni�cie_Oznacz( not TKostka(klikni�ty_obiekt).zaznaczona );


  if    ( kostka_klikni�ta <> nil )
    //and ( kostka_klikni�ta.symbol = TKostka(klikni�ty_obiekt).symbol ) then
    and (  Czy_Kostki_Pasuj�_Do_Siebie( kostka_klikni�ta, TKostka(klikni�ty_obiekt) )  ) then
    Zdejmij_Kostki( TKostka(klikni�ty_obiekt) )
  else//if    ( kostka_klikni�ta <> nil ) (...)
    kostka_klikni�ta := TKostka(klikni�ty_obiekt);


  //Plansza_ScrollBox.SetFocus();

end;//---//KostkaClick().

//PlanszaKeyDown().
procedure TMahjong_3D_Form.PlanszaKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
begin

  //// Enter.
  //if Key = 13 then
  //  begin
  //
  //    Key := 0;
  //    T�umaczenia_Zastosuj_ButtonClick( Tlumaczenia_Zastosuj_Button );
  //
  //  end;
  ////---//if Key = 13 then


  // Enter.
  if    ( ssAlt in Shift )
    and ( Key = 13 ) then
    begin

      Key := 0;
      Pelny_Ekran_CheckBox.Checked := not Pelny_Ekran_CheckBox.Checked;

    end;
  //---//if    ( ssAlt in Shift ) (...)

  // Escape.
  if Key = 27 then
    begin

      Key := 0;
      Pelny_Ekran_CheckBox.Checked := false;

    end;
  //---//if Key = 27 then


  // D.
  if    ( ssCtrl in Shift )
    and ( Key = 68 ) then
    begin

      Gra__Demo_MenuItem.Checked := not Gra__Demo_MenuItem.Checked;
      Gra__Demo_MenuItemClick( Sender );

    end;
  //---//if    ( ssCtrl in Shift ) (...)


  // Spacja, K.
  if Key in [ 32, 75 ] then
    begin

      Kamera_Ruch_Ciagly_MenuItem.Checked := not Kamera_Ruch_Ciagly_MenuItem.Checked;
      Kamera_Ruch_Ciagly_MenuItemClick( Sender );

    end;
  //---//if Key in [ 32, 75 ] then


  // N.
  if    ( ssCtrl in Shift )
    and ( Key = 78 ) then
    Gra__Nowa_Gra_MenuItemClick( Sender );

  // P.
  if    ( ssCtrl in Shift )
    and ( Key = 80 ) then
    Gra__Podpowiedz_MenuItemClick( Sender );

  // T.
  if    ( ssCtrl in Shift )
    and ( Key = 84 ) then
    Gra__Przetasuj_MenuItemClick( Sender );

  // X.
  if    ( ssCtrl in Shift )
    and ( Key = 88 ) then
    Gra__Wyczysc_Plansze_MenuItemClick( Sender );

  // W.
  if    ( ssCtrl in Shift )
    and ( Key = 87 ) then
    Gra__Wyjdz_MenuItemClick( Sender );

  // Z.
  //if    ( ssCtrl in Shift )
  //  and ( Key = 90 ) then
  //  Gra__Cofnij_MenuItemClick( Sender );
  if Key = 90 then
    if ssCtrl in Shift then
      Gra__Cofnij_MenuItemClick( Sender )
    else
      Przyblizenie_CheckBox.Checked := not Przyblizenie_CheckBox.Checked;


  // A.
  if    ( ssCtrl in Shift )
    and ( Key = 65 ) then
    Gra__Zaprezentuj_Kostki_MenuItemClick( Sender );



  // O.
  if    ( ssCtrl in Shift )
    and ( Key = 79 ) then
    Opcje_MenuItemClick( Sender );



  // 1.
  if    ( ssCtrl in Shift )
    and ( Key = 49 )
    and ( Wyswietlanie_Czasu_RadioGroup.Items.Count >= 1 ) then
    Wyswietlanie_Czasu_RadioGroup.ItemIndex := 0;

  // 2.
  if    ( ssCtrl in Shift )
    and ( Key = 50 )
    and ( Wyswietlanie_Czasu_RadioGroup.Items.Count >= 2 ) then
    Wyswietlanie_Czasu_RadioGroup.ItemIndex := 1;

  // 3.
  if    ( ssCtrl in Shift )
    and ( Key = 51 )
    and ( Wyswietlanie_Czasu_RadioGroup.Items.Count >= 3 ) then
    Wyswietlanie_Czasu_RadioGroup.ItemIndex := 2;



  // +.
  if Key = 187 then
    begin

      Szerokosc_Kostek_SpinEdit.Value := Szerokosc_Kostek_SpinEdit.Value + 1;
      Wysokosc_Kostek_SpinEdit.Value := Wysokosc_Kostek_SpinEdit.Value + 1;

    end;
  //---//if Key = 187 then

  // -.
  if Key = 189 then
    begin

      Szerokosc_Kostek_SpinEdit.Value := Szerokosc_Kostek_SpinEdit.Value - 1;
      Wysokosc_Kostek_SpinEdit.Value := Wysokosc_Kostek_SpinEdit.Value - 1;

    end;
  //---//if Key = 189 then

  // Backspace.
  if Key = 8 then
    begin

      Szerokosc_Kostek_SpinEdit.Value := 5;
      Wysokosc_Kostek_SpinEdit.Value := 7;

    end;
  //---//if Key = 8 then

  // 0, 0 (numeryczna).
  if Key in [ 48, 96 ] then
    begin

      Kamera_Ustawienie_Pocz�tkowe( true );

    end;
  //---//if Key in [ 48, 96 ] then

  // 9, 5 (numeryczna).
  if Key in [ 57, 101 ] then
    begin

      Kamera_Ustawienie_Pocz�tkowe( false );

    end;
  //---//if Key in [ 57, 101 ] then


  // [.
  if Key = 219 then
    begin

      Grubosc_Kostek_SpinEdit.Value := Grubosc_Kostek_SpinEdit.Value - 1;

    end;
  //---//if Key = 219 then

  // ].
  if Key = 221 then
    begin

      Grubosc_Kostek_SpinEdit.Value := Grubosc_Kostek_SpinEdit.Value + 1;

    end;
  //---//if Key = 221 then


  // ;.
  if Key = 186 then
    begin

      //Szybkosc_Kamery_SpinEdit.Value := Szybkosc_Kamery_SpinEdit.Value - 10;

      if ssShift in Shift then
        Szybkosc_Kamery_SpinEdit.Value := Szybkosc_Kamery_SpinEdit.Value - 10
      else//if ssShift in Shift then
        Szybkosc_Kamery_SpinEdit.Value := Szybkosc_Kamery_SpinEdit.Value - 1;

    end;
  //---//if Key = 186 then

  // '.
  if Key = 222 then
    begin

      //Szybkosc_Kamery_SpinEdit.Value := Szybkosc_Kamery_SpinEdit.Value + 10;

      if ssShift in Shift then
        Szybkosc_Kamery_SpinEdit.Value := Szybkosc_Kamery_SpinEdit.Value + 10
      else//if ssShift in Shift then
        Szybkosc_Kamery_SpinEdit.Value := Szybkosc_Kamery_SpinEdit.Value + 1;

    end;
  //---//if Key = 222 then

  // I.
  if    ( ssCtrl in Shift )
    and ( Key = 73 ) then
    Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked := not Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked;



  // Delete, 0, 2, 4, 5, 6, 8 (numeryczna), Delete (numeryczna).
  if Key in [ 46, 96, 98, 100, 101, 102, 104, 110 ] then
    begin

      case Key of
          98 : Key := 40; // Kursor d�.
          100 : Key := 37; // Kursor lewo.
          101 : Key := 96; // 0 (numeryczna).
          102 : Key := 39; // Kursor prawo.
          104 : Key := 38; // Kursor g�ra.
          110 : Key := 46; // Delete.
        end;
      //---//case Key of

      PerspektywaKeyDown( Sender, Key, Shift );

    end;
  //---//if Key in [ 98, 100, 102, 104 ] then


  // 1, 3, 7, 9 (numeryczna).
  if Key in [ 97, 99, 103, 105 ] then
    begin

        case Key of
          97 :
            begin

              Key := 37; // Kursor lewo.
              PerspektywaKeyDown( Sender, Key, Shift );

              Key := 40; // Kursor d�.
              PerspektywaKeyDown( Sender, Key, Shift );

            end;
          //---//97 :

          99 :
            begin

              Key := 39; // Kursor prawo.
              PerspektywaKeyDown( Sender, Key, Shift );

              Key := 40; // Kursor d�.
              PerspektywaKeyDown( Sender, Key, Shift );

            end;
          //---//99 :

          103 :
            begin

              Key := 37; // Kursor lewo.
              PerspektywaKeyDown( Sender, Key, Shift );

              Key := 38; // Kursor g�ra.
              PerspektywaKeyDown( Sender, Key, Shift );

            end;
          //---//103 :

          105 :
            begin

              Key := 39; // Kursor prawo.
              PerspektywaKeyDown( Sender, Key, Shift );

              Key := 38; // Kursor g�ra.
              PerspektywaKeyDown( Sender, Key, Shift );

            end;
          //---//105 :

        end;
      //---//case Key of

    end;
  //---//if Key in [ 98, 100, 102, 104 ] then

  // + (numeryczna).
  if Key = 107 then
    PerspektywaKeyDown( Sender, Key, Shift );

  // - (numeryczna).
  if Key = 109 then
    PerspektywaKeyDown( Sender, Key, Shift );

  // * (numeryczna).
  if Key = 106 then
    PerspektywaKeyDown( Sender, Key, Shift );


  // / (numeryczna).
  if Key = 111 then
    Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Checked := not Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Checked;



  // + (numeryczna).
  if    ( ssCtrl in Shift )
    and ( Key = 107 ) then
    PerspektywaKeyDown( Sender, Key, Shift );

  // - (numeryczna).
  if    ( ssCtrl in Shift )
    and ( Key = 109 ) then
    PerspektywaKeyDown( Sender, Key, Shift );

  // * (numeryczna).
  if    ( ssCtrl in Shift )
    and ( Key = 106 ) then
    PerspektywaKeyDown( Sender, Key, Shift );



  // ,
  if    ( ssCtrl in Shift )
    and ( Key = 188 ) then
    Szybkosc_Zegara_SpinEdit.Value := Szybkosc_Zegara_SpinEdit.Value + 50;

  // .
  if    ( ssCtrl in Shift )
    and ( Key = 190 ) then
    Szybkosc_Zegara_SpinEdit.Value := Szybkosc_Zegara_SpinEdit.Value - 50;

  // /
  if    ( ssCtrl in Shift )
    and ( Key = 191 ) then
    Szybkosc_Zegara_SpinEdit.Value := 1000;


  // B.
  if    ( ssCtrl in Shift )
    and ( Key = 66 ) then
    begin

      Obrazek_Tla_Planszy__Wyswietl_CheckBox.Checked := not Obrazek_Tla_Planszy__Wyswietl_CheckBox.Checked;
      Obrazek_Tla_Planszy__Wyswietl_CheckBoxClick( Sender );

    end;
  //---//if    ( ssCtrl in Shift ) (...)

end;//---//PlanszaKeyDown().

//PerspektywaKeyDown().
procedure TMahjong_3D_Form.PerspektywaKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
const
  szybko��_kamery_wsp�czynnik = 100;
begin

  ////Enter
  //if Key = 13 then
  //  begin
  //
  //    Key := 0;
  //    T�umaczenia_Zastosuj_ButtonClick( Tlumaczenia_Zastosuj_Button );
  //
  //  end;
  ////---//if Key = 13 then

  if not ( ssCtrl in Shift ) then
    begin

      // Kursor lewo.
      if Key = 37 then
        //Kamera_X_SpinEdit.Value := Kamera_X_SpinEdit.Value - 1;
        GLCamera1.Position.X := GLCamera1.Position.X - Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;

      // Kursor prawo.
      if Key = 39 then
        //Kamera_X_SpinEdit.Value := Kamera_X_SpinEdit.Value + 1;
        GLCamera1.Position.X := GLCamera1.Position.X + Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;


      // Kursor g�ra.
      if Key = 38 then
        //Kamera_Y_SpinEdit.Value := Kamera_Y_SpinEdit.Value - 1;
        GLCamera1.Position.Y := GLCamera1.Position.Y + Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;

      // Kursor d�.
      if Key = 40 then
        //Kamera_Y_SpinEdit.Value := Kamera_Y_SpinEdit.Value + 1;
        GLCamera1.Position.Y := GLCamera1.Position.Y - Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;

      // Delete.
      if Key = 46 then
        begin

          GLCamera1.Position.X := kamera_�rodek_x;
          GLCamera1.Position.Y := -kamera_�rodek_y;
          GLCamera1.Position.Z := kamera_�rodek_z;

        end;
      //---//if Key = 46 then


      // + (numeryczna).
      if Key = 107 then
        GLCamera1.Position.Z := GLCamera1.Position.Z - Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;


      // - (numeryczna).
      if Key = 109 then
        GLCamera1.Position.Z := GLCamera1.Position.Z + Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;

      // * (numeryczna).
      if Key = 106 then
        GLCamera1.Position.Z := 10;

    end
  else//if not ( ssCtrl in Shift ) then
    begin

      // Ruch punktem, na kt�ry patrzy kamera.

      // Kursor lewo.
      if Key = 37 then
        Kamera_Na_GLDummyCube.Position.X := Kamera_Na_GLDummyCube.Position.X - Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;

      // Kursor prawo.
      if Key = 39 then
        Kamera_Na_GLDummyCube.Position.X := Kamera_Na_GLDummyCube.Position.X + Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;


      // Kursor g�ra.
      if Key = 38 then
        Kamera_Na_GLDummyCube.Position.Y := Kamera_Na_GLDummyCube.Position.Y + Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;

      // Kursor d�.
      if Key = 40 then
        Kamera_Na_GLDummyCube.Position.Y := Kamera_Na_GLDummyCube.Position.Y - Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;

      // Delete.
      if Key = 46 then
        begin

          Kamera_Na_GLDummyCube.Position.X := kamera_na_�rodek_x; // GLCamera1.Position.X
          Kamera_Na_GLDummyCube.Position.Y := -kamera_na_�rodek_y; // GLCamera1.Position.Y
          Kamera_Na_GLDummyCube.Position.Z := 0;

        end;
      //---//if Key = 46 then


      // + (numeryczna).
      if Key = 107 then
        Kamera_Na_GLDummyCube.Position.Z := Kamera_Na_GLDummyCube.Position.Z - Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;


      // - (numeryczna).
      if Key = 109 then
        Kamera_Na_GLDummyCube.Position.Z := Kamera_Na_GLDummyCube.Position.Z + Szybkosc_Kamery_SpinEdit.Value / szybko��_kamery_wsp�czynnik;

      // * (numeryczna).
      if Key = 106 then
        Kamera_Na_GLDummyCube.Position.Z := 0;

    end;
  //---//if not ( ssShift in Shift ) then


  Key := 0;


  Kamera_Wsp�rz�dne_Wypisz();

end;//---//PerspektywaKeyDown().

//GLSceneViewer1Click().
procedure TMahjong_3D_Form.GLSceneViewer1Click( Sender: TObject );
begin

  if not GLSceneViewer1.Focused then
    GLSceneViewer1.SetFocus();

end;//---//GLSceneViewer1Click().

//GLSceneViewer1MouseMove().
procedure TMahjong_3D_Form.GLSceneViewer1MouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
begin

  //if ssLeft in Shift then
  if   ( ssLeft in Shift )
    or ( Kamera_Ruch_Ciagly_MenuItem.Checked ) then
    begin

      GLCamera1.Position.X := kamera_punkt_kopia.X - ( mysz_start_punkt.X - X ) / 1000 * Szybkosc_Kamery_SpinEdit.Value;
      GLCamera1.Position.Y := kamera_punkt_kopia.Y + ( mysz_start_punkt.Y - Y ) / 1000 * Szybkosc_Kamery_SpinEdit.Value;


      Kamera_Wsp�rz�dne_Wypisz();

    end;
  //---//if   ( ssLeft in Shift ) (...)

end;//---//GLSceneViewer1MouseMove().

//GLSceneViewer1MouseWheel().
procedure TMahjong_3D_Form.GLSceneViewer1MouseWheel( Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean );
begin

  if WheelDelta >= 0 then
    GLCamera1.Position.Z := GLCamera1.Position.Z - Szybkosc_Kamery_SpinEdit.Value / 50
  else//if WheelDelta >= 0 then
    GLCamera1.Position.Z := GLCamera1.Position.Z + Szybkosc_Kamery_SpinEdit.Value / 50;

  Kamera_Wsp�rz�dne_Wypisz();

end;//---//GLSceneViewer1MouseWheel().

//GLSceneViewer1MouseDown().
procedure TMahjong_3D_Form.GLSceneViewer1MouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
var
  //ztw : word;
  klikni�ty_obiekt : TGLSceneObject;
begin

  if Button = System.UITypes.TMouseButton.mbRight then
    begin

      //ztw := 32; // Spacja.
      //PlanszaKeyDown( Sender, ztw, Shift );
      Kamera_Ruch_Ciagly_MenuItem.Checked := not Kamera_Ruch_Ciagly_MenuItem.Checked;
      Kamera_Ruch_Ciagly_MenuItemClick( Tlumaczenia_Panel );
      Exit;

    end;
  //---//if Button = System.UITypes.TMouseButton.mbRight then


  mysz_start_punkt.X := X;
  mysz_start_punkt.Y := Y;

  kamera_punkt_kopia.X := GLCamera1.Position.X;
  kamera_punkt_kopia.Y := GLCamera1.Position.Y;
  //Pomoc_Memo.Lines.Add(  IntToStr( X ) + ' ' + IntToStr( Y )  );


  if    ( Sender <> nil )
    and ( TComponent(Sender).Name = Tlumaczenia_Panel.Name ) then
    Exit;


  // Tu (w if) si� pojawia� b��d "Unbalanced context activations" gdy T�o_GLSkyBox mia�o wczytane tekstury.
  // Ustawienie T�o_GLSkyBox.Pickable := false (chyba) rozwi�za�o problem.

  if ( GLSceneViewer1.Buffer.GetPickedObject( x, y ) is TGLSceneObject ) then
    klikni�ty_obiekt := ( GLSceneViewer1.Buffer.GetPickedObject( x, y ) as TGLSceneObject )
  else//if ( GLSceneViewer1.Buffer.GetPickedObject( x, y ) is TGLSceneObject ) then
    klikni�ty_obiekt := nil;

  if klikni�ty_obiekt <> nil then
    KostkaClick( klikni�ty_obiekt );

end;//---//GLSceneViewer1MouseDown().

//GLSceneViewer1Gesture().
procedure TMahjong_3D_Form.GLSceneViewer1Gesture( Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean );
var
  przybli�enie_r�nica_l : integer; // Dla zwi�kszenie czytelno�ci.
begin

  if EventInfo.GestureID = igiZoom then
    if ( TInteractiveGestureFlag.gfBegin in EventInfo.Flags ) then
      begin

        kamera_punkt_kopia_z := GLCamera1.Position.Z; // Aktualne przybli�enie.
        przybli�enie_mysz_start_y := EventInfo.Distance; // Tutaj jako wykryta warto�� przybli�enia (dystansu) w momencie rozpocz�cia gestu.

      end
    else//if ( TInteractiveGestureFlag.gfBegin in EventInfo.Flags ) then
      if EventInfo.Distance <> 0 then
        begin

          przybli�enie_r�nica_l := EventInfo.Distance - przybli�enie_mysz_start_y;
          //GLCamera1.Position.Z := kamera_punkt_kopia_z + przybli�enie_r�nica_l * ( Szybkosc_Kamery_SpinEdit.Value / 1000 );
          GLCamera1.Position.Z := kamera_punkt_kopia_z - przybli�enie_r�nica_l * ( Szybkosc_Kamery_SpinEdit.Value / 1000 );
          //GLCamera1.Position.Z := kamera_punkt_kopia_z - ( przybli�enie_mysz_start_y - Y ) * ( Szybkosc_Kamery_SpinEdit.Value / 1000 );

        end;
      //---//if EventInfo.Distance <> 0 then

end;//---//GLSceneViewer1Gesture().

//Kamera_Ruch_Ciagly_MenuItemClick().
procedure TMahjong_3D_Form.Kamera_Ruch_Ciagly_MenuItemClick( Sender: TObject );
var
  mysz_punkt : TPoint;
begin

  mysz_punkt := ScreenToClient( Mouse.CursorPos );
  //Pomoc_Memo.Lines.Add(  IntToStr( mysz_punkt.X ) + ' ' + IntToStr( mysz_punkt.Y )  );
  GLSceneViewer1MouseDown( Sender, TMouseButton.mbLeft, [], mysz_punkt.X, mysz_punkt.Y );

  if Kamera_Ruch_Ciagly_MenuItem.Checked then
    Kamera_Ruch_Ciagly_MenuItem.Caption := '*' + kamera_ruch_ci�g�y_tre��
  else//if Kamera_Ruch_Ciagly_MenuItem.Checked then
    Kamera_Ruch_Ciagly_MenuItem.Caption := kamera_ruch_ci�g�y_tre��;

end;//---//Kamera_Ruch_Ciagly_MenuItemClick().

//Pelny_Ekran_MenuItemClick().
procedure TMahjong_3D_Form.Pelny_Ekran_MenuItemClick( Sender: TObject );
begin

  Pelny_Ekran_CheckBox.Checked := not Pelny_Ekran_CheckBox.Checked;

  //Pe�ny_Ekran_CheckBoxClick( Sender ); // Wywo�a si� samo w linijce wy�ej.

end;//---//Pelny_Ekran_MenuItemClick().

//ScrollBoxMouseWheel().
procedure TMahjong_3D_Form.ScrollBoxMouseWheel( Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean );
var
  zti : integer;
begin

  //if   ( Sender = nil )
  //  or (  not ( Sender is TScrollBox )  ) then
  //  Exit;

  if Sender = nil then
    Exit;


  Handled := true;

  if WheelDelta >= 0 then
    zti := -25
  else//if WheelDelta >= 0 then
    zti := 25;


  if ssCtrl in Shift then
    zti := 10 * zti;


  if ssShift in Shift then
    begin

      if TScrollBox(Sender).HorzScrollBar.Visible then
        TScrollBox(Sender).HorzScrollBar.Position := TScrollBox(Sender).HorzScrollBar.Position + zti;

    end
  else//if ssShift in Shift then
    begin

      if TScrollBox(Sender).VertScrollBar.Visible then
        TScrollBox(Sender).VertScrollBar.Position := TScrollBox(Sender).VertScrollBar.Position + zti;

    end;
  //---//if ssShift in Shift then

end;//---//ScrollBoxMouseWheel().

//Przyblizenie_PanelMouseDown().
procedure TMahjong_3D_Form.Przyblizenie_PanelMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
begin

  przybli�enie_mysz_start_y := Y;
  kamera_punkt_kopia_z := GLCamera1.Position.Z;

end;//---//Przyblizenie_PanelMouseDown().

//Przyblizenie_PanelMouseMove().
procedure TMahjong_3D_Form.Przyblizenie_PanelMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
begin

  if ssLeft in Shift then
    begin

      GLCamera1.Position.Z := kamera_punkt_kopia_z - ( przybli�enie_mysz_start_y - Y ) * ( Szybkosc_Kamery_SpinEdit.Value / 1000 );

    end;
  //---//if ssLeft in Shift then

end;//---//Przyblizenie_PanelMouseMove().

//Gra__Demo_MenuItemClick().
procedure TMahjong_3D_Form.Gra__Demo_MenuItemClick( Sender: TObject );
begin

  if kostka_klikni�ta <> nil then
    kostka_klikni�ta := nil;

  if kostka_demo <> nil then
    kostka_demo := nil;


  SetLength( podpowied�_poprzednia_t_r, 0 );


  if Gra__Demo_MenuItem.Checked then
    Gra__Cofnij_MenuItem.Enabled := false
  else//if Gra__Demo_MenuItem.Checked then
    Gra__Cofnij_MenuItem.Enabled := Length( cofnij_t_r ) > 0;

end;//---//Gra__Demo_MenuItemClick().

//Gra__Cofnij_MenuItemClick().
procedure TMahjong_3D_Form.Gra__Cofnij_MenuItemClick( Sender: TObject );

  //Funkcja Odznacz_Kostki() w Gra__Cofnij_MenuItemClick().
  procedure Odznacz_Kostki( var kostka_f : TKostka );
  begin

    if kostka_f <> nil then
      begin

        kostka_f.Klikni�cie_Oznacz( false );
        kostka_f := nil;

      end;
    //---//if kostka_f <> nil then

  end;//---//Funkcja Odznacz_Kostki() w Gra__Cofnij_MenuItemClick().

var
  x_1,
  y_1,
  z_1,
  x_2,
  y_2,
  z_2
    : integer;
begin//Gra__Cofnij_MenuItemClick().

  if Gra__Demo_MenuItem.Checked then
    Exit;


  if Length( cofnij_t_r ) > 0 then
    begin

      x_1 := cofnij_t_r[ Length( cofnij_t_r ) - 1 ].x_1;
      y_1 := cofnij_t_r[ Length( cofnij_t_r ) - 1 ].y_1;
      z_1 := cofnij_t_r[ Length( cofnij_t_r ) - 1 ].z_1;

      x_2:= cofnij_t_r[ Length( cofnij_t_r ) - 1 ].x_2;
      y_2:= cofnij_t_r[ Length( cofnij_t_r ) - 1 ].y_2;
      z_2:= cofnij_t_r[ Length( cofnij_t_r ) - 1 ].z_2;



      if    ( uk�ad_kostek_t[ x_1 ][ y_1 ][ z_1 ] = '0' )
        and ( kostki_t[ x_1 ][ y_1 ][ z_1 ] = nil )
        and ( uk�ad_kostek_t[ x_2 ][ y_2 ][ z_2 ] = '0' )
        and ( kostki_t[ x_2 ][ y_2 ][ z_2 ] = nil ) then
        begin

          Odznacz_Kostki( kostka_klikni�ta );
          Odznacz_Kostki( kostka_podpowied�_1 );
          Odznacz_Kostki( kostka_podpowied�_2 );
          Odznacz_Kostki( kostka_demo );


          inc( cofni�cia_ilo�� );

          uk�ad_kostek_t[ x_1 ][ y_1 ][ z_1 ] := cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_1;
          uk�ad_kostek_t[ x_2 ][ y_2 ][ z_2 ] := cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_2;

          Utw�rz_Kostk�( kostki_t[ x_1 ][ y_1 ][ z_1 ], cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_1 );
          Utw�rz_Kostk�( kostki_t[ x_2 ][ y_2 ][ z_2 ], cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_2 );


          kostki_t[ x_1 ][ y_1 ][ z_1 ].x := x_1;
          kostki_t[ x_1 ][ y_1 ][ z_1 ].y := y_1;
          kostki_t[ x_1 ][ y_1 ][ z_1 ].z := z_1;

          kostki_t[ x_2 ][ y_2 ][ z_2 ].x := x_2;
          kostki_t[ x_2 ][ y_2 ][ z_2 ].y := y_2;
          kostki_t[ x_2 ][ y_2 ][ z_2 ].z := z_2;


          kostki_t[ x_1 ][ y_1 ][ z_1 ].symbol := cofnij_t_r[ Length( cofnij_t_r ) - 1 ].symbol;
          kostki_t[ x_2 ][ y_2 ][ z_2 ].symbol := cofnij_t_r[ Length( cofnij_t_r ) - 1 ].symbol;

          //kostki_t[ x_1 ][ y_1 ][ z_1 ].psymbol := cofnij_t_r[ Length( cofnij_t_r ) - 1 ].symbol;
          //kostki_t[ x_2 ][ y_2 ][ z_2 ].symbol := cofnij_t_r[ Length( cofnij_t_r ) - 1 ].symbol;

          SetLength(  cofnij_t_r, Length( cofnij_t_r ) - 1  );

          //kostki_t[ x_1 ][ y_1 ][ z_1 ].Wczytaj_Obrazek( obrazki_kostek_nazwa_katalogu, tabela_rgb );
          //kostki_t[ x_2 ][ y_2 ][ z_2 ].Wczytaj_Obrazek( obrazki_kostek_nazwa_katalogu, tabela_rgb );

          StatusBar1.Panels[ 1 ].Text := IntToStr( Kostek_Na_Planszy() );

          par_do_zdj�cia_ilo�� := Par_Do_Zdj�cia();

          //Kostki_SpinEditChange( nil );
          Wczytaj_Obrazki_Kostek( obrazki_kostek_nazwa_katalogu, true );
          Kostki_SpinEditChange( nil );

        end;
      //---//if    ( uk�ad_kostek_t[ cofnij_t_r[ Length( cofnij_t_r ) - 1 ].x_1 ][ cofnij_t_r[ Length( cofnij_t_r ) - 1 ].y_1 ][ cofnij_t_r[ Length( cofnij_t_r ) - 1 ].z_1 ] = '0' ) (...)

    end;
  //---//if Length( cofnij_t_r ) > 0 then

end;//---//Gra__Cofnij_MenuItemClick().

//Gra__Nowa_Gra_MenuItemClick().
procedure TMahjong_3D_Form.Gra__Nowa_Gra_MenuItemClick( Sender: TObject );
var
  zti : integer;
begin

  if Gra__Demo_MenuItem.Checked then
    Gra__Demo_MenuItem.Checked := false;


  zti := Kostek_Na_Planszy();

  if   ( zti <= 1 )
    or (
         ( zti > 1 )
         //and (  Application.MessageBox( 'Rozpocz�� gr� od nowa?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES  )
         and (   Application.MessageBox(  PChar( t__rozpocz��_gr�_od_nowa ), PChar( t__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) = IDYES   )
       ) then
    begin

      if Trim( wczytany_uk�ad_kostek_nazwa_pliku ) <> '' then
        Wczytaj_Uk�ad_Kostek( wczytany_uk�ad_kostek_nazwa_pliku )
      else//if Trim( wczytany_uk�ad_kostek_nazwa_pliku ) <> '' then
        if    ( Uklady_Kostek_MenuItem.Count > 1 )
          and ( Uklady_Kostek_MenuItem.Items[ 0 ].Name <> 'Uk�ady_Kostek__Od�wie�_List�_MenuItem' ) then
          Wczytaj_Uk�ad_Kostek( Uklady_Kostek_MenuItem.Items[ 0 ].Hint )
        else//if    ( Uklady_Kostek_MenuItem.Count > 0 ) (...)
          begin

            //Application.MessageBox( 'Brak zdefiniowanych uk�ad�w kostek.', 'B��d', MB_ICONEXCLAMATION + MB_OK );
            Application.MessageBox(  PChar( t__brak_zdefiniowanych_uk�ad�w_kostek ), PChar( t__b��d ), MB_ICONEXCLAMATION + MB_OK  );
            Exit;

          end;
        //---//if    ( Uklady_Kostek_MenuItem.Count > 1 ) (...)

    end;
  //---//if   ( zti <= 1 ) (...)

end;//---//Gra__Nowa_Gra_MenuItemClick().

//Gra__Podpowiedz_MenuItemClick().
procedure TMahjong_3D_Form.Gra__Podpowiedz_MenuItemClick( Sender: TObject );

  //Funckja Czy_Kostka_By�a_Podpowiadana() w Gra__Podpowiedz_MenuItemClick().
  function Czy_Kostka_By�a_Podpowiadana( const x, y, z : integer ) : boolean;
  var
    i : integer;
  begin

    Result := false;

    for i := 0 to Length( podpowied�_poprzednia_t_r ) - 1 do
      if   (
                 ( podpowied�_poprzednia_t_r[ i ].x_1 = x )
             and ( podpowied�_poprzednia_t_r[ i ].y_1 = y )
             and ( podpowied�_poprzednia_t_r[ i ].z_1 = z )
           )
        or (
                 ( podpowied�_poprzednia_t_r[ i ].x_2 = x )
             and ( podpowied�_poprzednia_t_r[ i ].y_2 = y )
             and ( podpowied�_poprzednia_t_r[ i ].z_2 = z )
           ) then
        begin

          Result := true;
          Exit;

        end;
      //---//if   ( (...)

  end;//---//Funckja Czy_Kostka_By�a_Podpowiadana() w Gra__Podpowiedz_MenuItemClick().

var
  x_1,
  y_1,
  z_1,
  x_2,
  y_2,
  z_2,
  zti
    : integer;
label
  podpowied�_pon�w_l;
begin//Gra__Podpowiedz_MenuItemClick().

  Screen.Cursor := crHourGlass;

  inc( podpowiedzi_ilo�� );

  zti := 0;

  podpowied�_pon�w_l:


  if Gra__Demo_MenuItem.Checked then
    SetLength( podpowied�_poprzednia_t_r, 0 );


  for x_1 := 0 to Length( kostki_t ) - 1 do
    for y_1 := 0 to Length( kostki_t[ 0 ] ) - 1 do
      for z_1 := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
        if    ( kostki_t[ x_1 ][ y_1 ][ z_1 ] <> nil )
          //and ( x_1 > podpowied�_poprzednia__x_1 )
          and ( not Czy_Kostka_By�a_Podpowiadana( x_1, y_1, z_1 )  )
          and (  Czy_Kostk�_Mo�na_Zdj��( kostki_t[ x_1 ][ y_1 ][ z_1 ] )  ) then
          begin

            for x_2 := 0 to Length( kostki_t ) - 1 do
              for y_2 := 0 to Length( kostki_t[ 0 ] ) - 1 do
                for z_2 := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
                  if    ( kostki_t[ x_2 ][ y_2 ][ z_2 ] <> nil )
                    and ( kostki_t[ x_1 ][ y_1 ][ z_1 ] <> kostki_t[ x_2 ][ y_2 ][ z_2 ] )
                    //and ( kostki_t[ x_1 ][ y_1 ][ z_1 ].symbol = kostki_t[ x_2 ][ y_2 ][ z_2 ].symbol )
                    //and ( x_2 <> podpowied�_poprzednia__x_1 )
                    and (  Czy_Kostki_Pasuj�_Do_Siebie( kostki_t[ x_1 ][ y_1 ][ z_1 ], kostki_t[ x_2 ][ y_2 ][ z_2 ] )  )
                    and (  Czy_Kostk�_Mo�na_Zdj��( kostki_t[ x_2 ][ y_2 ][ z_2 ] )  ) then
                    begin

                      //kostki_t[ x_1 ][ y_1 ][ z_1 ].Caption := 'A';
                      //kostki_t[ x_2 ][ y_2 ][ z_2 ].Caption := 'B';

                      if    ( kostka_podpowied�_1 <> nil )
                        and ( kostka_podpowied�_1 <> kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                        and ( kostka_podpowied�_1 <> kostki_t[ x_2 ][ y_2 ][ z_2 ] ) then
                        kostka_podpowied�_1.Klikni�cie_Oznacz( false );


                      if    ( kostka_podpowied�_2 <> nil )
                        and ( kostka_podpowied�_2 <> kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                        and ( kostka_podpowied�_2 <> kostki_t[ x_2 ][ y_2 ][ z_2 ] ) then
                        kostka_podpowied�_2.Klikni�cie_Oznacz( false );


                      if    ( kostka_klikni�ta <> nil )
                        and ( kostka_klikni�ta <> kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                        and ( kostka_klikni�ta <> kostki_t[ x_2 ][ y_2 ][ z_2 ] ) then
                        kostka_klikni�ta.Klikni�cie_Oznacz( false );


                      if    ( kostka_demo <> nil )
                        and ( kostka_demo <> kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                        and ( kostka_demo <> kostki_t[ x_2 ][ y_2 ][ z_2 ] ) then
                        kostka_demo.Klikni�cie_Oznacz( false );

                      kostka_klikni�ta := nil;
                      kostka_demo := nil;



                      if    ( kostka_podpowied�_2 <> nil )
                        and ( kostka_podpowied�_2 <> kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                        and ( kostka_podpowied�_2 <> kostki_t[ x_2 ][ y_2 ][ z_2 ] ) then
                        kostka_podpowied�_2.Klikni�cie_Oznacz( false );


                      if    ( kostka_podpowied�_1 <> nil )
                        and ( kostka_podpowied�_2 <> nil )
                        and (
                                 ( kostka_podpowied�_1 = kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                              or ( kostka_podpowied�_2 = kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                            )
                        and (
                                 ( kostka_podpowied�_1 = kostki_t[ x_2 ][ y_2 ][ z_2 ] )
                              or ( kostka_podpowied�_2 = kostki_t[ x_2 ][ y_2 ][ z_2 ] )
                            ) then
                          begin

                            // Wygasza pod�wietlenie poprzednio podpowiedzianych kostek.

                            kostka_podpowied�_1.Klikni�cie_Oznacz( false );
                            kostka_podpowied�_2.Klikni�cie_Oznacz( false );

                            kostka_podpowied�_1 := nil;
                            kostka_podpowied�_2 := nil;

                            Screen.Cursor := crDefault;

                            Exit;

                          end;
                        //---//if    ( kostka_podpowied�_1 <> nil ) (...)



                      //kostki_t[ x_1 ][ y_1 ][ z_1 ].Klikni�cie_Oznacz( true );
                      //kostki_t[ x_2 ][ y_2 ][ z_2 ].Klikni�cie_Oznacz( true );
                      kostka_podpowied�_1 := kostki_t[ x_1 ][ y_1 ][ z_1 ];
                      kostka_podpowied�_2 := kostki_t[ x_2 ][ y_2 ][ z_2 ];

                      kostka_podpowied�_1.Klikni�cie_Oznacz( true );
                      kostka_podpowied�_2.Klikni�cie_Oznacz( true );


                      if not Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked then
                        begin

                          SetLength( podpowied�_poprzednia_t_r, Length( podpowied�_poprzednia_t_r ) + 1  );
                          podpowied�_poprzednia_t_r[ Length( podpowied�_poprzednia_t_r ) - 1 ].x_1 := x_1;
                          podpowied�_poprzednia_t_r[ Length( podpowied�_poprzednia_t_r ) - 1 ].y_1 := y_1;
                          podpowied�_poprzednia_t_r[ Length( podpowied�_poprzednia_t_r ) - 1 ].z_1 := z_1;
                          podpowied�_poprzednia_t_r[ Length( podpowied�_poprzednia_t_r ) - 1 ].x_2 := x_2;
                          podpowied�_poprzednia_t_r[ Length( podpowied�_poprzednia_t_r ) - 1 ].y_2 := y_2;
                          podpowied�_poprzednia_t_r[ Length( podpowied�_poprzednia_t_r ) - 1 ].z_2 := z_2;

                        end;
                      //---//if not Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked then


                      if Gra__Demo_MenuItem.Checked then
                        begin

                          Application.ProcessMessages();

                          kostka_klikni�ta := kostka_podpowied�_1;
                          kostka_demo := kostka_podpowied�_2;

                          //kostka_podpowied�_1 := nil;
                          //kostka_podpowied�_2 := nil;


                          //kostka_klikni�ta := kostki_t[ x_1 ][ y_1 ][ z_1 ];
                          //kostka_demo := kostki_t[ x_2 ][ y_2 ][ z_2 ];
                          //kostki_t[ x_2 ][ y_2 ][ z_2 ].Click();

                        end;
                      //---//if Gra__Demo_MenuItem.Checked then

                      Screen.Cursor := crDefault;

                      Exit;

                    end;
                  //---//if    ( kostki_t[ x_2 ][ y_2 ][ z_2 ] <> nil ) (...)

          end;
        //---//if    ( kostki_t[ x_1 ][ y_1 ][ z_1 ] <> nil ) (...)


  if Gra__Demo_MenuItem.Checked then
    begin

      inc( zti );

      if zti <= 20 then
        begin

          Gra__Przetasuj_MenuItemClick( Sender );

          goto podpowied�_pon�w_l;

        end;
      //---//if zti <= 20 then


      Gra__Demo_MenuItem.Checked := false;

    end
  else//if Gra__Demo_MenuItem.Checked then
    if Length( podpowied�_poprzednia_t_r ) > 0 then
      begin

        SetLength( podpowied�_poprzednia_t_r, 0 );


        if kostka_podpowied�_1 <> nil then
          kostka_podpowied�_1.Klikni�cie_Oznacz( false );

        if kostka_podpowied�_2 <> nil then
          kostka_podpowied�_2.Klikni�cie_Oznacz( false );

        kostka_podpowied�_1 := nil;
        kostka_podpowied�_2 := nil;


        goto podpowied�_pon�w_l;

      end;
    //---//if Length( podpowied�_poprzednia_t_r ) > 0 then


  Screen.Cursor := crDefault;

  //Application.MessageBox( 'Nie odnaleziono kostek do �ci�gni�cia.', 'Komunikat', MB_ICONINFORMATION + MB_OK );
  Application.MessageBox(  PChar( t__nie_odnaleziono_kostek_do_�ci�gni�cia ), PChar( t__komunikat ), MB_ICONINFORMATION + MB_OK  );

end;//---//Gra__Podpowiedz_MenuItemClick().

//Gra__Przetasuj_MenuItemClick().
procedure TMahjong_3D_Form.Gra__Przetasuj_MenuItemClick( Sender: TObject );
var
  x,
  y,
  z,
  i,
  zti
    : integer;
  zts_t : array of string;
begin

  Screen.Cursor := crHourGlass;

  inc( przetasowania_ilo�� );

  Randomize();

  SetLength( zts_t, 0 );
  //SetLength( cofnij_t_r, 0 ); //???
  //Gra__Cofnij_MenuItem.Enabled := false; //???

  for x := 0 to Length( kostki_t ) - 1 do
    for y := 0 to Length( kostki_t[ 0 ] ) - 1 do
      for z := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
        if kostki_t[ x ][ y ][ z ] <> nil then
          begin

            SetLength(  zts_t, Length( zts_t ) + 1  );
            zts_t[ Length( zts_t ) - 1 ] := kostki_t[ x ][ y ][ z ].symbol;

          end;
        //---//if kostki_t[ x ][ y ][ z ] <> nil then


  for x := 0 to Length( kostki_t ) - 1 do
    for y := 0 to Length( kostki_t[ 0 ] ) - 1 do
      for z := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
        if kostki_t[ x ][ y ][ z ] <> nil then
          begin

            zti := Random(  Length( zts_t )  );
            kostki_t[ x ][ y ][ z ].symbol := zts_t[ zti ];

            for i := zti to Length( zts_t ) - 2 do
              zts_t[ i ] := zts_t[ i + 1 ];

            if Length( zts_t ) >= 1 then
              SetLength(  zts_t, Length( zts_t ) - 1  );

          end;
        //---//if kostki_t[ x ][ y ][ z ] <> nil then


  Screen.Cursor := crDefault;

  Wczytaj_Obrazki_Kostek( obrazki_kostek_nazwa_katalogu, true );

  par_do_zdj�cia_ilo�� := Par_Do_Zdj�cia();


  if    ( Kostek_Na_Planszy() > 2 )
    and ( par_do_zdj�cia_ilo�� <= 0 )
    and ( Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked )
    and ( not Gra__Demo_MenuItem.Checked ) then
    //if Application.MessageBox( 'Nie odnaleziono kostek do �ci�gni�cia.' + #13 + 'Czy przetasowa�?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO ) = IDYES then
    if Application.MessageBox(  PChar( t__nie_odnaleziono_kostek_do_�ci�gni�cia_czy_przetasowa� ), PChar( t__potwierdzenie ), MB_ICONQUESTION + MB_YESNO  ) = IDYES then
       Gra__Przetasuj_MenuItemClick( nil );

end;//---//Gra__Przetasuj_MenuItemClick().

//Gra__Wyczysc_Plansze_MenuItemClick().
procedure TMahjong_3D_Form.Gra__Wyczysc_Plansze_MenuItemClick( Sender: TObject );
begin

  if Gra__Demo_MenuItem.Checked then
    Gra__Demo_MenuItem.Checked := false;

  gra_czas_start := 0;
  gra_czas_koniec := 0;

  przetasowania_ilo�� := 0;
  podpowiedzi_ilo�� := 0;
  cofni�cia_ilo�� := 0;


  //if Application.MessageBox( 'Wyczy�ci� plansz�?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES then
  if Application.MessageBox(  PChar( t__wyczy�ci�_plansz� ), PChar( t__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) = IDYES then
    Wczytaj_Uk�ad_Kostek( '', true );


  StatusBar1.Panels[ 1 ].Text := IntToStr(  Kostek_Na_Planszy()  );

  par_do_zdj�cia_ilo�� := Par_Do_Zdj�cia();

end;//---//Gra__Wyczysc_Plansze_MenuItemClick().

//Gra__Wyjdz_MenuItemClick().
procedure TMahjong_3D_Form.Gra__Wyjdz_MenuItemClick( Sender: TObject );
begin

  if Gra__Demo_MenuItem.Checked then
    Gra__Demo_MenuItem.Checked := false;


  //if Application.MessageBox( 'Zako�czy� dzia�anie programu?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES then
  if Application.MessageBox(  PChar( t__zako�czy�_dzia�anie_programu ), PChar( t__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) = IDYES then
    Close();

end;//---//Gra__Wyjdz_MenuItemClick().

//Gra__Zaprezentuj_Kostki_MenuItemClick().
procedure TMahjong_3D_Form.Gra__Zaprezentuj_Kostki_MenuItemClick( Sender: TObject );
begin

  if Gra__Demo_MenuItem.Checked then
    Gra__Demo_MenuItem.Checked := false;


  //if Application.MessageBox( 'Zaprezentowa� kostki?' + #13 + 'Zako�czy to trwaj�c� gr�.', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES then
  if Application.MessageBox(  PChar( t__zaprezentowa�_kostki ), PChar( t__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) = IDYES then
    begin

      gra_czas_start := 0;

      przetasowania_ilo�� := 0;
      podpowiedzi_ilo�� := 0;
      cofni�cia_ilo�� := 0;

      Wczytaj_Uk�ad_Kostek( '*:?:*<>"\|/' ); // Zaprezentuj kostki.

    end;
  //---//if Application.MessageBox(  PChar( t__zaprezentowa�_kostki ), PChar( t__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) = IDYES then

end;//---//Gra__Zaprezentuj_Kostki_MenuItemClick().

//Opcje_MenuItemClick().
procedure TMahjong_3D_Form.Opcje_MenuItemClick( Sender: TObject );
begin

  if    ( Opcje_Panel.Visible )
    and ( Opcje_Panel.Width > 1) then
    begin

      if Sender <> nil then
        begin

          if    ( TComponent(Sender).Name = Opcje_MenuItem.Name )
            and ( PageControl1.ActivePage <> Opcje_TabSheet ) then
            begin

              PageControl1.ActivePage := Opcje_TabSheet;
              Opcje_ScrollBox.SetFocus();
              Exit;

            end;
          //---//if    ( TComponent(Sender).Name = Opcje_MenuItem.Name ) (...)


          if    ( TComponent(Sender).Name = Pomoc_MenuItem.Name )
            and ( PageControl1.ActivePage <> Pomoc_TabSheet ) then
            begin

              PageControl1.ActivePage := Pomoc_TabSheet;
              Exit;

            end;
          //---//if    ( TComponent(Sender).Name = Pomoc_MenuItem.Name )) (...)

        end;
      //---//if Sender <> nil then

    end;
  //---//if    ( Opcje_Panel.Visible ) (...)


  if   ( not Opcje_Panel.Visible )
    or ( Opcje_Panel.Width <= 1) then
    begin

      if Opcje_Panel.Width <= 1 then
        Opcje_Panel.Width := 250;

      Opcje_Panel.Visible := true;
      Opcje_Splitter.Visible := true;

      if Opcje_Splitter.Left > Opcje_Panel.Left then
        begin

          Opcje_Splitter.Align := alLeft;
          Application.ProcessMessages();
          Opcje_Splitter.Align := alRight;

        end;
      //---//if Opcje_Splitter.Left > Opcje_Panel.Left then

      if    ( Sender <> nil )
        and ( TComponent(Sender).Name = Pomoc_MenuItem.Name ) then
        PageControl1.ActivePage := Pomoc_TabSheet
      else//if    ( Sender <> nil ) (...)
        begin

          PageControl1.ActivePage := Opcje_TabSheet;
          Opcje_ScrollBox.SetFocus();

        end;
      //---//if    ( Sender <> nil ) (...)


    end
  else//if   ( not Opcje_Panel.Visible ) (...)
    begin

      Opcje_Splitter.Visible := false;
      Opcje_Panel.Visible := false;

    end;
  //---//if   ( not Opcje_Panel.Visible ) (...)

end;//---//Opcje_MenuItemClick().

//Opcje_Ukryj_ButtonClick().
procedure TMahjong_3D_Form.Opcje_Ukryj_ButtonClick( Sender: TObject );
begin

  Opcje_Splitter.Visible := false;
  Opcje_Panel.Visible := false;

end;//---//Opcje_Ukryj_ButtonClick().

//Kostki_SpinEditChange().
procedure TMahjong_3D_Form.Kostki_SpinEditChange( Sender: TObject );
var
  x,
  y,
  z
    : integer;
  ztf : real;
begin

  if blokuj_rysowanie_kostek then
    Exit;

  Screen.Cursor := crHourGlass;


  if Szybkosc_Kamery_SpinEdit.Value > Szybkosc_Kamery_SpinEdit.MaxValue then
    Szybkosc_Kamery_SpinEdit.Value := Szybkosc_Kamery_SpinEdit.MaxValue
  else//if Szybkosc_Kamery_SpinEdit.Value > Szybkosc_Kamery_SpinEdit.MaxValue then
    if Szybkosc_Kamery_SpinEdit.Value < Szybkosc_Kamery_SpinEdit.MinValue then
      Szybkosc_Kamery_SpinEdit.Value := Szybkosc_Kamery_SpinEdit.MinValue;


  if not Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Checked then
    begin

      GLCamera1.TargetObject := nil;

    end
  else//if not Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Checked then
    begin

      GLCamera1.TargetObject := Kamera_Na_GLDummyCube;

    end;
  //---//if not Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Checked then


  for x := 0 to Length( kostki_t ) - 1 do
    for y := 0 to Length( kostki_t[ 0 ] ) - 1 do
      for z := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
        if kostki_t[ x ][ y ][ z ] <> nil then
          begin

            kostki_t[ x ][ y ][ z ].szeroko�� := Szerokosc_Kostek_SpinEdit.Value / dzielnik_skalowania;
            kostki_t[ x ][ y ][ z ].wysoko�� := Wysokosc_Kostek_SpinEdit.Value / dzielnik_skalowania;
            kostki_t[ x ][ y ][ z ].grubo�� := Grubosc_Kostek_SpinEdit.Value / ( dzielnik_skalowania * 10 );


            ztf := 0;

            if kostki_t[ x ][ y ][ z ].korekta_x <> 0 then
              ztf := ( kostki_t[ x ][ y ][ z ].szeroko�� / 2 ) * kostki_t[ x ][ y ][ z ].korekta_x;

            kostki_t[ x ][ y ][ z ].lewo := x * kostki_t[ x ][ y ][ z ].szeroko�� + Margines_Planszy_SpinEdit.Value / dzielnik_skalowania + ztf;


            ztf := 0;

            if kostki_t[ x ][ y ][ z ].korekta_y <> 0 then
              ztf := ( kostki_t[ x ][ y ][ z ].wysoko�� / 2 ) * kostki_t[ x ][ y ][ z ].korekta_y;

            kostki_t[ x ][ y ][ z ].g�ra := y * kostki_t[ x ][ y ][ z ].wysoko�� + Margines_Planszy_SpinEdit.Value / dzielnik_skalowania + ztf;


            kostki_t[ x ][ y ][ z ].Przerysuj_Kostk�();

          end;
        //---//if kostki_t[ x ][ y ][ z ] <> nil then

  Screen.Cursor := crDefault;

end;//---//Kostki_SpinEditChange().

//Szybkosc_Zegara_SpinEditChange().
procedure TMahjong_3D_Form.Szybkosc_Zegara_SpinEditChange( Sender: TObject );
begin

  Timer1.Interval := Szybkosc_Zegara_SpinEdit.Value;

end;//---//Szybkosc_Zegara_SpinEditChange().

//Wartosci_Domyslne_ButtonClick().
procedure TMahjong_3D_Form.Wartosci_Domyslne_ButtonClick( Sender: TObject );
var
  zts : string;
begin

  blokuj_rysowanie_kostek := true;

  Wyswietlanie_Czasu_RadioGroup.ItemIndex := 0;
  Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked := false;

  Margines_Planszy_SpinEdit.Value := 0;
  Szerokosc_Kostek_SpinEdit.Value := 5;
  Wysokosc_Kostek_SpinEdit.Value := 7;
  Grubosc_Kostek_SpinEdit.Value := 20;

  Szybkosc_Zegara_SpinEdit.Value := 1000;

  Szybkosc_Kamery_SpinEdit.Value := 10;

  Kamera_Na_Srodek_Ukladu_Kostek_CheckBox.Checked := true;
  Automatyczne_Wczytywanie_Ukladu_Kostek_CheckBox.Checked := false;
  //Wczytuj_Konfiguracje_Kostek_CheckBox.Checked := true;
  Kostki_Kwiatkow_CheckBox.Checked := true;
  Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked := false;
  Pelny_Ekran_CheckBox.Checked := false;
  Przyblizenie_CheckBox.Checked := false;
  Obrazek_Tla_Planszy__Przod_RadioButton.Checked := true;
  Obrazek_Tla_Planszy__Sciezki_Wzgledne_CheckBox.Checked := false;
  Obrazek_Tla_Planszy__Wyswietl_CheckBox.Checked := true;


  //if Wczytuj_Konfiguracje_Kostek_CheckBox.Checked then
  //  begin
  //
  //    if obrazki_kostek_nazwa_katalogu <> '' then
  //      zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\' + obrazki_kostek_nazwa_katalogu + '\' + obrazki_kostek_nazwa_katalogu + '.ini'
  //    else//if nazwa_katalogu <> '' then
  //      zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\Domy�lne\Domy�lne.ini';
  //
  //
  //    Wczytaj_Ini_Obrazk�w_Kostek( zts );
  //
  //  end
  //else
  //  begin
  //
  //    kamera_�rodek_x := 0;
  //    kamera_�rodek_y := 0;
  //    kamera_�rodek_z := 0;
  //
  //    kamera_na_�rodek_x := 0;
  //    kamera_na_�rodek_y := 0;
  //
  //    Kamera_Ustawienie_Pocz�tkowe();
  //
  //  end;
  ////---//if Wczytuj_Konfiguracje_Kostek_CheckBox.Checked then
  Kamera_Ustawienie_Pocz�tkowe( true );


  Wczytuj_Konfiguracje_Kostek_CheckBox.Checked := true;

  blokuj_rysowanie_kostek := false;

  Kostki_SpinEditChange( nil );

end;//---//Wartosci_Domyslne_ButtonClick().

//Wczytaj_Ustawienia_ButtonClick().
procedure TMahjong_3D_Form.Wczytaj_Ustawienia_ButtonClick( Sender: TObject );
begin

  Wczytaj_Ustawienia();

  Kostki_SpinEditChange( nil );

  Kamera_Ustawienie_Pocz�tkowe( true );

end;//---//Wczytaj_Ustawienia_ButtonClick().

//Uklad_Kostek_Nazwa_Wyczysc_ButtonClick().
procedure TMahjong_3D_Form.Uklad_Kostek_Nazwa_Wyczysc_ButtonClick( Sender: TObject );
begin

  wczytany_uk�ad_kostek_nazwa_pliku := '';
  //Uklad_Kostek_Nazwa_Label.Caption := 'Nazwa uk�adu kostek: <brak>.';
  Uklad_Kostek_Nazwa_Label.Caption := t__uk�ad_kostek_nazwa + t__uk�ad_kostek_nazwa__brak + '.';

end;//---//Uklad_Kostek_Nazwa_Wyczysc_ButtonClick().

//Pelny_Ekran_CheckBoxClick().
procedure TMahjong_3D_Form.Pelny_Ekran_CheckBoxClick( Sender: TObject );
begin

  if Pelny_Ekran_CheckBox.Checked then
    begin

      Mahjong_3D_Form.BorderStyle := bsNone;
      Mahjong_3D_Form.WindowState := wsMaximized;
      Mahjong_3D_Form.Left := 0;
      Mahjong_3D_Form.Top := 0;
      Mahjong_3D_Form.Height := Screen.Height;
      Mahjong_3D_Form.Width := Screen.Width;

      Mahjong_3D_Form.BringToFront();

    end
  else//if Pelny_Ekran_CheckBox.Checked then
    begin

      //Mahjong_3D_Form.WindowState := wsNormal;
      Mahjong_3D_Form.BorderStyle := bsSizeable;

    end
  //---//if Pelny_Ekran_CheckBox.Checked then

end;//---//Pelny_Ekran_CheckBoxClick().

//Przyblizenie_CheckBoxClick().
procedure TMahjong_3D_Form.Przyblizenie_CheckBoxClick( Sender: TObject );
begin

  Przyblizenie_Panel.Visible := Przyblizenie_CheckBox.Checked;

  Przyblizenie_Splitter.Visible := Przyblizenie_Panel.Visible;


  if Przyblizenie_Panel.Visible then
    begin

      if Przyblizenie_Panel.Width < 1 then
        Przyblizenie_Panel.Width := 75;


      if Przyblizenie_Splitter.Left < Przyblizenie_Panel.Left then
        begin

          Przyblizenie_Splitter.Align := alRight;
          Application.ProcessMessages();
          Przyblizenie_Splitter.Align := alLeft;

        end;
      //---//if Przyblizenie_Panel.Left < Przyblizenie_Panel.Left then

    end;
  //---//if Przyblizenie_Panel.Visible then

end;//---//Przyblizenie_CheckBoxClick().

//Tlumaczenia_Zastosuj_ButtonClick().
procedure TMahjong_3D_Form.Tlumaczenia_Zastosuj_ButtonClick( Sender: TObject );
begin

  if    ( Tlumaczenia_ListBox.ItemIndex >= 0 )
    and ( Tlumaczenia_ListBox.ItemIndex <= Tlumaczenia_ListBox.Items.Count - 1 ) then
    begin

      Tlumaczenia_Domyslne_ButtonClick( Sender ); // Je�eli w t�umaczeniu czego� zabraknie to zostanie warto�� domy�lna.
      Wczytaj_T�umaczenie( Tlumaczenia_ListBox.Items[ Tlumaczenia_ListBox.ItemIndex ] );

    end;
  //---//if    ( Tlumaczenia_ListBox.ItemIndex >= 0 ) (...)

end;//---//Tlumaczenia_Zastosuj_ButtonClick().

//Tlumaczenia_ListBoxDblClick().
procedure TMahjong_3D_Form.Tlumaczenia_ListBoxDblClick( Sender: TObject );
begin

  Tlumaczenia_Zastosuj_ButtonClick( Tlumaczenia_Zastosuj_Button );

end;//---//Tlumaczenia_ListBoxDblClick().

//Tlumaczenia_ListBoxKeyDown().
procedure TMahjong_3D_Form.Tlumaczenia_ListBoxKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
begin

  // Enter.
  if Key = 13 then
    begin

      Key := 0;
      Tlumaczenia_Zastosuj_ButtonClick( Tlumaczenia_Zastosuj_Button );

    end;
  //---//if Key = 13 then

end;//---//Tlumaczenia_ListBoxKeyDown().

//Obrazek_Tla_Planszy__Wybierz_ButtonClick().
procedure TMahjong_3D_Form.Obrazek_Tla_Planszy__Wybierz_ButtonClick( Sender: TObject );
begin

  //OpenDialog1.Filter := 'Obrazki|*.bmp; *.gif; *.jpg; *.jpeg; *.png; *.tif; *.tiff|Wszystkie pliki|*.*';
  OpenDialog1.Filter := t__obrazek_t�a_planszy_filtr;

  //OpenDialog1.InitialDir := '';

  if OpenDialog1.Execute() then
    begin

      if not Obrazek_Tla_Planszy__Sciezki_Wzgledne_CheckBox.Checked then
        Wczytaj_T�o_Planszy( OpenDialog1.FileName )
      else//if not Obrazek_Tla_Planszy__Sciezki_Wzgledne_CheckBox.Checked then
        Wczytaj_T�o_Planszy(  ExtractRelativePath( Application.ExeName, OpenDialog1.FileName )  );

      GLSceneViewer1.Refresh();

    end;
  //---//if OpenDialog1.Execute() then

end;//---//Obrazek_Tla_Planszy__Wybierz_ButtonClick().

//Obrazek_Tla_Planszy__Wyswietl_CheckBoxClick().
procedure TMahjong_3D_Form.Obrazek_Tla_Planszy__Wyswietl_CheckBoxClick( Sender: TObject );
begin

  Tlo_GLSkyBox.Visible := Obrazek_Tla_Planszy__Wyswietl_CheckBox.Checked;

end;//---//Obrazek_Tla_Planszy__Wyswietl_CheckBoxClick().

//Obrazek_Tla_Planszy__Brak_ButtonClick().
procedure TMahjong_3D_Form.Obrazek_Tla_Planszy__Brak_ButtonClick( Sender: TObject );
begin

  //if Application.MessageBox( 'Ustawi� pusty obrazek t�a planszy?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES then
  if Application.MessageBox(  PChar( t__ustawi�_pusty_obrazek_t�a_planszy ), PChar( t__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) <> IDYES then
    Exit;


  //if Obrazek_T�a_Planszy__Wszystkie_RadioButton.Checked then
  //  GLMaterialLibrary1.Materials.Clear()
  //else//if Obrazek_T�a_Planszy__Wszystkie_RadioButton.Checked then
  //  Wczytaj_T�o_Planszy( '' ); // '*:?:*<>"\|/'

  Wczytaj_T�o_Planszy( '' ); // Aby zapisa�o si� do pliku. '*:?:*<>"\|/'

  GLSceneViewer1.Refresh();

end;//---//Obrazek_Tla_Planszy__Brak_ButtonClick().

//Timer1Timer().
procedure TMahjong_3D_Form.Timer1Timer( Sender: TObject );
begin

  if Gra__Demo_MenuItem.Checked then
    begin

      if kostka_demo = nil then
        Gra__Podpowiedz_MenuItemClick( Sender )
      else//if kostka_demo = nil then
        begin

          KostkaClick( kostka_demo ); // Tutaj wyzeruje kostka_klikni�ta, kostka_podpowied�_1, kostka_podpowied�_2 = nil.
          kostka_demo := nil;

        end;
      //---//if kostka_demo = nil then

    end;
  //---//if Gra__Demo_MenuItem.Checked then


  case Wyswietlanie_Czasu_RadioGroup.ItemIndex of
      0 : // Brak.
        begin
          StatusBar1.Panels[ 2 ].Text := '';
        end;
      //---//0 :

      1 : // Czas gry.
        begin

          if gra_czas_start = 0 then
            StatusBar1.Panels[ 2 ].Text := '...'
          else//if gra_czas_start = 0 then
            if gra_czas_koniec = 0 then
              StatusBar1.Panels[ 2 ].Text := TimeToStr( Now() - gra_czas_start )
            else//if gra_czas_koniec = 0 then
              StatusBar1.Panels[ 2 ].Text := TimeToStr( gra_czas_koniec - gra_czas_start );

        end;
      //---//1 :

      2 : // Czas.
        begin
          StatusBar1.Panels[ 2 ].Text := DateTimeToStr( Now() );
        end;
      //---//2 :

      else//case przedial of
        StatusBar1.Panels[ 2 ].Text := '';

    end;
  //---//case Wyswietlanie_Czasu_RadioGroup.ItemIndex of


  StatusBar1.Panels[ 3 ].Text := t__przetasowania_ilo�� + Trim(  FormatFloat( '### ### ##0', przetasowania_ilo�� )  );
  StatusBar1.Panels[ 4 ].Text := t__podpowiedzi_ilo�� + Trim(  FormatFloat( '### ### ##0', podpowiedzi_ilo�� )  );

  StatusBar1.Panels[ 5 ].Text := t__cofni�cia_ilo�� + Trim(  FormatFloat( '### ### ##0', cofni�cia_ilo�� )  );

  if Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked then
    StatusBar1.Panels[ 6 ].Text := Trim(  t__par_do_zdj�cia + FormatFloat( '### ### ##0', par_do_zdj�cia_ilo�� )  )
  else//if Wyswietlanie_Ilosci_Par_Do_Zdjecia_CheckBox.Checked then
    StatusBar1.Panels[ 6 ].Text := '';

end;//---//Timer1Timer().

end.
