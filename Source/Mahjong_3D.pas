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


  // Wydanie 2.0.0.0 - aktualizacja GLScene z 1.6.0.7082 na 2.2 2023.

interface

uses
  GLS.Color,
  GLS.SpaceText,
  GLS.Texture,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin,

  GLS.Scene, GLS.Objects, GLS.Coordinates, GLS.SceneViewer, GLS.BaseClasses, GLS.SkyDome, GLS.Material;

type
  TTabela_RGB = array[ 1..3 ] of integer;

  TT³umaczenie_Komunikaty_r = record
    inne__obrazek_t³a_planszy__filtr,
    inne__uk³ad_kostek_nazwa,
    inne__uk³ad_kostek_nazwa__brak,

    komunikat__b³¹d,
    komunikat__brak_zdefiniowanych_obrazków_kostek,
    komunikat__brak_zdefiniowanych_uk³adów_kostek,
    komunikat__gratulacje,
    komunikat__komunikat,
    komunikat__koniec_gry,
    komunikat__nie_odnaleziono_katalogu_obrazków_kostek,
    komunikat__nie_odnaleziono_katalogu_t³umaczeñ,
    komunikat__nie_odnaleziono_katalogu_uk³adów_kostek,
    komunikat__nie_odnaleziono_kostek_do_œci¹gniêcia,
    komunikat__nie_odnaleziono_kostek_do_œci¹gniêcia__czy_przetasowaæ,
    komunikat__nie_odnaleziono_pliku_pomocy,
    komunikat__nie_odnaleziono_pliku_t³umaczenia,
    komunikat__nie_odnaleziono_pliku_uk³adu_kostek,
    komunikat__potwierdzenie,
    komunikat__rozpocz¹æ_grê_od_nowa,
    komunikat__ustawiæ_pusty_obrazek_t³a_planszy,
    komunikat__wyczyœciæ_planszê,
    komunikat__zakoñczyæ_dzia³anie_programu,
    komunikat__zapisaæ_ustawienia,
    komunikat__zaprezentowaæ_kostki,

    menu_pozycja__brak_obrazków_kostek,
    menu_pozycja__domyœlne_obrazki_kostek,
    menu_pozycja__odœwie¿_listê_obrazków_kostek,
    menu_pozycja__odœwie¿_listê_uk³adów_kostek,

    panel_napis__cofniêcia_iloœæ,
    panel_napis__par_do_zdjêcia,
    panel_napis__podpowiedzi_iloœæ,
    panel_napis__przetasowania_iloœæ
      : string;
  end;//---//TT³umaczenie_Komunikaty_r

  TKostka_Obrazek = class;

  TGLSpaceText_M = class;

  TKostka = class( TGLCube )
  private
    { Private declarations }
    szerokoœæ,
    wysokoœæ,
    gruboœæ,
    góra,
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
    //Szkie³ko,
    Obrazek
      : TKostka_Obrazek;
    Opis_Kostki : TGLSpaceText_M;
    procedure Przerysuj_Kostkê();
    procedure Wczytaj_Obrazek( const adres_katalogu : string );
    procedure Klikniêcie_Oznacz( const zaznaczona : boolean );
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

  TGLSpaceText_M = class( GLS.SpaceText.TGLSpaceText )
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
    Gra__PodpowiedŸ_MenuItem: TMenuItem;
    Gra__Przetasuj_MenuItem: TMenuItem;
    Gra__Wyczyœæ_Planszê_MenuItem: TMenuItem;
    Gra__WyjdŸ_MenuItem: TMenuItem;
    N1: TMenuItem;
    Gra__Zaprezentuj_Kostki_MenuItem: TMenuItem;
    Uk³ady_Kostek_MenuItem: TMenuItem;
    Obrazki_Kostek_MenuItem: TMenuItem;
    Opcje_MenuItem: TMenuItem;
    Pomoc_MenuItem: TMenuItem;
    Kamera_Ruch_Ci¹g³y_MenuItem: TMenuItem;
    Pe³ny_Ekran_MenuItem: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Opcje_Panel: TPanel;
    Opcje_Splitter: TSplitter;
    PageControl1: TPageControl;
    Opcje_TabSheet: TTabSheet;
    Pomoc_TabSheet: TTabSheet;
    O_Programie_TabSheet: TTabSheet;
    T³umaczenia_TabSheet: TTabSheet;
    Opcje_ScrollBox: TScrollBox;
    Zapisz_Ustawienia_Button: TButton;
    Opcje_Ukryj_Button: TButton;
    Opcje_Przyciskij_Panel: TPanel;
    Wyœwietlanie_Czasu_RadioGroup: TRadioGroup;
    Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox: TCheckBox;
    Margines_Planszy_Etykieta_Label: TLabel;
    Margines_Planszy_SpinEdit: TSpinEdit;
    Szerokoœæ_Kostek_Etykieta_Label: TLabel;
    Szerokoœæ_Kostek_SpinEdit: TSpinEdit;
    Wysokoœæ_Kostek_Etykieta_Label: TLabel;
    Wysokoœæ_Kostek_SpinEdit: TSpinEdit;
    Gruboœæ_Kostek_Etykieta_Label: TLabel;
    Gruboœæ_Kostek_SpinEdit: TSpinEdit;
    Szybkoœæ_Kamery_Etykieta_Label: TLabel;
    Szybkoœæ_Kamery_SpinEdit: TSpinEdit;
    Szybkoœæ_Zegara_Etykieta_Label: TLabel;
    Szybkoœæ_Zegara_SpinEdit: TSpinEdit;
    Wartoœci_Domyœlne_Button: TButton;
    Wczytaj_Ustawienia_Button: TButton;
    Uk³ad_Kostek_Nazwa_Label: TLabel;
    Uk³ad_Kostek_Nazwa_Wyczyœæ_Button: TButton;
    Kamera_Wspó³rzêdne_Etykieta_Label: TLabel;
    Kamera_Wspó³rzêdne_Label: TLabel;
    Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox: TCheckBox;
    Automatyczne_Wczytywanie_Uk³adu_Kostek_CheckBox: TCheckBox;
    Wczytuj_Konfiguracjê_Kostek_CheckBox: TCheckBox;
    Kostki_Kwiatków_CheckBox: TCheckBox;
    Podpowiadaj_Tylko_Jeden_Ruch_CheckBox: TCheckBox;
    Pe³ny_Ekran_CheckBox: TCheckBox;
    Przybli¿enie_CheckBox: TCheckBox;
    Obrazek_T³a_Planszy__Bok_Panel: TPanel;
    Obrazek_T³a_Planszy__Góra_RadioButton: TRadioButton;
    Obrazek_T³a_Planszy__Lewo_RadioButton: TRadioButton;
    Obrazek_T³a_Planszy__Przód_RadioButton: TRadioButton;
    Obrazek_T³a_Planszy__Prawo_RadioButton: TRadioButton;
    Obrazek_T³a_Planszy__Dó³_RadioButton: TRadioButton;
    Obrazek_T³a_Planszy__Ty³_RadioButton: TRadioButton;
    Obrazek_T³a_Planszy__Chmury_RadioButton: TRadioButton;
    Obrazek_T³a_Planszy__Wszystkie_RadioButton: TRadioButton;
    Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne_CheckBox: TCheckBox;
    Obrazek_T³a_Planszy__Wybierz_Button: TButton;
    Obrazek_T³a_Planszy__Wyœwietl_CheckBox: TCheckBox;
    Obrazek_T³a_Planszy__Brak_Button: TButton;
    T³umaczenia_Panel: TPanel;
    T³umaczenia_Odœwie¿_Button: TButton;
    T³umaczenia_Zastosuj_Button: TButton;
    T³umaczenia_Domyœlne_Button: TButton;
    T³umaczenia_ListBox: TListBox;
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
    Przybli¿enie_Panel: TPanel;
    Przybli¿enie_Splitter: TSplitter;
    T³o_GLSkyBox: TGLSkyBox;
    GLMaterialLibrary1: TGLMaterialLibrary;
    Logo_Image: TImage;
    procedure FormShow( Sender: TObject );
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure Zapisz_Ustawienia( Sender : TObject );
    procedure Wczytaj_Listê_T³umaczeñ( Sender : TObject );
    procedure Uk³ady_Kostek__Uk³ad_Kostek_MenuItemClick( Sender: TObject );
    procedure Obrazki_Kostek__Obrazek_Kostek_MenuItemClick( Sender: TObject );
    procedure KostkaClick( klikniêty_obiekt : TGLSceneObject );
    procedure PlanszaKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    procedure PerspektywaKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    procedure GLSceneViewer1Click( Sender: TObject );
    procedure GLSceneViewer1MouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure GLSceneViewer1MouseWheel( Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean );
    procedure GLSceneViewer1MouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure GLSceneViewer1Gesture( Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean );
    procedure Kamera_Ruch_Ci¹g³y_MenuItemClick( Sender: TObject );
    procedure Pe³ny_Ekran_MenuItemClick( Sender: TObject );
    procedure ScrollBoxMouseWheel( Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean );
    procedure Przybli¿enie_PanelMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure Przybli¿enie_PanelMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure Gra__Demo_MenuItemClick( Sender: TObject );
    procedure Gra__Cofnij_MenuItemClick( Sender: TObject );
    procedure Gra__Nowa_Gra_MenuItemClick( Sender: TObject );
    procedure Gra__PodpowiedŸ_MenuItemClick( Sender: TObject );
    procedure Gra__Przetasuj_MenuItemClick( Sender: TObject );
    procedure Gra__Wyczyœæ_Planszê_MenuItemClick( Sender: TObject );
    procedure Gra__WyjdŸ_MenuItemClick( Sender: TObject );
    procedure Gra__Zaprezentuj_Kostki_MenuItemClick( Sender: TObject );
    procedure Opcje_MenuItemClick( Sender: TObject );
    procedure Opcje_Ukryj_ButtonClick( Sender: TObject );
    procedure Kostki_SpinEditChange( Sender: TObject );
    procedure Szybkoœæ_Zegara_SpinEditChange( Sender: TObject );
    procedure Wartoœci_Domyœlne_ButtonClick( Sender: TObject );
    procedure Wczytaj_Ustawienia_ButtonClick( Sender: TObject );
    procedure Uk³ad_Kostek_Nazwa_Wyczyœæ_ButtonClick( Sender: TObject );
    procedure Pe³ny_Ekran_CheckBoxClick( Sender: TObject );
    procedure Przybli¿enie_CheckBoxClick( Sender: TObject );
    procedure T³umaczenia_Zastosuj_ButtonClick( Sender: TObject );
    procedure T³umaczenia_Domyœlne_ButtonClick( Sender: TObject );
    procedure T³umaczenia_ListBoxDblClick( Sender: TObject );
    procedure T³umaczenia_ListBoxKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    procedure Obrazek_T³a_Planszy__Wybierz_ButtonClick( Sender: TObject );
    procedure Obrazek_T³a_Planszy__Wyœwietl_CheckBoxClick( Sender: TObject );
    procedure Obrazek_T³a_Planszy__Brak_ButtonClick( Sender: TObject );
    procedure Timer1Timer( Sender: TObject );
  private
    { Private declarations }
    blokuj_rysowanie_kostek : boolean;

    uk³ad_x, // Wymiary tablicy uk³adu (iloœæ koœci w liniach uk³adu wynosi + 1).
    uk³ad_y,
    uk³ad_z,
    przetasowania_iloœæ,
    podpowiedzi_iloœæ,
    cofniêcia_iloœæ,
    par_do_zdjêcia_iloœæ,
    przybli¿enie_mysz_start_y
      : integer;

    kamera_œrodek_x, // Wspó³rzêdne pocz¹tkowe kamery.
    kamera_œrodek_y,
    kamera_œrodek_z,
    kamera_na_œrodek_x, // Wspó³rzêdne pocz¹tkowe punktu, na który spogl¹da kamera.
    kamera_na_œrodek_y,
    kamera_punkt_kopia_z
      : single;

    gra_czas_start,
    gra_czas_koniec
      : TDateTime;

    wczytany_uk³ad_kostek_nazwa_pliku,
    obrazki_kostek_nazwa_katalogu,
    kamera_ruch_ci¹g³y_treœæ
      : string;

    t³umaczenie_komunikaty_r : TT³umaczenie_Komunikaty_r;

    mysz_start_punkt,
    kamera_punkt_kopia
      : TPointFloat;
    kostka_klikniêta,
    kostka_podpowiedŸ_1,
    kostka_podpowiedŸ_2,
    kostka_demo
      : TKostka;

    cofnij_t_r,
    podpowiedŸ_poprzednia_t_r
      : array of TCofnij_R;

    uk³ad_kostek_t : array of array of array of Char; // w, k, z; x, y, z
    kostki_t : array of array of array of TKostka; // w, k, z; x, y, z

    procedure Wczytaj_Listê_Uk³adów_Kostek( Sender : TObject );
    procedure Wczytaj_Uk³ad_Kostek( const nazwa_pliku : string; const zwolnij : boolean = false );
    procedure Utwórz_Kostkê( var kostka_f : TKostka; pozycja : Char );
    function Czy_Kostkê_Mo¿na_Zdj¹æ( kostka_f : TKostka ) : boolean;
    function Czy_Kostki_Pasuj¹_Do_Siebie( kostka_1_f, kostka_2_f : TKostka ) : boolean;
    procedure Zdejmij_Kostki( kostka_f : TKostka );
    function Kostek_Na_Planszy() : integer;
    function Par_Do_Zdjêcia() : integer;
    procedure Wczytaj_Ustawienia();
    procedure Wczytaj_T³umaczenie( const nazwa_pliku : string );
    procedure Wczytaj_Listê_Obrazków_Kostek( Sender : TObject );
    procedure Wczytaj_Obrazki_Kostek( const nazwa_katalogu : string; pomiñ_ini : boolean = false );
    procedure Wczytaj_Ini_Obrazków_Kostek( const adres_pliku : string );
    procedure Wczytaj_Pomoc( const nazwa_pliku : string );
    procedure Tekstury_Zasobnik_Zmodyfikuj( nazwa_tekstury, adres_pliku : string );
    procedure Wczytaj_T³o_Planszy( const adres_pliku : string; nie_zapisuj : boolean = false );
    procedure Kamera_Ustawienie_Pocz¹tkowe( const wymuœ_wyliczenie : boolean = false );
    procedure Kamera_Wspó³rzêdne_Wypisz();

    procedure Color_To_RGB( const color : integer; out r, g, b : integer );
  public
    { Public declarations }
  end;

const
  dzielnik_skalowania = 1; // Nie 0; ?

var
  Mahjong_3D_Form: TMahjong_3D_Form;

implementation

uses
  System.IniFiles,
  System.Math,
  System.Rtti,
  System.StrUtils,
  System.TypInfo,
  Vcl.Imaging.GIFImg,
  Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage;

{$R *.dfm}

{ TKostka }

//Konstruktor klasy TKostka.
constructor TKostka.Create( AOwner : TComponent );
begin

  inherited Create( AOwner );

  zaznaczona := false;

  Self.szerokoœæ := 50;
  Self.wysokoœæ := 70;
  Self.gruboœæ := 10;
  Self.góra := 0;
  Self.lewo := 0;

  //Self.Material.Texture.Enabled := true; //????

  x := -1;
  y := -1;
  z := -1;

  korekta_x := 0;
  korekta_y := 0;

  symbol := '';

  //Self.Szkie³ko := TKostka_Obrazek.Create( AOwner );
  //Self.Szkie³ko.Kostka := Self;

  Self.Obrazek := TKostka_Obrazek.Create( AOwner );
  Self.Obrazek.Kostka := Self;
  Self.Obrazek.Visible := true;

  Self.Opis_Kostki := TGLSpaceText_M.Create( AOwner );
  Self.Opis_Kostki.Kostka := Self;

end;//---//Konstruktor klasy TKostka.

//Destruktor klasy TKostka.
destructor TKostka.Destroy();
begin

  //FreeAndNil( Self.Szkie³ko );
  FreeAndNil( Self.Obrazek );
  FreeAndNil( Self.Opis_Kostki );

  inherited;

end;//---//Destruktor klasy TKostka.

//Funkcja Przerysuj_Kostkê().
procedure TKostka.Przerysuj_Kostkê();
begin

  //
  // Funkcja okreœla wzajemne po³o¿enie elementów kostki wzglêdem siebie.
  //

  //????Self.Szkie³ko.Parent := Self.Parent;

  //Self.szerokoœæ_ramka// 6 -> -3 | 3 Od œrodka po równo w obie strony rozchodzi siê szerokoœæ linii.

  // Wspó³rzêdne œrodka kostki (prostopad³oœcianu).

  Self.CubeWidth := Self.szerokoœæ;
  Self.CubeHeight := Self.wysokoœæ;
  Self.CubeDepth := Self.gruboœæ;
  Self.Position.Y := -Self.góra - Self.wysokoœæ / 2; // Korekta aby górny lewy róg kostki by³ w miejscu jej wspó³rzêdnych (domyœlnie jest œrodek kostki).
  Self.Position.X := Self.lewo + Self.szerokoœæ / 2; // Korekta aby górny lewy róg kostki by³ w miejscu jej wspó³rzêdnych (domyœlnie jest œrodek kostki).
  Self.Position.Z := Self.z * Self.gruboœæ + Self.gruboœæ / 2; // Korekta aby spód kostki dolnej by³ na wspó³rzêdnej zero (domyœlnie jest œrodek kostki).


  Self.Opis_Kostki.Parent := Self.Parent;

  Self.Opis_Kostki.Position := Self.Position;
  Self.Opis_Kostki.Position.X := Self.Opis_Kostki.Position.X - Self.CubeWidth / 2 + Self.CubeWidth / 10; // Korekta o szerokoœæ kostki, lekkie przesuniêcie.
  Self.Opis_Kostki.Position.Z := Self.Opis_Kostki.Position.Z + Self.CubeDepth / 2 + Self.CubeDepth / 100; // Korekta o gruboœæ kostki, lekkie wysuniêcie.

  Self.Opis_Kostki.TextHeight := Self.szerokoœæ / Length( Self.Opis_Kostki.Text );


  Self.Obrazek.Parent := Self.Parent;

  Self.Obrazek.CubeWidth := Self.CubeWidth - Self.CubeWidth / 100;
  Self.Obrazek.CubeHeight := Self.CubeHeight - Self.CubeHeight / 100;
  Self.Obrazek.CubeDepth := Self.CubeDepth / 1000;
  Self.Obrazek.Position := Self.Position;
  Self.Obrazek.Position.Z := Self.Obrazek.Position.Z + Self.CubeDepth / 2 + Self.CubeDepth / 1000;

end;//---//Funkcja Przerysuj_Kostkê().

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


    //Je¿eli znajdzie plik zwraca 0, je¿eli nie znajdzie zwraca numer b³êdu.
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
    // Funkcja (je¿eli nie odnaleziono pliku obrazka) wype³nia bitmapê kolorem i umieszcza napis z symbolem kostki.
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
  opis_b³êdu,
  opis_b³êdu_zaznaczenie,
  rozszerzenie_pliku
    : string;
const
  tekstura_œcianki = 'Œcianka';
