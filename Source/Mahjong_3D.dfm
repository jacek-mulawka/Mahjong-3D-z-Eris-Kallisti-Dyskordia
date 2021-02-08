﻿object Mahjong_3D_Form: TMahjong_3D_Form
  Left = 0
  Top = 0
  Caption = 'Mahjong 3D z Eris Kallisti Dyskordia'
  ClientHeight = 742
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = PlanszaKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Opcje_Splitter: TSplitter
    Left = 726
    Top = 0
    Width = 8
    Height = 723
    Align = alRight
    Visible = False
    ExplicitLeft = 727
    ExplicitHeight = 719
  end
  object Przybliżenie_Splitter: TSplitter
    Left = 75
    Top = 0
    Width = 8
    Height = 723
    Visible = False
    ExplicitLeft = 731
    ExplicitTop = 5
  end
  object Opcje_Panel: TPanel
    Left = 734
    Top = 0
    Width = 250
    Height = 723
    Align = alRight
    TabOrder = 0
    Visible = False
    object PageControl1: TPageControl
      Left = 1
      Top = 51
      Width = 248
      Height = 671
      ActivePage = O_Programie_TabSheet
      Align = alClient
      TabHeight = 45
      TabOrder = 0
      object Opcje_TabSheet: TTabSheet
        Caption = 'Opcje'
        ParentShowHint = False
        ShowHint = True
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Opcje_ScrollBox: TScrollBox
          Left = 0
          Top = 0
          Width = 240
          Height = 616
          VertScrollBar.Position = 951
          Align = alClient
          TabOrder = 0
          TabStop = True
          OnClick = GLSceneViewer1Click
          OnMouseWheel = ScrollBoxMouseWheel
          object Szybkość_Zegara_Etykieta_Label: TLabel
            Left = 10
            Top = -546
            Width = 104
            Height = 13
            Caption = 'Szybko'#347#263' zegara [ms]'
            ParentShowHint = False
            ShowHint = True
          end
          object Margines_Planszy_Etykieta_Label: TLabel
            Left = 10
            Top = -491
            Width = 82
            Height = 13
            Caption = 'Margines planszy'
            ParentShowHint = False
            ShowHint = True
          end
          object Szerokość_Kostek_Etykieta_Label: TLabel
            Left = 10
            Top = -771
            Width = 82
            Height = 13
            Caption = 'Szeroko'#347#263' kostek'
            ParentShowHint = False
            ShowHint = True
          end
          object Układ_Kostek_Nazwa_Label: TLabel
            Left = 17
            Top = -316
            Width = 133
            Height = 13
            Caption = 'Nazwa uk'#322'adu kostek: <?>.'
          end
          object Wysokość_Kostek_Etykieta_Label: TLabel
            Left = 10
            Top = -716
            Width = 82
            Height = 13
            Caption = 'Wysoko'#347#263' kostek'
            ParentShowHint = False
            ShowHint = True
          end
          object Kamera_Współrzędne_Etykieta_Label: TLabel
            Left = 10
            Top = 549
            Width = 143
            Height = 13
            Caption = 'Wsp'#243#322'rz'#281'dne kamery i jej celu'
          end
          object Grubość_Kostek_Etykieta_Label: TLabel
            Left = 10
            Top = -656
            Width = 73
            Height = 13
            Caption = 'Grubo'#347#263' kostek'
            ParentShowHint = False
            ShowHint = True
          end
          object Kamera_Współrzędne_Label: TLabel
            Left = 10
            Top = 566
            Width = 64
            Height = 39
            Caption = 'x: <?>   <?>'#13#10'y: <?>   <?>'#13#10'z: <?>   <?>'
            ParentShowHint = False
            ShowHint = True
          end
          object Szybkość_Kamery_Etykieta_Label: TLabel
            Left = 10
            Top = -601
            Width = 112
            Height = 13
            Caption = 'Szybko'#347#263' ruchu kamery'
            ParentShowHint = False
            ShowHint = True
          end
          object Szybkość_Zegara_SpinEdit: TSpinEdit
            Left = 10
            Top = -526
            Width = 121
            Height = 22
            MaxValue = 999999999
            MinValue = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            Value = 1000
            OnChange = Szybkość_Zegara_SpinEditChange
          end
          object Wysokość_Kostek_SpinEdit: TSpinEdit
            Left = 10
            Top = -696
            Width = 121
            Height = 22
            MaxValue = 999999999
            MinValue = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Value = 70
            OnChange = Kostki_SpinEditChange
          end
          object Szerokość_Kostek_SpinEdit: TSpinEdit
            Left = 10
            Top = -751
            Width = 121
            Height = 22
            MaxValue = 999999999
            MinValue = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            Value = 50
            OnChange = Kostki_SpinEditChange
          end
          object Margines_Planszy_SpinEdit: TSpinEdit
            Left = 10
            Top = -471
            Width = 121
            Height = 22
            MaxValue = 999999999
            MinValue = 0
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            Value = 50
            OnChange = Kostki_SpinEditChange
          end
          object Układ_Kostek_Nazwa_Wyczyść_Button: TButton
            Left = 11
            Top = -291
            Width = 175
            Height = 25
            Caption = 'Nazwa uk'#322'adu kostek - wyczy'#347#263
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            OnClick = Układ_Kostek_Nazwa_Wyczyść_ButtonClick
          end
          object Wartości_Domyślne_Button: TButton
            Left = 11
            Top = -416
            Width = 175
            Height = 25
            Caption = 'Warto'#347'ci domy'#347'lne'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            OnClick = Wartości_Domyślne_ButtonClick
          end
          object Wyświetlanie_Czasu_RadioGroup: TRadioGroup
            Left = 10
            Top = -941
            Width = 185
            Height = 105
            Caption = 'Wy'#347'wietlanie czasu'
            ItemIndex = 0
            Items.Strings = (
              'Brak'
              'Czas gry'
              'Czas')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TabStop = True
          end
          object Wczytaj_Ustawienia_Button: TButton
            Left = 11
            Top = -365
            Width = 175
            Height = 25
            Caption = 'Wczytaj ustawienia'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 9
            OnClick = Wczytaj_Ustawienia_ButtonClick
          end
          object Wyświetlanie_Ilości_Par_Do_Zdjęcia_CheckBox: TCheckBox
            Left = 10
            Top = -816
            Width = 300
            Height = 17
            Caption = 'Wy'#347'wietlanie ilo'#347'ci par do zdj'#281'cia'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object Automatyczne_Wczytywanie_Układu_Kostek_CheckBox: TCheckBox
            Left = 5
            Top = -191
            Width = 300
            Height = 17
            Hint = 
              'Automatyczne wczytywanie zapisanego uk'#322'adu kostek po uruchomieni' +
              'u gry.'
            Caption = 'Automatyczne wczytywanie uk'#322'adu kostek'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
          end
          object Wczytuj_Konfigurację_Kostek_CheckBox: TCheckBox
            Left = 5
            Top = -146
            Width = 300
            Height = 17
            Caption = 'Wczytuj konfiguracj'#281' obrazk'#243'w'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
          end
          object Kostki_Kwiatków_CheckBox: TCheckBox
            Left = 5
            Top = -106
            Width = 300
            Height = 17
            Hint = 
              'Zamiast dw'#243'ch zestaw'#243'w kostek p'#243'r roku u'#380'yj jednego zestawu kost' +
              'ek p'#243'r roku i jednego zestawu kostek kwiatk'#243'w.'
            Caption = 'Kostki kwiatk'#243'w'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 14
          end
          object Obrazek_Tła_Planszy__Wybierz_Button: TButton
            Left = 10
            Top = 389
            Width = 175
            Height = 25
            Caption = 'Wybierz obrazek t'#322'a planszy'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 20
            OnClick = Obrazek_Tła_Planszy__Wybierz_ButtonClick
          end
          object Obrazek_Tła_Planszy__Brak_Button: TButton
            Left = 10
            Top = 494
            Width = 175
            Height = 25
            Caption = 'Brak obrazka t'#322'a planszy'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 22
            OnClick = Obrazek_Tła_Planszy__Brak_ButtonClick
          end
          object Obrazek_Tła_Planszy__Wyświetl_CheckBox: TCheckBox
            Left = 5
            Top = 449
            Width = 300
            Height = 17
            Caption = 'Wy'#347'wietl obrazek t'#322'a planszy'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 21
            OnClick = Obrazek_Tła_Planszy__Wyświetl_CheckBoxClick
          end
          object Podpowiadaj_Tylko_Jeden_Ruch_CheckBox: TCheckBox
            Left = 5
            Top = -66
            Width = 200
            Height = 17
            Caption = 'Podpowiadaj tylko jeden ruch'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
          end
          object Pełny_Ekran_CheckBox: TCheckBox
            Left = 5
            Top = -21
            Width = 200
            Height = 17
            Caption = 'Pe'#322'ny ekran'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 16
            OnClick = Pełny_Ekran_CheckBoxClick
          end
          object Grubość_Kostek_SpinEdit: TSpinEdit
            Left = 10
            Top = -636
            Width = 121
            Height = 22
            MaxValue = 999999999
            MinValue = 0
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            Value = 1
            OnChange = Kostki_SpinEditChange
          end
          object Kamera_Na_Środek_Układu_Kostek_CheckBox: TCheckBox
            Left = 5
            Top = -231
            Width = 300
            Height = 17
            Caption = 'Kamera spogl'#261'da na '#347'rodek uk'#322'adu kostek'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnClick = Kostki_SpinEditChange
          end
          object Szybkość_Kamery_SpinEdit: TSpinEdit
            Left = 10
            Top = -581
            Width = 121
            Height = 22
            MaxValue = 999999999
            MinValue = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            Value = 10
            OnChange = Kostki_SpinEditChange
          end
          object Przybliżenie_CheckBox: TCheckBox
            Left = 5
            Top = 27
            Width = 200
            Height = 17
            Hint = 'Wy'#347'wietl panel przybli'#380'enia.'
            Caption = 'Panel przybli'#380'enia'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 17
            OnClick = Przybliżenie_CheckBoxClick
          end
          object Obrazek_Tła_Planszy__Bok_Panel: TPanel
            Left = 10
            Top = 74
            Width = 225
            Height = 215
            Hint = 'Wska'#380' cz'#281#347#263' t'#322'a do zmodyfikowania.'
            TabOrder = 18
            object Obrazek_Tła_Planszy__Góra_RadioButton: TRadioButton
              Left = 80
              Top = 10
              Width = 55
              Height = 17
              Caption = 'G'#243'ra'
              TabOrder = 0
            end
            object Obrazek_Tła_Planszy__Lewo_RadioButton: TRadioButton
              Left = 15
              Top = 55
              Width = 55
              Height = 17
              Caption = 'Lewo'
              TabOrder = 2
            end
            object Obrazek_Tła_Planszy__Przód_RadioButton: TRadioButton
              Left = 80
              Top = 55
              Width = 55
              Height = 17
              Caption = 'Prz'#243'd'
              Checked = True
              TabOrder = 3
              TabStop = True
            end
            object Obrazek_Tła_Planszy__Prawo_RadioButton: TRadioButton
              Left = 145
              Top = 55
              Width = 55
              Height = 17
              Caption = 'Prawo'
              TabOrder = 4
            end
            object Obrazek_Tła_Planszy__Dół_RadioButton: TRadioButton
              Left = 80
              Top = 100
              Width = 55
              Height = 17
              Caption = 'D'#243#322
              TabOrder = 5
            end
            object Obrazek_Tła_Planszy__Tył_RadioButton: TRadioButton
              Left = 80
              Top = 145
              Width = 55
              Height = 17
              Caption = 'Ty'#322
              TabOrder = 6
            end
            object Obrazek_Tła_Planszy__Wszystkie_RadioButton: TRadioButton
              Left = 10
              Top = 190
              Width = 180
              Height = 17
              Caption = 'Wszystkie'
              TabOrder = 7
            end
            object Obrazek_Tła_Planszy__Chmury_RadioButton: TRadioButton
              Left = 145
              Top = 10
              Width = 60
              Height = 17
              Caption = 'Chmury'
              TabOrder = 1
            end
          end
          object Obrazek_Tła_Planszy__Ścieżki_Względne_CheckBox: TCheckBox
            Left = 5
            Top = 329
            Width = 200
            Height = 17
            Hint = 'Pr'#243'buj zapisa'#263' '#347'cie'#380'ki do plik'#243'w obrazk'#243'w w postaci wzgl'#281'dnej.'
            Caption = 'Wzgl'#281'dne '#347'cie'#380'ki obrazk'#243'w'
            TabOrder = 19
          end
        end
      end
      object Pomoc_TabSheet: TTabSheet
        Caption = 'Pomoc'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Pomoc_Memo: TMemo
          Left = 0
          Top = 0
          Width = 240
          Height = 616
          Align = alClient
          Lines.Strings = (
            'Pomoc.')
          ParentShowHint = False
          ReadOnly = True
          ScrollBars = ssBoth
          ShowHint = True
          TabOrder = 0
        end
      end
      object Tłumaczenia_TabSheet: TTabSheet
        Caption = 'T'#322'umaczenia'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Tłumaczenia_Panel: TPanel
          Left = 0
          Top = 0
          Width = 240
          Height = 80
          Align = alTop
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object Tłumaczenia_Zastosuj_Button: TButton
            Left = 5
            Top = 45
            Width = 75
            Height = 25
            Caption = 'Zastosuj'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = Tłumaczenia_Zastosuj_ButtonClick
          end
          object Tłumaczenia_Odśwież_Button: TButton
            Left = 5
            Top = 10
            Width = 75
            Height = 25
            Caption = 'Od'#347'wie'#380
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = Wczytaj_Listę_Tłumaczeń
          end
          object Tłumaczenia_Domyślne_Button: TButton
            Left = 125
            Top = 45
            Width = 75
            Height = 25
            Hint = 'Ustaw domy'#347'lne t'#322'umaczenie.'
            Caption = 'Domy'#347'lne'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = Tłumaczenia_Domyślne_ButtonClick
          end
        end
        object Tłumaczenia_ListBox: TListBox
          Left = 0
          Top = 80
          Width = 240
          Height = 536
          Align = alClient
          ItemHeight = 13
          TabOrder = 1
          OnDblClick = Tłumaczenia_ListBoxDblClick
          OnKeyDown = Tłumaczenia_ListBoxKeyDown
        end
      end
      object O_Programie_TabSheet: TTabSheet
        Caption = 'O programie'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        object O_Programie_Label: TLabel
          Left = 0
          Top = 0
          Width = 240
          Height = 260
          Align = alTop
          Caption = 
            'Mahjong 3D z Eris Kallisti Dyskordia'#13#10'wersja 2021.02.07.'#13#10#13#10'MIT ' +
            'License'#13#10#13#10'Copyright (c) 2017 Jacek Mulawka'#13#10#13#10'j.mulawka@interia' +
            '.pl'#13#10#13#10'https://github.com/jacek-mulawka'#13#10#13#10#13#10#13#10'Program jest darm' +
            'owy, udost'#281'pniony w postaci takiej jakiej jest wraz ze wszystkim' +
            'i b'#322#281'dami. U'#380'ytkownik zyskuje dost'#281'p do programu, u'#380'ywa programu' +
            ' na w'#322'asne ryzyko i ponosi wy'#322#261'czn'#261' odpowiedzialno'#347#263' za wszelkie' +
            ' szkody (w'#322'asne i niew'#322'asne) materialne i niematerialne oraz utr' +
            'at'#281' danych w zwi'#261'zku z u'#380'ywaniem programu.'
          WordWrap = True
          ExplicitWidth = 237
        end
      end
    end
    object Opcje_Przyciskij_Panel: TPanel
      Left = 1
      Top = 1
      Width = 248
      Height = 50
      Align = alTop
      TabOrder = 1
      object Opcje_Ukryj_Button: TButton
        Left = 210
        Top = 5
        Width = 25
        Height = 25
        Hint = 'Ukryj opcje.'
        Caption = 'x'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = Opcje_Ukryj_ButtonClick
      end
      object Zapisz_Ustawienia_Button: TButton
        Left = 6
        Top = 5
        Width = 175
        Height = 25
        Caption = 'Zapisz ustawienia'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = Zapisz_Ustawienia
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 723
    Width = 984
    Height = 19
    DoubleBuffered = False
    Panels = <
      item
        Width = 50
      end
      item
        Width = 150
      end
      item
        Width = 250
      end
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 150
      end>
    ParentDoubleBuffered = False
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 295
    Top = 281
    Width = 100
    Height = 100
    Camera = GLCamera1
    FieldOfView = 90.000000000000000000
    OnClick = GLSceneViewer1Click
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    OnMouseWheel = GLSceneViewer1MouseWheel
    OnKeyDown = PlanszaKeyDown
    TabStop = True
    TabOrder = 2
    OnGesture = GLSceneViewer1Gesture
    Touch.InteractiveGestures = [igZoom, igPressAndTap]
  end
  object Przybliżenie_Panel: TPanel
    Left = 0
    Top = 0
    Width = 75
    Height = 723
    Hint = 'Przybli'#380'enie.'
    Align = alLeft
    Caption = '^...v'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnMouseDown = Przybliżenie_PanelMouseDown
    OnMouseMove = Przybliżenie_PanelMouseMove
  end
  object MainMenu1: TMainMenu
    Left = 26
    Top = 7
    object Gra_MenuItem: TMenuItem
      Caption = 'Gra'
      object Gra__Demo_MenuItem: TMenuItem
        AutoCheck = True
        Caption = 'Demo'
        OnClick = Gra__Demo_MenuItemClick
      end
      object Gra__Cofnij_MenuItem: TMenuItem
        Caption = 'Cofnij'
        OnClick = Gra__Cofnij_MenuItemClick
      end
      object Gra__Nowa_Gra_MenuItem: TMenuItem
        Caption = 'Nowa gra'
        OnClick = Gra__Nowa_Gra_MenuItemClick
      end
      object Gra__Podpowiedź_MenuItem: TMenuItem
        Caption = 'Podpowied'#378
        OnClick = Gra__Podpowiedź_MenuItemClick
      end
      object Gra__Przetasuj_MenuItem: TMenuItem
        Caption = 'Przetasuj'
        OnClick = Gra__Przetasuj_MenuItemClick
      end
      object Gra__Wyczyść_Planszę_MenuItem: TMenuItem
        Caption = 'Wyczy'#347#263' plansz'#281
        OnClick = Gra__Wyczyść_Planszę_MenuItemClick
      end
      object Gra__Wyjdź_MenuItem: TMenuItem
        Caption = 'Wyjd'#378
        OnClick = Gra__Wyjdź_MenuItemClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Gra__Zaprezentuj_Kostki_MenuItem: TMenuItem
        Caption = 'Zaprezentuj kostki'
        OnClick = Gra__Zaprezentuj_Kostki_MenuItemClick
      end
    end
    object Układy_Kostek_MenuItem: TMenuItem
      Caption = 'Uk'#322'ady kostek'
    end
    object Obrazki_Kostek_MenuItem: TMenuItem
      Caption = 'Obrazki kostek'
    end
    object Opcje_MenuItem: TMenuItem
      Caption = 'Opcje'
      OnClick = Opcje_MenuItemClick
    end
    object Pomoc_MenuItem: TMenuItem
      Caption = 'Pomoc'
      OnClick = Opcje_MenuItemClick
    end
    object Kamera_Ruch_Ciągły_MenuItem: TMenuItem
      AutoCheck = True
      Caption = 'Ci'#261'g'#322'y ruch kamery'
      OnClick = Kamera_Ruch_Ciągły_MenuItemClick
    end
    object Pełny_Ekran_MenuItem: TMenuItem
      Caption = 'Pe'#322'ny ekran'
      OnClick = Pełny_Ekran_MenuItemClick
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 109
    Top = 7
  end
  object OpenDialog1: TOpenDialog
    Left = 202
    Top = 7
  end
  object GLScene1: TGLScene
    Left = 195
    Top = 330
    object Tło_GLSkyBox: TGLSkyBox
      Pickable = False
      MaterialLibrary = GLMaterialLibrary1
      MatNameTop = 'G'#243'ra'
      MatNameBottom = 'D'#243#322
      MatNameLeft = 'Lewo'
      MatNameRight = 'Prawo'
      MatNameFront = 'Prz'#243'd'
      MatNameBack = 'Ty'#322
      MatNameClouds = 'Chmury'
      CloudsPlaneOffset = 0.200000002980232200
      CloudsPlaneSize = 32.000000000000000000
    end
    object Test_GLSphere: TGLSphere
      Radius = 0.500000000000000000
    end
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      Position.Coordinates = {0000000000000000000020410000803F}
    end
    object GLLightSource1: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {00000000000000000000C8420000803F}
      SpotCutOff = 180.000000000000000000
    end
    object Test_GLCube: TGLCube
      Visible = False
    end
    object Kamera_Na_GLDummyCube: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Left = 195
    Top = 395
  end
end