begin//Funkcja Wczytaj_Obrazek().

  opis_b³êdu := '';
  opis_b³êdu_zaznaczenie := '';

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

      {$region 'Wczytuje w odpowiedni sposób obrazek.'}
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
                opis_b³êdu := E.Message;

            end;
          //---//on E : Exception do

        end;
        //---//try
      {$endregion 'Wczytuje w odpowiedni sposób obrazek.'}


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


      {$region 'Œcianka.'}
      rozszerzenie_pliku := '';

      {$region 'Sprawdza czy istnieje plik obrazka z danym rozszerzeniem.'}
      if Czy_Istnieje_Plik_Obrazka( 'png', tekstura_œcianki ) then
        rozszerzenie_pliku := 'png'
      else//if Czy_Istnieje_Plik_Obrazka( 'png', tekstura_œcianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'jpg', tekstura_œcianki ) then
        rozszerzenie_pliku := 'jpg'
      else//if Czy_Istnieje_Plik_Obrazka( 'jpg', tekstura_œcianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'jpeg', tekstura_œcianki ) then
        rozszerzenie_pliku := 'jpeg'
      else//if Czy_Istnieje_Plik_Obrazka( 'jpeg', tekstura_œcianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'gif', tekstura_œcianki ) then
        rozszerzenie_pliku := 'gif'
      else//if Czy_Istnieje_Plik_Obrazka( 'gif', tekstura_œcianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'bmp', tekstura_œcianki ) then
        rozszerzenie_pliku := 'bmp'
      else//if Czy_Istnieje_Plik_Obrazka( 'bmp', tekstura_œcianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'tif', tekstura_œcianki ) then
        rozszerzenie_pliku := 'tif'
      else//if Czy_Istnieje_Plik_Obrazka( 'tif', tekstura_œcianki ) then
      if Czy_Istnieje_Plik_Obrazka( 'tiff', tekstura_œcianki ) then
        rozszerzenie_pliku := 'tiff'
      else//if Czy_Istnieje_Plik_Obrazka( 'tiff', tekstura_œcianki ) then
        rozszerzenie_pliku := ''; //???
      {$endregion 'Sprawdza czy istnieje plik obrazka z danym rozszerzeniem.'}


      bit_map := TBitmap.Create();

      {$region 'Wczytuje w odpowiedni sposób obrazek.'}
      if rozszerzenie_pliku = 'png' then
        begin

          obrazek_png := TPngImage.Create();
          obrazek_png.LoadFromFile( adres_katalogu + '\' + tekstura_œcianki + '.' + rozszerzenie_pliku );
          bit_map.Assign( obrazek_png );
          obrazek_png.Free();

        end
      else//if Pos(  'png', AnsiLowerCase( zts_1 )  ) > 0 then
      if   ( rozszerzenie_pliku = 'jpg' )
        or ( rozszerzenie_pliku = 'jpeg' ) then
        begin

          obrazek_jpg := TJPEGImage.Create();
          obrazek_jpg.LoadFromFile( adres_katalogu + '\' + tekstura_œcianki + '.' + rozszerzenie_pliku );
          bit_map.Assign( obrazek_jpg );
          obrazek_jpg.Free();

        end
      else//if   ( rozszerzenie_pliku = 'jpg' ) (...)
      if rozszerzenie_pliku = 'gif' then
        begin

          obrazek_gif := TGIFImage.Create();
          obrazek_gif.LoadFromFile( adres_katalogu + '\' + tekstura_œcianki + '.' + rozszerzenie_pliku );
          bit_map.Assign( obrazek_gif );
          obrazek_gif.Free();

        end
      else//if rozszerzenie_pliku = 'gif' then
      if rozszerzenie_pliku = 'bmp' then
        begin

          bit_map.LoadFromFile( adres_katalogu + '\' + tekstura_œcianki + '.' + rozszerzenie_pliku );

        end
      else//if rozszerzenie_pliku = 'bmp' then
      if   ( rozszerzenie_pliku = 'tif' )
        or ( rozszerzenie_pliku = 'tiff' ) then
        begin

          wic_image := TWICImage.Create();
          wic_image.LoadFromFile( adres_katalogu + '\' + tekstura_œcianki + '.' + rozszerzenie_pliku );
          bit_map.Assign( wic_image );
          wic_image.Free();

        end
      else//if   (   rozszerzenie_pliku = 'tif' ) (...)
        try
          //bit_map.LoadFromFile( zts + '\B1.bmp' );
          bit_map.LoadFromFile( adres_katalogu + '\' + tekstura_œcianki + '.bmp' );
        except
          on E : Exception do
            begin

            end;
          //---//on E : Exception do

        end;
        //---//try
      {$endregion 'Wczytuje w odpowiedni sposób obrazek.'}


      if not bit_map.Empty then
        begin

          Self.Material.Texture.Image.Assign( bit_map );
          Self.Material.Texture.Enabled := true;

        end;
      //---//if not bit_map.Empty then

      bit_map.Free();
      {$endregion 'Œcianka.'}

    end
  else//if adres_katalogu <> 'Brak' then
    begin

      Brak_Obrazka( Self );

    end;
  //---//if adres_katalogu <> 'Brak' then

  Self.Obrazek.Visible := not Self.Opis_Kostki.Visible;


  if opis_b³êdu <> '' then
    raise Exception.Create( opis_b³êdu );


  if opis_b³êdu_zaznaczenie <> '' then
    raise Exception.Create( opis_b³êdu_zaznaczenie );

end;//---//Funkcja Wczytaj_Obrazek().

//Funkcja Klikniêcie_Oznacz().
procedure TKostka.Klikniêcie_Oznacz( const zaznaczona : boolean );
begin

  Self.zaznaczona := zaznaczona;


  if zaznaczona then
    begin

      // Zaznacza klikniêt¹ kostkê.

      Self.Material.Texture.ImageGamma := 2;

      Self.Obrazek.Material.Texture.ImageGamma := 2;

      Self.Opis_Kostki.Font.Style := Self.Opis_Kostki.Font.Style + [ fsBold ];
      Self.Opis_Kostki.Material.FrontProperties.Diffuse.Color := GLS.Color.clrGreen;

    end
  else//if zaznaczona then
    begin

      // Odznacza poprzednio klikniêt¹ kostkê.

      Self.Material.Texture.ImageGamma := 1;

      Self.Obrazek.Material.Texture.ImageGamma := 1;

      Self.Opis_Kostki.Font.Style := Self.Opis_Kostki.Font.Style - [ fsBold ];
      Self.Opis_Kostki.Material.FrontProperties.Diffuse.Color := GLS.Color.clrGray80;

    end;
  //---//if zaznaczona then

end;//---//Funkcja Klikniêcie_Oznacz().


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
  Self.Material.FrontProperties.Ambient.Color := GLS.Color.clrWhite;
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

//Funkcja Wczytaj_Listê_Uk³adów_Kostek().
procedure TMahjong_3D_Form.Wczytaj_Listê_Uk³adów_Kostek( Sender : TObject );
var
  zts : string;
  zti : integer;
  search_rec : TSearchRec;
  menu_item : TMenuItem;
begin

  for zti := Uk³ady_Kostek_MenuItem.Count - 1 downto 0 do
    Uk³ady_Kostek_MenuItem.Items[ zti ].Free();


  if Sender = nil then // Tylko zwalnia pamiêæ.
    Exit;

  Screen.Cursor := crHourGlass;

  zti := 0;

  //Je¿eli znajdzie plik zwraca 0, je¿eli nie znajdzie zwraca numer b³êdu. Na pocz¹tku znajduje '.' '..' potem listê plików.
  if FindFirst(  ExtractFilePath( Application.ExeName ) + 'Uk³ady kostek\*.txt', faAnyFile, search_rec  ) = 0 then //Application potrzebuje w uses Forms.
    begin

      repeat

        zts := search_rec.Name;
        zts := ReverseString( zts );
        Delete(  zts, 1, Pos( '.', zts )  );
        zts := ReverseString( zts );

        inc( zti );

        menu_item := TMenuItem.Create( Application );
        menu_item.Name := 'Uk³ady_Kostek__Uk³ad_Kostek_' + IntToStr( zti ) + '_MenuItem';
        menu_item.Caption := zts;
        menu_item.Hint := zts;
        menu_item.OnClick := Uk³ady_Kostek__Uk³ad_Kostek_MenuItemClick;

        Uk³ady_Kostek_MenuItem.Add( menu_item );

      until FindNext( search_rec ) <> 0 //Zwraca dane kolejnego pliku zgodnego z parametrami wczeœniej wywo³anej funkcji FindFirst. Je¿eli mo¿na przejœæ do nastêpnego znalezionego pliku zwraca 0.

    end;
  //---//if FindFirst(  ExtractFilePath( Application.ExeName ) + 'Uk³ady kostek\*.txt', faAnyFile, search_rec  ) = 0 then //Application

  FindClose( search_rec );

  //menu_item := TMenuItem.Create( Application );
  menu_item := TMenuItem.Create( Mahjong_3D_Form ); // Dla FindComponent().
  menu_item.Name := 'Uk³ady_Kostek__Odœwie¿_Listê_MenuItem';
  //menu_item.Caption := 'Odœwie¿ listê uk³adów kostek';
  menu_item.Caption := t³umaczenie_komunikaty_r.menu_pozycja__odœwie¿_listê_uk³adów_kostek;
  menu_item.OnClick := Wczytaj_Listê_Uk³adów_Kostek;

  Uk³ady_Kostek_MenuItem.Add( menu_item );

  Screen.Cursor := crDefault;


  if    ( Sender <> nil )
    //and ( TComponent(Sender).Name = Uk³ady_Kostek__Odœwie¿_Listê_MenuItem.Name )
    and ( TComponent(Sender).Name <> Mahjong_3D_Form.Name )
    and ( Uk³ady_Kostek_MenuItem.Count < 2 ) then
    //Application.MessageBox( 'Brak zdefiniowanych uk³adów kostek.', 'B³¹d', MB_ICONEXCLAMATION + MB_OK );
    Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__brak_zdefiniowanych_uk³adów_kostek ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK  );

end;//---//Funkcja Wczytaj_Listê_Uk³adów_Kostek().

//Funkcja Wczytaj_Uk³ad_Kostek().
procedure TMahjong_3D_Form.Wczytaj_Uk³ad_Kostek( const nazwa_pliku : string; const zwolnij : boolean = false );
var
  symbole_kostek_t : array of string;
  czy_zaprezentowaæ_kostki : boolean;

  //Funkcja Przygotuj_Symbole_Kostek() w Wczytaj_Uk³ad_Kostek().
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

    //Funkcja Wczytaj_Ini_Uk³adu_Kostek() w Przygotuj_Symbole_Kostek() w Wczytaj_Uk³ad_Kostek().
    procedure Wczytaj_Ini_Uk³adu_Kostek( const czytaj_parametry_kostek : boolean );
    var
      search_rec : TSearchRec;
      plik_ini : System.IniFiles.TIniFile;
      zti : integer;
      zts : string;
    begin

      //
      // Funkcja wczyta parametry uk³adu kostek.
      //

      if czytaj_parametry_kostek then
        begin

          kamera_œrodek_x := 0;
          kamera_œrodek_y := 0;
          kamera_œrodek_z := 0;

          kamera_na_œrodek_x := 0;
          kamera_na_œrodek_y := 0;

        end;
      //---//if czytaj_parametry_kostek then


      zts := ExtractFilePath( Application.ExeName ) + 'Uk³ady kostek\' + nazwa_pliku + '.ini';

      if FindFirst( zts, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
        begin

          plik_ini := System.IniFiles.TIniFile.Create( zts );


          if czytaj_parametry_kostek then
            begin

              if Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked then
                begin

                  blokuj_rysowanie_kostek := true;


                  zti := plik_ini.ReadInteger( 'Kostki', 'Margines_Planszy', Margines_Planszy_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Wyœwietlanie_Czasu_RadioGroup.ItemIndex.

                  if    ( zti >= Margines_Planszy_SpinEdit.MinValue )
                    and ( zti <= Margines_Planszy_SpinEdit.MaxValue ) then
                    Margines_Planszy_SpinEdit.Value := zti;



                  zti := plik_ini.ReadInteger( 'Kostki', 'Szerokoœæ_Kostek', Szerokoœæ_Kostek_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Szerokoœæ_Kostek_SpinEdit.Value.

                  if    ( zti >= Szerokoœæ_Kostek_SpinEdit.MinValue )
                    and ( zti <= Szerokoœæ_Kostek_SpinEdit.MaxValue ) then
                    Szerokoœæ_Kostek_SpinEdit.Value := zti;


                  zti := plik_ini.ReadInteger( 'Kostki', 'Wysokoœæ_Kostek', Wysokoœæ_Kostek_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Wysokoœæ_Kostek_SpinEdit.Value.

                  if    ( zti >= Wysokoœæ_Kostek_SpinEdit.MinValue )
                    and ( zti <= Wysokoœæ_Kostek_SpinEdit.MaxValue ) then
                    Wysokoœæ_Kostek_SpinEdit.Value := zti;


                  zti := plik_ini.ReadInteger( 'Kostki', 'Gruboœæ_Kostek', Gruboœæ_Kostek_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Gruboœæ_Kostek_SpinEdit.Value.

                  if    ( zti >= Gruboœæ_Kostek_SpinEdit.MinValue )
                    and ( zti <= Gruboœæ_Kostek_SpinEdit.MaxValue ) then
                    Gruboœæ_Kostek_SpinEdit.Value := zti;


                  kamera_œrodek_x := plik_ini.ReadFloat( 'Kostki', 'Kamera_X', kamera_œrodek_x ); // Je¿eli nie znajdzie to podstawia wartoœæ kamera_œrodek_x.
                  kamera_œrodek_y := plik_ini.ReadFloat( 'Kostki', 'Kamera_Y', kamera_œrodek_y ); // Je¿eli nie znajdzie to podstawia wartoœæ kamera_œrodek_y.
                  kamera_œrodek_z := plik_ini.ReadFloat( 'Kostki', 'Kamera_Z', kamera_œrodek_z ); // Je¿eli nie znajdzie to podstawia wartoœæ kamera_œrodek_z.

                  kamera_na_œrodek_x := plik_ini.ReadFloat( 'Kostki', 'Kamera_Na_X', kamera_na_œrodek_x ); // Je¿eli nie znajdzie to podstawia wartoœæ kamera_na_œrodek_x.
                  kamera_na_œrodek_y := plik_ini.ReadFloat( 'Kostki', 'Kamera_Na_Y', kamera_na_œrodek_y ); // Je¿eli nie znajdzie to podstawia wartoœæ kamera_na_œrodek_y.


                  blokuj_rysowanie_kostek := false;

                end;
              //---//if Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked then

            end;
          //---//if czytaj_parametry_kostek then


          czy_bambusy := plik_ini.ReadBool( 'Kostki_Symbole', 'Bambusy', czy_bambusy ); // Je¿eli nie znajdzie to podstawia wartoœæ czy_bambusy.
          czy_kropki := plik_ini.ReadBool( 'Kostki_Symbole', 'Kropki', czy_kropki ); // Je¿eli nie znajdzie to podstawia wartoœæ czy_kropki.
          czy_liczby := plik_ini.ReadBool( 'Kostki_Symbole', 'Liczby', czy_liczby ); // Je¿eli nie znajdzie to podstawia wartoœæ czy_liczby.
          czy_wiatry := plik_ini.ReadBool( 'Kostki_Symbole', 'Wiatry', czy_wiatry ); // Je¿eli nie znajdzie to podstawia wartoœæ czy_wiatry.
          czy_smoki := plik_ini.ReadBool( 'Kostki_Symbole', 'Smoki', czy_smoki ); // Je¿eli nie znajdzie to podstawia wartoœæ czy_smoki.
          czy_pory_roku := plik_ini.ReadBool( 'Kostki_Symbole', 'Pory_Roku', czy_pory_roku ); // Je¿eli nie znajdzie to podstawia wartoœæ czy_pory_roku.
          czy_kwiaty := plik_ini.ReadBool( 'Kostki_Symbole', 'Kwiaty', czy_kwiaty ); // Je¿eli nie znajdzie to podstawia wartoœæ czy_kwiaty.


          plik_ini.Free();

        end;
      //---//if FindFirst( zts, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.

      FindClose( search_rec );

    end;//---//Funkcja Wczytaj_Ini_Uk³adu_Kostek() w Przygotuj_Symbole_Kostek() w Wczytaj_Uk³ad_Kostek().

  var
    i,
    j
      : integer;
  begin//Funkcja Przygotuj_Symbole_Kostek() w Wczytaj_Uk³ad_Kostek().

    //
    // Ka¿dy kamieñ wystêpuje w grze w czterech kopiach, zatem ka¿dy kolor sk³ada siê z 36 kamieni (9×4).
    // Pe³ny zestaw p³ytek do gry mad¿ong liczy 144 p³ytki.
    //
    // Bambusy_ 9 * 4 = 36
    // Kropki_ 9 * 4 = 36
    // Liczby_ 9 * 4 = 36
    //
    // Wiatry_ 4 * 4 = 16
    //
    // Smoki_ 3 * 4 = 12
    //
    // Pory_Roku_ 4 * 2 = 8 (38 ró¿ne kostki)
    // Lub
    // Pory_Roku_ 4 * 1 = 4 + Kwiaty_ 4 * 1 = 4 = 8 (42 ró¿ne kostki)
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


    Wczytaj_Ini_Uk³adu_Kostek( czytaj_parametry_kostek );


    if not czy_zaprezentowaæ_kostki then
      i := 4
    else//if not czy_zaprezentowaæ_kostki then
      i := 1;

    //for j := 1 to 4 do
    for j := 1 to i do
      begin

        if czy_bambusy then
          for i := 1 to 9 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Bambusy_' + IntToStr( i );

              if czy_zaprezentowaæ_kostki then
                uk³ad_kostek_t[ i - 1 ][ 0 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 9 do

        if czy_kropki then
          for i := 1 to 9 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Kropki_' + IntToStr( i );

              if czy_zaprezentowaæ_kostki then
                uk³ad_kostek_t[ i - 1 ][ 1 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 9 do

        if czy_liczby then
          for i := 1 to 9 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Liczby_' + IntToStr( i );

              if czy_zaprezentowaæ_kostki then
                uk³ad_kostek_t[ i - 1 ][ 2 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 9 do


        if czy_wiatry then
          for i := 1 to 4 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Wiatry_' + IntToStr( i );

              if czy_zaprezentowaæ_kostki then
                uk³ad_kostek_t[ i - 1 ][ 3 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 4 do


          if czy_smoki then
            for i := 1 to 3 do
              begin

                SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
                symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Smoki_' + IntToStr( i );

                if czy_zaprezentowaæ_kostki then
                uk³ad_kostek_t[ i - 1 ][ 4 ][ 0 ] := '1';

              end;
            //---//for i := 1 to 4 do

      end;
    //---//for j := 1 to i do


    if not Kostki_Kwiatków_CheckBox.Checked then
      begin

        if not czy_zaprezentowaæ_kostki then
          i := 2
        else//if not czy_zaprezentowaæ_kostki then
          i := 1;

        if czy_pory_roku then
          //for j := 1 to 2 do
          for j := 1 to i do
            for i := 1 to 4 do
              begin

                SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
                symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Pory_Roku_' + IntToStr( i );

                if czy_zaprezentowaæ_kostki then
                  uk³ad_kostek_t[ i - 1 ][ 5 ][ 0 ] := '1';

              end;
            //---//for i := 1 to 4 do

      end
    else//if not Kostki_Kwiatków_CheckBox.Checked then
      begin

        if czy_pory_roku then
          for i := 1 to 4 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Pory_Roku_' + IntToStr( i );

              if czy_zaprezentowaæ_kostki then
                uk³ad_kostek_t[ i - 1 ][ 5 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 4 do


        if czy_kwiaty then
          for i := 1 to 4 do
            begin

              SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) + 1  );
              symbole_kostek_t[ Length( symbole_kostek_t ) - 1 ] := 'Kwiaty_' + IntToStr( i );

              if czy_zaprezentowaæ_kostki then
                uk³ad_kostek_t[ i - 1 ][ 6 ][ 0 ] := '1';

            end;
          //---//for i := 1 to 4 do

      end;
    //---//if not Kostki_Kwiatków_CheckBox.Checked then

  end;//---//Funkcja Przygotuj_Symbole_Kostek() w Wczytaj_Uk³ad_Kostek().

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
begin//Funkcja Wczytaj_Uk³ad_Kostek().

  Screen.Cursor := crHourGlass;

  kostka_klikniêta := nil;
  kostka_podpowiedŸ_1 := nil;
  kostka_podpowiedŸ_2 := nil;
  kostka_demo := nil;


  gra_czas_koniec := 0;


  SetLength( podpowiedŸ_poprzednia_t_r, 0 );


  czy_zaprezentowaæ_kostki := nazwa_pliku = '*:?:*<>"\|/'; // Zaprezentuj kostki.

  {$region 'Zwalnianie elementów.'}
  for x := Length( uk³ad_kostek_t ) - 1 downto 0 do
    begin

      for y := Length( uk³ad_kostek_t[ 0 ] ) - 1 downto 0 do
        SetLength( uk³ad_kostek_t[ x ][ y ], 0 );

      SetLength( uk³ad_kostek_t[ x ], 0 );

    end;
  //---//for x := 0 to Length( uk³ad_kostek_t ) - 1 do

  SetLength( uk³ad_kostek_t, 0 );


  uk³ad_x := 0;
  uk³ad_y := 0;
  uk³ad_z := 0;


  for x := Length( kostki_t ) - 1 downto 0 do
    begin

      for y := Length( kostki_t[ 0 ] ) - 1 downto 0 do
        begin

          for z := Length( kostki_t[ 0 ][ 0 ] ) - 1 downto 0 do
            if kostki_t[ x ][ y ][ z ] <> nil then
              begin

                //FreeAndNil( kostki_t[ x ][ y ][ z ].Szkie³ko );
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
  {$endregion 'Zwalnianie elementów.'}


  if zwolnij then
    begin

      Screen.Cursor := crDefault;
      Exit;

    end;
  //---//if zwolnij then


  if not czy_zaprezentowaæ_kostki then
    begin

      {$region 'Wczytywanie pliku.'}
      zts := ExtractFilePath( Application.ExeName ) + 'Uk³ady kostek\' + nazwa_pliku + '.txt';

      if FindFirst( zts, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
        begin

          FindClose( search_rec );
          //Application.MessageBox(  PChar( 'Nie odnaleziono pliku uk³adu kostek: ' + zts + '.' ), 'B³¹d', MB_ICONEXCLAMATION + MB_OK  );
          Screen.Cursor := crDefault;
          Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_pliku_uk³adu_kostek + ': ' + zts + '.' ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK  );
          Exit;

        end;
      //---//if FindFirst( zts, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.

      FindClose( search_rec );

      AssignFile( plik_tekstowy, zts );

      wczytany_uk³ad_kostek_nazwa_pliku := nazwa_pliku;
      //Uk³ad_Kostek_Nazwa_Label.Caption := 'Nazwa uk³adu kostek: ' + wczytany_uk³ad_kostek_nazwa_pliku + '.';
      Uk³ad_Kostek_Nazwa_Label.Caption := t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa + ': ' + wczytany_uk³ad_kostek_nazwa_pliku + '.';

      x := 0;
      y := 0;
      z := 0;
      zti := 0;


      Reset( plik_tekstowy );

      while not Eof( plik_tekstowy ) do
        begin

          Readln( plik_tekstowy, zts ); //Czyta ca³¹ liniê.

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

              if x < Length( zts ) then // Okreœla najd³u¿szy wiersz x.
                x := Length( zts );

              if Trim( zts ) = '' then
                begin

                  inc( z );

                  if y < zti then // Okreœla najd³u¿sz¹ kolumnê y.
                    y := zti;

                  zti := 0; // Okreœla iloœæ poziomów.

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

      if y < zti then // Okreœla najd³u¿sz¹ kolumnê y.
        y := zti;


      uk³ad_x := x - 1;
      uk³ad_y := y - 1;
      uk³ad_z := z - 1;


      SetLength( uk³ad_kostek_t, x, y, z );
      SetLength( kostki_t, x, y, z );


      for x := 0 to Length( uk³ad_kostek_t ) - 1 do
        for y := 0 to Length( uk³ad_kostek_t[ 0 ] ) - 1 do
          for z := 0 to Length( uk³ad_kostek_t[ 0 ][ 0 ] ) - 1 do
            uk³ad_kostek_t[ x ][ y ][ z ] := '0';


      Reset( plik_tekstowy );

      y := -1;
      z := 0;

      while not Eof( plik_tekstowy ) do
        begin

          Readln( plik_tekstowy, zts ); //Czyta ca³¹ liniê.

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
                    uk³ad_kostek_t[ x ][ y ][ z ] := zts[ x + 1 ];
                  //else//if zts[ x + 1 ] = '1' then
                  //  uk³ad_kostek_t[ x ][ y ][ z ] := '0';

            end;
          //---//if zts_1 <> 'Komentarze' then

        end;
      //---//while not Eof( plik_tekstowy ) do


      CloseFile( plik_tekstowy ); //Dopiero po zamkniêciu zapisuje zmiany.
      {$endregion 'Wczytywanie pliku.'}

    end
  else//if not czy_zaprezentowaæ_kostki then
    begin

      x := 9;

      if not Kostki_Kwiatków_CheckBox.Checked then
        y := 6
      else//if not Kostki_Kwiatków_CheckBox.Checked then
        y := 7;

      z := 1;

      uk³ad_x := x - 1;
      uk³ad_y := y - 1;
      uk³ad_z := z - 1;


      SetLength( uk³ad_kostek_t, x, y, z );
      SetLength( kostki_t, x, y, z );


      for x := 0 to Length( uk³ad_kostek_t ) - 1 do
        for y := 0 to Length( uk³ad_kostek_t[ 0 ] ) - 1 do
          for z := 0 to Length( uk³ad_kostek_t[ 0 ][ 0 ] ) - 1 do
            uk³ad_kostek_t[ x ][ y ][ z ] := '0';

    end;
  //---//if not czy_zaprezentowaæ_kostki then

  //x := 4;
  //y := 3;
  //z := 1;

  //SetLength( uk³ad_kostek_t, x, y, z );
  //SetLength( uk³ad_kostek_t, 4, 3, 2 );

  //SetLength( kostki_t, x, y, z );
  //SetLength( kostki_t, 1, 1, 1 );
  //kostki_t[ 0 ][ 0 ][ 0 ] := TKostka.Create();
  //kostki_t[ 0 ][ 0 ][ 0 ].Parent := ScrollBox1;
  //FreeAndNil( kostki_t[ 0 ][ 0 ][ 0 ] );


//  uk³ad_kostek_t[ 0 ][ 0 ][ 0 ] := 1;
//  uk³ad_kostek_t[ 1 ][ 0 ][ 0 ] := 1;
//  uk³ad_kostek_t[ 2 ][ 1 ][ 0 ] := 1;


  {$region 'Tworzenie uk³adu kostek.'}
  Przygotuj_Symbole_Kostek( true );

  Randomize();

  if    (  Length( uk³ad_kostek_t ) > 0  )
    and (  Length( uk³ad_kostek_t[ 0 ] ) > 0  ) then
    for z := 0 to Length( uk³ad_kostek_t[ 0 ][ 0 ] ) - 1 do // Najpierw jest z aby zachowaæ wizualizacjê warstw uk³adaj¹c kostki od do³u do góry.
      for y := 0 to Length( uk³ad_kostek_t[ 0 ] ) - 1 do // Najpierw jest y aby najpierw uk³ada³ wiersze.
        for x := 0 to Length( uk³ad_kostek_t ) - 1 do
          if uk³ad_kostek_t[ x ][ y ][ z ] <> '0' then
            begin

              Utwórz_Kostkê( kostki_t[ x ][ y ][ z ], uk³ad_kostek_t[ x ][ y ][ z ] );

              kostki_t[ x ][ y ][ z ].x := x;
              kostki_t[ x ][ y ][ z ].y := y;
              kostki_t[ x ][ y ][ z ].z := z;


              if Length( symbole_kostek_t ) <= 0 then
                Przygotuj_Symbole_Kostek(); // Je¿eli kostek w uk³adzie bêdzie wiêcej ni¿ dostêpnych symboli kostek.


              if not czy_zaprezentowaæ_kostki then
                zti := Random(  Length( symbole_kostek_t )  )
              else//if not czy_zaprezentowaæ_kostki then
                zti := 0;

              if Length( symbole_kostek_t ) > 0 then
                begin

                  kostki_t[ x ][ y ][ z ].symbol := symbole_kostek_t[ zti ]; //??? Ma byæ odkomentowane.
                  //kostki_t[ x ][ y ][ z ].Caption := symbole_kostek_t[ zti ];
                  //kostki_t[ x ][ y ][ z ].Caption := IntToStr( x ) + IntToStr( y ) + IntToStr( z ); //???

                end;
              //---//if Length( symbole_kostek_t ) > 0 then



              for i := zti to Length( symbole_kostek_t ) - 2 do
                symbole_kostek_t[ i ] := symbole_kostek_t[ i + 1 ];

              if Length( symbole_kostek_t ) >= 1 then
                SetLength(  symbole_kostek_t, Length( symbole_kostek_t ) - 1  );

            end;
          //---//if uk³ad_kostek_t[ x ][ y ][ z ] <> '0' then

  SetLength( symbole_kostek_t, 0 );
  {$endregion 'Tworzenie uk³adu kostek.'}


  //Kostki_SpinEditChange( nil ); //???

  Screen.Cursor := crHourGlass;

  StatusBar1.Panels[ 1 ].Text := IntToStr( Kostek_Na_Planszy() );

  par_do_zdjêcia_iloœæ := Par_Do_Zdjêcia();

  //Wczytaj_Obrazki_Kostek( '' );
  //Wczytaj_Obrazki_Kostek( obrazki_kostek_nazwa_katalogu, true ); // true - aby wartoœci z pliku ini nie blokowa³y zmian kostek.
  Wczytaj_Obrazki_Kostek( obrazki_kostek_nazwa_katalogu );
    //Kamera_Ustawienie_Pocz¹tkowe(); //???

  przetasowania_iloœæ := 0;
  podpowiedzi_iloœæ := 0;
  cofniêcia_iloœæ := 0;


  Kostki_SpinEditChange( nil );


  Kamera_Ustawienie_Pocz¹tkowe();


  if not czy_zaprezentowaæ_kostki then
    gra_czas_start := Now();

  Screen.Cursor := crDefault;

end;//---//Funkcja Wczytaj_Uk³ad_Kostek().

//Funkcja Utwórz_Kostkê().
procedure TMahjong_3D_Form.Utwórz_Kostkê( var kostka_f : TKostka; pozycja : Char );
begin

  if kostka_f <> nil then
    Exit;


  kostka_f := TKostka.Create( Application );

  kostka_f.Parent := GLScene1.Objects;

  //????kostka_f.Przerysuj_Kostkê();

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

  kostka_f.Przerysuj_Kostkê(); //????

end;//---//Funkcja Utwórz_Kostkê().

//Funkcja Czy_Kostkê_Mo¿na_Zdj¹æ().
function TMahjong_3D_Form.Czy_Kostkê_Mo¿na_Zdj¹æ( kostka_f : TKostka ): boolean;
begin

  Result := false;

  if kostka_f = nil then
    Exit;

  //Caption := IntToStr( kostka_f.x ) + ' ' + IntToStr( kostka_f.y ) + ' ' + IntToStr( kostka_f.z ); //???

  // Nad.
  if    (  kostka_f.z < uk³ad_z  )
    and (
             ( uk³ad_kostek_t[ kostka_f.x ][ kostka_f.y ][ kostka_f.z + 1 ] <> '0' ) // Kostka bezpoœrednio nad.
          or (
                   (  kostka_f.x < uk³ad_x  )
               and ( uk³ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = '<' ) // Kostka nad po L przesuniêta w P.
             )
          or (
                   ( kostka_f.x > 0 )
               and ( uk³ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = '>' ) // Kostka nad po P przesuniêta w L.
             )
          or (
                   ( kostka_f.y < uk³ad_y )
               and ( uk³ad_kostek_t[ kostka_f.x ][ kostka_f.y + 1 ][ kostka_f.z + 1 ] = '^' ) // Kostka nad D przesuniêta w G.
             )
          or (
                   ( kostka_f.y > 0 )
               and ( uk³ad_kostek_t[ kostka_f.x ][ kostka_f.y - 1 ][ kostka_f.z + 1 ] = 'v' ) // Kostka nad G przesuniêta w D.
             )
        ) then
    Exit;


  // Nad skos.
  if    (  kostka_f.z < uk³ad_z  )
    and (
          // Kostka nad D przesuniêta w LG.
            (
                   ( kostka_f.y < uk³ad_y )
               and ( uk³ad_kostek_t[ kostka_f.x ][ kostka_f.y + 1 ][ kostka_f.z + 1 ] = '\' ) // Kostka z D.
             )
          or (
                   ( kostka_f.x < uk³ad_x )
               and ( uk³ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = '\' ) // Kostka z P.
             )
          or (
                   ( kostka_f.x < uk³ad_x )
               and ( kostka_f.y < uk³ad_y )
               and ( uk³ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y + 1 ][ kostka_f.z + 1 ] = '\' ) // Kostka z PD.
             )

          // Kostka nad D przesuniêta w PG.
          or (
                   ( kostka_f.y < uk³ad_y )
               and ( uk³ad_kostek_t[ kostka_f.x ][ kostka_f.y + 1 ][ kostka_f.z + 1 ] = '/' ) // Kostka z D.
             )
          or (
                   ( kostka_f.x > 0 )
               and ( uk³ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = '/' ) // Kostka z L.
             )
          or (
                   ( kostka_f.x > 0 )
               and ( kostka_f.y < uk³ad_y )
               and ( uk³ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y + 1 ][ kostka_f.z + 1 ] = '/' ) // Kostka z LD.
             )


          // Kostka nad G przesuniêta w LD.
          or (
                   ( kostka_f.y > 0 )
               and ( uk³ad_kostek_t[ kostka_f.x ][ kostka_f.y - 1 ][ kostka_f.z + 1 ] = '[' ) // Kostka z G.
             )
          or (
                   ( kostka_f.x > 0 )
               and ( uk³ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = '[' ) // Kostka z P.
             )
          or (
                   ( kostka_f.x > 0 )
               and ( kostka_f.y > 0 )
               and ( uk³ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y - 1 ][ kostka_f.z + 1 ] = '[' ) // Kostka z PG.
             )

          // Kostka nad G przesuniêta w PD.
          or (
                   ( kostka_f.y > 0 )
               and ( uk³ad_kostek_t[ kostka_f.x ][ kostka_f.y - 1 ][ kostka_f.z + 1 ] = ']' ) // Kostka z G.
             )
          or (
                   ( kostka_f.x < uk³ad_x )
               and ( uk³ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y ][ kostka_f.z + 1 ] = ']' ) // Kostka z L.
             )
          or (
                   ( kostka_f.x < uk³ad_x )
               and ( kostka_f.y > 0 )
               and ( uk³ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y - 1 ][ kostka_f.z + 1 ] = ']' ) // Kostka z LG.
             )

        ) then
    Exit;


  // S¹siednie.
  if    (
              ( kostka_f.x > 0 )
          and ( kostka_f.x < uk³ad_x )
          and (
                   ( uk³ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y ][ kostka_f.z ] <> '0' ) // Kostka z L.
                or (
                         (  kostka_f.y < uk³ad_y  )
                     and ( uk³ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y + 1 ][ kostka_f.z ] = '^' ) // Kostka z L przesuniêta w G.
                   )
                or (
                         ( kostka_f.y > 0 )
                     and ( uk³ad_kostek_t[ kostka_f.x - 1 ][ kostka_f.y - 1 ][ kostka_f.z ] = 'v' ) // Kostka Z L przesuniêta w D.
                   )
              )
          and (
                   ( uk³ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y ][ kostka_f.z ] <> '0' ) // Kostka z P.
                or (
                         (  kostka_f.y < uk³ad_y  )
                     and ( uk³ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y + 1 ][ kostka_f.z ] = '^' ) // Kostka z P przesuniêta w G.
                   )
                or (
                         ( kostka_f.y > 0 )
                     and ( uk³ad_kostek_t[ kostka_f.x + 1 ][ kostka_f.y - 1 ][ kostka_f.z ] = 'v' ) // Kostka Z P przesuniêta w D.
                   )
              )
        )
         then
    Exit;


  Result := true;

end;//---//Funkcja Czy_Kostkê_Mo¿na_Zdj¹æ().

//Funkcja Czy_Kostki_Pasuj¹_Do_Siebie().
function TMahjong_3D_Form.Czy_Kostki_Pasuj¹_Do_Siebie( kostka_1_f, kostka_2_f : TKostka ) : boolean;
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

end;//---//Funkcja Czy_Kostki_Pasuj¹_Do_Siebie().

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

  if kostka_klikniêta <> nil then
    begin

      x := kostka_klikniêta.x;
      y := kostka_klikniêta.y;
      z := kostka_klikniêta.z;

      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].symbol := kostka_klikniêta.symbol;
      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_1 := uk³ad_kostek_t[ x ][ y ][ z ];

      //FreeAndNil( kostka_klikniêta.Szkie³ko );
      FreeAndNil( kostka_klikniêta );

      uk³ad_kostek_t[ x ][ y ][ z ] := '0';
      kostki_t[ x ][ y ][ z ] := nil;

      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].x_1 := x;
      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].y_1 := y;
      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].z_1 := z;

    end;
  //---//if kostka_klikniêta <> nil then


  if kostka_f <> nil then
    begin

      x := kostka_f.x;
      y := kostka_f.y;
      z := kostka_f.z;

      if cofnij_t_r[ Length( cofnij_t_r ) - 1 ].symbol = '' then
        cofnij_t_r[ Length( cofnij_t_r ) - 1 ].symbol := kostka_f.symbol;

      cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_2 := uk³ad_kostek_t[ x ][ y ][ z ];

      //FreeAndNil( kostka_f.Szkie³ko );
      FreeAndNil( kostka_f );

      uk³ad_kostek_t[ x ][ y ][ z ] := '0';
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

  par_do_zdjêcia_iloœæ := Par_Do_Zdjêcia();


  SetLength( podpowiedŸ_poprzednia_t_r, 0 );


  if x <= 1 then
    begin

      gra_czas_koniec := Now();

      if Gra__Demo_MenuItem.Checked then
        Gra__Demo_MenuItem.Checked := false;

      //Application.MessageBox( 'Koniec gry.', 'Gratulacje', MB_ICONINFORMATION + MB_OK );
      Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__koniec_gry ), PChar( t³umaczenie_komunikaty_r.komunikat__gratulacje ), MB_ICONINFORMATION + MB_OK  );

    end;
  //---//if x <= 1 then


  if    ( x > 2 )
    and ( par_do_zdjêcia_iloœæ <= 0 )
    and ( Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked )
    and ( not Gra__Demo_MenuItem.Checked ) then
    //if Application.MessageBox( 'Nie odnaleziono kostek do œci¹gniêcia.' + #13 + 'Czy przetasowaæ?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO ) = IDYES then
    if Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_kostek_do_œci¹gniêcia__czy_przetasowaæ ), PChar( t³umaczenie_komunikaty_r.komunikat__potwierdzenie ), MB_ICONQUESTION + MB_YESNO  ) = IDYES then
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

//Funkcja Par_Do_Zdjêcia().
function TMahjong_3D_Form.Par_Do_Zdjêcia() : integer;
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
          and (  Czy_Kostkê_Mo¿na_Zdj¹æ( kostki_t[ x_1 ][ y_1 ][ z_1 ] )  ) then
          begin

            for x_2 := 0 to Length( kostki_t ) - 1 do
              for y_2 := 0 to Length( kostki_t[ 0 ] ) - 1 do
                for z_2 := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
                  if    ( kostki_t[ x_2 ][ y_2 ][ z_2 ] <> nil )
                    and ( kostki_t[ x_1 ][ y_1 ][ z_1 ] <> kostki_t[ x_2 ][ y_2 ][ z_2 ] )
                    //and ( kostki_t[ x_1 ][ y_1 ][ z_1 ].symbol = kostki_t[ x_2 ][ y_2 ][ z_2 ].symbol )
                    and (  Czy_Kostki_Pasuj¹_Do_Siebie( kostki_t[ x_1 ][ y_1 ][ z_1 ], kostki_t[ x_2 ][ y_2 ][ z_2 ] )  )
                    and (  Czy_Kostkê_Mo¿na_Zdj¹æ( kostki_t[ x_2 ][ y_2 ][ z_2 ] )  ) then
                    begin

                      inc( Result );

                    end;
                  //---//if    ( kostki_t[ x_2 ][ y_2 ][ z_2 ] <> nil ) (...)

          end;
        //---//if    ( kostki_t[ x_1 ][ y_1 ][ z_1 ] <> nil ) (...)

  if Result > 0 then
    Result := Round( Result / 2 );

end;//---//Funkcja Par_Do_Zdjêcia().

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
  plik_ini : System.IniFiles.TIniFile;
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

  // Tutaj jeszcze nie ma wczytanych t³umaczeñ (w ustawieniach jest okreœlone wybrane t³umaczenie).

  {$region 'Plik ini.'}
  plik_ini := System.IniFiles.TIniFile.Create(  ExtractFilePath( Application.ExeName ) + 'Mahjong.ini'  );

  blokuj_rysowanie_kostek := true;

  if not plik_ini.ValueExists( 'Opcje', 'Wyœwietlanie_Czasu' ) then
    plik_ini.WriteInteger( 'Opcje', 'Wyœwietlanie_Czasu', Wyœwietlanie_Czasu_RadioGroup.ItemIndex )
  else//if not plik_ini.ValueExists( 'Opcje', 'Wyœwietlanie_Czasu' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Wyœwietlanie_Czasu', Wyœwietlanie_Czasu_RadioGroup.ItemIndex ); // Je¿eli nie znajdzie to podstawia wartoœæ Wyœwietlanie_Czasu_RadioGroup.ItemIndex.

      if    ( zti_1 >= 0 )
        and ( zti_1 <= Wyœwietlanie_Czasu_RadioGroup.Items.Count ) then
        Wyœwietlanie_Czasu_RadioGroup.ItemIndex := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Wyœwietlanie_Czasu' ) then


  if not plik_ini.ValueExists( 'Opcje', 'Wyœwietlanie_Iloœci_Par_Do_Zdjêcia' ) then
    plik_ini.WriteBool( 'Opcje', 'Wyœwietlanie_Iloœci_Par_Do_Zdjêcia', Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked )
  else
    Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Wyœwietlanie_Iloœci_Par_Do_Zdjêcia', Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked ); // Je¿eli nie znajdzie to podstawia wartoœæ Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked.



  if not plik_ini.ValueExists( 'Opcje', 'Margines_Planszy' ) then
    plik_ini.WriteInteger( 'Opcje', 'Margines_Planszy', Margines_Planszy_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Margines_Planszy' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Margines_Planszy', Margines_Planszy_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Wyœwietlanie_Czasu_RadioGroup.ItemIndex.

      if    ( zti_1 >= Margines_Planszy_SpinEdit.MinValue )
        and ( zti_1 <= Margines_Planszy_SpinEdit.MaxValue ) then
        Margines_Planszy_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Margines_Planszy' ) then



  if not plik_ini.ValueExists( 'Opcje', 'Szerokoœæ_Kostek' ) then
    plik_ini.WriteInteger( 'Opcje', 'Szerokoœæ_Kostek', Szerokoœæ_Kostek_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Szerokoœæ_Kostek' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Szerokoœæ_Kostek', Szerokoœæ_Kostek_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Szerokoœæ_Kostek_SpinEdit.Value.

      if    ( zti_1 >= Szerokoœæ_Kostek_SpinEdit.MinValue )
        and ( zti_1 <= Szerokoœæ_Kostek_SpinEdit.MaxValue ) then
        Szerokoœæ_Kostek_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Szerokoœæ_Kostek' ) then



  if not plik_ini.ValueExists( 'Opcje', 'Wysokoœæ_Kostek' ) then
    plik_ini.WriteInteger( 'Opcje', 'Wysokoœæ_Kostek', Wysokoœæ_Kostek_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Wysokoœæ_Kostek' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Wysokoœæ_Kostek', Wysokoœæ_Kostek_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Wysokoœæ_Kostek_SpinEdit.Value.

      if    ( zti_1 >= Wysokoœæ_Kostek_SpinEdit.MinValue )
        and ( zti_1 <= Wysokoœæ_Kostek_SpinEdit.MaxValue ) then
        Wysokoœæ_Kostek_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Wysokoœæ_Kostek' ) then



  if not plik_ini.ValueExists( 'Opcje', 'Gruboœæ_Kostek' ) then
    plik_ini.WriteInteger( 'Opcje', 'Gruboœæ_Kostek', Gruboœæ_Kostek_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Gruboœæ_Kostek' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Gruboœæ_Kostek', Gruboœæ_Kostek_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Gruboœæ_Kostek_SpinEdit.Value.

      if    ( zti_1 >= Gruboœæ_Kostek_SpinEdit.MinValue )
        and ( zti_1 <= Gruboœæ_Kostek_SpinEdit.MaxValue ) then
        Gruboœæ_Kostek_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Gruboœæ_Kostek' ) then



  if not plik_ini.ValueExists( 'Opcje', 'Szybkoœæ_Zegara' ) then
    plik_ini.WriteInteger( 'Opcje', 'Szybkoœæ_Zegara', Szybkoœæ_Zegara_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Szybkoœæ_Zegara' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Szybkoœæ_Zegara', Szybkoœæ_Zegara_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Szybkoœæ_Zegara_SpinEdit.Value.

      if    ( zti_1 >= Szybkoœæ_Zegara_SpinEdit.MinValue )
        and ( zti_1 <= Szybkoœæ_Zegara_SpinEdit.MaxValue ) then
        Szybkoœæ_Zegara_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Szybkoœæ_Zegara' ) then




  if not plik_ini.ValueExists( 'Opcje', 'Szybkoœæ_Kamery' ) then
    plik_ini.WriteInteger( 'Opcje', 'Szybkoœæ_Kamery', Szybkoœæ_Kamery_SpinEdit.Value )
  else//if not plik_ini.ValueExists( 'Opcje', 'Szybkoœæ_Kamery' ) then
    begin

      zti_1 := plik_ini.ReadInteger( 'Opcje', 'Szybkoœæ_Kamery', Szybkoœæ_Kamery_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Szybkoœæ_Kamery_SpinEdit.Position.

      if    ( zti_1 >= Szybkoœæ_Kamery_SpinEdit.MinValue )
        and ( zti_1 <= Szybkoœæ_Kamery_SpinEdit.MaxValue ) then
        Szybkoœæ_Kamery_SpinEdit.Value := zti_1;

    end;
  //---//if not plik_ini.ValueExists( 'Opcje', 'Szybkoœæ_Kamery' ) then



  if not plik_ini.ValueExists( 'Opcje', 'Kamera_Na_Œrodek_Uk³adu_Kostek' ) then
    plik_ini.WriteBool( 'Opcje', 'Kamera_Na_Œrodek_Uk³adu_Kostek', Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Checked )
  else
    Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Kamera_Na_Œrodek_Uk³adu_Kostek', Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Checked ); // Je¿eli nie znajdzie to podstawia wartoœæ Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Automatyczne_Wczytywanie_Uk³adu_Kostek' ) then
    plik_ini.WriteBool( 'Opcje', 'Automatyczne_Wczytywanie_Uk³adu_Kostek', Automatyczne_Wczytywanie_Uk³adu_Kostek_CheckBox.Checked )
  else
    Automatyczne_Wczytywanie_Uk³adu_Kostek_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Automatyczne_Wczytywanie_Uk³adu_Kostek', Automatyczne_Wczytywanie_Uk³adu_Kostek_CheckBox.Checked ); // Je¿eli nie znajdzie to podstawia wartoœæ Automatyczne_Wczytywanie_Uk³adu_Kostek_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Wczytuj_Konfiguracjê_Kostek' ) then
    plik_ini.WriteBool( 'Opcje', 'Wczytuj_Konfiguracjê_Kostek', Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked )
  else
    Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Wczytuj_Konfiguracjê_Kostek', Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked ); // Je¿eli nie znajdzie to podstawia wartoœæ Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Kostki_Kwiatków' ) then
    plik_ini.WriteBool( 'Opcje', 'Kostki_Kwiatków', Kostki_Kwiatków_CheckBox.Checked )
  else
    Kostki_Kwiatków_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Kostki_Kwiatków', Kostki_Kwiatków_CheckBox.Checked ); // Je¿eli nie znajdzie to podstawia wartoœæ Kostki_Kwiatków_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Podpowiadaj_Tylko_Jeden_Ruch' ) then
    plik_ini.WriteBool( 'Opcje', 'Podpowiadaj_Tylko_Jeden_Ruch', Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked )
  else
    Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Podpowiadaj_Tylko_Jeden_Ruch', Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked ); // Je¿eli nie znajdzie to podstawia wartoœæ Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Pe³ny_Ekran' ) then
    plik_ini.WriteBool( 'Opcje', 'Pe³ny_Ekran', Pe³ny_Ekran_CheckBox.Checked )
  else
    Pe³ny_Ekran_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Pe³ny_Ekran', Pe³ny_Ekran_CheckBox.Checked ); // Je¿eli nie znajdzie to podstawia wartoœæ Pe³ny_Ekran_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Przybli¿enie' ) then
    plik_ini.WriteBool( 'Opcje', 'Przybli¿enie', Przybli¿enie_CheckBox.Checked )
  else
    Przybli¿enie_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Przybli¿enie', Przybli¿enie_CheckBox.Checked ); // Je¿eli nie znajdzie to podstawia wartoœæ Przybli¿enie_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne' ) then
    plik_ini.WriteBool( 'Opcje', 'Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne', Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne_CheckBox.Checked )
  else
    Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne', Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne_CheckBox.Checked ); // Je¿eli nie znajdzie to podstawia wartoœæ Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne_CheckBox.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Obrazek_T³a_Planszy__Wyœwietl' ) then
    plik_ini.WriteBool( 'Opcje', 'Obrazek_T³a_Planszy__Wyœwietl', Obrazek_T³a_Planszy__Wyœwietl_CheckBox.Checked )
  else
    Obrazek_T³a_Planszy__Wyœwietl_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Obrazek_T³a_Planszy__Wyœwietl', Obrazek_T³a_Planszy__Wyœwietl_CheckBox.Checked ); // Je¿eli nie znajdzie to podstawia wartoœæ Obrazek_T³a_Planszy__Wyœwietl_CheckBox.Checked.

  //if not plik_ini.ValueExists( 'Opcje', 'uk³ad_kostek_nazwa' ) then
  //  plik_ini.WriteString( 'Opcje', 'uk³ad_kostek_nazwa', wczytany_uk³ad_kostek_nazwa_pliku )
  //else
  //  wczytany_uk³ad_kostek_nazwa_pliku := plik_ini.ReadString( 'Opcje', 'uk³ad_kostek_nazwa', wczytany_uk³ad_kostek_nazwa_pliku ); //Je¿eli nie znajdzie to podstawia wartoœæ wczytany_uk³ad_kostek_nazwa_pliku.
  //
  //
  //
  //if    ( T³umaczenia_ListBox.ItemIndex >= 0 )
  //  and ( T³umaczenia_ListBox.ItemIndex <= T³umaczenia_ListBox.Items.Count - 1 ) then
  //  zts_1 := T³umaczenia_ListBox.Items[ T³umaczenia_ListBox.ItemIndex ]
  //else//if    ( T³umaczenia_ListBox.ItemIndex >= 0 ) (...)
  //  zts_1 := '';
  //
  //if not plik_ini.ValueExists( 'Opcje', 't³umaczenie_nazwa' ) then
  //  plik_ini.WriteString( 'Opcje', 't³umaczenie_nazwa', zts_1 )
  //else
  //  zts_1 := plik_ini.ReadString( 'Opcje', 't³umaczenie_nazwa', zts_1 ); //Je¿eli nie znajdzie to podstawia wartoœæ zts_1.
  //
  //for zti_1 := T³umaczenia_ListBox.Items.Count - 1 downto 0 do
  //  if T³umaczenia_ListBox.Items[ zti_1 ] = zts_1 then
  //    begin
  //
  //      T³umaczenia_ListBox.ItemIndex := zti_1;
  //      Break;
  //
  //    end;
  //  //---//if T³umaczenia_ListBox.Items[ zti_1 ] = zts_1 then


  blokuj_rysowanie_kostek := false;

  plik_ini.Free();
  {$endregion 'Plik ini.'}


  tekst_l := TStringList.Create();


  {$region 'Uk³ady kostek.'}
  zts_1 := ExtractFilePath( Application.ExeName ) + 'Uk³ady kostek\Uk³ady kostek.ini';

  if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      // Je¿eli pliku nie ma to nie trzeba wczytywaæ, mo¿na od razu dodawaæ linie.

      FindClose( search_rec );

      if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then
        //Application.MessageBox(   PChar(  'Nie odnaleziono katalogu uk³adów kostek: ' + ExtractFileDir( zts_1 ) + '.'  ), 'B³¹d', MB_ICONEXCLAMATION + MB_OK   )
        Application.MessageBox(   PChar(  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_katalogu_uk³adów_kostek + ': ' + ExtractFileDir( zts_1 ) + '.'  ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK   )
      else//if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then
        begin

          tekst_l.Text := wczytany_uk³ad_kostek_nazwa_pliku;
          tekst_l.SaveToFile( zts_1, TEncoding.UTF8 );

        end;
      //---//if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then

    end
  else//if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      // Plik jest.

      tekst_l.LoadFromFile( zts_1 );
      wczytany_uk³ad_kostek_nazwa_pliku := tekst_l.Text;
      wczytany_uk³ad_kostek_nazwa_pliku := StringReplace( wczytany_uk³ad_kostek_nazwa_pliku, #$D#$A, '', [ rfReplaceAll ] );

      zts_1 := '?';

      for zti_1 := Uk³ady_Kostek_MenuItem.Count - 1 downto 0 do
        if    ( Uk³ady_Kostek_MenuItem.Items[ zti_1 ].Name <> 'Uk³ady_Kostek__Odœwie¿_Listê_MenuItem' )
          //and (  StringReplace( Uk³ady_Kostek_MenuItem.Items[ zti_1 ].Caption, '&', '', [ rfReplaceAll ] ) = wczytany_uk³ad_kostek_nazwa_pliku  ) then
          and ( Uk³ady_Kostek_MenuItem.Items[ zti_1 ].Hint = wczytany_uk³ad_kostek_nazwa_pliku ) then
          begin

            zts_1 := '';
            Break;

          end;
        //---//if StringReplace( Uk³ady_Kostek_MenuItem.Items[ zti_1 ].Caption, '&', '', [ rfReplaceAll ] ) = wczytany_uk³ad_kostek_nazwa_pliku then

      if zts_1 <> '' then
        wczytany_uk³ad_kostek_nazwa_pliku := '';

    end;
  //---//if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.

  FindClose( search_rec );
  {$endregion 'Uk³ady kostek.'}


  {$region 'T³umaczenia.'}
  zts_1 := ExtractFilePath( Application.ExeName ) + 'T³umaczenia\T³umaczenia.ini';

  if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      // Je¿eli pliku nie ma to nie trzeba wczytywaæ, mo¿na od razu dodawaæ linie.

      FindClose( search_rec );

      if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then
        //Application.MessageBox(   PChar(  'Nie odnaleziono katalogu t³umaczeñ: ' + ExtractFileDir( zts_1 ) + '.'  ), 'B³¹d', MB_ICONEXCLAMATION + MB_OK   )
        Application.MessageBox(   PChar(  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_katalogu_t³umaczeñ + ': ' + ExtractFileDir( zts_1 ) + '.'  ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK   )
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

      for zti_1 := T³umaczenia_ListBox.Items.Count - 1 downto 0 do
        if T³umaczenia_ListBox.Items[ zti_1 ] = zts_1 then
          begin

            T³umaczenia_ListBox.ItemIndex := zti_1;
            Break;

          end;
        //---//if T³umaczenia_ListBox.Items[ zti_1 ] = zts_1 then

    end;
  //---//if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.

  FindClose( search_rec );
  {$endregion 'T³umaczenia.'}


  {$region 'Obrazki kostek.'}
  zts_1 := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\Obrazki kostek.ini';

  if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      // Je¿eli pliku nie ma to nie trzeba wczytywaæ, mo¿na od razu dodawaæ linie.

      FindClose( search_rec );

      if FindFirst(  ExtractFileDir( zts_1 ), faDirectory, search_rec  ) <> 0 then
        //Application.MessageBox(   PChar(  'Nie odnaleziono katalogu obrazków kostek: ' + ExtractFileDir( zts_1 ) + '.'  ), 'B³¹d', MB_ICONEXCLAMATION + MB_OK   )
        Application.MessageBox(   PChar(  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_katalogu_obrazków_kostek + ': ' + ExtractFileDir( zts_1 ) + '.'  ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK   )
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
        obrazki_kostek_nazwa_katalogu := 'Domyœlne';

      if obrazki_kostek_nazwa_katalogu = '*:?:*<>"\|/' then // Brak obrazków kostek.
        begin

          zt_component := nil;
          zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Brak_MenuItem' );

          if zt_component <> nil then
            TMenuItem(zt_component).Checked := true;

        end
      else//if obrazki_kostek_nazwa_katalogu = '*:?:*<>"\|/' then
        for zti_1 := Obrazki_Kostek_MenuItem.Count - 1 downto 0 do
          if    ( Obrazki_Kostek_MenuItem.Items[ zti_1 ].Name <> 'Obrazki_Kostek__Odœwie¿_Listê_MenuItem' )
            and ( Obrazki_Kostek_MenuItem.Items[ zti_1 ].Hint = obrazki_kostek_nazwa_katalogu ) then
            begin

              Obrazki_Kostek_MenuItem.Items[ zti_1 ].Checked := true;
              Break;

            end;
          //---//if T³umaczenia_ListBox.Items[ zti_1 ] = zts_1 then

    end;
  //---//if FindFirst( zts_1, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.

  FindClose( search_rec );
  {$endregion 'Obrazki kostek.'}


  {$region 'T³o planszy.'}
  zts_1 := ExtractFilePath( Application.ExeName ) + 'Plansza t³o.ini';

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

              // Plik obrazka t³a jest.

              //Wczytaj_T³o_Planszy( zts_1, true );
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
  {$endregion 'T³o planszy.'}

  tekst_l.Clear();

  tekst_l.Free();

end;//---//Funkcja Wczytaj_Ustawienia().

//Funkcja Zapisz_Ustawienia().
procedure TMahjong_3D_Form.Zapisz_Ustawienia( Sender : TObject );
var
  plik_ini : System.IniFiles.TIniFile;
  tekst_l : TStringList;
begin

  //if Application.MessageBox( 'Zapisaæ ustawienia?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) <> IDYES then
  if Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__zapisaæ_ustawienia ), PChar( t³umaczenie_komunikaty_r.komunikat__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) <> IDYES then
    Exit;


  plik_ini := System.IniFiles.TIniFile.Create(  ExtractFilePath( Application.ExeName ) + 'Mahjong.ini'  );


  plik_ini.WriteInteger( 'Opcje', 'Wyœwietlanie_Czasu', Wyœwietlanie_Czasu_RadioGroup.ItemIndex );
  plik_ini.WriteBool( 'Opcje', 'Wyœwietlanie_Iloœci_Par_Do_Zdjêcia', Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked );

  plik_ini.WriteInteger( 'Opcje', 'Margines_Planszy', Margines_Planszy_SpinEdit.Value );
  plik_ini.WriteInteger( 'Opcje', 'Szerokoœæ_Kostek', Szerokoœæ_Kostek_SpinEdit.Value );
  plik_ini.WriteInteger( 'Opcje', 'Wysokoœæ_Kostek', Wysokoœæ_Kostek_SpinEdit.Value );

  plik_ini.WriteInteger( 'Opcje', 'Gruboœæ_Kostek', Gruboœæ_Kostek_SpinEdit.Value );

  plik_ini.WriteInteger( 'Opcje', 'Szybkoœæ_Zegara', Szybkoœæ_Zegara_SpinEdit.Value );

  plik_ini.WriteInteger( 'Opcje', 'Szybkoœæ_Kamery', Szybkoœæ_Kamery_SpinEdit.Value );
  plik_ini.WriteBool( 'Opcje', 'Kamera_Na_Œrodek_Uk³adu_Kostek', Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Automatyczne_Wczytywanie_Uk³adu_Kostek', Automatyczne_Wczytywanie_Uk³adu_Kostek_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Wczytuj_Konfiguracjê_Kostek', Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Kostki_Kwiatków', Kostki_Kwiatków_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Podpowiadaj_Tylko_Jeden_Ruch', Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Pe³ny_Ekran', Pe³ny_Ekran_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Przybli¿enie', Przybli¿enie_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne', Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne_CheckBox.Checked );
  plik_ini.WriteBool( 'Opcje', 'Obrazek_T³a_Planszy__Wyœwietl', Obrazek_T³a_Planszy__Wyœwietl_CheckBox.Checked );

  //plik_ini.WriteString( 'Opcje', 'uk³ad_kostek_nazwa', wczytany_uk³ad_kostek_nazwa_pliku );
  //
  //if    ( T³umaczenia_ListBox.ItemIndex >= 0 )
  //  and ( T³umaczenia_ListBox.ItemIndex <= T³umaczenia_ListBox.Items.Count - 1 ) then
  //  plik_ini.WriteString( 'Opcje', 't³umaczenie_nazwa', T³umaczenia_ListBox.Items[ T³umaczenia_ListBox.ItemIndex ] )
  //else//if    ( T³umaczenia_ListBox.ItemIndex >= 0 )
  //  plik_ini.WriteString( 'Opcje', 't³umaczenie_nazwa', '' );


  plik_ini.Free();



  tekst_l := TStringList.Create();

  tekst_l.Text := wczytany_uk³ad_kostek_nazwa_pliku;
  tekst_l.SaveToFile(  ExtractFilePath( Application.ExeName ) + 'Uk³ady kostek\Uk³ady kostek.ini', TEncoding.UTF8  );
  tekst_l.Clear();


  if    ( T³umaczenia_ListBox.ItemIndex >= 0 )
    and ( T³umaczenia_ListBox.ItemIndex <= T³umaczenia_ListBox.Items.Count - 1 ) then
    tekst_l.Text := T³umaczenia_ListBox.Items[ T³umaczenia_ListBox.ItemIndex ];

  tekst_l.SaveToFile(  ExtractFilePath( Application.ExeName ) + 'T³umaczenia\T³umaczenia.ini', TEncoding.UTF8  );
  tekst_l.Clear();


  tekst_l.Text := obrazki_kostek_nazwa_katalogu;
  tekst_l.SaveToFile(  ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\Obrazki kostek.ini', TEncoding.UTF8  );
  tekst_l.Clear();


  tekst_l.Free();

end;//---//Funkcja Zapisz_Ustawienia().

//Funkcja Wczytaj_Listê_T³umaczeñ().
procedure TMahjong_3D_Form.Wczytaj_Listê_T³umaczeñ( Sender : TObject );
var
  zts : string;
  search_rec : TSearchRec;
begin

  T³umaczenia_ListBox.Items.Clear();

  //Je¿eli znajdzie plik zwraca 0, je¿eli nie znajdzie zwraca numer b³êdu. Na pocz¹tku znajduje '.' '..' potem listê plików.
  if FindFirst(  ExtractFilePath( Application.ExeName ) + 'T³umaczenia\*.txt', faAnyFile, search_rec  ) = 0 then //Application potrzebuje w uses Forms.
    begin

      repeat

        zts := search_rec.Name;
        zts := ReverseString( zts );
        Delete(  zts, 1, Pos( '.', zts )  );
        zts := ReverseString( zts );

        T³umaczenia_ListBox.Items.Add( zts );

      until FindNext( search_rec ) <> 0 //Zwraca dane kolejnego pliku zgodnego z parametrami wczeœniej wywo³anej funkcji FindFirst. Je¿eli mo¿na przejœæ do nastêpnego znalezionego pliku zwraca 0.

    end;
  //---//if FindFirst(  ExtractFilePath( Application.ExeName ) + 'Uk³ady kostek\*.txt', faAnyFile, search_rec  ) = 0 then //Application

  FindClose( search_rec );

end;//---//Funkcja Wczytaj_Listê_T³umaczeñ().

//Funkcja Wczytaj_T³umaczenie().
procedure TMahjong_3D_Form.Wczytaj_T³umaczenie( const nazwa_pliku : string );
const
  t³umaczenie_komunikaty_r_c_l : string = 't³umaczenie_komunikaty_r.';
  t³umaczenie__nowa_linia_c_l : string = '#13#10';
  t³umaczenie__wyró¿nik__elementy_c_l : string = '-->Elementy';
  t³umaczenie__wyró¿nik__podpowiedŸ_c_l : string = '-->PodpowiedŸ';

var
  czy_elementy, // Czy t³umaczenie dotyczy elementów komponentu (np. pozycje listy rozwijanej).
  czy_podpowiedŸ // Czy t³umaczenie dotyczy podpowiedzi komponentu.
    : boolean;

  i,
  zti_1,
  zti_2
    : integer;

  zts_1,
  zts_2,
  nazwa
    : string;

  rtti_field : TRttiField;
  rtti_type : TRttiType;

  tekst_l : TStringList;
  zt_component : TComponent;
begin

  zts_1 := ExtractFilePath( Application.ExeName ) + 'T³umaczenia\' + nazwa_pliku + '.txt';

  if not FileExists( zts_1 ) then // Sprawdza czy istnieje plik.
    begin

      //Application.MessageBox(  PChar( 'Nie odnaleziono pliku t³umaczenia: ' + zts_1 + '.' ), 'B³¹d', MB_ICONEXCLAMATION + MB_OK  );
      Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_pliku_t³umaczenia + ': ' + zts_1 + '.' ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK  );
      Wczytaj_Pomoc( nazwa_pliku );
      Exit;

    end;
  //---//if not FileExists( zts_1 ) then

  Screen.Cursor := crHourGlass;

  tekst_l := TStringList.Create();
  tekst_l.LoadFromFile( zts_1 ); // Je¿eli pliku nie ma to nie trzeba wczytywaæ, mo¿na od razu dodawaæ linie.

  if tekst_l.Count > 0 then //???
    rtti_type := TRTTIContext.Create.GetType(  TypeInfo( TT³umaczenie_Komunikaty_r )  );


  for i := 0 to tekst_l.Count - 1 do
    begin

      zts_1 := tekst_l[ i ];

      if Trim( zts_1 ) <> '' then
        begin

          zti_1 := Pos( '=', zts_1 );

          // Te pozycje menu nie podlegaj¹ t³umaczeniu.
          if   (  Pos( 'Uk³ady_Kostek__Uk³ad_Kostek_', zts_1 ) > 0  )
            or (  Pos( 'Obrazki_Kostek__Obrazek_Kostek_', zts_1 ) > 0  )
            or (
                     (  Pos( 'T³umaczenia_Panel', zts_1 ) > 0  ) // Etykieta panelu t³umaczenia nie podlega t³umaczeniu.
                 and (  Pos( t³umaczenie__wyró¿nik__podpowiedŸ_c_l + '=', zts_1 ) <= 0  )

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

              if Pos( t³umaczenie_komunikaty_r_c_l, zts_1 ) <= 0 then
                begin

                  {$region 'Komponenty.'}
                  if Pos( t³umaczenie__wyró¿nik__podpowiedŸ_c_l + '=', zts_1 ) > 0 then
                    begin

                      czy_podpowiedŸ := true;
                      zts_1 := StringReplace( zts_1, t³umaczenie__wyró¿nik__podpowiedŸ_c_l , '', [] );
                      zti_1 := Pos( '=', zts_1 );

                    end
                  else//if Pos( t³umaczenie__wyró¿nik__podpowiedŸ_c_l + '=', zts_1 ) > 0 then
                    czy_podpowiedŸ := false;

                  if Pos( t³umaczenie__wyró¿nik__elementy_c_l + '=', zts_1 ) > 0 then
                    begin

                      czy_elementy := true;
                      zts_1 := StringReplace( zts_1, t³umaczenie__wyró¿nik__elementy_c_l, '', [] );
                      zti_1 := Pos( '=', zts_1 );

                    end
                  else//if Pos( t³umaczenie__wyró¿nik__elementy_c_l + '=', zts_1 ) > 0 then
                    czy_elementy := false;


                  nazwa := Copy( zts_1, 1, zti_1 - 1 );
                  Delete( zts_1, 1, zti_1 );

                  zt_component := nil;

                  zt_component := Mahjong_3D_Form.FindComponent( nazwa );


                  if czy_podpowiedŸ then
                    begin

                      // Te podpowiedzi pozycji menu nie podlegaj¹ t³umaczeniu.
                      if   (  Pos( 'Obrazki_Kostek__Domyœlne_MenuItem', nazwa ) > 0  )
                        or (  Pos( 'Obrazki_Kostek__Brak_MenuItem', nazwa ) > 0  ) then
                        zt_component := nil;

                    end;
                  //---//if czy_podpowiedŸ then


                  if zt_component <> nil then
                    begin

                      zts_1 := StringReplace( zts_1, t³umaczenie__nowa_linia_c_l, #13 + #10, [ rfReplaceAll ] );

                      if Pos( '_Button', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedŸ then
                            TButton(zt_component).Caption := zts_1
                          else//if not czy_podpowiedŸ then
                            TButton(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_CheckBox', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedŸ then
                            TCheckBox(zt_component).Caption := zts_1
                          else//if not czy_podpowiedŸ then
                            TCheckBox(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_Label', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedŸ then
                            TLabel(zt_component).Caption := zts_1
                          else//if not czy_podpowiedŸ then
                            TLabel(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_MenuItem', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedŸ then
                            TMenuItem(zt_component).Caption := zts_1
                          else//if not czy_podpowiedŸ then
                            TMenuItem(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_Panel', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedŸ then
                            TPanel(zt_component).Caption := zts_1
                          else//if not czy_podpowiedŸ then
                            TPanel(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_RadioButton', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedŸ then
                            TRadioButton(zt_component).Caption := zts_1
                          else//if not czy_podpowiedŸ then
                            TRadioButton(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_RadioGroup', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedŸ then
                            begin

                              if not czy_elementy then
                                TRadioGroup(zt_component).Caption := zts_1
                              else//if not czy_elementy then
                                begin

                                  zti_2 := TRadioGroup(zt_component).ItemIndex;

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
                          else//if not czy_elementy then
                            TRadioGroup(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_ScrollBox', nazwa ) > 0 then
                        begin

                          if czy_podpowiedŸ then
                            TScrollBox(zt_component).Hint := zts_1;

                        end
                      else
                      if Pos( '_TabSheet', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedŸ then
                            TTabSheet(zt_component).Caption := zts_1
                          else//if not czy_podpowiedŸ then
                            TTabSheet(zt_component).Hint := zts_1;

                        end
                      else
                        ;

                    end;
                  //---//if zt_component <> nil then
                  {$endregion 'Komponenty.'}

                end
              else//if Pos( t³umaczenie_komunikaty_r_c_l, zts_1 ) <= 0 then
                begin

                  {$region 'Komunikaty.'}
                  // Wariant bez RTTI.
                  //
                  //nazwa := Copy( zts_1, 1, zti_1 - 1 );
                  //Delete( zts_1, 1, zti_1 );
                  //
                  //zts_1 := StringReplace( zts_1, t³umaczenie__nowa_linia_c_l, #13 + #10, [ rfReplaceAll ] );
                  //
                  //if nazwa = 't³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa' then // Wszystkie pola rekordu nale¿y rozpisaæ w ten sposób.
                  //  t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa := zts_1;
                  //---// Wariant bez RTTI.

                  nazwa := Copy( zts_1, 1, zti_1 - 1 );
                  Delete( zts_1, 1, zti_1 );

                  nazwa := StringReplace( nazwa, t³umaczenie_komunikaty_r_c_l, '', [ rfReplaceAll ] );
                  zts_1 := StringReplace( zts_1, t³umaczenie__nowa_linia_c_l, #13 + #10, [ rfReplaceAll ] );

                  for rtti_field in rtti_type.GetFields do
                    if rtti_field.Name = nazwa then
                      begin

                        if rtti_field.GetValue( @t³umaczenie_komunikaty_r ).Kind in [ System.TypInfo.tkUString, System.TypInfo.tkString, System.TypInfo.tkWString ] then
                          rtti_field.SetValue( @t³umaczenie_komunikaty_r, zts_1 );

                        Break;

                      end;
                    //---//if rtti_field.Name = nazwa then
                  {$endregion 'Komunikaty.'}

                end;
              //---//if Pos( t³umaczenie_komunikaty_r_c_l, zts_1 ) <= 0 then

            end;
          //---//if zti_1 > 1 then

        end;
      //---//if Trim( zts_1 ) <> '' then

    end;
  //---//for i := 0 to tekst_l.Count - 1 do

  tekst_l.Free();


  if wczytany_uk³ad_kostek_nazwa_pliku <> '' then
    //Uk³ad_Kostek_Nazwa_Label.Caption := 'Nazwa uk³adu kostek: ' + wczytany_uk³ad_kostek_nazwa_pliku + '.'
    Uk³ad_Kostek_Nazwa_Label.Caption := t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa + ': ' + wczytany_uk³ad_kostek_nazwa_pliku + '.'
  else//if wczytany_uk³ad_kostek_nazwa_pliku <> '' then
    //Uk³ad_Kostek_Nazwa_Label.Caption := 'Nazwa uk³adu kostek: <brak>.';
    Uk³ad_Kostek_Nazwa_Label.Caption := t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa + ': ' + t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa__brak + '.';

  zt_component := nil;
  zt_component := Mahjong_3D_Form.FindComponent( 'Uk³ady_Kostek__Odœwie¿_Listê_MenuItem' );

  if zt_component <> nil then
    TMenuItem(zt_component).Caption := t³umaczenie_komunikaty_r.menu_pozycja__odœwie¿_listê_uk³adów_kostek;


  zt_component := nil;
  zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Odœwie¿_Listê_MenuItem' );

  if zt_component <> nil then
    TMenuItem(zt_component).Caption := t³umaczenie_komunikaty_r.menu_pozycja__odœwie¿_listê_obrazków_kostek;


  zt_component := nil;
  zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Brak_MenuItem' );

  if zt_component <> nil then
    TMenuItem(zt_component).Caption := t³umaczenie_komunikaty_r.menu_pozycja__brak_obrazków_kostek;


  zt_component := nil;
  zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Domyœlne_MenuItem' );

  if zt_component <> nil then
    TMenuItem(zt_component).Caption := t³umaczenie_komunikaty_r.menu_pozycja__domyœlne_obrazki_kostek;


  Screen.Cursor := crDefault;


  Wczytaj_Pomoc( nazwa_pliku );


  kamera_ruch_ci¹g³y_treœæ := Kamera_Ruch_Ci¹g³y_MenuItem.Caption;
  Kamera_Ruch_Ci¹g³y_MenuItemClick( nil ); // Aby zaktualizowaæ wyœwietlanie aktywnoœci funkcji na etykiecie.

end;//---//Funkcja Wczytaj_T³umaczenie().

//T³umaczenia_Domyœlne_ButtonClick().
procedure TMahjong_3D_Form.T³umaczenia_Domyœlne_ButtonClick( Sender: TObject );
var
  zt_component : TComponent;
  zti : integer;
begin

  {$region 'T³umaczenia.'}
  t³umaczenie_komunikaty_r.inne__obrazek_t³a_planszy__filtr := 'Obrazki|*.bmp; *.gif; *.jpg; *.jpeg; *.png; *.tif; *.tiff|Wszystkie pliki|*.*';
  t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa := 'Nazwa uk³adu kostek';
  t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa__brak := '<brak>';

  t³umaczenie_komunikaty_r.komunikat__b³¹d := 'B³¹d';
  t³umaczenie_komunikaty_r.komunikat__brak_zdefiniowanych_obrazków_kostek := 'Brak zdefiniowanych obrazków kostek.';
  t³umaczenie_komunikaty_r.komunikat__brak_zdefiniowanych_uk³adów_kostek := 'Brak zdefiniowanych uk³adów kostek.';
  t³umaczenie_komunikaty_r.komunikat__gratulacje := 'Gratulacje';
  t³umaczenie_komunikaty_r.komunikat__komunikat := 'Komunikat';
  t³umaczenie_komunikaty_r.komunikat__koniec_gry := 'Koniec gry.';
  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_katalogu_obrazków_kostek := 'Nie odnaleziono katalogu obrazków kostek';
  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_katalogu_t³umaczeñ := 'Nie odnaleziono katalogu t³umaczeñ';
  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_katalogu_uk³adów_kostek := 'Nie odnaleziono katalogu uk³adów kostek';
  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_kostek_do_œci¹gniêcia := 'Nie odnaleziono kostek do œci¹gniêcia.';
  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_kostek_do_œci¹gniêcia__czy_przetasowaæ := 'Nie odnaleziono kostek do œci¹gniêcia.' + #13 + 'Czy przetasowaæ?';
  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_pliku_pomocy := 'Nie odnaleziono pliku pomocy';
  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_pliku_t³umaczenia := 'Nie odnaleziono pliku t³umaczenia';
  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_pliku_uk³adu_kostek := 'Nie odnaleziono pliku uk³adu kostek';
  t³umaczenie_komunikaty_r.komunikat__potwierdzenie := 'Potwierdzenie';
  t³umaczenie_komunikaty_r.komunikat__rozpocz¹æ_grê_od_nowa := 'Rozpocz¹æ grê od nowa?';
  t³umaczenie_komunikaty_r.komunikat__ustawiæ_pusty_obrazek_t³a_planszy := 'Ustawiæ pusty obrazek t³a planszy?';
  t³umaczenie_komunikaty_r.komunikat__wyczyœciæ_planszê := 'Wyczyœciæ planszê?';
  t³umaczenie_komunikaty_r.komunikat__zakoñczyæ_dzia³anie_programu := 'Zakoñczyæ dzia³anie programu?';
  t³umaczenie_komunikaty_r.komunikat__zapisaæ_ustawienia := 'Zapisaæ ustawienia?';
  t³umaczenie_komunikaty_r.komunikat__zaprezentowaæ_kostki := 'Zaprezentowaæ kostki?' + #13 + 'Zakoñczy to trwaj¹c¹ grê.';

  t³umaczenie_komunikaty_r.menu_pozycja__brak_obrazków_kostek := 'Brak';
  t³umaczenie_komunikaty_r.menu_pozycja__domyœlne_obrazki_kostek := 'Domyœlne';
  t³umaczenie_komunikaty_r.menu_pozycja__odœwie¿_listê_obrazków_kostek := 'Odœwie¿ listê obrazków kostek';
  t³umaczenie_komunikaty_r.menu_pozycja__odœwie¿_listê_uk³adów_kostek := 'Odœwie¿ listê uk³adów kostek';

  t³umaczenie_komunikaty_r.panel_napis__cofniêcia_iloœæ := 'Cofniêcia';
  t³umaczenie_komunikaty_r.panel_napis__par_do_zdjêcia := 'Par do zdjêcia';
  t³umaczenie_komunikaty_r.panel_napis__podpowiedzi_iloœæ := 'Podpowiedzi';
  t³umaczenie_komunikaty_r.panel_napis__przetasowania_iloœæ := 'Przetasowania';
  {$endregion 'T³umaczenia.'}

  if    ( Sender <> nil )
    and (
             ( TComponent(Sender).Name = T³umaczenia_Domyœlne_Button.Name )
          or ( TComponent(Sender).Name = T³umaczenia_Zastosuj_Button.Name ) // Je¿eli w t³umaczeniu czegoœ zabraknie to zostanie wartoœæ domyœlna.
        ) then
    begin

      if TComponent(Sender).Name = T³umaczenia_Domyœlne_Button.Name then // Je¿eli w t³umaczeniu czegoœ zabraknie to zostanie wartoœæ domyœlna.
        T³umaczenia_ListBox.ItemIndex := -1;

      T³umaczenia_ListBox.Hint := '';


      Gra_MenuItem.Caption := 'Gra';
      Gra__Demo_MenuItem.Caption := 'Demo';
      Gra__Cofnij_MenuItem.Caption := 'Cofnij';
      Gra__Nowa_Gra_MenuItem.Caption := 'Nowa gra';
      Gra__PodpowiedŸ_MenuItem.Caption := 'PodpowiedŸ';
      Gra__Przetasuj_MenuItem.Caption := 'Przetasuj';
      Gra__Wyczyœæ_Planszê_MenuItem.Caption := 'Wyczyœæ planszê';
      Gra__WyjdŸ_MenuItem.Caption := 'WyjdŸ';
      Gra__Zaprezentuj_Kostki_MenuItem.Caption := 'Zaprezentuj kostki';
      Uk³ady_Kostek_MenuItem.Caption := 'Uk³ady kostek';
      Obrazki_Kostek_MenuItem.Caption := 'Obrazki kostek';
      Opcje_MenuItem.Caption := 'Opcje';
      Pomoc_MenuItem.Caption := 'Pomoc';
      kamera_ruch_ci¹g³y_treœæ := 'Ci¹g³y ruch kamery';
      //Kamera_Ruch_Ci¹g³y_MenuItem.Caption := kamera_ruch_ci¹g³y_treœæ; // Zaktualizuje siê w Kamera_Ruch_Ci¹g³y_MenuItemClick( nil ).
      Pe³ny_Ekran_MenuItem.Caption := 'Pe³ny ekran';

      Opcje_TabSheet.Caption := 'Opcje';
      Opcje_TabSheet.Hint := '';
      Pomoc_TabSheet.Caption := 'Pomoc';
      Pomoc_TabSheet.Hint := '';
      T³umaczenia_TabSheet.Caption := 'T³umaczenia';
      T³umaczenia_TabSheet.Hint := '';
      O_Programie_TabSheet.Caption := 'O programie';
      O_Programie_TabSheet.Hint := '';

      Zapisz_Ustawienia_Button.Caption := 'Zapisz ustawienia';
      Zapisz_Ustawienia_Button.Hint := '';
      Opcje_Ukryj_Button.Hint := 'Ukryj opcje.';

      Opcje_ScrollBox.Hint := '';
      Wyœwietlanie_Czasu_RadioGroup.Caption := 'Wyœwietlanie czasu';

        zti := Wyœwietlanie_Czasu_RadioGroup.ItemIndex;
        Wyœwietlanie_Czasu_RadioGroup.Items.Clear();
        Wyœwietlanie_Czasu_RadioGroup.Items.Add( 'Brak' );
        Wyœwietlanie_Czasu_RadioGroup.Items.Add( 'Czas gry' );
        Wyœwietlanie_Czasu_RadioGroup.Items.Add( 'Czas' );

        if    ( zti >= 0 )
          and ( zti <= Wyœwietlanie_Czasu_RadioGroup.Items.Count ) then
          Wyœwietlanie_Czasu_RadioGroup.ItemIndex := zti;

      Wyœwietlanie_Czasu_RadioGroup.Hint := '';


      Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Caption := 'Wyœwietlanie iloœci par do zdjêcia';

      Szerokoœæ_Kostek_Etykieta_Label.Caption := 'Szerokoœæ kostek';
      Szerokoœæ_Kostek_Etykieta_Label.Hint := '';
      Szerokoœæ_Kostek_SpinEdit.Hint := '';
      Wysokoœæ_Kostek_Etykieta_Label.Caption := 'Wysokoœæ kostek';
      Wysokoœæ_Kostek_Etykieta_Label.Hint := '';
      Wysokoœæ_Kostek_SpinEdit.Hint := '';
      Gruboœæ_Kostek_Etykieta_Label.Caption := 'Gruboœæ kostek';
      Gruboœæ_Kostek_Etykieta_Label.Hint := '';
      Gruboœæ_Kostek_SpinEdit.Hint := '';
      Szybkoœæ_Kamery_Etykieta_Label.Caption := 'Szybkoœæ ruchu kamery';
      Szybkoœæ_Kamery_Etykieta_Label.Hint := '';
      Szybkoœæ_Kamery_SpinEdit.Hint := '';
      Szybkoœæ_Zegara_Etykieta_Label.Caption := 'Szybkoœæ zegara';
      Szybkoœæ_Zegara_Etykieta_Label.Hint := '';
      Szybkoœæ_Zegara_SpinEdit.Hint := '';
      Margines_Planszy_Etykieta_Label.Caption := 'Margines planszy';
      Margines_Planszy_Etykieta_Label.Hint := '';
      Margines_Planszy_SpinEdit.Hint := '';

      Wartoœci_Domyœlne_Button.Caption := 'Wartoœci domyœlne';
      Wartoœci_Domyœlne_Button.Hint := '';
      Wczytaj_Ustawienia_Button.Caption := 'Wczytaj ustawienia';
      Wczytaj_Ustawienia_Button.Hint := '';
      Uk³ad_Kostek_Nazwa_Wyczyœæ_Button.Caption := 'Nazwa uk³adu kostek - wyczyœæ';
      Uk³ad_Kostek_Nazwa_Wyczyœæ_Button.Hint := '';
      Szybkoœæ_Kamery_SpinEdit.Hint := '';
      Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Caption := 'Kamera na œrodek uk³adu kostek';
      Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Hint := '';
      Automatyczne_Wczytywanie_Uk³adu_Kostek_CheckBox.Caption := 'Automatyczne wczytywanie uk³adu kostek.';
      Automatyczne_Wczytywanie_Uk³adu_Kostek_CheckBox.Hint := 'Automatyczne wczytywanie zapisanego uk³adu kostek po uruchomieniu gry.';
      Wczytuj_Konfiguracjê_Kostek_CheckBox.Caption := 'Wczytuj konfiguracjê kostek';
      Wczytuj_Konfiguracjê_Kostek_CheckBox.Hint := '';
      Kostki_Kwiatków_CheckBox.Caption := 'Kostki kwiatków';
      Kostki_Kwiatków_CheckBox.Hint := 'Zamiast dwóch zestawów kostek pór roku u¿yj jednego zestawu kostek pór roku i jednego zestawu kostek kwiatków.';
      Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Caption := 'Podpowiadaj tylko jeden ruch';
      Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Hint := '';
      Pe³ny_Ekran_CheckBox.Caption := 'Pe³ny ekran';
      Pe³ny_Ekran_CheckBox.Hint := '';
      Przybli¿enie_CheckBox.Caption := 'Panel przybli¿enia';
      Przybli¿enie_CheckBox.Hint := 'Wyœwietl panel przybli¿enia.';
      Obrazek_T³a_Planszy__Bok_Panel.Caption := '';
      Obrazek_T³a_Planszy__Bok_Panel.Hint := 'Wska¿ czêœæ t³a do zmodyfikowania.';
      Obrazek_T³a_Planszy__Góra_RadioButton.Caption := 'Góra';
      Obrazek_T³a_Planszy__Góra_RadioButton.Hint := '';
      Obrazek_T³a_Planszy__Lewo_RadioButton.Caption := 'Lewo';
      Obrazek_T³a_Planszy__Lewo_RadioButton.Hint := '';
      Obrazek_T³a_Planszy__Przód_RadioButton.Caption := 'Przód';
      Obrazek_T³a_Planszy__Przód_RadioButton.Hint := '';
      Obrazek_T³a_Planszy__Prawo_RadioButton.Caption := 'Prawo';
      Obrazek_T³a_Planszy__Prawo_RadioButton.Hint := '';
      Obrazek_T³a_Planszy__Dó³_RadioButton.Caption := 'Dó³';
      Obrazek_T³a_Planszy__Dó³_RadioButton.Hint := '';
      Obrazek_T³a_Planszy__Ty³_RadioButton.Caption := 'Ty³';
      Obrazek_T³a_Planszy__Ty³_RadioButton.Hint := '';
      Obrazek_T³a_Planszy__Chmury_RadioButton.Caption := 'Chmury';
      Obrazek_T³a_Planszy__Chmury_RadioButton.Hint := '';
      Obrazek_T³a_Planszy__Wszystkie_RadioButton.Caption := 'Wszystkie';
      Obrazek_T³a_Planszy__Wszystkie_RadioButton.Hint := '';
      Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne_CheckBox.Caption := 'Wzglêdne œcie¿ki obrazków';
      Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne_CheckBox.Hint := 'Próbuj zapisaæ œcie¿ki do plików obrazków w postaci wzglêdnej.';
      Obrazek_T³a_Planszy__Wybierz_Button.Caption := 'Wybierz obrazek t³a planszy';
      Obrazek_T³a_Planszy__Wybierz_Button.Hint := '';
      Obrazek_T³a_Planszy__Wyœwietl_CheckBox.Caption := 'Wyœwietl obrazek t³a planszy';
      Obrazek_T³a_Planszy__Wyœwietl_CheckBox.Hint := '';
      Obrazek_T³a_Planszy__Brak_Button.Caption := 'Brak obrazka t³a planszy';
      Obrazek_T³a_Planszy__Brak_Button.Hint := '';
      Kamera_Wspó³rzêdne_Etykieta_Label.Caption := 'Wspó³rzêdne kamery i jej celu';
      Kamera_Wspó³rzêdne_Etykieta_Label.Hint := '';
      Kamera_Wspó³rzêdne_Label.Hint := '';

      T³umaczenia_Panel.Hint := '';
      T³umaczenia_Odœwie¿_Button.Caption := 'Odœwie¿';
      T³umaczenia_Odœwie¿_Button.Hint := '';
      T³umaczenia_Zastosuj_Button.Caption := 'Zastosuj';
      T³umaczenia_Zastosuj_Button.Hint := '';
      T³umaczenia_Domyœlne_Button.Caption := 'Domyœlne';
      T³umaczenia_Domyœlne_Button.Hint := 'Ustaw domyœlne t³umaczenie.';

      Pomoc_Memo.Hint := '';


      if wczytany_uk³ad_kostek_nazwa_pliku <> '' then
        //Uk³ad_Kostek_Nazwa_Label.Caption := 'Nazwa uk³adu kostek: ' + wczytany_uk³ad_kostek_nazwa_pliku + '.'
        Uk³ad_Kostek_Nazwa_Label.Caption := t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa + ': ' + wczytany_uk³ad_kostek_nazwa_pliku + '.'
      else//if wczytany_uk³ad_kostek_nazwa_pliku <> '' then
        //Uk³ad_Kostek_Nazwa_Label.Caption := 'Nazwa uk³adu kostek: <brak>.';
        Uk³ad_Kostek_Nazwa_Label.Caption := t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa + ': ' + t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa__brak + '.';

      Uk³ad_Kostek_Nazwa_Label.Hint := '';


      Przybli¿enie_Panel.Caption := '^...v';
      Przybli¿enie_Panel.Hint := 'Przybli¿enie.';


      zt_component := nil;
      zt_component := Mahjong_3D_Form.FindComponent( 'Uk³ady_Kostek__Odœwie¿_Listê_MenuItem' );

      if zt_component <> nil then
        TMenuItem(zt_component).Caption := t³umaczenie_komunikaty_r.menu_pozycja__odœwie¿_listê_uk³adów_kostek;


      zt_component := nil;
      zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Odœwie¿_Listê_MenuItem' );

      if zt_component <> nil then
        TMenuItem(zt_component).Caption := t³umaczenie_komunikaty_r.menu_pozycja__odœwie¿_listê_obrazków_kostek;


      zt_component := nil;
      zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Brak_MenuItem' );

      if zt_component <> nil then
        TMenuItem(zt_component).Caption := t³umaczenie_komunikaty_r.menu_pozycja__brak_obrazków_kostek;


      zt_component := nil;
      zt_component := Mahjong_3D_Form.FindComponent( 'Obrazki_Kostek__Domyœlne_MenuItem' );

      if zt_component <> nil then
        TMenuItem(zt_component).Caption := t³umaczenie_komunikaty_r.menu_pozycja__domyœlne_obrazki_kostek;

    end;
  //---//if    ( Sender <> nil ) (...)


  Wczytaj_Pomoc( '*:?:*<>"\|/' ); // Plik domyœlny.


  Kamera_Ruch_Ci¹g³y_MenuItemClick( nil ); // Aby zaktualizowaæ wyœwietlanie aktywnoœci funkcji na etykiecie.

end;//---//T³umaczenia_Domyœlne_ButtonClick().

//Funkcja Wczytaj_Listê_Obrazków_Kostek().
procedure TMahjong_3D_Form.Wczytaj_Listê_Obrazków_Kostek( Sender : TObject );
var
  zts : string;
  zti : integer;
  search_rec : TSearchRec;
  menu_item : TMenuItem;
begin

  for zti := Obrazki_Kostek_MenuItem.Count - 1 downto 0 do
    Obrazki_Kostek_MenuItem.Items[ zti ].Free();


  if Sender = nil then // Tylko zwalnia pamiêæ.
    Exit;

  Screen.Cursor := crHourGlass;

  //menu_item := TMenuItem.Create( Application );
  menu_item := TMenuItem.Create( Mahjong_3D_Form ); // Dla FindComponent().
  menu_item.Name := 'Obrazki_Kostek__Brak_MenuItem';
  //menu_item.Caption := 'Brak';
  menu_item.Caption := t³umaczenie_komunikaty_r.menu_pozycja__brak_obrazków_kostek;
  menu_item.Hint := 'Brak';
  menu_item.AutoCheck := true;
  menu_item.RadioItem := true;
  menu_item.OnClick := Obrazki_Kostek__Obrazek_Kostek_MenuItemClick;

  Obrazki_Kostek_MenuItem.Add( menu_item );


  //menu_item := TMenuItem.Create( Application );
  menu_item := TMenuItem.Create( Mahjong_3D_Form ); // Dla FindComponent().
  menu_item.Name := 'Obrazki_Kostek__Domyœlne_MenuItem';
  //menu_item.Caption := 'Domyœlne';
  menu_item.Caption := t³umaczenie_komunikaty_r.menu_pozycja__domyœlne_obrazki_kostek;
  menu_item.Hint := 'Domyœlne';
  menu_item.AutoCheck := true;
  menu_item.RadioItem := true;
  menu_item.OnClick := Obrazki_Kostek__Obrazek_Kostek_MenuItemClick;

  Obrazki_Kostek_MenuItem.Add( menu_item );


  zti := 0;

  // Je¿eli znajdzie plik zwraca 0, je¿eli nie znajdzie zwraca numer b³êdu. Na pocz¹tku znajduje '.' '..' potem listê plików.
  if FindFirst(  ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\*', faDirectory, search_rec  ) = 0 then //Application potrzebuje w uses Forms.
    begin

      repeat

        if    ( search_rec.Attr = faDirectory )
          and ( search_rec.Name <> '.' )
          and ( search_rec.Name <> '..' )
          and (  AnsiLowerCase( search_rec.Name ) <> 'brak'  ) // Te nazwy katalogów s¹ zastrze¿one.
          and (  AnsiLowerCase( search_rec.Name)  <> 'domyœlne'  ) then // Te nazwy katalogów s¹ zastrze¿one.
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


      until FindNext( search_rec ) <> 0 //Zwraca dane kolejnego pliku zgodnego z parametrami wczeœniej wywo³anej funkcji FindFirst. Je¿eli mo¿na przejœæ do nastêpnego znalezionego pliku zwraca 0.

    end;
  //---//if FindFirst(  ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\', faDirectory, search_rec  ) = 0 then //Application

  FindClose( search_rec );

  //menu_item := TMenuItem.Create( Application );
  menu_item := TMenuItem.Create( Mahjong_3D_Form ); // Dla FindComponent().
  menu_item.Name := 'Obrazki_Kostek__Odœwie¿_Listê_MenuItem';
  //menu_item.Caption := 'Odœwie¿ listê obrazków kostek';
  menu_item.Caption := t³umaczenie_komunikaty_r.menu_pozycja__odœwie¿_listê_obrazków_kostek;
  menu_item.OnClick := Wczytaj_Listê_Obrazków_Kostek;

  Obrazki_Kostek_MenuItem.Add( menu_item );

  Screen.Cursor := crDefault;


  if    ( Sender <> nil )
    //and ( TComponent(Sender).Name = Obrazki_Kostek__Odœwie¿_Listê_MenuItem.Name )
    and ( TComponent(Sender).Name <> Mahjong_3D_Form.Name )
    and ( Obrazki_Kostek_MenuItem.Count < 3 ) then
    //Application.MessageBox( 'Brak zdefiniowanych obrazków kostek.', 'B³¹d', MB_ICONEXCLAMATION + MB_OK );
    Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__brak_zdefiniowanych_obrazków_kostek ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK  );

end;//---//Funkcja Wczytaj_Listê_Obrazków_Kostek().

//Funkcja Wczytaj_Obrazki_Kostek().
procedure TMahjong_3D_Form.Wczytaj_Obrazki_Kostek( const nazwa_katalogu : string; pomiñ_ini : boolean = false );
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
  //   pomiñ_ini:
  //     true - wczyta wszystkie parametry obrazków kostek.
  //     false - wczyta tylko wartoœci przezroczystoœci zaznaczenia.
  //

  if nazwa_katalogu <> 'Brak' then
    begin

      if nazwa_katalogu <> '' then
        zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\' + nazwa_katalogu
      else//if nazwa_katalogu <> '' then
        zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\Domyœlne';


      if FindFirst( zts, faDirectory, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
        begin

          FindClose( search_rec );
          //Application.MessageBox(  PChar( 'Nie odnaleziono katalogu obrazków kostek: ' + zts + '.' ), 'B³¹d', MB_ICONEXCLAMATION + MB_OK  );
          Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_katalogu_obrazków_kostek + ': ' + zts + '.' ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK  );
          Exit;

        end;
      //---//if FindFirst( zts, faDirectory, search_rec ) <> 0 then // Sprawdza czy istnieje plik.


      Screen.Cursor := crHourGlass;

      FindClose( search_rec );


      //if nazwa_katalogu <> '' then
      //  komunikaty := zts + '\' + nazwa_katalogu + '.ini' // Tutaj tymczasowo jako adres pliku.
      //else//if nazwa_katalogu <> '' then
      //  komunikaty := zts + '\Domyœlne.ini';
      //
      //if    ( not pomiñ_ini )
      //  and ( Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked ) then
      //  begin
      //
      //    Wczytaj_Ini_Obrazków_Kostek( komunikaty );
      //
      //  end;
      ////---//if    ( not pomiñ_ini ) (...)

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
    //Application.MessageBox(  PChar(  komunikaty + '.' ), 'B³¹d', MB_OK + MB_ICONEXCLAMATION  );
    Application.MessageBox(   PChar(  komunikaty + '.' ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_OK + MB_ICONEXCLAMATION   );

end;//---//Funkcja Wczytaj_Obrazki_Kostek().

//Funkcja Wczytaj_Ini_Obrazków_Kostek().
procedure TMahjong_3D_Form.Wczytaj_Ini_Obrazków_Kostek( const adres_pliku : string );
var
  search_rec : TSearchRec;
  plik_ini : System.IniFiles.TIniFile;
  zti : integer;
begin

  Exit;

  //
  // Funkcja wczyta parametry obrazków kostek.
  //
  // Zwraca wartoœci przezroczystoœci zaznaczenia.
  //
  // Parametry:
  //   adres_pliku
  //

  kamera_œrodek_x := 0;
  kamera_œrodek_y := 0;
  kamera_œrodek_z := 0;

  kamera_na_œrodek_x := 0;
  kamera_na_œrodek_y := 0;


  if FindFirst( adres_pliku, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
    begin

      {$region 'Plik ini.'}
      plik_ini := System.IniFiles.TIniFile.Create( adres_pliku );

      blokuj_rysowanie_kostek := true;


      zti := plik_ini.ReadInteger( 'Obrazki', 'Margines_Planszy', Margines_Planszy_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Wyœwietlanie_Czasu_RadioGroup.ItemIndex.

      if    ( zti >= Margines_Planszy_SpinEdit.MinValue )
        and ( zti <= Margines_Planszy_SpinEdit.MaxValue ) then
        Margines_Planszy_SpinEdit.Value := zti;



      zti := plik_ini.ReadInteger( 'Obrazki', 'Szerokoœæ_Kostek', Szerokoœæ_Kostek_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Szerokoœæ_Kostek_SpinEdit.Value.

      if    ( zti >= Szerokoœæ_Kostek_SpinEdit.MinValue )
        and ( zti <= Szerokoœæ_Kostek_SpinEdit.MaxValue ) then
        Szerokoœæ_Kostek_SpinEdit.Value := zti;


      zti := plik_ini.ReadInteger( 'Obrazki', 'Wysokoœæ_Kostek', Wysokoœæ_Kostek_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Wysokoœæ_Kostek_SpinEdit.Value.

      if    ( zti >= Wysokoœæ_Kostek_SpinEdit.MinValue )
        and ( zti <= Wysokoœæ_Kostek_SpinEdit.MaxValue ) then
        Wysokoœæ_Kostek_SpinEdit.Value := zti;


      zti := plik_ini.ReadInteger( 'Obrazki', 'Gruboœæ_Kostek', Gruboœæ_Kostek_SpinEdit.Value ); // Je¿eli nie znajdzie to podstawia wartoœæ Gruboœæ_Kostek_SpinEdit.Value.

      if    ( zti >= Gruboœæ_Kostek_SpinEdit.MinValue )
        and ( zti <= Gruboœæ_Kostek_SpinEdit.MaxValue ) then
        Gruboœæ_Kostek_SpinEdit.Value := zti;


      kamera_œrodek_x := plik_ini.ReadFloat( 'Obrazki', 'Kamera_X', kamera_œrodek_x ); // Je¿eli nie znajdzie to podstawia wartoœæ kamera_œrodek_x.
      kamera_œrodek_y := plik_ini.ReadFloat( 'Obrazki', 'Kamera_Y', kamera_œrodek_y ); // Je¿eli nie znajdzie to podstawia wartoœæ kamera_œrodek_y.
      kamera_œrodek_z := plik_ini.ReadFloat( 'Obrazki', 'Kamera_Z', kamera_œrodek_z ); // Je¿eli nie znajdzie to podstawia wartoœæ kamera_œrodek_z.

      kamera_na_œrodek_x := plik_ini.ReadFloat( 'Obrazki', 'Kamera_Na_X', kamera_na_œrodek_x ); // Je¿eli nie znajdzie to podstawia wartoœæ kamera_na_œrodek_x.
      kamera_na_œrodek_y := plik_ini.ReadFloat( 'Obrazki', 'Kamera_Na_Y', kamera_na_œrodek_y ); // Je¿eli nie znajdzie to podstawia wartoœæ kamera_na_œrodek_y.


      blokuj_rysowanie_kostek := false;

      plik_ini.Free();
      {$endregion 'Plik ini.'}

    end;
  //---//if FindFirst( adres_pliku, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.

  FindClose( search_rec );


  Kamera_Ustawienie_Pocz¹tkowe();

end;//---//Funkcja Wczytaj_Ini_Obrazków_Kostek().

//Funkcja Wczytaj_Pomoc().
procedure TMahjong_3D_Form.Wczytaj_Pomoc( const nazwa_pliku : string );
var
  search_rec : TSearchRec;
  zts : string;
begin

  if nazwa_pliku = '*:?:*<>"\|/' then // Plik domyœlny.
    zts := ExtractFilePath( Application.ExeName ) + 'Pomoc\Pomoc.txt'
  else//if nazwa_pliku = '*:?:*<>"\|/' then
    zts := ExtractFilePath( Application.ExeName ) + 'Pomoc\' + nazwa_pliku + ' Pomoc.txt';

  if FindFirst( zts, faAnyFile, search_rec ) <> 0 then // Sprawdza czy istnieje plik.
    begin

      FindClose( search_rec );
      //Application.MessageBox(  PChar( 'Nie odnaleziono pliku t³umaczenia: ' + zts + '.' ), 'B³¹d', MB_ICONEXCLAMATION + MB_OK  );
      Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_pliku_pomocy + ': ' + zts + '.' ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK  );

      if zts = ExtractFilePath( Application.ExeName ) + 'Pomoc\Pomoc.txt' then // Plik domyœlny.
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
      Application.MessageBox(   PChar(  t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_pliku_pomocy + ': ' + zts + ' [2].' + #13 + E.Message + ' ' + IntToStr( E.HelpContext )  ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_OK + MB_ICONEXCLAMATION   );
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

  if zt_gl_texture <> nil then // Wyczyœci teksturê i zast¹pi j¹ now¹.
    GLMaterialLibrary1.Materials.Delete(  GLMaterialLibrary1.Materials.GetTextureIndex( zt_gl_texture )  );


  if adres_pliku = '' then
    Exit;


  zt_gl_libMaterial := GLMaterialLibrary1.AddTextureMaterial( nazwa_tekstury, adres_pliku );
  zt_gl_libMaterial.Material.Texture.Disabled := false;
  zt_gl_libMaterial.Material.Texture.TextureMode := GLS.Texture.tmDecal;

  //zt_gl_libMaterial.TextureScale.X := 10;
  //Reszt_gl_libMaterialult.TextureScale.Y := 10;

  zt_gl_libMaterial.Material.BlendingMode := bmTransparency;

  if nazwa_tekstury = 'Chmury' then
    zt_gl_libMaterial.Material.FrontProperties.Diffuse.Alpha := 0.75
  else//if nazwa_tekstury = 'Chmury' then
    zt_gl_libMaterial.Material.FrontProperties.Diffuse.Alpha := 1; // 0 - nie widaæ, 1 - brak przezroczystoœci.

end;//---//Funkcja Tekstury_Zasobnik_Zmodyfikuj().

//Funkcja Wczytaj_T³o_Planszy().
procedure TMahjong_3D_Form.Wczytaj_T³o_Planszy( const adres_pliku : string; nie_zapisuj : boolean = false );
var
  tekstury_t : array of string;

  //Funkcja Zmodyfikuj_Teksturê() w Wczytaj_T³o_Planszy().
  procedure Zmodyfikuj_Teksturê( nazwa_tekstury, adres_pliku_f : string );
  begin

    Tekstury_Zasobnik_Zmodyfikuj( nazwa_tekstury, adres_pliku_f );


    SetLength(  tekstury_t, Length( tekstury_t ) + 1  );

    tekstury_t[ Length( tekstury_t ) - 1 ] := nazwa_tekstury + '*' + adres_pliku_f;

  end;//---//Funkcja Zmodyfikuj_Teksturê() w Wczytaj_T³o_Planszy().

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
begin//Funkcja Wczytaj_T³o_Planszy().

  Screen.Cursor := crHourGlass;


  SetLength( tekstury_t, 0 );

  if   ( Obrazek_T³a_Planszy__Góra_RadioButton.Checked )
    or ( Obrazek_T³a_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Teksturê( 'Góra', adres_pliku );

  if   ( Obrazek_T³a_Planszy__Lewo_RadioButton.Checked )
    or ( Obrazek_T³a_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Teksturê( 'Lewo', adres_pliku );

  if   ( Obrazek_T³a_Planszy__Przód_RadioButton.Checked )
    or ( Obrazek_T³a_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Teksturê( 'Przód', adres_pliku ); // Za kostkami.

  if   ( Obrazek_T³a_Planszy__Prawo_RadioButton.Checked )
    or ( Obrazek_T³a_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Teksturê( 'Prawo', adres_pliku );

  if   ( Obrazek_T³a_Planszy__Dó³_RadioButton.Checked )
    or ( Obrazek_T³a_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Teksturê( 'Dó³', adres_pliku );

  if   ( Obrazek_T³a_Planszy__Ty³_RadioButton.Checked )
    or ( Obrazek_T³a_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Teksturê( 'Ty³', adres_pliku );

  if   ( Obrazek_T³a_Planszy__Chmury_RadioButton.Checked )
    or ( Obrazek_T³a_Planszy__Wszystkie_RadioButton.Checked ) then
    Zmodyfikuj_Teksturê( 'Chmury', adres_pliku );



  {$region 'Zapisuje adres wczytanego pliku t³a planszy.'}
  if not nie_zapisuj then
    begin

      adres_pliku_ini := ExtractFilePath( Application.ExeName ) + 'Plansza t³o.ini';

      tekst_l := TStringList.Create();


      if FindFirst( adres_pliku_ini, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
        begin

          // Plik jest.

          FindClose( search_rec );

          tekst_l.LoadFromFile( adres_pliku_ini, TEncoding.UTF8 ); // Lepiej wskazaæ kodowanie.

          for i := 0 to Length( tekstury_t ) - 1 do // Dla wszystkich modyfikowanych tekstur.
            begin

              czy_w_pliku_jest_informacja_o_teksturze := false;


              zts_1 := tekstury_t[ i ];

              zts_1 := StringReplace( zts_1, #$D#$A, '', [ rfReplaceAll ] );

              zti := Pos( '*', zts_1 );

              zts_2 := Copy( zts_1, 1, zti - 1 ); // Nazwa tekstury nowej.
              Delete( zts_1, 1, zti ); // Adres pliku.


              for j := 0 to tekst_l.Count - 1 do // Porównuje i ewentualnie zmienia zawartoœæ pliku ini.
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

          // Je¿eli pliku nie ma to nie trzeba wczytywaæ, mo¿na od razu dodawaæ linie.


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
  {$endregion 'Zapisuje adres wczytanego pliku t³a planszy.'}


  SetLength( tekstury_t, 0 );

  Screen.Cursor := crDefault;

end;//---//Funkcja Wczytaj_T³o_Planszy().

//Funkcja Kamera_Ustawienie_Pocz¹tkowe().
procedure TMahjong_3D_Form.Kamera_Ustawienie_Pocz¹tkowe( const wymuœ_wyliczenie : boolean = false );
var
  kamera_œrodek_x_l, // Wspó³rzêdne pocz¹tkowe kamery.
  kamera_œrodek_y_l,
  kamera_œrodek_z_l,
  kamera_na_œrodek_x_l, // Wspó³rzêdne pocz¹tkowe punktu, na który spogl¹da kamera.
  kamera_na_œrodek_y_l
    : single;
begin

  //
  // Funkcja wylicza ustawienie kamery tak aby objê³a wszystkie kostki.
  //
  // Parametry:
  //   wymuœ_wyliczenie:
  //     true - wylicza ustawienie kamery.
  //     false - podstawia wartoœci wczytane z pliku ini obrazów kostek.
  //

  if   ( wymuœ_wyliczenie )
    or (
             ( kamera_na_œrodek_x = 0 )
         and ( kamera_na_œrodek_x = kamera_œrodek_x )
         and ( kamera_na_œrodek_x = kamera_na_œrodek_y )
       ) then
    begin

      // Je¿eli nie zdefiniowano pozycji punktu kamera patrzy na oszacuje pozycjê automatycznie.

      //kamera_na_œrodek_x_l := (  uk³ad_x * ( Szerokoœæ_Kostek_SpinEdit.Value / dzielnik_skalowania )  ) / 2;
      //kamera_na_œrodek_y_l := (  uk³ad_y * ( Wysokoœæ_Kostek_SpinEdit.Value / dzielnik_skalowania )  ) / 2;
      kamera_na_œrodek_x_l := (  uk³ad_x * ( Szerokoœæ_Kostek_SpinEdit.Value / dzielnik_skalowania )  ) / 2 + ( Szerokoœæ_Kostek_SpinEdit.Value / dzielnik_skalowania ) / 2 + Margines_Planszy_SpinEdit.Value / dzielnik_skalowania;
      kamera_na_œrodek_y_l := (  uk³ad_y * ( Wysokoœæ_Kostek_SpinEdit.Value / dzielnik_skalowania )  ) / 2 + ( Wysokoœæ_Kostek_SpinEdit.Value / dzielnik_skalowania ) / 2 + Margines_Planszy_SpinEdit.Value / dzielnik_skalowania;

    end;
  //---//if    ( wymuœ_wyliczenie ) (...)


  if   ( wymuœ_wyliczenie )
    or (
              ( kamera_œrodek_x = 0 )
          and ( kamera_œrodek_x = kamera_œrodek_y )
          and ( kamera_œrodek_x = kamera_œrodek_z )
       ) then
    begin

      // Je¿eli nie zdefiniowano pozycji kamery oszacuje pozycjê automatycznie.

      kamera_œrodek_x_l := kamera_na_œrodek_x_l;
      kamera_œrodek_y_l := kamera_na_œrodek_y_l;
      kamera_œrodek_z_l := (   ( uk³ad_z + 1 ) * (  ( Gruboœæ_Kostek_SpinEdit.Value + 1 ) / ( dzielnik_skalowania * 10 )  )   ) + 4 * Max( Szerokoœæ_Kostek_SpinEdit.Value, Wysokoœæ_Kostek_SpinEdit.Value );
      //kamera_œrodek_z_l := Round(     (    uk³ad_z * (   Max(  Max( Wysokoœæ_Kostek_SpinEdit.Value, Szerokoœæ_Kostek_SpinEdit.Value ), Gruboœæ_Kostek_SpinEdit.Value  ) / 1   )    ) * 2     );

    end;
  //---//if    ( wymuœ_wyliczenie ) (...)


  // Je¿eli w pliku ini obrazów kostek nie zdefiniowano pozycji kamery podstawi wyliczone wartoœci.
  if    ( kamera_na_œrodek_x = 0 )
    and ( kamera_na_œrodek_x = kamera_œrodek_x )
    and ( kamera_na_œrodek_x = kamera_na_œrodek_y ) then
    begin

      kamera_na_œrodek_x := kamera_na_œrodek_x_l;
      kamera_na_œrodek_y := kamera_na_œrodek_y_l;

    end;
  //---//if    ( kamera_na_œrodek_x = 0 ) (...)

  if    ( kamera_œrodek_x = 0 )
    and ( kamera_œrodek_x = kamera_œrodek_y )
    and ( kamera_œrodek_x = kamera_œrodek_z ) then
    begin

      kamera_œrodek_x := kamera_œrodek_x_l;
      kamera_œrodek_y := kamera_œrodek_y_l;
      kamera_œrodek_z := kamera_œrodek_z_l;

    end;
  //---//if    ( kamera_œrodek_x = 0 ) (...)
  //---// Je¿eli w pliku ini obrazów kostek nie zdefiniowano pozycji kamery podstawi wyliczone wartoœci.


  if wymuœ_wyliczenie then
    begin

      GLCamera1.Position.X := kamera_œrodek_x_l;
      GLCamera1.Position.Y := -kamera_œrodek_y_l;
      GLCamera1.Position.Z := kamera_œrodek_z_l;

      Kamera_Na_GLDummyCube.Position.X := kamera_na_œrodek_x_l; // GLCamera1.Position.X
      Kamera_Na_GLDummyCube.Position.Y := -kamera_na_œrodek_y_l; // GLCamera1.Position.Y
      Kamera_Na_GLDummyCube.Position.Z := 0;

    end
  else//if wymuœ_wyliczenie then
    begin

      GLCamera1.Position.X := kamera_œrodek_x;
      GLCamera1.Position.Y := -kamera_œrodek_y;
      GLCamera1.Position.Z := kamera_œrodek_z;

      Kamera_Na_GLDummyCube.Position.X := kamera_na_œrodek_x; // GLCamera1.Position.X
      Kamera_Na_GLDummyCube.Position.Y := -kamera_na_œrodek_y; // GLCamera1.Position.Y
      Kamera_Na_GLDummyCube.Position.Z := 0;

    end;
  //---//if wymuœ_wyliczenie then


  if Kamera_Ruch_Ci¹g³y_MenuItem.Checked then
    Kamera_Ruch_Ci¹g³y_MenuItemClick( nil ); // Gdy jest aktywna funkcja ci¹g³ego ruchu kamery aktualizuje wspó³rzêdne do przeliczania ruchu.

  Kamera_Wspó³rzêdne_Wypisz();

end;//---//Funkcja Kamera_Ustawienie_Pocz¹tkowe().

//Funkcja Kamera_Wspó³rzêdne_Wypisz().
procedure TMahjong_3D_Form.Kamera_Wspó³rzêdne_Wypisz();
begin

  Kamera_Wspó³rzêdne_Label.Caption :=
    'x: ' + FloatToStr( GLCamera1.Position.X ) + '   ' + FloatToStr( Kamera_Na_GLDummyCube.Position.X ) + #13 +
    'y: ' + FloatToStr( GLCamera1.Position.Y ) + '   ' + FloatToStr( Kamera_Na_GLDummyCube.Position.Y ) + #13 +
    'z: ' + FloatToStr( GLCamera1.Position.Z ) + '   ' + FloatToStr( Kamera_Na_GLDummyCube.Position.Z );

end;//---//Funkcja Kamera_Wspó³rzêdne_Wypisz().


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
//var
//  ztk : TKostka;
//  zts : string;
begin

  //ztk := TKostka.Create( Application );
  //ztk.Free();
  //FreeAndNil( ztk );

  kostka_klikniêta := nil;
  kostka_podpowiedŸ_1 := nil;
  kostka_podpowiedŸ_2 := nil;
  kostka_demo := nil;

  blokuj_rysowanie_kostek := false;

  wczytany_uk³ad_kostek_nazwa_pliku := '';
  obrazki_kostek_nazwa_katalogu := 'Domyœlne';
  gra_czas_start := 0;
  gra_czas_koniec := 0;

  przetasowania_iloœæ := 0;
  podpowiedzi_iloœæ := 0;
  cofniêcia_iloœæ := 0;


  kamera_na_œrodek_x := 0;
  kamera_na_œrodek_y := 0;
  kamera_œrodek_x := 0;
  kamera_œrodek_y := 0;
  kamera_œrodek_z := 10;

  Test_GLSphere.Visible := false;
  Test_GLCube.Visible := false;

  SetLength( podpowiedŸ_poprzednia_t_r, 0 );

  T³umaczenia_Domyœlne_ButtonClick( Sender ); // Podstawi wartoœci zmiennym t³umaczeñ.

  Wczytaj_Listê_Uk³adów_Kostek( Sender );

  Wczytaj_Listê_Obrazków_Kostek( Sender );

  Wczytaj_Listê_T³umaczeñ( Sender );

  Wczytaj_Ustawienia();

  Pe³ny_Ekran_CheckBoxClick( Sender );

  Przybli¿enie_CheckBoxClick( Sender );

  T³umaczenia_Zastosuj_ButtonClick( Sender );


  if Uk³ady_Kostek_MenuItem.Count < 2 then
    //Application.MessageBox( 'Brak zdefiniowanych uk³adów kostek.', 'B³¹d', MB_ICONEXCLAMATION + MB_OK );
    Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__brak_zdefiniowanych_uk³adów_kostek ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK  );

  if Obrazki_Kostek_MenuItem.Count < 2 then
    //Application.MessageBox( 'Brak zdefiniowanych obrazków kostek.', 'B³¹d', MB_ICONEXCLAMATION + MB_OK );
    Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__brak_zdefiniowanych_obrazków_kostek ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK  );



  PageControl1.ActivePage := Opcje_TabSheet; //???

  if    ( Opcje_ScrollBox.VertScrollBar.Visible )
    and ( Opcje_ScrollBox.VertScrollBar.Position <> 0 ) then
    Opcje_ScrollBox.VertScrollBar.Position := 0;


  if    ( Automatyczne_Wczytywanie_Uk³adu_Kostek_CheckBox.Checked )
    and (  Trim( wczytany_uk³ad_kostek_nazwa_pliku ) <> ''  ) then
    begin

      //if Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked then
      //  begin
      //
      //    if obrazki_kostek_nazwa_katalogu <> '' then
      //      zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\' + obrazki_kostek_nazwa_katalogu + '\' + obrazki_kostek_nazwa_katalogu + '.ini'
      //    else//if nazwa_katalogu <> '' then
      //      zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\Domyœlne\Domyœlne.ini';
      //
      //
      //    Wczytaj_Ini_Obrazków_Kostek( zts );
      //
      //  end;
      ////---//if Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked then


      Wczytaj_Uk³ad_Kostek( wczytany_uk³ad_kostek_nazwa_pliku );

    end;
  //---//if    ( Automatyczne_Wczytywanie_Uk³adu_Kostek_CheckBox.Checked ) (...)


  // Zainicjowanie wartoœci gdyby wczytanie ustawieñ nie wywo³a³o zdarzenia.f
  Obrazek_T³a_Planszy__Wyœwietl_CheckBoxClick( Sender );

  GLSceneViewer1.Align := alClient;

  Kamera_Ustawienie_Pocz¹tkowe();

end;//---//FormShow().

//FormClose().
procedure TMahjong_3D_Form.FormClose( Sender: TObject; var Action: TCloseAction );
begin

  Wczytaj_Uk³ad_Kostek( '', true );

  Wczytaj_Listê_Uk³adów_Kostek( nil );

  Wczytaj_Listê_Obrazków_Kostek( nil );

end;//---//FormClose().

//Uk³ady_Kostek__Uk³ad_Kostek_MenuItemClick().
procedure TMahjong_3D_Form.Uk³ady_Kostek__Uk³ad_Kostek_MenuItemClick( Sender : TObject );
begin

  if Sender = nil then
    Exit;

  //Wczytaj_Uk³ad_Kostek(  StringReplace( TMenuItem(Sender).Caption, '&', '', [ rfReplaceAll ] )  );
  Wczytaj_Uk³ad_Kostek( TMenuItem(Sender).Hint );

end;//---//Uk³ady_Kostek__Uk³ad_Kostek_MenuItemClick().

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


  // Gdy kliknie siê ponownie to samo pole kropka zaznaczenia znika.
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


  if Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked then
    Kostki_SpinEditChange( nil );

end;//---//Obrazki_Kostek__Obrazek_Kostek_MenuItemClick().

//KostkaClick().
procedure TMahjong_3D_Form.KostkaClick( klikniêty_obiekt : TGLSceneObject );
begin

  if klikniêty_obiekt = nil then
    Exit;


  if klikniêty_obiekt is TGLSpaceText_M then
    klikniêty_obiekt := TGLSpaceText_M(klikniêty_obiekt).Kostka
  else//if klikniêty_obiekt is TGLSpaceText_M then
  if klikniêty_obiekt is TKostka_Obrazek then
    klikniêty_obiekt := TKostka_Obrazek(klikniêty_obiekt).Kostka;


  //if not ( klikniêty_obiekt is TKostka ) then
  //  Exit;



  if not Czy_Kostkê_Mo¿na_Zdj¹æ( TKostka(klikniêty_obiekt) ) then
    Exit;



  if    ( kostka_podpowiedŸ_1 <> nil )
    and ( kostka_podpowiedŸ_1 <> kostka_klikniêta )
    and ( kostka_podpowiedŸ_1 <> klikniêty_obiekt ) then
    kostka_podpowiedŸ_1.Klikniêcie_Oznacz( false );


  if    ( kostka_podpowiedŸ_2 <> nil )
    and ( kostka_podpowiedŸ_2 <> kostka_klikniêta )
    and ( kostka_podpowiedŸ_2 <> klikniêty_obiekt ) then
    kostka_podpowiedŸ_2.Klikniêcie_Oznacz( false );

  kostka_podpowiedŸ_1 := nil;
  kostka_podpowiedŸ_2 := nil;


  SetLength( podpowiedŸ_poprzednia_t_r, 0 );


  if kostka_klikniêta = TKostka(klikniêty_obiekt) then
    begin

      // Klikniêto tê sam¹ kostkê - odznacza j¹.

      TKostka(klikniêty_obiekt).Klikniêcie_Oznacz( false );

      kostka_klikniêta := nil;

      Exit;

    end
  else//if kostka_klikniêta_t[ kostka_klikniêta_indeks ] = TKostka(klikniêty_obiekt) then
    if kostka_klikniêta <> nil then
      begin

        // Odznacza poprzednio klikniêt¹ kostkê.

        kostka_klikniêta.Klikniêcie_Oznacz( false );

      end;
    //---//if kostka_klikniêta <> nil then


  // Zaznacza klikniêt¹ kostkê.

  TKostka(klikniêty_obiekt).Klikniêcie_Oznacz( true );
  //TKostka(klikniêty_obiekt).Klikniêcie_Oznacz( not TKostka(klikniêty_obiekt).zaznaczona );


  if    ( kostka_klikniêta <> nil )
    //and ( kostka_klikniêta.symbol = TKostka(klikniêty_obiekt).symbol ) then
    and (  Czy_Kostki_Pasuj¹_Do_Siebie( kostka_klikniêta, TKostka(klikniêty_obiekt) )  ) then
    Zdejmij_Kostki( TKostka(klikniêty_obiekt) )
  else//if    ( kostka_klikniêta <> nil ) (...)
    kostka_klikniêta := TKostka(klikniêty_obiekt);


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
  //    T³umaczenia_Zastosuj_ButtonClick( T³umaczenia_Zastosuj_Button );
  //
  //  end;
  ////---//if Key = 13 then


  // Enter.
  if    ( ssAlt in Shift )
    and ( Key = 13 ) then
    begin

      Key := 0;
      Pe³ny_Ekran_CheckBox.Checked := not Pe³ny_Ekran_CheckBox.Checked;

    end;
  //---//if    ( ssAlt in Shift ) (...)

  // Escape.
  if Key = 27 then
    begin

      Key := 0;
      Pe³ny_Ekran_CheckBox.Checked := false;

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

      Kamera_Ruch_Ci¹g³y_MenuItem.Checked := not Kamera_Ruch_Ci¹g³y_MenuItem.Checked;
      Kamera_Ruch_Ci¹g³y_MenuItemClick( T³umaczenia_Panel ); // Aby nie zaznacza³ kostki podczas obs³ugiwania innych klawiszy.

    end;
  //---//if Key in [ 32, 75 ] then


  // N.
  if    ( ssCtrl in Shift )
    and ( Key = 78 ) then
    Gra__Nowa_Gra_MenuItemClick( Sender );

  // P.
  if    ( ssCtrl in Shift )
    and ( Key = 80 ) then
    Gra__PodpowiedŸ_MenuItemClick( Sender );

  // T.
  if    ( ssCtrl in Shift )
    and ( Key = 84 ) then
    Gra__Przetasuj_MenuItemClick( Sender );

  // X.
  if    ( ssCtrl in Shift )
    and ( Key = 88 ) then
    Gra__Wyczyœæ_Planszê_MenuItemClick( Sender );

  // W.
  if    ( ssCtrl in Shift )
    and ( Key = 87 ) then
    Gra__WyjdŸ_MenuItemClick( Sender );

  // Z.
  //if    ( ssCtrl in Shift )
  //  and ( Key = 90 ) then
  //  Gra__Cofnij_MenuItemClick( Sender );
  if Key = 90 then
    if ssCtrl in Shift then
      Gra__Cofnij_MenuItemClick( Sender )
    else
      Przybli¿enie_CheckBox.Checked := not Przybli¿enie_CheckBox.Checked;


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
    and ( Wyœwietlanie_Czasu_RadioGroup.Items.Count >= 1 ) then
    Wyœwietlanie_Czasu_RadioGroup.ItemIndex := 0;

  // 2.
  if    ( ssCtrl in Shift )
    and ( Key = 50 )
    and ( Wyœwietlanie_Czasu_RadioGroup.Items.Count >= 2 ) then
    Wyœwietlanie_Czasu_RadioGroup.ItemIndex := 1;

  // 3.
  if    ( ssCtrl in Shift )
    and ( Key = 51 )
    and ( Wyœwietlanie_Czasu_RadioGroup.Items.Count >= 3 ) then
    Wyœwietlanie_Czasu_RadioGroup.ItemIndex := 2;



  // +.
  if Key = 187 then
    begin

      Szerokoœæ_Kostek_SpinEdit.Value := Szerokoœæ_Kostek_SpinEdit.Value + 1;
      Wysokoœæ_Kostek_SpinEdit.Value := Wysokoœæ_Kostek_SpinEdit.Value + 1;

    end;
  //---//if Key = 187 then

  // -.
  if Key = 189 then
    begin

      Szerokoœæ_Kostek_SpinEdit.Value := Szerokoœæ_Kostek_SpinEdit.Value - 1;
      Wysokoœæ_Kostek_SpinEdit.Value := Wysokoœæ_Kostek_SpinEdit.Value - 1;

    end;
  //---//if Key = 189 then

  // Backspace.
  if Key = 8 then
    begin

      Szerokoœæ_Kostek_SpinEdit.Value := 5;
      Wysokoœæ_Kostek_SpinEdit.Value := 7;

    end;
  //---//if Key = 8 then

  // 0, 0 (numeryczna).
  if Key in [ 48, 96 ] then
    begin

      Kamera_Ustawienie_Pocz¹tkowe( true );

    end;
  //---//if Key in [ 48, 96 ] then

  // 9, 5 (numeryczna).
  if Key in [ 57, 101 ] then
    begin

      Kamera_Ustawienie_Pocz¹tkowe( false );

    end;
  //---//if Key in [ 57, 101 ] then


  // [.
  if Key = 219 then
    begin

      Gruboœæ_Kostek_SpinEdit.Value := Gruboœæ_Kostek_SpinEdit.Value - 1;

    end;
  //---//if Key = 219 then

  // ].
  if Key = 221 then
    begin

      Gruboœæ_Kostek_SpinEdit.Value := Gruboœæ_Kostek_SpinEdit.Value + 1;

    end;
  //---//if Key = 221 then


  // ;.
  if Key = 186 then
    begin

      //Szybkoœæ_Kamery_SpinEdit.Value := Szybkoœæ_Kamery_SpinEdit.Value - 10;

      if ssShift in Shift then
        Szybkoœæ_Kamery_SpinEdit.Value := Szybkoœæ_Kamery_SpinEdit.Value - 10
      else//if ssShift in Shift then
        Szybkoœæ_Kamery_SpinEdit.Value := Szybkoœæ_Kamery_SpinEdit.Value - 1;

    end;
  //---//if Key = 186 then

  // '.
  if Key = 222 then
    begin

      //Szybkoœæ_Kamery_SpinEdit.Value := Szybkoœæ_Kamery_SpinEdit.Value + 10;

      if ssShift in Shift then
        Szybkoœæ_Kamery_SpinEdit.Value := Szybkoœæ_Kamery_SpinEdit.Value + 10
      else//if ssShift in Shift then
        Szybkoœæ_Kamery_SpinEdit.Value := Szybkoœæ_Kamery_SpinEdit.Value + 1;

    end;
  //---//if Key = 222 then

  // I.
  if    ( ssCtrl in Shift )
    and ( Key = 73 ) then
    Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked := not Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked;



  // Delete, 0, 2, 4, 5, 6, 8 (numeryczna), Delete (numeryczna).
  if Key in [ 46, 96, 98, 100, 101, 102, 104, 110 ] then
    begin

      case Key of
          98 : Key := 40; // Kursor dó³.
          100 : Key := 37; // Kursor lewo.
          101 : Key := 96; // 0 (numeryczna).
          102 : Key := 39; // Kursor prawo.
          104 : Key := 38; // Kursor góra.
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

              Key := 40; // Kursor dó³.
              PerspektywaKeyDown( Sender, Key, Shift );

            end;
          //---//97 :

          99 :
            begin

              Key := 39; // Kursor prawo.
              PerspektywaKeyDown( Sender, Key, Shift );

              Key := 40; // Kursor dó³.
              PerspektywaKeyDown( Sender, Key, Shift );

            end;
          //---//99 :

          103 :
            begin

              Key := 37; // Kursor lewo.
              PerspektywaKeyDown( Sender, Key, Shift );

              Key := 38; // Kursor góra.
              PerspektywaKeyDown( Sender, Key, Shift );

            end;
          //---//103 :

          105 :
            begin

              Key := 39; // Kursor prawo.
              PerspektywaKeyDown( Sender, Key, Shift );

              Key := 38; // Kursor góra.
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
    Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Checked := not Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Checked;



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
    Szybkoœæ_Zegara_SpinEdit.Value := Szybkoœæ_Zegara_SpinEdit.Value + 50;

  // .
  if    ( ssCtrl in Shift )
    and ( Key = 190 ) then
    Szybkoœæ_Zegara_SpinEdit.Value := Szybkoœæ_Zegara_SpinEdit.Value - 50;

  // /
  if    ( ssCtrl in Shift )
    and ( Key = 191 ) then
    Szybkoœæ_Zegara_SpinEdit.Value := 1000;


  // B.
  if    ( ssCtrl in Shift )
    and ( Key = 66 ) then
    begin

      Obrazek_T³a_Planszy__Wyœwietl_CheckBox.Checked := not Obrazek_T³a_Planszy__Wyœwietl_CheckBox.Checked;
      Obrazek_T³a_Planszy__Wyœwietl_CheckBoxClick( Sender );

    end;
  //---//if    ( ssCtrl in Shift ) (...)

end;//---//PlanszaKeyDown().

//PerspektywaKeyDown().
procedure TMahjong_3D_Form.PerspektywaKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
const
  szybkoœæ_kamery_wspó³czynnik = 100;
begin

  ////Enter
  //if Key = 13 then
  //  begin
  //
  //    Key := 0;
  //    T³umaczenia_Zastosuj_ButtonClick( T³umaczenia_Zastosuj_Button );
  //
  //  end;
  ////---//if Key = 13 then

  if not ( ssCtrl in Shift ) then
    begin

      // Kursor lewo.
      if Key = 37 then
        //Kamera_X_SpinEdit.Value := Kamera_X_SpinEdit.Value - 1;
        GLCamera1.Position.X := GLCamera1.Position.X - Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;

      // Kursor prawo.
      if Key = 39 then
        //Kamera_X_SpinEdit.Value := Kamera_X_SpinEdit.Value + 1;
        GLCamera1.Position.X := GLCamera1.Position.X + Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;


      // Kursor góra.
      if Key = 38 then
        //Kamera_Y_SpinEdit.Value := Kamera_Y_SpinEdit.Value - 1;
        GLCamera1.Position.Y := GLCamera1.Position.Y + Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;

      // Kursor dó³.
      if Key = 40 then
        //Kamera_Y_SpinEdit.Value := Kamera_Y_SpinEdit.Value + 1;
        GLCamera1.Position.Y := GLCamera1.Position.Y - Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;

      // Delete.
      if Key = 46 then
        begin

          GLCamera1.Position.X := kamera_œrodek_x;
          GLCamera1.Position.Y := -kamera_œrodek_y;
          GLCamera1.Position.Z := kamera_œrodek_z;

        end;
      //---//if Key = 46 then


      // + (numeryczna).
      if Key = 107 then
        GLCamera1.Position.Z := GLCamera1.Position.Z - Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;


      // - (numeryczna).
      if Key = 109 then
        GLCamera1.Position.Z := GLCamera1.Position.Z + Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;

      // * (numeryczna).
      if Key = 106 then
        GLCamera1.Position.Z := 10;

    end
  else//if not ( ssCtrl in Shift ) then
    begin

      // Ruch punktem, na który patrzy kamera.

      // Kursor lewo.
      if Key = 37 then
        Kamera_Na_GLDummyCube.Position.X := Kamera_Na_GLDummyCube.Position.X - Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;

      // Kursor prawo.
      if Key = 39 then
        Kamera_Na_GLDummyCube.Position.X := Kamera_Na_GLDummyCube.Position.X + Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;


      // Kursor góra.
      if Key = 38 then
        Kamera_Na_GLDummyCube.Position.Y := Kamera_Na_GLDummyCube.Position.Y + Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;

      // Kursor dó³.
      if Key = 40 then
        Kamera_Na_GLDummyCube.Position.Y := Kamera_Na_GLDummyCube.Position.Y - Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;

      // Delete.
      if Key = 46 then
        begin

          Kamera_Na_GLDummyCube.Position.X := kamera_na_œrodek_x; // GLCamera1.Position.X
          Kamera_Na_GLDummyCube.Position.Y := -kamera_na_œrodek_y; // GLCamera1.Position.Y
          Kamera_Na_GLDummyCube.Position.Z := 0;

        end;
      //---//if Key = 46 then


      // + (numeryczna).
      if Key = 107 then
        Kamera_Na_GLDummyCube.Position.Z := Kamera_Na_GLDummyCube.Position.Z - Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;


      // - (numeryczna).
      if Key = 109 then
        Kamera_Na_GLDummyCube.Position.Z := Kamera_Na_GLDummyCube.Position.Z + Szybkoœæ_Kamery_SpinEdit.Value / szybkoœæ_kamery_wspó³czynnik;

      // * (numeryczna).
      if Key = 106 then
        Kamera_Na_GLDummyCube.Position.Z := 0;

    end;
  //---//if not ( ssShift in Shift ) then


  Key := 0;


  Kamera_Wspó³rzêdne_Wypisz();

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
    or ( Kamera_Ruch_Ci¹g³y_MenuItem.Checked ) then
    begin

      GLCamera1.Position.X := kamera_punkt_kopia.X - ( mysz_start_punkt.X - X ) / 1000 * Szybkoœæ_Kamery_SpinEdit.Value;
      GLCamera1.Position.Y := kamera_punkt_kopia.Y + ( mysz_start_punkt.Y - Y ) / 1000 * Szybkoœæ_Kamery_SpinEdit.Value;


      Kamera_Wspó³rzêdne_Wypisz();

    end;
  //---//if   ( ssLeft in Shift ) (...)

end;//---//GLSceneViewer1MouseMove().

//GLSceneViewer1MouseWheel().
procedure TMahjong_3D_Form.GLSceneViewer1MouseWheel( Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean );
begin

  if WheelDelta >= 0 then
    GLCamera1.Position.Z := GLCamera1.Position.Z - Szybkoœæ_Kamery_SpinEdit.Value / 50
  else//if WheelDelta >= 0 then
    GLCamera1.Position.Z := GLCamera1.Position.Z + Szybkoœæ_Kamery_SpinEdit.Value / 50;

  Kamera_Wspó³rzêdne_Wypisz();

end;//---//GLSceneViewer1MouseWheel().

//GLSceneViewer1MouseDown().
procedure TMahjong_3D_Form.GLSceneViewer1MouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
var
  //ztw : word;
  klikniêty_obiekt : TGLSceneObject;
begin

  if Button = System.UITypes.TMouseButton.mbRight then
    begin

      //ztw := 32; // Spacja.
      //PlanszaKeyDown( Sender, ztw, Shift );
      Kamera_Ruch_Ci¹g³y_MenuItem.Checked := not Kamera_Ruch_Ci¹g³y_MenuItem.Checked;
      Kamera_Ruch_Ci¹g³y_MenuItemClick( T³umaczenia_Panel ); // Aby nie zaznacza³ kostki podczas obs³ugiwania innych klawiszy.
      Exit;

    end;
  //---//if Button = System.UITypes.TMouseButton.mbRight then


  mysz_start_punkt.X := X;
  mysz_start_punkt.Y := Y;

  kamera_punkt_kopia.X := GLCamera1.Position.X;
  kamera_punkt_kopia.Y := GLCamera1.Position.Y;
  //Pomoc_Memo.Lines.Add(  IntToStr( X ) + ' ' + IntToStr( Y )  );


  if    ( Sender <> nil )
    and ( TComponent(Sender).Name = T³umaczenia_Panel.Name ) then // Aby nie zaznacza³ kostki podczas obs³ugiwania innych klawiszy.
    Exit;


  // Tu (w if) siê pojawia³ b³¹d "Unbalanced context activations" gdy T³o_GLSkyBox mia³o wczytane tekstury.
  // Ustawienie T³o_GLSkyBox.Pickable := false (chyba) rozwi¹za³o problem.

  if ( GLSceneViewer1.Buffer.GetPickedObject( x, y ) is TGLSceneObject ) then
    klikniêty_obiekt := ( GLSceneViewer1.Buffer.GetPickedObject( x, y ) as TGLSceneObject )
  else//if ( GLSceneViewer1.Buffer.GetPickedObject( x, y ) is TGLSceneObject ) then
    klikniêty_obiekt := nil;

  if klikniêty_obiekt <> nil then
    KostkaClick( klikniêty_obiekt );

end;//---//GLSceneViewer1MouseDown().

//GLSceneViewer1Gesture().
procedure TMahjong_3D_Form.GLSceneViewer1Gesture( Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean );
var
  przybli¿enie_ró¿nica_l : integer; // Dla zwiêkszenie czytelnoœci.
begin

  if EventInfo.GestureID = igiZoom then
    if ( TInteractiveGestureFlag.gfBegin in EventInfo.Flags ) then
      begin

        kamera_punkt_kopia_z := GLCamera1.Position.Z; // Aktualne przybli¿enie.
        przybli¿enie_mysz_start_y := EventInfo.Distance; // Tutaj jako wykryta wartoœæ przybli¿enia (dystansu) w momencie rozpoczêcia gestu.

      end
    else//if ( TInteractiveGestureFlag.gfBegin in EventInfo.Flags ) then
      if EventInfo.Distance <> 0 then
        begin

          przybli¿enie_ró¿nica_l := EventInfo.Distance - przybli¿enie_mysz_start_y;
          //GLCamera1.Position.Z := kamera_punkt_kopia_z + przybli¿enie_ró¿nica_l * ( Szybkoœæ_Kamery_SpinEdit.Value / 1000 );
          GLCamera1.Position.Z := kamera_punkt_kopia_z - przybli¿enie_ró¿nica_l * ( Szybkoœæ_Kamery_SpinEdit.Value / 1000 );
          //GLCamera1.Position.Z := kamera_punkt_kopia_z - ( przybli¿enie_mysz_start_y - Y ) * ( Szybkoœæ_Kamery_SpinEdit.Value / 1000 );

        end;
      //---//if EventInfo.Distance <> 0 then

end;//---//GLSceneViewer1Gesture().

//Kamera_Ruch_Ci¹g³y_MenuItemClick().
procedure TMahjong_3D_Form.Kamera_Ruch_Ci¹g³y_MenuItemClick( Sender: TObject );
var
  mysz_punkt : TPoint;
begin

  mysz_punkt := ScreenToClient( Mouse.CursorPos );
  //Pomoc_Memo.Lines.Add(  IntToStr( mysz_punkt.X ) + ' ' + IntToStr( mysz_punkt.Y )  );
  GLSceneViewer1MouseDown( Sender, TMouseButton.mbLeft, [], mysz_punkt.X, mysz_punkt.Y );

  if Kamera_Ruch_Ci¹g³y_MenuItem.Checked then
    Kamera_Ruch_Ci¹g³y_MenuItem.Caption := '*' + kamera_ruch_ci¹g³y_treœæ
  else//if Kamera_Ruch_Ci¹g³y_MenuItem.Checked then
    Kamera_Ruch_Ci¹g³y_MenuItem.Caption := kamera_ruch_ci¹g³y_treœæ;

end;//---//Kamera_Ruch_Ci¹g³y_MenuItemClick().

//Pe³ny_Ekran_MenuItemClick().
procedure TMahjong_3D_Form.Pe³ny_Ekran_MenuItemClick( Sender: TObject );
begin

  Pe³ny_Ekran_CheckBox.Checked := not Pe³ny_Ekran_CheckBox.Checked;

  //Pe³ny_Ekran_CheckBoxClick( Sender ); // Wywo³a siê samo w linijce wy¿ej.

end;//---//Pe³ny_Ekran_MenuItemClick().

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

//Przybli¿enie_PanelMouseDown().
procedure TMahjong_3D_Form.Przybli¿enie_PanelMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
begin

  przybli¿enie_mysz_start_y := Y;
  kamera_punkt_kopia_z := GLCamera1.Position.Z;

end;//---//Przybli¿enie_PanelMouseDown().

//Przybli¿enie_PanelMouseMove().
procedure TMahjong_3D_Form.Przybli¿enie_PanelMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
begin

  if ssLeft in Shift then
    begin

      GLCamera1.Position.Z := kamera_punkt_kopia_z - ( przybli¿enie_mysz_start_y - Y ) * ( Szybkoœæ_Kamery_SpinEdit.Value / 1000 );

    end;
  //---//if ssLeft in Shift then

end;//---//Przybli¿enie_PanelMouseMove().

//Gra__Demo_MenuItemClick().
procedure TMahjong_3D_Form.Gra__Demo_MenuItemClick( Sender: TObject );
begin

  if kostka_klikniêta <> nil then
    kostka_klikniêta := nil;

  if kostka_demo <> nil then
    kostka_demo := nil;


  SetLength( podpowiedŸ_poprzednia_t_r, 0 );


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

        kostka_f.Klikniêcie_Oznacz( false );
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



      if    ( uk³ad_kostek_t[ x_1 ][ y_1 ][ z_1 ] = '0' )
        and ( kostki_t[ x_1 ][ y_1 ][ z_1 ] = nil )
        and ( uk³ad_kostek_t[ x_2 ][ y_2 ][ z_2 ] = '0' )
        and ( kostki_t[ x_2 ][ y_2 ][ z_2 ] = nil ) then
        begin

          Odznacz_Kostki( kostka_klikniêta );
          Odznacz_Kostki( kostka_podpowiedŸ_1 );
          Odznacz_Kostki( kostka_podpowiedŸ_2 );
          Odznacz_Kostki( kostka_demo );


          inc( cofniêcia_iloœæ );

          uk³ad_kostek_t[ x_1 ][ y_1 ][ z_1 ] := cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_1;
          uk³ad_kostek_t[ x_2 ][ y_2 ][ z_2 ] := cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_2;

          Utwórz_Kostkê( kostki_t[ x_1 ][ y_1 ][ z_1 ], cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_1 );
          Utwórz_Kostkê( kostki_t[ x_2 ][ y_2 ][ z_2 ], cofnij_t_r[ Length( cofnij_t_r ) - 1 ].pozycja_2 );


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

          par_do_zdjêcia_iloœæ := Par_Do_Zdjêcia();

          //Kostki_SpinEditChange( nil );
          Wczytaj_Obrazki_Kostek( obrazki_kostek_nazwa_katalogu, true );
          Kostki_SpinEditChange( nil );

        end;
      //---//if    ( uk³ad_kostek_t[ cofnij_t_r[ Length( cofnij_t_r ) - 1 ].x_1 ][ cofnij_t_r[ Length( cofnij_t_r ) - 1 ].y_1 ][ cofnij_t_r[ Length( cofnij_t_r ) - 1 ].z_1 ] = '0' ) (...)

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
         //and (  Application.MessageBox( 'Rozpocz¹æ grê od nowa?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES  )
         and (   Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__rozpocz¹æ_grê_od_nowa ), PChar( t³umaczenie_komunikaty_r.komunikat__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) = IDYES   )
       ) then
    begin

      if Trim( wczytany_uk³ad_kostek_nazwa_pliku ) <> '' then
        Wczytaj_Uk³ad_Kostek( wczytany_uk³ad_kostek_nazwa_pliku )
      else//if Trim( wczytany_uk³ad_kostek_nazwa_pliku ) <> '' then
        if    ( Uk³ady_Kostek_MenuItem.Count > 1 )
          and ( Uk³ady_Kostek_MenuItem.Items[ 0 ].Name <> 'Uk³ady_Kostek__Odœwie¿_Listê_MenuItem' ) then
          Wczytaj_Uk³ad_Kostek( Uk³ady_Kostek_MenuItem.Items[ 0 ].Hint )
        else//if    ( Uk³ady_Kostek_MenuItem.Count > 0 ) (...)
          begin

            //Application.MessageBox( 'Brak zdefiniowanych uk³adów kostek.', 'B³¹d', MB_ICONEXCLAMATION + MB_OK );
            Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__brak_zdefiniowanych_uk³adów_kostek ), PChar( t³umaczenie_komunikaty_r.komunikat__b³¹d ), MB_ICONEXCLAMATION + MB_OK  );
            Exit;

          end;
        //---//if    ( Uk³ady_Kostek_MenuItem.Count > 1 ) (...)

    end;
  //---//if   ( zti <= 1 ) (...)

end;//---//Gra__Nowa_Gra_MenuItemClick().

//Gra__PodpowiedŸ_MenuItemClick().
procedure TMahjong_3D_Form.Gra__PodpowiedŸ_MenuItemClick( Sender: TObject );

  //Funckja Czy_Kostka_By³a_Podpowiadana() w Gra__PodpowiedŸ_MenuItemClick().
  function Czy_Kostka_By³a_Podpowiadana( const x, y, z : integer ) : boolean;
  var
    i : integer;
  begin

    Result := false;

    for i := 0 to Length( podpowiedŸ_poprzednia_t_r ) - 1 do
      if   (
                 ( podpowiedŸ_poprzednia_t_r[ i ].x_1 = x )
             and ( podpowiedŸ_poprzednia_t_r[ i ].y_1 = y )
             and ( podpowiedŸ_poprzednia_t_r[ i ].z_1 = z )
           )
        or (
                 ( podpowiedŸ_poprzednia_t_r[ i ].x_2 = x )
             and ( podpowiedŸ_poprzednia_t_r[ i ].y_2 = y )
             and ( podpowiedŸ_poprzednia_t_r[ i ].z_2 = z )
           ) then
        begin

          Result := true;
          Exit;

        end;
      //---//if   ( (...)

  end;//---//Funckja Czy_Kostka_By³a_Podpowiadana() w Gra__PodpowiedŸ_MenuItemClick().

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
  podpowiedŸ_ponów_l;
begin//Gra__PodpowiedŸ_MenuItemClick().

  Screen.Cursor := crHourGlass;

  inc( podpowiedzi_iloœæ );

  zti := 0;

  podpowiedŸ_ponów_l:


  if Gra__Demo_MenuItem.Checked then
    SetLength( podpowiedŸ_poprzednia_t_r, 0 );


  for x_1 := 0 to Length( kostki_t ) - 1 do
    for y_1 := 0 to Length( kostki_t[ 0 ] ) - 1 do
      for z_1 := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
        if    ( kostki_t[ x_1 ][ y_1 ][ z_1 ] <> nil )
          //and ( x_1 > podpowiedŸ_poprzednia__x_1 )
          and ( not Czy_Kostka_By³a_Podpowiadana( x_1, y_1, z_1 )  )
          and (  Czy_Kostkê_Mo¿na_Zdj¹æ( kostki_t[ x_1 ][ y_1 ][ z_1 ] )  ) then
          begin

            for x_2 := 0 to Length( kostki_t ) - 1 do
              for y_2 := 0 to Length( kostki_t[ 0 ] ) - 1 do
                for z_2 := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
                  if    ( kostki_t[ x_2 ][ y_2 ][ z_2 ] <> nil )
                    and ( kostki_t[ x_1 ][ y_1 ][ z_1 ] <> kostki_t[ x_2 ][ y_2 ][ z_2 ] )
                    //and ( kostki_t[ x_1 ][ y_1 ][ z_1 ].symbol = kostki_t[ x_2 ][ y_2 ][ z_2 ].symbol )
                    //and ( x_2 <> podpowiedŸ_poprzednia__x_1 )
                    and (  Czy_Kostki_Pasuj¹_Do_Siebie( kostki_t[ x_1 ][ y_1 ][ z_1 ], kostki_t[ x_2 ][ y_2 ][ z_2 ] )  )
                    and (  Czy_Kostkê_Mo¿na_Zdj¹æ( kostki_t[ x_2 ][ y_2 ][ z_2 ] )  ) then
                    begin

                      //kostki_t[ x_1 ][ y_1 ][ z_1 ].Caption := 'A';
                      //kostki_t[ x_2 ][ y_2 ][ z_2 ].Caption := 'B';

                      if    ( kostka_podpowiedŸ_1 <> nil )
                        and ( kostka_podpowiedŸ_1 <> kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                        and ( kostka_podpowiedŸ_1 <> kostki_t[ x_2 ][ y_2 ][ z_2 ] ) then
                        kostka_podpowiedŸ_1.Klikniêcie_Oznacz( false );


                      if    ( kostka_podpowiedŸ_2 <> nil )
                        and ( kostka_podpowiedŸ_2 <> kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                        and ( kostka_podpowiedŸ_2 <> kostki_t[ x_2 ][ y_2 ][ z_2 ] ) then
                        kostka_podpowiedŸ_2.Klikniêcie_Oznacz( false );


                      if    ( kostka_klikniêta <> nil )
                        and ( kostka_klikniêta <> kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                        and ( kostka_klikniêta <> kostki_t[ x_2 ][ y_2 ][ z_2 ] ) then
                        kostka_klikniêta.Klikniêcie_Oznacz( false );


                      if    ( kostka_demo <> nil )
                        and ( kostka_demo <> kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                        and ( kostka_demo <> kostki_t[ x_2 ][ y_2 ][ z_2 ] ) then
                        kostka_demo.Klikniêcie_Oznacz( false );

                      kostka_klikniêta := nil;
                      kostka_demo := nil;



                      if    ( kostka_podpowiedŸ_2 <> nil )
                        and ( kostka_podpowiedŸ_2 <> kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                        and ( kostka_podpowiedŸ_2 <> kostki_t[ x_2 ][ y_2 ][ z_2 ] ) then
                        kostka_podpowiedŸ_2.Klikniêcie_Oznacz( false );


                      if    ( kostka_podpowiedŸ_1 <> nil )
                        and ( kostka_podpowiedŸ_2 <> nil )
                        and (
                                 ( kostka_podpowiedŸ_1 = kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                              or ( kostka_podpowiedŸ_2 = kostki_t[ x_1 ][ y_1 ][ z_1 ] )
                            )
                        and (
                                 ( kostka_podpowiedŸ_1 = kostki_t[ x_2 ][ y_2 ][ z_2 ] )
                              or ( kostka_podpowiedŸ_2 = kostki_t[ x_2 ][ y_2 ][ z_2 ] )
                            ) then
                          begin

                            // Wygasza podœwietlenie poprzednio podpowiedzianych kostek.

                            kostka_podpowiedŸ_1.Klikniêcie_Oznacz( false );
                            kostka_podpowiedŸ_2.Klikniêcie_Oznacz( false );

                            kostka_podpowiedŸ_1 := nil;
                            kostka_podpowiedŸ_2 := nil;

                            Screen.Cursor := crDefault;

                            Exit;

                          end;
                        //---//if    ( kostka_podpowiedŸ_1 <> nil ) (...)



                      //kostki_t[ x_1 ][ y_1 ][ z_1 ].Klikniêcie_Oznacz( true );
                      //kostki_t[ x_2 ][ y_2 ][ z_2 ].Klikniêcie_Oznacz( true );
                      kostka_podpowiedŸ_1 := kostki_t[ x_1 ][ y_1 ][ z_1 ];
                      kostka_podpowiedŸ_2 := kostki_t[ x_2 ][ y_2 ][ z_2 ];

                      kostka_podpowiedŸ_1.Klikniêcie_Oznacz( true );
                      kostka_podpowiedŸ_2.Klikniêcie_Oznacz( true );


                      if not Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked then
                        begin

                          SetLength( podpowiedŸ_poprzednia_t_r, Length( podpowiedŸ_poprzednia_t_r ) + 1  );
                          podpowiedŸ_poprzednia_t_r[ Length( podpowiedŸ_poprzednia_t_r ) - 1 ].x_1 := x_1;
                          podpowiedŸ_poprzednia_t_r[ Length( podpowiedŸ_poprzednia_t_r ) - 1 ].y_1 := y_1;
                          podpowiedŸ_poprzednia_t_r[ Length( podpowiedŸ_poprzednia_t_r ) - 1 ].z_1 := z_1;
                          podpowiedŸ_poprzednia_t_r[ Length( podpowiedŸ_poprzednia_t_r ) - 1 ].x_2 := x_2;
                          podpowiedŸ_poprzednia_t_r[ Length( podpowiedŸ_poprzednia_t_r ) - 1 ].y_2 := y_2;
                          podpowiedŸ_poprzednia_t_r[ Length( podpowiedŸ_poprzednia_t_r ) - 1 ].z_2 := z_2;

                        end;
                      //---//if not Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked then


                      if Gra__Demo_MenuItem.Checked then
                        begin

                          Application.ProcessMessages();

                          kostka_klikniêta := kostka_podpowiedŸ_1;
                          kostka_demo := kostka_podpowiedŸ_2;

                          //kostka_podpowiedŸ_1 := nil;
                          //kostka_podpowiedŸ_2 := nil;


                          //kostka_klikniêta := kostki_t[ x_1 ][ y_1 ][ z_1 ];
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

          goto podpowiedŸ_ponów_l;

        end;
      //---//if zti <= 20 then


      Gra__Demo_MenuItem.Checked := false;

    end
  else//if Gra__Demo_MenuItem.Checked then
    if Length( podpowiedŸ_poprzednia_t_r ) > 0 then
      begin

        SetLength( podpowiedŸ_poprzednia_t_r, 0 );


        if kostka_podpowiedŸ_1 <> nil then
          kostka_podpowiedŸ_1.Klikniêcie_Oznacz( false );

        if kostka_podpowiedŸ_2 <> nil then
          kostka_podpowiedŸ_2.Klikniêcie_Oznacz( false );

        kostka_podpowiedŸ_1 := nil;
        kostka_podpowiedŸ_2 := nil;


        goto podpowiedŸ_ponów_l;

      end;
    //---//if Length( podpowiedŸ_poprzednia_t_r ) > 0 then


  Screen.Cursor := crDefault;

  //Application.MessageBox( 'Nie odnaleziono kostek do œci¹gniêcia.', 'Komunikat', MB_ICONINFORMATION + MB_OK );
  Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_kostek_do_œci¹gniêcia ), PChar( t³umaczenie_komunikaty_r.komunikat__komunikat ), MB_ICONINFORMATION + MB_OK  );

end;//---//Gra__PodpowiedŸ_MenuItemClick().

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

  inc( przetasowania_iloœæ );

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

  par_do_zdjêcia_iloœæ := Par_Do_Zdjêcia();


  if    ( Kostek_Na_Planszy() > 2 )
    and ( par_do_zdjêcia_iloœæ <= 0 )
    and ( Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked )
    and ( not Gra__Demo_MenuItem.Checked ) then
    //if Application.MessageBox( 'Nie odnaleziono kostek do œci¹gniêcia.' + #13 + 'Czy przetasowaæ?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO ) = IDYES then
    if Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__nie_odnaleziono_kostek_do_œci¹gniêcia__czy_przetasowaæ ), PChar( t³umaczenie_komunikaty_r.komunikat__potwierdzenie ), MB_ICONQUESTION + MB_YESNO  ) = IDYES then
       Gra__Przetasuj_MenuItemClick( nil );

end;//---//Gra__Przetasuj_MenuItemClick().

//Gra__Wyczyœæ_Planszê_MenuItemClick().
procedure TMahjong_3D_Form.Gra__Wyczyœæ_Planszê_MenuItemClick( Sender: TObject );
begin

  if Gra__Demo_MenuItem.Checked then
    Gra__Demo_MenuItem.Checked := false;

  gra_czas_start := 0;
  gra_czas_koniec := 0;

  przetasowania_iloœæ := 0;
  podpowiedzi_iloœæ := 0;
  cofniêcia_iloœæ := 0;


  //if Application.MessageBox( 'Wyczyœciæ planszê?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES then
  if Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__wyczyœciæ_planszê ), PChar( t³umaczenie_komunikaty_r.komunikat__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) = IDYES then
    Wczytaj_Uk³ad_Kostek( '', true );


  StatusBar1.Panels[ 1 ].Text := IntToStr(  Kostek_Na_Planszy()  );

  par_do_zdjêcia_iloœæ := Par_Do_Zdjêcia();

end;//---//Gra__Wyczyœæ_Planszê_MenuItemClick().

//Gra__WyjdŸ_MenuItemClick().
procedure TMahjong_3D_Form.Gra__WyjdŸ_MenuItemClick( Sender: TObject );
begin

  if Gra__Demo_MenuItem.Checked then
    Gra__Demo_MenuItem.Checked := false;


  //if Application.MessageBox( 'Zakoñczyæ dzia³anie programu?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES then
  if Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__zakoñczyæ_dzia³anie_programu ), PChar( t³umaczenie_komunikaty_r.komunikat__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) = IDYES then
    Close();

end;//---//Gra__WyjdŸ_MenuItemClick().

//Gra__Zaprezentuj_Kostki_MenuItemClick().
procedure TMahjong_3D_Form.Gra__Zaprezentuj_Kostki_MenuItemClick( Sender: TObject );
begin

  if Gra__Demo_MenuItem.Checked then
    Gra__Demo_MenuItem.Checked := false;


  //if Application.MessageBox( 'Zaprezentowaæ kostki?' + #13 + 'Zakoñczy to trwaj¹c¹ grê.', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES then
  if Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__zaprezentowaæ_kostki ), PChar( t³umaczenie_komunikaty_r.komunikat__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) = IDYES then
    begin

      gra_czas_start := 0;

      przetasowania_iloœæ := 0;
      podpowiedzi_iloœæ := 0;
      cofniêcia_iloœæ := 0;

      Wczytaj_Uk³ad_Kostek( '*:?:*<>"\|/' ); // Zaprezentuj kostki.

    end;
  //---//if Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__zaprezentowaæ_kostki ), PChar( t³umaczenie_komunikaty_r.komunikat__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) = IDYES then

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


  if Szybkoœæ_Kamery_SpinEdit.Value > Szybkoœæ_Kamery_SpinEdit.MaxValue then
    Szybkoœæ_Kamery_SpinEdit.Value := Szybkoœæ_Kamery_SpinEdit.MaxValue
  else//if Szybkoœæ_Kamery_SpinEdit.Value > Szybkoœæ_Kamery_SpinEdit.MaxValue then
    if Szybkoœæ_Kamery_SpinEdit.Value < Szybkoœæ_Kamery_SpinEdit.MinValue then
      Szybkoœæ_Kamery_SpinEdit.Value := Szybkoœæ_Kamery_SpinEdit.MinValue;


  if not Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Checked then
    begin

      GLCamera1.TargetObject := nil;

    end
  else//if not Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Checked then
    begin

      GLCamera1.TargetObject := Kamera_Na_GLDummyCube;

    end;
  //---//if not Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Checked then


  for x := 0 to Length( kostki_t ) - 1 do
    for y := 0 to Length( kostki_t[ 0 ] ) - 1 do
      for z := 0 to Length( kostki_t[ 0 ][ 0 ] ) - 1 do
        if kostki_t[ x ][ y ][ z ] <> nil then
          begin

            kostki_t[ x ][ y ][ z ].szerokoœæ := Szerokoœæ_Kostek_SpinEdit.Value / dzielnik_skalowania;
            kostki_t[ x ][ y ][ z ].wysokoœæ := Wysokoœæ_Kostek_SpinEdit.Value / dzielnik_skalowania;
            kostki_t[ x ][ y ][ z ].gruboœæ := Gruboœæ_Kostek_SpinEdit.Value / ( dzielnik_skalowania * 10 );


            ztf := 0;

            if kostki_t[ x ][ y ][ z ].korekta_x <> 0 then
              ztf := ( kostki_t[ x ][ y ][ z ].szerokoœæ / 2 ) * kostki_t[ x ][ y ][ z ].korekta_x;

            kostki_t[ x ][ y ][ z ].lewo := x * kostki_t[ x ][ y ][ z ].szerokoœæ + Margines_Planszy_SpinEdit.Value / dzielnik_skalowania + ztf;


            ztf := 0;

            if kostki_t[ x ][ y ][ z ].korekta_y <> 0 then
              ztf := ( kostki_t[ x ][ y ][ z ].wysokoœæ / 2 ) * kostki_t[ x ][ y ][ z ].korekta_y;

            kostki_t[ x ][ y ][ z ].góra := y * kostki_t[ x ][ y ][ z ].wysokoœæ + Margines_Planszy_SpinEdit.Value / dzielnik_skalowania + ztf;


            kostki_t[ x ][ y ][ z ].Przerysuj_Kostkê();

          end;
        //---//if kostki_t[ x ][ y ][ z ] <> nil then

  Screen.Cursor := crDefault;

end;//---//Kostki_SpinEditChange().

//Szybkoœæ_Zegara_SpinEditChange().
procedure TMahjong_3D_Form.Szybkoœæ_Zegara_SpinEditChange( Sender: TObject );
begin

  Timer1.Interval := Szybkoœæ_Zegara_SpinEdit.Value;

end;//---//Szybkoœæ_Zegara_SpinEditChange().

//Wartoœci_Domyœlne_ButtonClick().
procedure TMahjong_3D_Form.Wartoœci_Domyœlne_ButtonClick( Sender: TObject );
//var
//  zts : string;
begin

  blokuj_rysowanie_kostek := true;

  Wyœwietlanie_Czasu_RadioGroup.ItemIndex := 0;
  Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked := true;

  Margines_Planszy_SpinEdit.Value := 0;
  Szerokoœæ_Kostek_SpinEdit.Value := 1;
  Wysokoœæ_Kostek_SpinEdit.Value := 2;
  Gruboœæ_Kostek_SpinEdit.Value := 7;

  Szybkoœæ_Zegara_SpinEdit.Value := 1000;

  Szybkoœæ_Kamery_SpinEdit.Value := 10;

  Kamera_Na_Œrodek_Uk³adu_Kostek_CheckBox.Checked := true;
  Automatyczne_Wczytywanie_Uk³adu_Kostek_CheckBox.Checked := true;
  //Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked := true;
  Kostki_Kwiatków_CheckBox.Checked := true;
  Podpowiadaj_Tylko_Jeden_Ruch_CheckBox.Checked := false;
  Pe³ny_Ekran_CheckBox.Checked := false;
  Przybli¿enie_CheckBox.Checked := false;
  Obrazek_T³a_Planszy__Przód_RadioButton.Checked := true;
  Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne_CheckBox.Checked := false;
  Obrazek_T³a_Planszy__Wyœwietl_CheckBox.Checked := true;


  //if Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked then
  //  begin
  //
  //    if obrazki_kostek_nazwa_katalogu <> '' then
  //      zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\' + obrazki_kostek_nazwa_katalogu + '\' + obrazki_kostek_nazwa_katalogu + '.ini'
  //    else//if nazwa_katalogu <> '' then
  //      zts := ExtractFilePath( Application.ExeName ) + 'Obrazki kostek\Domyœlne\Domyœlne.ini';
  //
  //
  //    Wczytaj_Ini_Obrazków_Kostek( zts );
  //
  //  end
  //else
  //  begin
  //
  //    kamera_œrodek_x := 0;
  //    kamera_œrodek_y := 0;
  //    kamera_œrodek_z := 0;
  //
  //    kamera_na_œrodek_x := 0;
  //    kamera_na_œrodek_y := 0;
  //
  //    Kamera_Ustawienie_Pocz¹tkowe();
  //
  //  end;
  ////---//if Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked then
  Kamera_Ustawienie_Pocz¹tkowe( true );


  Wczytuj_Konfiguracjê_Kostek_CheckBox.Checked := true;

  blokuj_rysowanie_kostek := false;

  Kostki_SpinEditChange( nil );

end;//---//Wartoœci_Domyœlne_ButtonClick().

//Wczytaj_Ustawienia_ButtonClick().
procedure TMahjong_3D_Form.Wczytaj_Ustawienia_ButtonClick( Sender: TObject );
begin

  Wczytaj_Ustawienia();

  Kostki_SpinEditChange( nil );

  Kamera_Ustawienie_Pocz¹tkowe( true );

end;//---//Wczytaj_Ustawienia_ButtonClick().

//Uk³ad_Kostek_Nazwa_Wyczyœæ_ButtonClick().
procedure TMahjong_3D_Form.Uk³ad_Kostek_Nazwa_Wyczyœæ_ButtonClick( Sender: TObject );
begin

  wczytany_uk³ad_kostek_nazwa_pliku := '';
  //Uk³ad_Kostek_Nazwa_Label.Caption := 'Nazwa uk³adu kostek: <brak>.';
  Uk³ad_Kostek_Nazwa_Label.Caption := t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa + ': ' + t³umaczenie_komunikaty_r.inne__uk³ad_kostek_nazwa__brak + '.';

end;//---//Uk³ad_Kostek_Nazwa_Wyczyœæ_ButtonClick().

//Pe³ny_Ekran_CheckBoxClick().
procedure TMahjong_3D_Form.Pe³ny_Ekran_CheckBoxClick( Sender: TObject );
begin

  if Pe³ny_Ekran_CheckBox.Checked then
    begin

      Mahjong_3D_Form.BorderStyle := bsNone;
      Mahjong_3D_Form.WindowState := wsMaximized;
      Mahjong_3D_Form.Left := 0;
      Mahjong_3D_Form.Top := 0;
      Mahjong_3D_Form.Height := Screen.Height;
      Mahjong_3D_Form.Width := Screen.Width;

      Mahjong_3D_Form.BringToFront();

    end
  else//if Pe³ny_Ekran_CheckBox.Checked then
    begin

      //Mahjong_3D_Form.WindowState := wsNormal;
      Mahjong_3D_Form.BorderStyle := bsSizeable;

    end
  //---//if Pe³ny_Ekran_CheckBox.Checked then

end;//---//Pe³ny_Ekran_CheckBoxClick().

//Przybli¿enie_CheckBoxClick().
procedure TMahjong_3D_Form.Przybli¿enie_CheckBoxClick( Sender: TObject );
begin

  Przybli¿enie_Panel.Visible := Przybli¿enie_CheckBox.Checked;

  Przybli¿enie_Splitter.Visible := Przybli¿enie_Panel.Visible;


  if Przybli¿enie_Panel.Visible then
    begin

      if Przybli¿enie_Panel.Width < 1 then
        Przybli¿enie_Panel.Width := 75;


      if Przybli¿enie_Splitter.Left < Przybli¿enie_Panel.Left then
        begin

          Przybli¿enie_Splitter.Align := alRight;
          Application.ProcessMessages();
          Przybli¿enie_Splitter.Align := alLeft;

        end;
      //---//if Przybli¿enie_Panel.Left < Przybli¿enie_Panel.Left then

    end;
  //---//if Przybli¿enie_Panel.Visible then

end;//---//Przybli¿enie_CheckBoxClick().

//T³umaczenia_Zastosuj_ButtonClick().
procedure TMahjong_3D_Form.T³umaczenia_Zastosuj_ButtonClick( Sender: TObject );
begin

  if    ( T³umaczenia_ListBox.ItemIndex >= 0 )
    and ( T³umaczenia_ListBox.ItemIndex <= T³umaczenia_ListBox.Items.Count - 1 ) then
    begin

      T³umaczenia_Domyœlne_ButtonClick( Sender ); // Je¿eli w t³umaczeniu czegoœ zabraknie to zostanie wartoœæ domyœlna.
      Wczytaj_T³umaczenie( T³umaczenia_ListBox.Items[ T³umaczenia_ListBox.ItemIndex ] );

    end;
  //---//if    ( T³umaczenia_ListBox.ItemIndex >= 0 ) (...)

end;//---//T³umaczenia_Zastosuj_ButtonClick().

//T³umaczenia_ListBoxDblClick().
procedure TMahjong_3D_Form.T³umaczenia_ListBoxDblClick( Sender: TObject );
begin

  T³umaczenia_Zastosuj_ButtonClick( T³umaczenia_Zastosuj_Button );

end;//---//T³umaczenia_ListBoxDblClick().

//T³umaczenia_ListBoxKeyDown().
procedure TMahjong_3D_Form.T³umaczenia_ListBoxKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
begin

  // Enter.
  if Key = 13 then
    begin

      Key := 0;
      T³umaczenia_Zastosuj_ButtonClick( T³umaczenia_Zastosuj_Button );

    end;
  //---//if Key = 13 then

end;//---//T³umaczenia_ListBoxKeyDown().

//Obrazek_T³a_Planszy__Wybierz_ButtonClick().
procedure TMahjong_3D_Form.Obrazek_T³a_Planszy__Wybierz_ButtonClick( Sender: TObject );
begin

  //OpenDialog1.Filter := 'Obrazki|*.bmp; *.gif; *.jpg; *.jpeg; *.png; *.tif; *.tiff|Wszystkie pliki|*.*';
  OpenDialog1.Filter := t³umaczenie_komunikaty_r.inne__obrazek_t³a_planszy__filtr;

  //OpenDialog1.InitialDir := '';

  if OpenDialog1.Execute() then
    begin

      if not Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne_CheckBox.Checked then
        Wczytaj_T³o_Planszy( OpenDialog1.FileName )
      else//if not Obrazek_T³a_Planszy__Œcie¿ki_Wzglêdne_CheckBox.Checked then
        Wczytaj_T³o_Planszy(  ExtractRelativePath( Application.ExeName, OpenDialog1.FileName )  );

      GLSceneViewer1.Refresh();

    end;
  //---//if OpenDialog1.Execute() then

end;//---//Obrazek_T³a_Planszy__Wybierz_ButtonClick().

//Obrazek_T³a_Planszy__Wyœwietl_CheckBoxClick().
procedure TMahjong_3D_Form.Obrazek_T³a_Planszy__Wyœwietl_CheckBoxClick( Sender: TObject );
begin

  T³o_GLSkyBox.Visible := Obrazek_T³a_Planszy__Wyœwietl_CheckBox.Checked;

end;//---//Obrazek_T³a_Planszy__Wyœwietl_CheckBoxClick().

//Obrazek_T³a_Planszy__Brak_ButtonClick().
procedure TMahjong_3D_Form.Obrazek_T³a_Planszy__Brak_ButtonClick( Sender: TObject );
begin

  //if Application.MessageBox( 'Ustawiæ pusty obrazek t³a planszy?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES then
  if Application.MessageBox(  PChar( t³umaczenie_komunikaty_r.komunikat__ustawiæ_pusty_obrazek_t³a_planszy ), PChar( t³umaczenie_komunikaty_r.komunikat__potwierdzenie ), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2  ) <> IDYES then
    Exit;


  //if Obrazek_T³a_Planszy__Wszystkie_RadioButton.Checked then
  //  GLMaterialLibrary1.Materials.Clear()
  //else//if Obrazek_T³a_Planszy__Wszystkie_RadioButton.Checked then
  //  Wczytaj_T³o_Planszy( '' ); // '*:?:*<>"\|/'

  Wczytaj_T³o_Planszy( '' ); // Aby zapisa³o siê do pliku. '*:?:*<>"\|/'

  GLSceneViewer1.Refresh();

end;//---//Obrazek_T³a_Planszy__Brak_ButtonClick().

//Timer1Timer().
procedure TMahjong_3D_Form.Timer1Timer( Sender: TObject );
begin

  if Gra__Demo_MenuItem.Checked then
    begin

      if kostka_demo = nil then
        Gra__PodpowiedŸ_MenuItemClick( Sender )
      else//if kostka_demo = nil then
        begin

          KostkaClick( kostka_demo ); // Tutaj wyzeruje kostka_klikniêta, kostka_podpowiedŸ_1, kostka_podpowiedŸ_2 = nil.
          kostka_demo := nil;

        end;
      //---//if kostka_demo = nil then

    end;
  //---//if Gra__Demo_MenuItem.Checked then


  case Wyœwietlanie_Czasu_RadioGroup.ItemIndex of
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
  //---//case Wyœwietlanie_Czasu_RadioGroup.ItemIndex of


  StatusBar1.Panels[ 3 ].Text := t³umaczenie_komunikaty_r.panel_napis__przetasowania_iloœæ + ' ' + Trim(  FormatFloat( '### ### ##0', przetasowania_iloœæ )  );
  StatusBar1.Panels[ 4 ].Text := t³umaczenie_komunikaty_r.panel_napis__podpowiedzi_iloœæ + ' ' + Trim(  FormatFloat( '### ### ##0', podpowiedzi_iloœæ )  );

  StatusBar1.Panels[ 5 ].Text := t³umaczenie_komunikaty_r.panel_napis__cofniêcia_iloœæ + ' ' + Trim(  FormatFloat( '### ### ##0', cofniêcia_iloœæ )  );

  if Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked then
    StatusBar1.Panels[ 6 ].Text := Trim(  t³umaczenie_komunikaty_r.panel_napis__par_do_zdjêcia + ' ' + FormatFloat( '### ### ##0', par_do_zdjêcia_iloœæ )  )
  else//if Wyœwietlanie_Iloœci_Par_Do_Zdjêcia_CheckBox.Checked then
    StatusBar1.Panels[ 6 ].Text := '';

end;//---//Timer1Timer().

end.
