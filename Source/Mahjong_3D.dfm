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
      ActivePage = Opcje_TabSheet
      Align = alClient
      TabHeight = 45
      TabOrder = 0
      object Opcje_TabSheet: TTabSheet
        Caption = 'Opcje'
        ParentShowHint = False
        ShowHint = True
        object Opcje_ScrollBox: TScrollBox
          Left = 0
          Top = 0
          Width = 240
          Height = 616
          VertScrollBar.Position = 494
          Align = alClient
          TabOrder = 0
          TabStop = True
          OnClick = GLSceneViewer1Click
          OnMouseWheel = ScrollBoxMouseWheel
          object Szybkość_Zegara_Etykieta_Label: TLabel
            Left = 10
            Top = -89
            Width = 104
            Height = 13
            Caption = 'Szybko'#347#263' zegara [ms]'
            ParentShowHint = False
            ShowHint = True
          end
          object Margines_Planszy_Etykieta_Label: TLabel
            Left = 10
            Top = -34
            Width = 82
            Height = 13
            Caption = 'Margines planszy'
            ParentShowHint = False
            ShowHint = True
          end
          object Szerokość_Kostek_Etykieta_Label: TLabel
            Left = 10
            Top = -314
            Width = 82
            Height = 13
            Caption = 'Szeroko'#347#263' kostek'
            ParentShowHint = False
            ShowHint = True
          end
          object Układ_Kostek_Nazwa_Label: TLabel
            Left = 17
            Top = 141
            Width = 133
            Height = 13
            Caption = 'Nazwa uk'#322'adu kostek: <?>.'
          end
          object Wysokość_Kostek_Etykieta_Label: TLabel
            Left = 10
            Top = -259
            Width = 82
            Height = 13
            Caption = 'Wysoko'#347#263' kostek'
            ParentShowHint = False
            ShowHint = True
          end
          object Kamera_Współrzędne_Etykieta_Label: TLabel
            Left = 10
            Top = 1006
            Width = 143
            Height = 13
            Caption = 'Wsp'#243#322'rz'#281'dne kamery i jej celu'
          end
          object Grubość_Kostek_Etykieta_Label: TLabel
            Left = 10
            Top = -199
            Width = 73
            Height = 13
            Caption = 'Grubo'#347#263' kostek'
            ParentShowHint = False
            ShowHint = True
          end
          object Kamera_Współrzędne_Label: TLabel
            Left = 10
            Top = 1023
            Width = 64
            Height = 39
            Caption = 'x: <?>   <?>'#13#10'y: <?>   <?>'#13#10'z: <?>   <?>'
            ParentShowHint = False
            ShowHint = True
          end
          object Szybkość_Kamery_Etykieta_Label: TLabel
            Left = 10
            Top = -144
            Width = 112
            Height = 13
            Caption = 'Szybko'#347#263' ruchu kamery'
            ParentShowHint = False
            ShowHint = True
          end
          object Szybkość_Zegara_SpinEdit: TSpinEdit
            Left = 10
            Top = -69
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
            Top = -239
            Width = 121
            Height = 22
            MaxValue = 999999999
            MinValue = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Value = 2
            OnChange = Kostki_SpinEditChange
          end
          object Szerokość_Kostek_SpinEdit: TSpinEdit
            Left = 10
            Top = -294
            Width = 121
            Height = 22
            MaxValue = 999999999
            MinValue = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            Value = 1
            OnChange = Kostki_SpinEditChange
          end
          object Margines_Planszy_SpinEdit: TSpinEdit
            Left = 10
            Top = -14
            Width = 121
            Height = 22
            MaxValue = 999999999
            MinValue = 0
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            Value = 0
            OnChange = Kostki_SpinEditChange
          end
          object Układ_Kostek_Nazwa_Wyczyść_Button: TButton
            Left = 11
            Top = 166
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
            Top = 41
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
            Top = -484
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
            Top = 92
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
            Top = -359
            Width = 300
            Height = 17
            Caption = 'Wy'#347'wietlanie ilo'#347'ci par do zdj'#281'cia'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 1
          end
          object Automatyczne_Wczytywanie_Układu_Kostek_CheckBox: TCheckBox
            Left = 5
            Top = 266
            Width = 300
            Height = 17
            Hint = 
              'Automatyczne wczytywanie zapisanego uk'#322'adu kostek po uruchomieni' +
              'u gry.'
            Caption = 'Automatyczne wczytywanie uk'#322'adu kostek'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 12
          end
          object Wczytuj_Konfigurację_Kostek_CheckBox: TCheckBox
            Left = 5
            Top = 311
            Width = 300
            Height = 17
            Hint = 
              'Podczas '#322'adowania uk'#322'adu kostek ustawiaj parametry kostek z plik' +
              'u konfiguracyjnego uk'#322'adu kostek (je'#380'eli dost'#281'pne).'
            Caption = 'Wczytuj konfiguracj'#281' uk'#322'adu kostek'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 13
          end
          object Kostki_Kwiatków_CheckBox: TCheckBox
            Left = 5
            Top = 351
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
            Top = 846
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
            Top = 951
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
            Top = 906
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
            Top = 391
            Width = 200
            Height = 17
            Caption = 'Podpowiadaj tylko jeden ruch'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
          end
          object Pełny_Ekran_CheckBox: TCheckBox
            Left = 5
            Top = 436
            Width = 200
            Height = 17
            Caption = 'Pe'#322'ny ekran'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 16
            OnClick = Pełny_Ekran_CheckBoxClick
          end
          object Grubość_Kostek_SpinEdit: TSpinEdit
            Left = 10
            Top = -179
            Width = 121
            Height = 22
            MaxValue = 999999999
            MinValue = 0
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            Value = 7
            OnChange = Kostki_SpinEditChange
          end
          object Kamera_Na_Środek_Układu_Kostek_CheckBox: TCheckBox
            Left = 5
            Top = 226
            Width = 300
            Height = 17
            Caption = 'Kamera spogl'#261'da na '#347'rodek uk'#322'adu kostek'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 11
            OnClick = Kostki_SpinEditChange
          end
          object Szybkość_Kamery_SpinEdit: TSpinEdit
            Left = 10
            Top = -124
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
            Top = 484
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
            Top = 531
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
            Top = 786
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
        DesignSize = (
          240
          616)
        object O_Programie_Label: TLabel
          Left = 0
          Top = 0
          Width = 240
          Height = 260
          Align = alTop
          Caption = 
            'Mahjong 3D z Eris Kallisti Dyskordia'#13#10'wersja 2021.05.03.'#13#10#13#10'MIT ' +
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
        object Logo_Image: TImage
          Left = 195
          Top = 0
          Width = 43
          Height = 41
          Anchors = [akTop, akRight]
          AutoSize = True
          Picture.Data = {
            055449636F6E0000010001002B29000001002000FC1C00001600000028000000
            2B0000005200000001002000000000008C1B0000640000006400000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000403162E0000000004031640000000000403163400000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000040316330403163D04031641
            000000000403163B040316340403162E0403162A04031626000000000403161C
            000000000000000014040A080000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000004031628040C197B
            040927DA041A29F0042549F908243CF808243CF1042A3CE6042549DC143251D3
            1C334AC81C2A44B8040C196C000000000000000014040A0C0000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000413295E04031625
            040C19722C5A6CC75192A9DE5192A9EE5192A9F84C8EACFD347694FD246684FB
            18547CF80C4E74F5144264F12C5684EB405670E01C2A44D00C1329BB0C061856
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            041329530402058D041329BA74AEC8D84F9EB9E95CA6BCF44F9EB9FA409ECCFD
            4096B8FE24789CFF186A8CFE045279FE043C61FD043456FC144976FA295279F5
            34587AED3C4767DF171E37CB0403162D04031620000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000004031620041329B46CB4CCDB54A2B8F184DCF8F9
            6CC2E4FC5EBAE0FE5EBAE0FF54B4D0FF4096B8FF2486BCFF1C7CA9FF0C669AFF
            044474FF044474FE0C4470FD164E80FA3C5E84F31C385CE5040927C604031627
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000040316060000000000000000040316292C6E84CE
            74CBE1ED8CF4FCFA6CD4F9FE8CF4FCFF86E4FCFF84DCF8FF6CD4F9FF4CB6E4FF
            349CCAFF248EBCFF0872ACFF045A94FF045A94FF045289FF0C4A80FE2C5684FB
            2C5684F1042549D7040927A60000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            041A298B042A3CC08CD4ECE684DCF8F86CDDFCFE7CF4FCFF86E4FCFF86E4FCFF
            7CE4FCFF78DEF9FF5CCCF6FF4CBDECFF34ABD4FF2492CCFF147AACFF0872ACFF
            0C669AFF0C5B97FF1C5E94FE246494F70C3D69E3040927B90000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000403162208243CB494DCFCDE86E4FCF47CE4FCFD6EECFCFF
            64DDF9FF78DEF9FF6CDDFCFF78DEF9FF74E5FCFF64D6F4FF54CBF6FF44B5E1FF
            2CA3D1FF2C9ED4FF0872ACFF045A94FF0C669AFF0C5B97FE14538AFB14538AED
            0C3D69D00403162B000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000040C196E54A2B8D57CDAFCF0
            7CECFCFB84FAFCFE5CDCF9FF64E4FBFF6CE5FCFF6CE5FCFF6EECFCFF6CE5FCFF
            64E4FBFF64DDF9FF5CD5F9FF54CBF6FF34A6DCFF34A6DCFF147AACFF0C669AFF
            1465A1FF0C5692FD14538AF6144976E5041D3BC4040316280000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000004031624
            3C869CC389EBFCE87CECFCF86CDDFCFD64E4FBFF6CE5FCFF6EECFCFF62EAFCFF
            6EECFCFF64E4FBFF5CE4FCFF5CDCF9FF64E4FBFF54D3F4FF44BCE4FF44B5E1FF
            44AAD0FF2486BCFF1A74ACFF1465A1FF0C5692FE145B9AFC164E80F30C325CDF
            0403163104031622000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000041329A28CD4ECD694F2FCF174E5FCFC64DDF9FE5CDCF9FF
            6EECFCFF64E4FBFF72F4FCFF5CDCF9FF5CDCF9FF6EECFCFF62EAFCFF5CDCF9FF
            5CD5F9FF5CD5F9FF4CC2ECFF44B5E1FF3492BFFF247EBCFF1465A1FF0C5692FF
            145B9AFE0C4A80FA2C4B6CED040E28CC04031628000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000403161E347694B389EBFCE16CD4F9F6
            6CE5FCFD7CF4FCFF72F4FCFF7CECFCFF64E4FBFF5CDCF9FF5CE4FCFF5CE4FCFF
            54DCF7FF4CD4ECFF6EECFCFF72F4FCFF54CBF6FF54CBF6FF4CBDECFF3CA3D4FF
            348DC1FF1465A1FF0C5692FF145B9AFF0C4A80FD3C5E84F20C2644D50403162A
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            84CEDCBF74CBE1E854C2DCF96CE5FCFE6CDDFCFF6EECFCFF5CDCF9FF54CBE4FF
            72F4FCFF4CD4ECFF54E2FCFF72F4FCFF5CE4FCFF4CD4ECFF64E4FBFF72F4FCFF
            54C5F0FF54C5F0FF44A6DCFF348DC1FF1A74ACFF0C5B97FF1C629CFF1C558CFD
            3C5E84F41C2A44D80403162B0000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000422288D74CBE1CA54BADCED54CBE4FB64E4FBFE34B2D0FF
            5CD5F9FF5CCCE8FF54CBE4FF5CDCF9FF29B2CCFF3CC5DEFF54E2FCFF3CC5DEFF
            1CA6C4FF34BAD7FF44C5E9FF34B2D0FF4CBDECFF2C9ED4FF2486BCFF1C6EA0FF
            0C5692FF145B9AFF1C558CFD295279F4243857D80403162B0000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000C525C986CC6D4D25CCCE8F1
            64E4FBFC72F4FCFF44BCE4FF6EECFCFF74E5FCFF6EECFCFF34BAD7FF62EAFCFF
            77FBFCFF44D2ECFF29B2CCFF62EAFCFF72F4FCFF24A4C8FF2CA3D1FF54C5F0FF
            409ECCFF1A74ACFF2C78ACFF045289FF044480FF1C558CFD1C3E64F42C425CD8
            040E28A200000000000000000000000000000000000000000000000000000000
            0000000000000000140C10010000000000000000000000000000000000000000
            2C767CA06CCEDCD764D6F4F354CBE4FD77FBFCFF54D3F4FF77FBFCFF7CECFCFF
            74E5FCFF34BAD7FF3CC5DEFF62EAFCFF54E2FCFF3CCAE4FF5CE4FCFF6EECFCFF
            34BAD7FF34ABD4FF64D6F4FF3CA3D4FF247EBCFF247EBCFF045289FF044480FF
            1C5A8CFD143860F4344464D8041329A200000000000000000000000000000000
            000000000000000000000000000000000000000014040A010000000000000000
            00000000000000000000000054A2B8A974D8F8DC6EECFCF56EECFCFD5CE4FCFF
            72F4FCFF7CF4FCFF7CECFCFF74E5FCFF29B2CCFF54E2FCFF62EAFCFF3CC5DEFF
            3CC5DEFF72F4FCFF62EAFCFF3CBCDCFF5CD5F9FF4CB6E4FF34A6DCFF3492BFFF
            2C7EB1FF0C5B97FF044D84FF245A8CFD0C325CF4243857D80C1B2CA200000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000006CBAC4B578DEF9E2
            7CECFCF764E4FBFE5CE4FCFF6EECFCFF7CF4FCFF6EECFCFF74E5FCFF64E4FBFF
            62EAFCFF54E2FCFF54E2FCFF54E2FCFF54E2FCFF54D3F4FF54D3F4FF64DDF9FF
            54C5F0FF44A6DCFF348DC1FF1C6EA0FF044D84FF044D84FF245A8CFD0C325CF4
            243542D80C1B2CA2000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            040C195B84CEDCC486E4FCEA74E5FCFA64DDF9FE5CE4FCFF6EECFCFF6EECFCFF
            74E5FCFF6CE5FCFF62EAFCFF62EAFCFF62EAFCFF62EAFCFF62EAFCFF5CE4FCFF
            64E4FBFF64DDF9FF64D6F4FF5CCCF6FF5EBAE0FF409ECCFF2C78ACFF0C5692FF
            0C4A80FF144976FD0C2C4AF41C334AD80C1B2CA2000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000040C196594D4E8CF7CDAFCF078DEF9FB5CDCF9FE
            5CDCF9FF6EECFCFF6EECFCFF64E4FBFF6EECFCFF54DCF7FF62EAFCFF62EAFCFF
            54E2FCFF54E2FCFF62EAFCFF64E4FBFF64DDF9FF5CCCF6FF64CEF4FF5EBAE0FF
            449ACCFF2C78ACFF1C5E94FF18547CFF144976FD042D4BF4142B47D8041329A2
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000403162A94D4E8D5
            7CCEECF36CD4F9FC5CDCF9FF5CDCF9FF64E4FBFF64E4FBFF64E4FBFF6EECFCFF
            62EAFCFF54E2FCFF54E2FCFF62EAFCFF62EAFCFF5CDCF9FF5CD5F9FF6CE5FCFF
            7CECFCFF6CD4F9FF4CAAD4FF2C7EB1FF145C88FF145C88FF1C558CFF164E80FD
            042549F414253FD8041329A20000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000403162B90C2E0D76CBEE4F374D8F8FD6CDDFCFF5CDCF9FF5CE4FCFF
            64E4FBFF64E4FBFF6EECFCFF64E4FBFF62EAFCFF62EAFCFF5CE4FCFF5CE4FCFF
            64E4FBFF6EECFCFF6CE5FCFF8CF4FCFF74D8F8FF44A6DCFF24789CFF1C5E94FF
            1C558CFF164E80FF144976FD041D3BF30C2644D7040E28A10000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000403162A74A6C4D56CB4CCF37CDAFCFC
            74E5FCFF5CDCF9FF54DCF7FF62EAFCFF64E4FBFF62EAFCFF5CDCF9FF62EAFCFF
            64E4FBFF44CBE9FF4CCBECFF64E4FBFF6CE5FCFF64D6F4FF6CD4F9FF54BADCFF
            3C8EB4FF24789CFF246494FF14538AFF144976FE0C3D69FB041D3BF0041D3BD2
            040C196800000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000004031628
            6C8EACCF74AEC8EF94DCFCFB89EBFCFE6CDDFCFF64D6F4FF64E4FBFF6CE5FCFF
            64E4FBFF72F4FCFF4CD4ECFF44CBE9FF4CCBECFF44C5E9FF3CB5D9FF44BCE4FF
            5CCCF6FF54BADCFF3492BFFF1C6EA0FF145C88FF18547CFF164E80FE144976FC
            24446CF5041D3BE5171E37C3040C195F00000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000040C195B0C1329C394B6D4E890C2E0F9ACF2FCFE6CBEE4FF
            6CD4F9FF5CCCF6FF64DDF9FF54DCF7FF44C5E9FF44CBE9FF4CCBECFF1CA6C4FF
            54CBE4FF3CB5D9FF0C7CACFF44AAD0FF2C8AAFFF24789CFF1C6391FF18547CFF
            0C3D69FF143860FD1C3E64F7243857E71C2634CB0C1B2CA30403161E00000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000403162F243857DD
            84A2BCF46C9ABCFC9CDAF4FF3C8EB4FF349CCAFF3CACD8FF44B5E1FF34ABD4FF
            2CA3D1FF1483A9FF1483A9FF1483A9FF1C8AACFF1C7CA9FF2C8AAFFF186A8CFF
            0C4E74FF043C61FF144264FF244A74FE244A74FA143251ED041537D1141C20A6
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000403162B04031638041D3BEE54829CFB447A9CFE3C8AACFF348EB4FF
            1C7CA9FF3492BFFF045279FF146290FF045A7CFF348EB4FF044C70FF044C70FF
            0C525CFF043C61FE043456FF042A3CFF041D3BFF042A3CFF1C385CFC243E64F5
            243857DF1C2A44B6000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000403161900000000040316350403163E04031642
            041537FE042D4BFE042549FE043456FE041D3BFE043C61FE043C61FF041537FF
            0C4470FF041D3BFF042D4BFE042D4BFC040E28FB041537FB041D3BFC042549FD
            042D4BFC142B47F80C1B37EB041329CC0409279B000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            040316350403163E0403164204031643041537FA041329F8042D4BF7043456F8
            041537FB0C2C4AFD243857FE344E70FF24446CFE042549FA041D3BF50C2644F1
            0C2C4AF00C2C4AF2041537F4040E28F40C1B37EE041329D90403163004031621
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000403162D0403163600000000142B47EF0C2C4AEF2C425CEA
            34587AE4144264E12C4B6CE6344464EF3C4767F73C4767FC1C2A44FE2C3A54FB
            040316F30C1B37E4405670D71C2634D2243542D5171E37DA041418DD041329D8
            0403163300000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000040C193E0C13297A1C2A3494243542AD243542C3546674D0
            243542D46C7E94CF405670C44C5B6FB82C3E54B5171E37BF2C3248D50C1329EA
            04031642171E37FB545B6CF6040927E604031636000000002C3248A0545B6CA0
            546674A7646674B0546674B03434409C0403161E000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000140C10081C26345D303C447454667484
            6C767C904C5B6F9934444C9E3C48589D04031628040C195B0000000000000000
            000000000403162F0403163A000000003C4858F5545B6CED000000000403162E
            0000000000000000000000000000000000000000343440772C2E346B00000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000004031635000000009CB2BCEA
            344464DB00000000040316240000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000040C1954
            00000000041A29DAA4CACCDB042228C104141851000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000403162D548284CE7CAAACCB0000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000001C4A4C9DBCEAECC2
            74969CBE04141852000000000414182200000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000054828489A4C2CCAE607E84AD04031626000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000001C334A6A34444C8E0422289800000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000014152489000000000C06182D0C06181C0000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000C061848000000000C06184700000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000030D8E7F32A274C87
            F6D6065E5BE8FD3BAD9A38032E5EF620E88DE6415FD7DFEFBD127E5EFD85D41F
            0FC389675D078BF63D4AEACBC83AC4F901C2AC01F2075034C0E50E811B49A071
            DB0FCC84EC921BB0ADC41A9B535D14F3658304322A5E28FCE5B8FB1585DF2838
            FE68F537DB8AA1A47226B3F9C9F36F16A9FE94F0C38A6A86C18CEE2BCE5C04D1
            4838EDC7A5EABBE3CFBC16F65CFAFB41BDFEAD971F828FDF7D41EA8F878134BE
            E57F5A01A5E513A5BE94AC233983905285F9D1636E1A49CEB4801038EC6DD052
            BB86D50A881B8ACA65893F152936DEBA6AD52A6A2D9E515320D304F02CEE4EE7
            C2785CA59F4EA781D209BBA2DA6F06336FF79B78D55FA55274C6FB735CF80957
            9EB17087411BE9027D0657A0E9401AC140E1B4B7C0AD97FF4EEA8F27099DDE08
            773CF43E2847E3F09184B8A720A705B0C6A29E109B40DC5AFF2B74381A984330
            168B09A411D228223B579A5B6B3EFFFC73810432828C89195FECB3197FC8CA64
            930F5CE1F34A264161C90426F8163EDB8FBCFE42C28FD0D64B361C34803316A0
            EA96B9F90F9446FCC7473E04A56AE082F3C76B8F83D6A6ED527E3C29A8183F0D
            AEBEFD39A92F23AB48CE1F144705825C962045059826E0F641D3B69510F00792
            19826436A016F0D81E932397E2CB639934053249007FC3DD05C2EA4FABBBDE60
            C6D57F3EAEFCBAA4EA4F317F0DAFFA0BADBC7335ECD715572201643AD36ECE6E
            FBC2E917FD71C0AF5BF5CD87F0E2DF6F91EAA3E9167B1D78021C71D2E5525F46
            56914C15265F00DF543410E2128448032022686FA9057BD3C6AE61C1A059179D
            AE8F6C6EC8A429901151E3FBFA6F4361D608ABBF96C27EE3768282C2712CE987
            527DA9C69F0A7D92ADBD86595BAFABCF5E885F6C660940ADD1C19D7F1F5C2EC1
            75E7EF03E10CD5010C16E75E791F4C9BB987D4979175884791538210AB15E04B
            874913202DC0E7F5249383E29C2FE08189D6C6E5858585914C69019922807B70
            7795D8F6371871F5AFDE15577D6D920028D75FA3518A72FD33FD35A417CBCE59
            C4BEAC4C838466EACE032F2AFAC7337F82955F489310D413F20A4AE1FABFFC53
            EACBC83A840421A15680E50608A640572D80FA08B22842C26BD1F8A6CB7C9B5A
            8F3DF6D868261284D22E7228FCF9B8DB2E9EE7472A7E7EE9342828AE60B6BF39
            99EEAB4AE9E73FDCB0FCBCC519F5010898BCD3AE48020F0CF8757E9F1B6EBBFC
            E0A42D9A2BB8F4C6A7A17CFC34A92F23EB6069C2A2B261D655988F0A5078B069
            CB77E0F7FB981620440414B2F85FC6E96A6ED56834914C3804334100FF87BB1B
            85B83FADFE7ABD01CA26EEC1049F3CFF14F3A7B01F95F9B2621FBEBDCF70E280
            A6BACD70FF6DA767E55C264B3EDC786FFF7AF775C5E3F75C0A5B36ACCAE647D3
            272AAB77868BAE7F4CEACB48A276EB7AF8E08DBFB355F8CADB5E046D0686A1EC
            50364C5A00730886586B71F207D85BB683BD7913CB0B1045043A0A0DDE19A596
            70BBD1688CA6DB1448ABC8A1F053F60AADFED664C10F0A795EE914C82FAA6404
            60E12BFD84D55F2ECCF14BFB479E593CF5C095B069DDCAAC9C8B8A6CFEF4E87F
            07F55AB7AB0DEEBCF6A89CD2026871B8E19E77C068B24A7A1D3FAFFA0CDE7AE9
            AFE0F53893F7596C8570ED9DAFE16F5299F6F30923C8931D84D8BCC108783C48
            003EF20550B5E07710A48840AC530B50CAE3FF37B5D07E97DD6E0FA7DB21986E
            02B81E777F14AFFEACB77FF5EEB8EAEB70F557739D7DF9629F64D86F382DFDC0
            85746EBE781F88672807A03B5CF797B7982630183C4364B53E3B64D55FCC9CBF
            0F9C78AEB40347DE7CE12EF8FECB7776B8BF785C355C76F3F31939A730823C16
            13C2829164F310D204DA9BB782B3756BD772E1F6AA3CFF2C75C2E94CB743306D
            9287C24FBDAF6A50980B859C7F4AF9CD2B9E04F9C5E371F55773833C756A7EA8
            0797F403C37090E7171FBE041FBEF96856CFF9FB53AE815D170D2EB9C7E771C1
            9F97FD2EA7B400CA76BCE5A18F32B2D2F6175F7DFC2ABCFFFAC3DD3E367FD1E1
            70C429CB32725EF19831EA23E8A7E4203E2A405A40D3966F21180A4234D25923
            A052C46F18A7AB7DC8E57285D2E9104C27015C86BBFB8516DF4A56EEABC3D57F
            0F3019B929BEE4F9D78957FF6166F70BF8CB754782A7C39ED573CE9CBF2F1C77
            D6E0E3FA8FFEF95C68AC95B642B02B0E3AEA2258B8DFF1929D7FEBC6D5A81D75
            9F972093C9E1DABBFE05066366CC9494B90234763C10068F972381F6A6CDE06A
            AB49A911C07F9A26D8DAE644431E4F3A1D82E924809FC423BD29E7DF56540DF9
            25D52CDB8F79FE759D937C05DB7FB8A1B1F63778ECAE73B37EDE82E24AB8E4E6
            C1E7F73FFAA7B3A0B941FA0A4131AAA7CD83D32FF9EBD00F344804FD5EB8F39A
            437B7CBC6AD26C38EB8A0733726EA14E80CC004A0EF205C3AC6498CC00B7C70B
            CDDB56A216104A691DA653464FDD695CE02D2480D08C1933D2A205A44502C7CD
            3A710EC8E43FA60EF85043D9C43DC168D425C37E5D6D7F7601C34C0578F681CB
            A066D39AAC9F57A154C14DF77F3CE8D73F70CB09E0B43765FDBA7B83D19C0F57
            FFE90D49AFE1D64B9676BAE8BBC179CB9E80B2CA29693DA7608A75E605C45923
            516A1C427502141A6C6BDA08EEF63A162D10D28315F2C4BF27E7B59C919797E7
            6F6B6B4B8B16901E02987DF2BDB8BB529CF863CE2B85A2F2196CF5A78D6CFFAE
            053FC34CF619EEB87CBF8C1500F585C34FBA06E6EE79E8A05E7BCFF547305F40
            2E8134C59B1EC87EC72431FAFA3E2B26EC0C675DF9F0008ED83F081A406744A0
            B387202B167239A0AD76F50E4542A546D79C4273BCD1683406D3A1050C59040B
            26EEA7D4188BEB50A04BC4CEBFC2F25960CD2B4A120037D34F94F39FF68F34F3
            A8DFB60E9EB9FF62C9CE6F2B28838B6F5A31A8D7DE75EDA110EEA3798914B8E1
            DE8F40AE94CE1178F7F2C32118F0F6F838F90296DFF33E2E6AE9AF6414C68BD1
            C63A0987225C0F41240032079A6BBE67C95C6267A04611B97E82CDFE78BAB480
            21CBE1B8D9271D82877957ACFEEB747A289DB80798F41AD6E58765FDF1AB3FA9
            FFDC079BF6CF33E37867C59F61EDF7FF19FA81868045079E0A7B1D7CE6805FF7
            E7AB0F447B32A746D3335C71C71BA0CF90A3AD3F78E8B613C0EDEC7D42F2C2FD
            4E82A5879D9391F327878AC4383380B2033DBC29606FA90167CBE664DB30BE4A
            70D5E4BCE6DFA306E04E872F60A8622843F5FF25DC9F20AEFAB314544141E964
            B6F293F0B39C7F61B4D7308CFB0B78987E2CAEBEC7696712F4D99D71F923505A
            39B054DA3BAFDC2F2B3302068A0BAE7F016C85E3243BFF53F79C072D0D9B7B7D
            8EC16483CB6ECF4CFD02CB0BC0AF259A9C274079015CCF008FC703CDDBBEEB6A
            0624F2B49EBD8B8CBE5FD2A1050C49124B773ED62257A89BF047A91377FC29AA
            9A07168B8D09BFD0E74FCDAFFEB26118F71770D735FB67BCFAAF3FD0680D70D9
            6D6F0C4875CE956BEF8A0B6F7A05CCD642C9CEFFE2C397A169F74B9FCF3BE38A
            47A1A43CBDCE4001E24AC100D302C24C0B2033A0A56E0DF8DCF6143340AD883E
            3229DFF1279D4EE719AA16301449948D9B75D25928CD4F8A63FF3ABD194A26EC
            CA427E4603B7FA6B858A3F810032F231661E775DBD9FD497904445F52C38E9C2
            FE87D0EE5E7640562A170702FADD2CBBFBA3AC9FD7D15607ABBEFC1734D56E80
            B6E66DFD6AEB5635691738E1FCF44F3F1224968D1A8F753A037DE40C442270B6
            3780BDF1D7143340264BD44DC96BDE1B3F3FD750B580A111C0EC933FC7FD122E
            A6CF4DF8B51671997F24F8C2604FAD866BF4A910E2FEC350030806BDF0D04D47
            487D1929D8E77717C2BCC5FD6BB879EFB50766A5727120A05E0797DDF1CED00F
            D407A2D130FCBCF203D8B0E653A6EE47FAD1C8B52BE472055C71E7FBEC779E76
            F0D100C119C84282BC2FC0E70B40F3D66FB8BE819D660058B58153CAADBE4F51
            03F0363434040F3FFCF0D860B480414B62D9CCE3AA657215B5FC9289D5FFE2EA
            DDD1F637A6ACFEA4FED307271FC6EA7F5BD35678EEBE3F487D1929200FF55957
            3F853674799FCFFDEBF283728E00F28A2AD9F567129FBDF37758F505E51A0C3D
            0D7AF14167C2EEFB9C9491EB24E1171283B822212E2F80EA04DAEAD783A7A3A9
            4B6A70EC8D29058EAB552A95CB872C31D81A81C14AA3AC7CF6C937E2996E177B
            FF8DE60228AC98CDADFE7A15E8D10CA036DF2A9590F63B3C859FB06DC377F0E6
            B337497D193B803CE8E7DFF88F3E9F77FF0D8764B578A93FD8FBF00B60978547
            66ECF8DB36AE84379FB9316DC7B3E495C2D9CB32D3D750982BC83A0847B9E1A2
            3EA16988B315DAEBD7A62405C920D13139BF75915C9668C3C5D72BAA141C909D
            37680240F59FEA53178B2BFFF24AA7832DBF0CF47A5532F4C78A7E8671DEBF80
            9FBF7F1F3E7E23FB73FEFA83493B2F82C34FEE9D9C1EBCF150C91298BA039538
            5F76FBBF49B7CEC8F1FD5E173C79D729690E7DCAE0A25BDE00B5569F916BEEAC
            0FE82C152647A02F1066664028144C3103F2F5FE538A0C1E1A00D1819A407030
            FD02062392B2A2A987EA555AAB03855F2DCEFD2FAE5E80AABF2E99F62BE4FD27
            9D7F393EE8A3377CF7D90AF8E6A3CC9488A603879C703D4C99B5578F8F3F71E7
            89E0F338A4BECC24AA26CF8323CFFC53C68EFFF4DDA781DBD992F6E3EEB6F789
            B060FF33D27E5CF12091A8A8792885044913686F5C071E67734A6D805E1579B4
            D262BF1F49C18126806F30CEC0411140C59C93F7C3EBFC8F58FDD7EAC8FB3F9F
            09BE013500C1F9C785FE866FEAAF80CFDF7904D67E9B7987D560A15469E0C25B
            DFEAF1F1F75EBA0336AFFB52EACBE4AF550DE72C7F25632BE9FBAFDE099BD60E
            AE814ADFD7AE81F36F7E3323CE406165A76840981F2442894144004E7B3D389B
            36A6B40B53CA63DF4FCA6B3B07AFA53D1289B83D1E4F68A00D4306450068FFFF
            098FBE5C1CFE33DB2AD10498CCEC7FDA68BCB75A18F3350CABFEBAE2EB0F9F82
            D55FBE2EF565F48A05079C097317773F9577CBFAAFE0FD97EF90FA12190E3BE5
            36183F75B78C1C3BE877C3937F3EA1D7029FA162CAACBDE1806333D72B80B50C
            13CC009E007C5E2FB4D47C972C11E6FC00109C5CD0B61F8A59E3609D8103954C
            D9ADB7DE2A7BE2CD4D5FE1ED3DC4C53F79E37606ABAD98177E6EF5E7BCFFB261
            D9F0B32BB6ACFF123E7825732A6B3AA0D599E0ECEB5EEDFE41FCD1FCEDB6C325
            6F0A3265F6DEB0FFD1D764ECF89FBC712F6C58F34946DF032D7C275FF624730A
            A61B493320CE99012C270009808880082018F0A5F8010AF4FE4B0B0D9E8F510B
            B0534810B580F040CC800113C094DD4E32FB42B2769AF8D369FFABA0A47A4FD0
            EB75ACE8879C7F5A3EF5573E0CDB7D77075A599EB9EB44A92FA34FEC7BD4D54C
            C8BAC30BF79E0E5E77BB64D756346E321C7D5E661DA94FDC71144423A18CBF17
            4BFE3838E9D2C7D37EDCAEEDC3291A402410203F40D306F0381BBBFA015EAC30
            B7DF875A41AB4EA7730FB44A70A0A2292F9F7DE2210990BF23D8F414FFD71BAC
            50583997093FF90098FAAF24EFBFD0F4636490C0636C05CDAD6CBAAE282E9F06
            479E736FB78FADFCE43958FD45DF21C34C20BF78021C7B41FACB6AC5F875D507
            F0DF771ECADA7B5A74F0F9B0F3EE87A7F5987CF71FD400B86E41C26871365EDC
            D1048EA65FBBFA01D64DCE6F3F1F09A009CD00672814F20FC40C18885832492E
            9F73F2DD78DE2BC50E40737E25EBFD47C2AF47E1A7611F440072856CD887FFC4
            78E1DE53C1EF750EFD4019845A6B8033AF7DB5C7C7DF78FC72686BDA3C80230E
            1DD6827238FE229A149799909F80971E381B3CAEF47BFE7B02F5353C63F9ABA8
            E96AD276CC649F00160D48309BDF1F88F245427E68DDF64D977C008854DB5A8F
            52C8A2DBC819483901E1703884660011409FABD58008E0D8638F957FFD9B9ADA
            CBCE15E2FF0A54F3F3C7CD0693A580093FB3FFA9EB0F53FFF99EFF23049FBF75
            1F6C5A2B6D038BFEE0CCEB5EEFF1474969B12BEE3B0DC2415F56AEA56CFC4C38
            F454723E6656F8DB1A37C1BF9EBA322BEF498C19BB1E060B0E4A6F8668675250
            679F00C11468AFFD81F50810750C867C9DF7E66293FF7D94C91624800E320350
            0388423FA20103114FF9843947E68513FA66BCAD4896FFAA29FEBF10ED7EAEE9
            07C5FE357CF20FD7F577E43080B36D3BBCF198740D41FA8BC5875D0A53E6ECDF
            EBFB78F3F14B336ECECC5E781CCCDFFBD4ACBCE7B79FBE0A49E0B7AC9C4B0C95
            5A0BA72D7B2DBD074D703901E4088C44B86880101274B66C4253A04E3C4414F4
            AAF05B9516C7BDB158AC49A3D138066206F4573A99FA5FB9CBC9BFC7F3BE21D8
            FFB4C2EB8D795050318739FEB8D8BF920DFB64ABBF9C1FF33D82F0C23DC74324
            9C5B0337BB62E1C117C1D45D0EECF5395BD7FD17BE7CEFE18C38CCE4A81AEF73
            D472A89C9C99505F57F8BD0E78E5416A92224D8463D1A148B8B3D35B291AE70B
            848800843E01440264E2D81BD7A5380255F2D82634032EC6DB0D5DCC803EA301
            FD260052FFBFD9A4BA299190DD22D8FF34F7CF9C3F1EAC451398F093F38F2601
            B1DC7FF9C8B2FF057CFBE163F0EBAAF7A4BE8C5E20C315E91F689AF5AF85D5AA
            CF5F80752BDFC61F54DF25B17D9E1935C209D317C242D44032D142AB277CF2FA
            9D50FBDBB7593B5F57986C2570CC05E91B7526440284E220561B108A32332010
            0842CBB6AFF0FB8A271D813259C237ADA0F564340BEA281A60369B3BB66CD912
            5AB76E1D9901BDAA79FD2680A54B972A36BBC6BD80E73B41EC00B4954C0793B5
            84093FA7FE7776FE61433F469806108F4761056A01B4CF45E80C3638EE926707
            FAAEE0FB4F9E85DFD67C30408D40C6B2FA343A3314944E8205075F0C6A6DFAE7
            EAF57AE5ECFB384ED24A479287D3AEFD575A8FC95283793F009B1D8004401B11
            41EBB6EF201CF6A7F801C65BEDE76A14E1F54AA5B209577FA74EA70BF4A736A0
            BFD2299F376F9EA2393A8D6876AE98000A2AE682C96C65C2AFD57486FF8673EB
            AFBEF0D57B0FC2E61C75068EC71578AFDF0F3ED186F21DEA367D074DDBD7B24E
            34F15884551192A091A05BF2CB99B01757EC04E63CE95A7909F8FE93A761FDF7
            831B9C9A4E2C3DEA5AA89AB267DA8ED7758418350A09F25A407BFD4F68F6D853
            08A0D8E8F9934DEBFB18EF6BC4BFEDA150C8D79F0122FD915066FF1F7CF0C1AA
            B58D796D78DB248E00144D5808069D865BFD85E21FF9C84900EA0E240CAF3D74
            46D63CE9FD067EE047FEE151305A8AA5BE92ACE1E5BF9E885ACBC01B7CA41B15
            93774312B82E6DC74B0D077612008D157734FD065E5743970621FE178BF4AE97
            D1FEAF8B46A36D6AB5DAD39F12E17E1100D9FFAB36C72B4371EDD6A40310ED3D
            B5468F04B01BCBFA63ABBF5AC1BA0229152327F9A727D85BB6C0072F2CCB68CE
            F9405139650F58FCFBCCE4A8E72236FDF801ACFC38FDD9788381566F81A32F7A
            26ADC714D282C9D6270210A2011DF63AE868DD9C120930A8439F555A5C0FA37C
            D60E241CD81F1195A3FD2FAF7197EE1789C9DF4F890018F221BF62169B0340B1
            7F46008ACE08C048C79AFFBD00EB57BE29F5653090E7FD984B5ECCAAF34D6ABC
            F9E8D910F0E54662960C7FF0275E99DE62316194788CCF072002088623E0EBB0
            83BDF1E79448804619FDB5DA66BF03E5733BFEDD140C069D4AA5B2CFE2A07E11
            C08C1933946ED5AC0BE209F9FD620230D9CAC1563C1955FF4E02488EFC1EE11A
            8080CF5EBF1D9A6AB23F2A4C0CF2BEEF7DCC4D5052355BEA8F236B68DCB61A3E
            FF676E54370A38E1F257409E260266AA3DDF2340F003B07E819410E4F742EBF6
            952904A094C7ED93F25AAF45B9A409DD0D8140C0EEF7FB7D2693A9D7E2A0BE44
            94A9FF5EAF57F94B93EDBE784276819800ACC553C08224A0A108804A21EAFE03
            CC1E1D0D0440F8EEC34760EB2FD23805E9FB5872E4F5503661AED41F4356F1EF
            A72F068F33B7661DEE7BFCED6C1C5EBA90EC0F201A254E2640183581E62D5F42
            3412491200223E35BFE57214CBADF8775D381CA656611E518F806EFD00FD2280
            B6B636D56657D93B89846C3F711150DEB899603417B2D59FABFEEB2C001A25B2
            9FC42FDFFC03B757877EA001803AD52E38EC2A289FB4BBD46F3FAB70B66C850F
            5764AEA478B098B3E4749836FF77693B1E5F17C47C00B1283F44144D007206B6
            6DFF01C2412FAB091088A2D2E2FC8B411DFE8EFC00A150A8C5603074D4D6D606
            7BCB07E8930028FE8F6A84FAC75AF37A3C4F953809A868FCEEA0D319B808009F
            FF4F11004E01186D1400B06DDDA7F0FD477FCB4ACDBDB5703CAAFDB7805A6B96
            FA6D671D1FBDB40C1C2DB935EA9C3071D601307FDFF4D50508A140CA0788C4F9
            706008092018037BE32F10F0B4A51040A1DEF36281C1FF7E3C1EAFA17C003401
            5C28BBFEDEF201FA925216FF4F688ACD2D3E1BCDC4927776015242D18445A0A5
            EC3F7597B1DFC3B8FDF75041ABD3EA4F1E034733FD40D34F042AB51E765E7412
            4C9A73B0D46F5512F8DD6DF0EE93E74B7D19DD62D29C8360977DCE4DEB31D962
            C28F0E8BF22600F9015CF66DE06DAF4921008B36F07199C94DA3FAB6E1DF8DB8
            273F80BFBCBC3C3C6802200760D43063AA37A45ACB5EC013805A6F427B673E67
            FFA72400C9478DEDDF1B827E17ACFEF44968D8FA3D32F8D0B3D4F4686AEDBCE7
            09307EFA5E433ED670C67FDFF83F68A9FD49EACBE81653E61ECECC8074428804
            50383012A35C00DA22AC3188AB65634A3210AAFF3F56981D8FC9E5F26D787F3D
            9AE9ED7D7509EA4D5459FBAFEFBEFB4EF55BAB717E30AAFE52C6E5F63202D01A
            F2A0A07C36120037F853ABE6BAFFCA79EFFFE8F302740FFA827EFEFA25A8DDF0
            3F16B2EA6F051E79F60D962228A99A0393E71C02669BF4597752231A0EC21B8F
            9E22795BB39E307DD7A360D6C293D3763C210A407B363588FC007C2E80B7A30D
            1C8D3FA710804E19DE5065753C8A2FDD8A5B6D7F1C81BD1280E000ACF314EF13
            8C2ADF15D47A05FE38B5A602C81FB733AEFE7CFB6FD60014C55E0EA3D607D01F
            B8DA6AA0FEB76FA0C35E0BB1480862B1302BC451690C60B4968025BF0A6CC5D5
            905F9A994194C3196BBF780136FEF0D6D00F9421CCD8F378D8698F63D37ACCCE
            94602E1F2014E2FA02F83D0EB037AC492100AD32B26DBCD5FE08DEA648402D6E
            2D9148A42388183401D4D7D7AB9B4395BF0BC794AFA41080B9187FA4D341AF55
            A316C08D05938D9006A063C84DBCFBE47910F0DAA5BE8C1EB1F3A25360DAFCF4
            4F3A12528229F5974281D417C0EFED80F6BA552904A051441B27D8DAA9EFDA56
            7204A2BC36A339E0B2D96C819EFA04F64A004204E09706C3C9E198E271C10420
            02D0A34A6A2B9EC2AA00A90B90500198C91020853D1AB6AC441B702D4C9C7920
            14964FCFD099C6906B08A2F9F4F6E3E975B0A51BBB2C3D0B26EF72485A8FC985
            02F906215413408343A92CD8EB83B6DA6F530840A588B54FB4B55153444AD9AF
            C17D236504F61609E84D565904005FACD9EE2EF90312C03D621F8031AF0AAC45
            13591B70AE07A09C8506D94133C0001F3C7B29737C242F1C4F326BF1A930655E
            FAE2AE63C85DACFEE471D8B2F63F525F46AF38F0B4FBC09C5F91F6E33201E74B
            83A918883507F107A1B5E6AB140250CAE3EEC9F96D0F02E7034846025073F0F5
            9412DC27016811F5FE8AABA371C5CDEC057C14C0543011AC0555A0D7AB591290
            300034534340DE7CE4946E3BF1EC79E8555031654146CE3986DCC1DB8F9F8D5A
            804BEACBE81172850A8EB9F4958C1C3B5915887B362B2010666DC25BB6FE2F85
            0014B278604A014700F8F73694D5FABEE605F424AD2C02B06EDD3AA5D3E9D46D
            B217DC8A0470397B80270073D16464BB72D4009000500B50254B80339302FCFA
            03C7773BDD961C67879CF548463EF831E40EFEF9C0096803A773D0677A412BFF
            41A7A77FE641B22C38C145948800685828F50568DDFA051BF82A3C47264B44A7
            E6B73C80B76B140A054B09164A837B6A11D62301083500C81CFA3A5FC5DDD1B8
            FC6CF6409200A682A5601C184803D0A8581F00593204987EBC76FF313D867F0E
            3AEDFE8CA85E63C81DFC03BFFF5C2ABDEE8A29730F83397B9D9991630B7E00D6
            1D281265034303C130B46DFB9A757916088030ADA0F901B2FF7163A140DC5ABB
            CC0D4C8904F44A00140244F541BFA135EF51240036744E20004BC94EAC1598C9
            C83503A1E6200A19D70720130CF0DA5F8F869E32EB8A2A67C25EC7DCB6C3FD5B
            7EFA00DA1B7E05B7A31E021E3B84435C030FD21ACAAA7785C9730F059D313F23
            5FDA18D207FA91BFF9E009525F46AF38F0F40732B708910620E4024462E0F586
            3902A8F90EA291400A014CCE6B7D5CA948D0E00772046E572A95CD2A95AAA3A1
            A121386002A01020128061ABABF4F95842CE724F0502B096CE44412A049341C3
            4701642C7925535140A602F6D0B892CE7BE4C5CF8352CD4D9BA574D14F5EB99E
            097D5F5069F450327E2EEC7EC8E51999F83A86A1C3D9BC193E5A91BB8D4E142A
            0D1C7DE9CB193BBEA0F85059700835001F12803F443302564124E84E2180EA3C
            FB0B1A45743DDEDC8ABFE7ED6802F41A0AEC91002804585858A84233C0F84B93
            ED9FF1846C317B40208071B3C168CA07938927001A03CEB701CF0409BCF3D8B9
            E0EF45A0C7CFD81B763FF812E6295EF5F113034EBF55AAB4B0C72197C1B8C9A3
            ABB26E38806CDFD7EF3B36673300E7EE7336D3263305211D982201D419C8EB0B
            B15C004A040AFB9D290430DEEAF8874E15594B2600E502E0EA4FCD415CD42474
            F7DD778F0C8800280720140A197F6D2D781B098049462701CC05A3D90A66A316
            B44800D40948A6C85C0F808F572C077BE3C61E1F272F6CC1B869D05AFBF390CE
            53583103961C75236A13DACCBC91310C0AEF3E7101785DCD525FC60EA01A8DC3
            FF90D9B664095E64D9C0D070143C5E9E00EAD74238604F21804A8BE30DBD2A4C
            C512C95C00D4E29D4806DDE602F44A006AB55A138BC58C9B1C45AFC4E2F2A5EC
            01DECB6F2B9D8326403EF301502440917402668601567EF0206CCB52D30D0592
            C9DCFDCE83EA99FB0FFD6063480BD67CFE4C4EA6011F70EA3D602B9E94D17308
            E9C0719E00DC4400FE3012C01A34015C290430C1E6785DAB8CAC033E1B90BA04
            F7362DA84F020887C3A66D1DA54F46E372A6E3080460299909665B11187902A0
            6620B20C4E026AAE5903FF7DEDD68C7ED05D612B9E084B8FBB2DEBBDEEC7B023
            82FE0E78FB6F67E6D474E69209BBC05EC7DC92F1F308454171660244C0EB0E81
            9708A06E1544421EEE393C014CB4B5BDA252C436513D80D01E0C49C0D1533250
            4FD29ACC02449836B4DAEE8FC615C928001180B988FAC29780C9A403835EC511
            4086EB005EBBF728B483B2FB0390CB95307BE9193079DE61593DEF1876C4A6D5
            EFC28F9F3C21F56530D08C8443CFFB7BD2F19C0DC4F854608F27083E24004A05
            8E858329BE9129F92D2BD01AAF013E1908F70D28FCA401F8BAEB0BD02701A854
            2AF3667BFE1FC331C519EC053C01980AA6B04420B3598B04A06104C066016690
            04C80EF4381A877EA041C05250097B1F7F1B688D79929C7F0C1C3E7DE90668AD
            FB45D26BD09BF2E11012FE2C75606626401C58F30F4A0072BB03CC07D046A9C0
            D188980012D30B5B5EC4BFEB4903502814DB22914803DEDF3E68024035C252E3
            2ABC3E14535EC85EC00BB8297F22980BABC06CD280D1A003A58A6B069AC93E00
            AB3E7E9CAD0252815A3FEFBCF02498B1677A4B3E871BDCF67A68D8FC1D0BB706
            7C2E0805DCAC565FA5D6815A6702ADDE0C466B29544E5B0C7A73415ACF4D4359
            DE7F4ABA86A0F4BE0E39E761A619660B9C0F902F070E46A0A323C0B201DBB6FE
            8F2F14E2E4592E4B4450037895528081AB0560E9C0B888B7BB5C2E6F7793827A
            2500AA03C0175BEABDC5970622CA641746220183B50AAC2513C164D082C9AC49
            9A00B20C86D26920C2074F483F9EDB642B85A527FC1FE82D85525F4AC641825D
            BBE14B68DAF2036B7316F4D80734878F86941AACC550317501ECB4F0B8B409CE
            D76FDD0D75BF7E99D5CFC25A341E0E3CEB3EBC95FD7C11A601A0F91B40C177B9
            D104F005A17DEB17DC633C0128E5F1E0A4BCD67FE24D9A124CEAFFD6BE3A03F5
            4A00E3C68DD30683416B8DD372B62FAC4E7A3B48D0F5D672B0503D009A002693
            36D90F20D378FD9E63D232C976A8A0E4A349730F81B9FB9F27F5A5A4156DF5EB
            A16EC357D05EB78EADB2D1348E42A7CFACA0622798B3F79990573A79C8C7DBBC
            FA3DF8F1E327333EA895BA2F4F9E7F38CCD9E7AC8C9EA75724B8116101B4FD5D
            A401787D60DFFE0DFF1027CF2A45CC3B29AF9D062592DACF34009A184C23C3F5
            7ABDA7BF04C00A81D056505656566A63B19865BBD37CA237ACB92BF9046A0966
            2A055BC9345CFDB52C1740A551729580DDE56AA49117FEF3EC952C332C574011
            823D7F773594540FCFBEFC7124D3CD3F7E0035EB3E878EB69A6E0BAE3281FCB2
            A9B0E8981BD948AD215D3F0AFF8F1F3F015B7FFA980D324D2BF0775E3E790FD8
            FDB02BB29B17D28D0C2564C0660304FC21E87005C0EB7183A36E658A0350A38C
            7654DBEC34BBBE81849F36A552598732DC366802884422D606B7F977EE90EE21
            F193B4A662B095CE607900268B8E4D07621D8132FCD9ACFBFA1FF0F37F5FC8DE
            97D14F14944F8725C7DE3C2C42865E5CD937AEFC17DAF1DF83DFD32E59910DF9
            54A6ED7E248BB20C1D7158F3C9334864FF65CD438602859292CAA6A3E05FCE12
            7D7201540D188DC650F50F81DBE507AFDB01CE861F530840A78CD8ABACF68F80
            D700A82210F78C00F0B6B7BB8AC07E1140B3C7B8AF3368785AFC248DA100F2C6
            ED0C46A30ECD001D6B0E9AA95E0062D044DE37EFCBCDC21019AA8A3B2D381676
            5E9CBEC690E942477B1DFCF4E9D3D08E2A7E24E497FA7252602D9A00FB9F797F
            DA6A31286760C337AF43FDC6AFC1D74103ADFB263872601656EE0C53773B028A
            AA6649FD91EC007A07116A07E609A209E0C7F7D50ECEC6D4EEC87A55B8A5D2E2
            F80C3A7D00E404AC1D12019009D0EAD1EDD1E637FE23E503D35A21BF620E1850
            FDB798F5AC27007504CA4633D07FDD7712FB9273155AA30D16A37A9B3F6E9AD4
            9702AED61AF8EEDFF781B32977CCA6EE409FD921E7FE0DD4FAF40E3A2113C1D9
            BC153A5AB7811B49D0E36A667522465B19580B2B59B297A5B83AB70BC158A61F
            D70BC0EB0DB02880C7D10CEE9675294F33AA438D1516D77FF94E4064026C1D94
            09409BD809E8F4AB66367AAC29F137854A070555BB83C1A001339A003A960B20
            EFB61F58BA29E1CB7FDE99750FF0603065D7C361DE81D20CB108FBDDF0D9CB37
            83A36993D41F43BF410559879CFF286B873E9AD19DBE420970613E09A8034D00
            77FB76F0DA53A72359B4C19A32530779061BF824204600D16874404E40424A18
            50A952956E682DFA025FA5493E0305BD70C22224001D58AC7AD01B35AC35789F
            7900696083E66D6BE0D317AECFCA973154980B2AE080B3EECDAA6F60EB9AFFC0
            CA771FCE9A432F9DA03C82A3AE78216D53768705FAB450B81C806030021E7700
            DCA801B85A3640A0233529AED0E05D57A0F7FD4489406402F08EC0BA41870189
            00F085A493156F7614BF1E4BC827249F81049057310F4C161B6A00065613A0E2
            43815DDF4F268C8257EE386C40F1682941B1F0BD4EB8252B91824F9E5F0E2D35
            B93939A7BFB0148D8743CF7F54EACB90043D05D12802100C8451F8FDA80504C0
            51CF95028B516E76AE4433601325FF081A809008849A806FC00420A402E3C18A
            B7380A1E0CC7148BC497455D812CF96560B2EAC064D4815A437E80ECCC0578EF
            D10BC0D9B22D2BE74A17A6ED7124CC3B287DC323538036E27B7FBF68D87D263D
            61C2EC7D61C191B93701580A50121045002804C8114010DAB77D03B16830E579
            13F3DA3E552BE2A4FED7A3E03327206A02F58140C08E668077D0B500F877518D
            D376AD3FA24A71BF1BF2ABD9141BB3599F0C05D278B09E6B0CD3F7A1ACFDF479
            58FBF98AEC7F1B43C46E875D0C53763B3CBD0745FBF0ED87CF634EAE9103191C
            7EC9636029AC92FA42B2835ECC006A0612A56EC03ECEFEF77AFCD0B6F58B9410
            A05C96884EC96FF908059FC21E75421E006E4408F681D60224CB81F18066648F
            C2468FE51477489742C95A5309E48F9B0126B30ECC563D6884B2E02C28013E57
            0BBC71EFA9993F519A415965475DBD0274A6F41515BDF7F74BC0DEB071E807CA
            3198F2C7C111973F23F565480A612600F501F079032C07C0ED70A009F0436A12
            9022EAA9CEB37F81F7B5A1CCD24AC066030CB61C38A51F00DA0F858E8061698B
            D7F8A0F8496A8D050AC6CF03234F002C12A052B08E41892C0C077DE9D6437222
            2D78A0603FEC2B9E4BCBB14813FA09B7918A3D8FB80A26CD1F9DA3D03924201E
            A30800EF0074FAC1D5D600EED6F5290480B67F4B85C5F503DE6C25C71FF0E5C0
            A8C193A770700D41A82598DFEF372183144413AAC95B9D856F885FA3502AA1B0
            7A314B06A24880CEA8455250F62F17200DFCF0CE83E7B118EF70C4BC83CF8319
            8B8F1BD231EC0DBFC17B7FBB28677BE5A5037285128EB9F615D01AAD525F4AFA
            D18FAF8D750242FB9F1C808C00500370366F01AF635B4A06679ECEBFADC8E0A6
            C480564AFE117A02920630E89660424F40541F0AF04756BEC951F24A3C21B325
            9F24974141D502B4FF4DA801189826A0562BB91161FC8CC04C4604D67CFC1CDB
            86234A27CD8503CFB96748C778E3EE53C16D6F90FAAD641CE6C20A38EAAAE1F9
            3DF7073DC948821F06122302F0710E40EA0560AFFF0582EED4FE88A526F77AAB
            36B019E59408603BF02DC1507B6F422DDE494D41074400D4161CF7EAB6B63603
            EE0B509518B7C99EFF5024A6484EE4A495DE366E0E98F38A3A0980FA038A3A04
            6712A4FEBF78E3C139D526AABF30E597C1D1CB06EFC46CAD5907EF3D2A7D6974
            B63063F1B1B0EB61174A7D19594582EF041C41FB9F1C80B4FAFB9000DA6A7E80
            70303513B6CA6AFF5EA78C90BA4FCCC00880880049A069506DC185C1200A85C2
            8007C8C38B1957E3CABB291051ED937C124D082A9C0296A22AE60330524AB05E
            CDFC0054E8918D80E03B0FFE01DAEB879F038CE6119CF27FEF0DFAF56FDE7B26
            B84648C8AF7F90C12E079C0973F63B4DEA0BC91A880062BCFDEFF770EABFCF13
            84D6ADFFC3C52F35C96B6A7ECBE73259C28932D984AF630480DB7694DF66DC3A
            6A6B6B8328D30323001A0D86C2AF0F040279B82FAD775BCEF384B49DAE77EA0B
            602E83BC71D3D10CD0B38DFC002AB5926F1D269A1224D673D2C80CDB7FF9023E
            7DF64629BFA741816AE3CFB8FBB341BD361CF4C38A1B47A763ACB0722738F8C2
            075872D588408FFA3F4F00BCFD4F2BBFC7E543127082BD7625D30C0428E5B1E0
            E4FCF6AFF0F90201D400E704A4D1602D68C6BB8388014D06120F078D46A336B4
            254A1C7EDDBE2D3EF31DE227AAD47A28ACDE138C261D986D44005C4290D0263C
            1B6AC00BD71F089150FA1A576403F4033EFDAE8F07F5DA5FFEFB2AAC7C7BF40E
            4455690DB0DF997F647E94918A045F0044F1FFA03F041EB4FFBDB8395B6AC0DD
            FA5B8AE3D7A00EDB2BCC8ED528FC0E8AFBD33C003E13902A015B07331C942047
            9B815504FA7C3E8B46A3298EC761C2467BE1F389842CD91D81AAA81801582CCC
            0F60A0D260E60750241D813B9C2DCD4EEB5FBF7A13BEF9E75F25F9A2060B73C1
            3838E6FAC18D93FEF78317406B8DB48D3173015441386DC1EF61CE01A767B547
            5F5AD183864C2B3C85FFC8FE0FA0FD2F10407BDD5A08BA5B5308A0D0E0DD52A0
            F751B9673B11407FEB00C4A7EF0E3B6403E256B9C59EFFA7504C3123F9241472
            4BF14E602DAE0093558F046000AD410D2A259A018ACCCD0AEC8A576E3B0A7CCE
            D6EC9C2C0D9830676FD8E78CFF1BD46B9F5F7E004482B955D32F25A80F43E9A4
            5DA07A977DA16AE6E2611F3264467A9C53FF2341DEFEA71E00B86FDEFC05C423
            E11402186FB5AFD2A9A22D78B31D069005C83EBBDE3E57F1742064924234052A
            9ABCB6B3DD21EDD1C9275183504B29E457CE645100A3C5003A93961506C995D9
            E90F4068D9FA13FCFB81E1E3255E74C27298BAE7E052829FB962C9B029849202
            943BA033E7E1A2341E4AAA67C3C479FB830935AE6183043709B8D3FEC7D59F65
            00B683BDE60736224C9063853C1E9992DFF6350ABA07658D5640B2FB050268C4
            C5DBD9531210A15702102604A3FD6FD4E974F9F178BCBC23A85DDCE8B1DC9C7C
            120AB852A383E2890B991FC06833809E1282B4FCB8B00C4E0CEE8AB7EFFB03B4
            6E1BDA6CC06CE1D43F7F009A4136BF78F2D28590763B6A848348416F2980FCF2
            29503E6D7798BAE0F09C341BD8EA9FE0D4FF28AAFF64FF93F033FBBF792BDAFF
            9B586E8000A33AD45E6171913DD881B2D88C8F1101B008002EDCD43BBDC7C1A0
            843E09401C0AC4FBCAF0A0D59B1C258FC413321D7B126B052E87C2097B80C966
            E3CD00AE2E40415A00AB0EEC3E29A8DB930EE1C30BB81DF0D28D87E77C5E407E
            C5543872D9B3837A2D45009EBF665FA9DFC2B0874AAB87A5A7DE0255B39664FC
            5CFDFDDDD3F368B18CC778F53F1481803788C2EFE3E2FFDB7F8480A72D250250
            64F06CC9D3F9B6A31CBA90389A842420DAE3CADF623018580870DDBA7514378C
            7777DE1EAF892201DF7DF79D2A1008E8D014B0A109508A44307E9B33FFFA6054
            39433804F901ACA5D351E5AA02A340007A0DA8846840B65400C4CA7F3D0C6B3F
            7A316BE71B28E8B338FEF637C098573AA8D707BD4E78F1DAD11902CC048AAA67
            C28117DC3B686D2CDD60DE7F5AFDA35108A3FA4FF6BF972500F9A105EDFF6817
            FBBFDAD6BE4AAD8852F8CF817F36520890EF07489A406B2412717B3C9E507721
            4042AF04409B1009A0E6A0D41700EFAB6AF65A4E76057547084F2402D05BCA20
            AF622612009A0166035717408D42D9C8301964CD0E40BCFFE025D0B06165D6CE
            37104C9CBF3FEC7DD61D433AC69317EE2EF5DB185120F360DF73EFCC8A36D01B
            4842A8F4371E450208A1FA1F0881DFCDA9FF6E7B2BB46F5FC55A83750E028985
            26E5B57D8FC2EFC33FED7C0890D9FFA8B5D7F7D60C547CCE5E3F1BA133905EAF
            37011F09F084D47BD6755897270F22273F80168A272E62AB3F6504EA4C7C3890
            AF0D60A642163FCC576F3E0ADC6DF5593C63DFA0D8FF19F77D8EA43834DBF3A9
            8B170CCB765FB90CEAFB7FFABD9F0EF9BB192C12FC3F64BE0ADE7F0AFFF95807
            603F389A3683A7752B9B0F2814019935C1D632936B03CA96972F03AE172200A8
            B1370483C15E230084BE64322512A0542A0B281280279AB0B1BDE8EE78426660
            4F42E12621A726A1C6FC3C46007A96168C668096EF16CC7202B24701D1901F56
            2C3F14D5286FD6CED917169DB41CA62F397AC8C779EE8ABD73EA7D8D148C9FB3
            14F63FFF6E694E9EE0E6FFB1E29F701442A8FE07BC01F0F1F9FFEDB5ABF8B16C
            9D325C62746FB66AFDD4FDC74D4540C04700281148A55235E1B17A8D0010FA24
            002112A0D1680CA84E9023701C9E607C8D33EFCA4054B533F72C1928E4723015
            5683AD6C32E86964B80509C0A0655A809C7A0470A383B36909A006D000AFDD7C
            744EAC96BB1F7319CC3A203D0D4C9EBF625F08F972B72DFA70C6EF973FC3FC02
            5905E7FAE7D47F4AFE094520E427F53F007E9600E486D62D5F410C7FC76207E0
            C4BCB61F54F2989B7700B222203E03703BCA1BFDDDD1531190807E1100D50478
            3C1EB402F4567204221154357BF4473802C664413B09B85A6784A2897B320220
            0D40C7B20235AC3640D002B2921B2C42F3E635F0FE7D17423412CAEA79C5D8ED
            A84B60F64167A4ED782F5CB51FAE06439B7E3386EE419D9A4EB9F7A3AC9F97AB
            FCE3D4FF70300C416F90093FADFE54F4E56ADEC89C8382FDAF5644FD13F3EC3F
            E2DF9411E64012600E40DEFEA786207D3A0009FD9146399280124980D27FCD68
            0A14230954C6138A299B9D85B7271232569541C24D0D420A2AE7A11950080613
            1200D302880054A0102A04333C42BC3B84FD5E78EBAE33C0D998FDE621BB1D79
            31CC3924BD43255FBCFA00FC71B467FDBD8C161C7DD34B905F99A5A12EB2045F
            F7CFADFE9CFA1F828027C01C80140568DFF63DFEED4AB1FF0BF4BEDA02BD8742
            7E5E14FE76DEFE176A001AFA4A014E9EBE1F97C81C81F9F9F96AA13D18250491
            1FA0B623EF7C7F44CDF425E6E4C355DE9457097915D3510BE0FC002C2B504B25
            C29DCE402EBE905D12207CF3F2DDF0CBC72F43369268C8A9B4E0A4653075F191
            693FF64B571F043E674BC6DFC368C5B42547C1E2D36FCACEC9B8AA1F8E00F8D8
            7FD0176482CFD47FA71309E03BD40C2262FB3F3129BF7D15AAFFE40822FB9F1A
            81D652F80F1768EA01D088C2EFE8CBFE27F4470A9923100FA6223F000A703E9E
            A88CFC00CE807669B3D7C215689323504666800ECD80058C004803E0A201FCF4
            606A182A97751B11C8F050E1241A7F5D091F3E7C254482BE4C7C9D4CCB99BAE8
            085872EA0D641765E41C4FFD6137F683184366602A288313EF7A77C8C7E9EB37
            2D3CCE15FEC4D04C450220E71F1240A0835BFD9D4D9BC04DDEFF6834A9FEEB55
            E18E4A8B631DCA5100EF7301D704A456B0FF716B119A80A0F047F9530D9E00BA
            FA0190654AF07EEAD75CBDC951B43C1697538890110065FFD9CA6782B9B08C23
            01336F066885CCC0CE6E413B944277B99A4CB6BADBF8BF37E0C7779F024F5BFA
            5A6A954D9B0FFB5E784F468B51EAD67E091FDC3F7A3A0149014A5F3FE7891F86
            44E0DD29B85D7FCF2CFB2FC179FEB9D53F8AE66A8879FF49FD0F50F38F2DDF40
            C8EF4989FF9718DD5B6CBA00A5F9FAF13E9600249400E3B1EA504B6FEB8FFD2F
            5C437FC0FC00A80568DC6EB705D9A5084F5849664083DB72823BA4DD8D1D8CC6
            832B14AC3828AF6A266F06E8900074A0D2A9935A801011C805381BB6C2B72FFF
            051A7E5DC986460E045485662D1D0F13E6EF0F3BEF7F32680C99CF267BEFEE3F
            40C3FA6FA5FAB8460DF6BDF06EA8DEF5808C9E2321A8FF94F917894234C8A9FF
            64FF07DC54FCD30A8EEDAB21868FC5F9E7CA6589D8E4FCB6D5328807F8F83F39
            8358FC1FE5AA066F37A09CB65BAD565F5FF63FA1DF048066805C9C0F80FB7264
            9B09C19876EE7697ED5C7630320350B8951A351492196036A109C091805AC7E5
            04902F4026F205ECB0EA0FE122870252B1EA7EFE0A1AD67D0B6DDBD631CD8026
            CB8AAF8256764B71057310954D9F0F653B653F23EFE97377836858BA88C66841
            D52E4BE1C0CB1F18D46BFB6A849B4CFA8973433F63A4FED3EA1F084188BCFF6C
            F547F5BF613D78EDF529E13FB326D85E6672D1C4571A0BE4162A008900841E80
            8140C089E67A9FF67F77D7D6E3F3847C00B201A830281A8D965138101F9BB0C5
            917F6138A62CE2FC005C34C052360DCC45552C24487E00CA09202D40C9C68729
            9004B8C4A01C510486053E7AF82AD8F67DF64354A311B6F24970EC1FDFC8D8F1
            29E927110356D64D2B3C65FE857C210832F51F3500AF1FDAB67C09E1603025FC
            576E76FE6AD284A9F30F6900140B6EA61E809402CCB7036FA11E8046A331D897
            FD4FE83701088541685B689165A82EA04430035A7DA6431C01C35EEC89BC1940
            F1D4FCAAF92C0A405A001180DAA061DA011B1E221409F5C400D998303A8CB0FD
            C7CFE13FF75D22F5658C1AE82C0570CA4303ECD9D81FF53501C98E3F24D8CCF9
            C787FE68F5270208B883E0696F400DE0E714F55F298F8751FDA7D83F4DC361F9
            FFB8B11660D4029CE600E2C2DC462DC0EC767BB82FFBBFBBCBEB0D291D82685C
            18324D395ECCF8685C396D8BA3E0C204F901793340A156310230D8F25175460D
            8069016406100928514B1015098DA901BD221AF4C30B172DC11F4A70E8071B43
            BF40B52D673EF943FA0F9CE0E2FE409EFF38E7F98F06C32CF38FA9FFA8FA1309
            D86B56A319606759AC82FA6FD3F91B4B8C1E52F7837CFA2F1B0346F17F52FFA9
            01089A138EBEF2FFC51888E425C38156ABD5180C06A95370191100EEAB6A9C79
            6704A2AA2AC10CA0A20AA3AD046C15B39000B43C0968795F809A3903A9541864
            4258B0870EC29024CD7E5E65FABF3329417E88D7971F01AEC6D1D4025C7A5085
            E039CFF163D6871A8DE28BFD13FC81D8EACF6C7FAAFA8BB0D01F39FF48F08348
            003E471B386A5743241C49F1FE4FB0B6AFD5AA621E52FFF14F17350001DEFE27
            EF3FDF10A4A3B70620DD5D5ABFDF86100EA4FE00F8B715550D9615483D023A82
            BA058D1E332B1166B17EB902546A351454EF0A7A8B8D4502880034640AB06621
            2AA605305F808C9F283CC28477A8A0829FD797FD0E7F1063493FD98642A581B3
            9E5D9DDE83F2833E858E3FCCF647020833E1E70900F78EBA9FC0EF6C618E6941
            FDD7A922EEF156C7AFBCFA4F0940A4FEB3F01F25FF90FA4FE13F5CA03DFD09FF
            09181001D02698010813990194154804808F556D75169C198E290B852E4114F7
            37E495816DDCCE492D40432440434459B310212F804689653F45389741518837
            AE3B72ACEA4F22A8744638E3C9F4F6941087FD28EE4F9EFF4810557F22000F6E
            3EAAFEB3A3FABF0ACDBD30F30F08EA7FB9D9B9C1A80E91D38FA9FFC00D01AD17
            114093A0FEA36C46FA0AFF0918A8C43133A0B0B0504523C3A83A900686E08554
            9129E00AEA17347BCD0702AFD2531520D302C6EF0E3A8B0534461D730AAA0D7C
            CF40B58A3D4721E76709CAF84BEA4F9AE060DFC13040EBA69FE0DFB79F362C27
            1F8F1468CD7970EA635F75FF605F62D5CDEF9715FBF0A3BE48B0E3C9D5BFD3F9
            47ABBFB3FE675CFD9B38E71FAFFE6B9511EF78AB7D3D0A7B848A7FC8FB4FEDBF
            F0C8B57C0210A9FFA42676A854AA60773300FB7BA97D3E5F3003281A807F5BA8
            4B109EBC820800A86DB8B3F0F4484C61156A0394A8EA1BF3CAC13A6E3AA8510B
            A0C12144046A1612241250F06141393F567C10573582B0E5EBF7E0F347AE61B6
            DF18A40385018FBEFB9DF41C8C0FFC532E7F22CAAFFE68DF4782615EFD0FB0AC
            BF40871357FFEFB9D53F8224C131078C3377FC66D60429F41746B9F2F0C93FE4
            FDA7F05F0DCA22CD046C1F88F75FC060442DA53808B8C1A1CC19489A80236058
            D0EA332D154683913350A9D140E184DD406BB2301380F202546806085A00AB14
            4C761096259D26FD6D243A52B0FE3F2BE0EB67EFC86C0EF418FA85E9FB9F080B
            CFBA6550AF4DF9DDF2213FE6FD8F71053F9CED1F86081FFAA3D45FDA3B1BD681
            DFD108D1482419FBD728A2FE09B676EAFA4B317D0A0351F7DF167ED5AFC1BF6B
            29F9A7AFF6DFBD5DEB80DF9FD02D186D0D3DB28F8DCC00BCBF9269013259E516
            7BC14991B8C2C47202E40A50AA9560C8AF026BE9545CFDB54802A805E8B9C420
            562948B304292CA8E88C0AB013F59422207A6BB2E43FC31BAB5E7B0856BFFEB0
            D49731061E87DFBA024AA6CFEFF6B194DF5F2FBFBD04DFE82345F5A7D53F1861
            35FF113FE7FC0BB1D87F07B46F5B095124067A0EB506A3D795993AB658B4419A
            F813E17BFF9126402B3E093E85FFEA71DFAAD3E9DC3D0D00ED0D8322004A0A42
            9661CD42038180994A8463B158056506725A8011B500E39E823390547C8AFFE7
            4FD803577F134702D43454CF970A934350DDE91094F1A6806C07E91ECCCA98FB
            ECF0D593B7C0AF1FBD2CF5658C8107FD06CF7EF9D781BE4A743B910C5D27BDFE
            64CF4778C71FADFEFE50D2FB4F7B57E3AFE075D4B17E00941F4069C26A453450
            6D6BFB05E5218AC7A0FC6F0F6E54FA5BCF27FF6C47D9233270F4A7F6BFAFAB1E
            D0BB2567A0C96452A3DA61C4BF596A30E503E0ED2A7CAFE40B383E9A50E89933
            105777BC503014921630853901593890363D5F294829C268065012914C2816CA
            CE6C514961AFD9006F2EFB9DD4973106114AA6CD87C36E7F6948C7E86EF58FA1
            F0B3B87F30C439FF7C41CE01E871437BCD77A8198478CF3FB7FA9718DDDBAC5A
            7F9BC8F9972CFD25E14759A943B96BB65AAD2E94C3C0409C7F02064D00823310
            9947E772B9C8E9578C1754015C9970659BCFB8D01E30CE4B6A0148022A8D16F2
            283DD8624502D0248980B40385502824540B8AFB068C601678FBFA63A175D31A
            A92F630C221C71D79B5050BDF3A05FCFF9FC448D3E48A823BCE32FC0ADFE4CF8
            7D414604AE7AB4FD9D68FB53D30F7A2EBE54258B8626E6B7FF2CE36CFF101200
            8BFDA36C3490F0E36D7200B2CE3F5D62FFFD56FF09832600E89213801748A3C3
            68005B256E5531D2021C85C7C650B4D9A070D20250C0759622B055CC66750149
            02600E412401562ECC9902C04C07FEF24668AAB0DFD90A2F9FB770CCE9974330
            1494C2097FFF62D0AF97F1A9BECC088877C6FCB9821F41F5C7CD1F60C53F0117
            65FDADE13CFFD1CED5BFD8E8A9B1697DADFCEA4F997FD40596427DF554F64B4E
            405AFD91009C7E447F537F77B8DE217C56C90A41B3D9AC236720DEC74282B8AF
            A23D6A010BDAFD86B9CCA94765C244026A0D58C7CD007D7E2953FFD5061DD306
            547A0D1F16E47B0624FD01F88E64D96D299E2D7CF4E773A1F6874FA5BE8C3188
            70F0CDCF43D9AC85837C359FECCBDBFD42B14F9CD9FEBCEA4F04E0C1953FC0D9
            FE8EED3F40C8D3C126013102C0FF54F26870A2CD8EB67F22CA87FED8EA2FC4FE
            81EBFA5B8F32D74ECE3FAAFCEBADF36F6F181201903370DDBA75AC5148201030
            A106508017496DC399168057326E9BB3E0F7E1B8CA2268019402ACD11BD014D8
            0DD4941320F2052875B85172109F1B20680232A19D784F71C19EDE458E2FACCF
            9EB013AE0C63B5FDB982CAF9FBC0FED73DC1FD3188DF9458F869E5873897EE4B
            8E3DB1E32F42EA3FDEF6B4D680A765F30EAB7FB9C5B5D1A80A52B88FFABEB1D0
            1F6EAD285FF57CD10F25003553E61F6AE0FEC138FF040C75594D66063A1C0EBD
            52A9B4E14516E34689414C0BF08535D3EBDCB67D042D40C1B40035180B2780B9
            7822AF057024C0B400A17518DF3EAC9304F8CB1D418AC073440063157E39011A
            167AF2F3AB51FB540FEE00BC19D7B9F2F3AA7F9873FC91838FB3FD0310F62211
            783D2CE927120C428CFAFD45B9C41F147C4785C5B5050F1513567FA1ED17A9FD
            C0F5FC6BE0CB7EDD7DF5FDEF0B432600410BA0B6E1A809902FA0008980F90290
            084813286BF0D8F6F684B59572961DA86035000A0A0B56CE038DC90A1A23670A
            A892110135F307B06221DA9823912B1B1E49A6C08AD3768190D725F5658C7A50
            E1DAA177BC0A45D3E60DEAF509AED48FF7FAC7D96CBF04DFE62B1E8C24577F8A
            FB33C71FDE7635FC0241574BCAEA2F43DAA846D55F298F867A5AFD05CF3F6E8E
            FEB6FDEAF5BDA7E3F313D70768341AD634944F0FA6BC80F2685C5EB1D5597870
            02D775410B50A8D4A0B514B07261B5AE5303500B5A00E506085101BE9B3088CA
            8647825FF0D5731682AFBD51EACB18D5A0C565BF1B9E840A54FF078C8478A61F
            E7F4234166763FADFCE1084BFA890642ACDD5784F7FA53A59F8B9A7DA0F0D320
            1061F52FD47BEA0AF43E0AF3755DFD69EC37B5FDDE8E82DF40557F4808EE81E6
            FD77FBFED3F11976D502F0C20A848880A0053802C639AD7ED36CD20240A1600E
            41059A0296B29D409F57CA928298F09316A0E34880B50F53F1EDC44559823279
            BA2E5D5AFCEBD203C159BB51EACB18BDC0DFD292CBFF0A13F71AC2EC0616E707
            D6E08FE5FAF34EBF588413FE08AFFA477C9C0610F6F38E3F9F9B150409717F95
            3C1AA8CE6B5F8FC78BF1AB3F79FE59D51FADFEB8AF552814B5B4FA6BB55A0792
            C090577FF611A4EBA3EC4E0B205F007011011A2452B4D599BF7F38A6B20AD981
            24DC6ABD91E506A80D7A2E29884F1156B2DC00DE14608D44F90E427261C41824
            D580E14A051FDE723234AEF952EACB1895200D74BF1B9F86B2398B07FC5A61D5
            E7B37D78BB9F137E5AD169F58F8522C9B01FE5FC4749F871EF69D90ADED66D8C
            2098ED4F39FFF85FA5D9B1C1A00E53A61F093479868591DF4D64FB93F0A34CD5
            A773F527A48D00BAF305003748B4920F0D96F923EA09B5EEFC256C1D57749A02
            86FC7230974EE56A03980620720852F72095922B18129A89B22CC1E1EF186C5C
            F305FCE7E693A5BE8C51074341191C7EDFBB6882E60FFCC59DC3793A8B7CE29C
            CD4FB63FADEA4CF5A7841F61F5C72D1A08FE7F7B5F166B59769EB5F678E673EE
            5873577757BBDB76BBE329F1007688C19108C246080594042991B050848414F1
            122139BC002F48BC21E001780209119080584848246078800790AC24D8C6DD9E
            BA6BAE5B773AF3B007FEEF5FFF5A7BED7DCFADBAD55D77AABE4BDA770FF70CFB
            ECBDBFEF9FFFA5A6FD3DB5F3DE7754329BD16B175C19089F413B9E6EDFE8EEA1
            E513C09F98B83F3AFEA2E65FE9597F6E2F91FE00FF072A1B7D9ED029450488AD
            5689A52E8B1680AE41D7513A7C6FD0FB627FD678992BFF422281206490F7AE92
            29B07A55484008A0E1F803B856409B026C0EF89E540F967F499E173FC9F3CE78
            1C90C6BFFEB54FA9D9C5449F2733E86179F5CB5F53BFF0DBFFF8482F5FFA2CE5
            C6E12F893E16FCBAD027E3325F6DF76381DABF18431398709BAFF9B8CFB6BF51
            FD3D7AF76BAB5B7F1C78298A7D4A597FB47F5F3CFF68FB75EF794B7FFE5DCFF3
            F22ECB0BA01F71157E00A305647970E5477B1BBF98E57E0D00F6450B88EA0DB5
            F2D26754ADD3D526809000B6835AAD3005C41F50AE1C3CBF5AC077FEE53F507F
            F4BB175580C73D7A2F7D44FD996FFE0BD5BD7EEBFD7F0857F8E42C737357F25B
            BB9F6CFAD95C4B7F56FDA722FDE76AFFDEF7D564EF3E7BFD6126284EF965C7DF
            7BEBCD117AFB43FAA3030CF7FBA30559802CFDC507F0703E9FEF3A9EFF0F2CFD
            319E376C6CE350640792168039B22E2112205101AC2FEF4F6B6FDC1FAE7ECE13
            87A03105E2F68A5A7DE9D36C0240FA472D71084AF3103F96546133D3B03BE5B8
            A73DBACFD641F4F44796CCD5BFFA4BAF3FF3AC4417E368A3B5795DFDDC5FFBA6
            7AE5E7DF67C19511FC7A1EAFB2D30FF6BB91FC48F881E4670298D9B01F72FF47
            DB77C8F67F8724FF8C49224F75B96F3D5CF45FE96DBF9DE7FC895CEF6F1A7E40
            FAD3FE6D34FB84F4C70CC0B55A0D3E82D9511B7E1E653C770230A5C2640A6012
            9136690230B4AE90097043B400440736EF0FBA9FDD9F375F6535DE0F58BA43D5
            6FAEDE509D2B6F145A40439B0251031982E20F30A5C39C2350140ED95F74CE62
            84FFE5777E55DDFFCEFF38EDD3787106DDFFCD8F7E567DFE37FF9E5A7FE3531F
            ECB37247F5578600A4B34FA68B7C18FC1CF22BA43F6C7EEEF6DBDF55FB77FF90
            F761F773D88F88C3F7D3C5AD95C7DF0DFD0C1EFFD4F4FA97765F080562D24AA4
            FDDEA57D68037BC8F97F967E7F47BA54C771F94DC39024491A711C7789C536D1
            3508FE004404E8075DA5B35F7F777FE3CBB3245ED12ABD4E134687A0EED58FAB
            E6DA158E048004A0018008382A00F0DB2E420193071C833647C0778820F79EAD
            9B00D4BBFCE4C963FFF60FD5EFFD8D5FB8280AFA80C3272DF2E52F7D4D7DEE37
            FFAEAA75D78A7F1CE1BE2E7D4E3C1DE8E7021F259D7D38D69FEA4C3FA8FC00FF
            4CABFE8BA991FEB49EEA94DFDDDBDFA1FD3EFB06788A2FEDF8CB6F7477DF69C7
            3384F9ACE38FB081A49F2D487CF1FCB3E38F30B433A4B1B7B7377BD6861F4F1B
            C742004A2A05D1368CCEBBD56834600A5C565AFADF94F5A5451A5C2112F852A6
            C2884980937E22EB0F88DB1DAD018843101982613DE2B56F8A866C8E80980362
            1294948065BFF2A4B1F6942BFD3FFFE16FA91FFDC1BF3DE1937A3106BCF91FFB
            8B7F5DFDCC5FFE9BCF3EA3EF939E0D91FAB6C2CFDAFCA2FA2F74B88F137A2673
            D10044FDA7ED3EECFEFDFBFC9A3C49780E40980E6B8DD1BD4BCDC13D51FD4DD8
            0FEAFD8E38FE50F107E71F26FAD842C1CF68349A3C6BBBAFF7FBF39FCBE79A7E
            01B45D4358907ED83A1C82F003D0B19BB2BD3158345FB937E87D060046FB30F6
            0790848FDAAB6AE5C6A73822C09A00E706C4BCF66BD240843506090F4A7E80CE
            18F48B6CC15CFB074E6BD2D1A30E3C5CBFFB573EAEE6A3FE699FCAB9192B2F7F
            547DF61B7F475DFFDC57DFD7FB97CE3E6735FEBC50FBB35C6C7E1DEBCFA5BC57
            C7FBB5DA9F0AF8132682991A6FDF53FD873F60D3205B2CACD7BF11CEFB2F93DD
            2FDF04D51F26C098168482E00CB4AA3F2D98E70F0EC191D3ECF3B9497FFB9B8F
            69588720261425C0635AF14D740E822F00A600BDE60A2D6B0F47BDB77627CD97
            8D775F3BFA62D55C873FE07515D52431A8115B22F04D5B71131EB43D0569098A
            D98672C915380F6E817BFFE7BFA9FFFA3BBF7ADAA771A64773FD8A7AE9CB5F53
            3FF32BBFA5EAAB9BCFF5B34D230F2F2F0800157D991000DBFD92E60B951E453E
            200096FE00FF546B01B3C19EDABBFD87F4BFC2EE57B0FBBD64F1EACAF6F742B2
            FF95A8FEB44C890430CB2F3AFDDE93669F77240168DB38FE9E57D8AF3A8E9500
            E010FCD6B7BEC54D4388C95AF4C360985D162D0024704D214AA0BC9577F7D6BE
            304B6B3D654800D29D48A073F935BAE92F495250CD6A01080DC21CF0629D23A0
            C38312223419839E270AC0F90913FEFEDFFE65F5F0223BB0341A6B57D4CD9FFF
            9A7AEB18405F1ACEC49D36D14726F1CCA5A1672EB17E56FDA7DAEE4F05FC29B7
            F91EB2D36F311E6AE99F26BA3498EDFEBD77DAD1B46F547F7A3E39E64F6B34FA
            E4661F2000F4F9CBB20CBE80FDE370FCB9E3B861611D82F4A36AA401744D6E00
            484088001D85D7933CDAF8E9DEFA173382BD710AC21F007BBF73F5E3AAD1BB2C
            C08FB53FC03507625D3E5C140E410BD04490970A889C9FFBA45F7E12FE8143BE
            1F7301FEDEAF7F418D1EDD39819338BBA3B176594BFA5FFB5B1F0CF44F7BC28D
            CA9FE78EED6FC09FD9E29E5CB2FC388C375B58C043F2A75363FF8F09FC7FA466
            A37D51FD13EB37586F8EEE6D36FB90F0F4487AA6D8670C9023E34F15D2FF2EE1
            04B5FEBBB420E63FFBFAD7BF9E3E4FC7DFB35C9EE7F1F9EC10BC76ED5A443FA6
            493F8E4D013A7E5DF202E0108456B0DA9F376EDE1FAE7C8AFD01DC1024D4F306
            C4B1EA5E7B4BD57AEB4C003639A829F901356D0AE844A150CF3160FC029E3806
            0D01783AC3EB2C9B04D97CAAFEE36F7C5E4DB61F9CF6A99CE8D0A0FFF3EA1304
            7A6C1FF7304117CFD8FBD2C493FF21C035597EB9801F923F13B57F2124904E67
            ECF5EFDFFDAE9A0D7734F8D1DF0FAA7F86783FECFE9DB7E51B21FD91F537A1EF
            B2317F49F6418F3F54FE6D23E38FCCE5D97138FEDC711230602D80D6C1BD7BF7
            30B5780B8D439406BD2101F80536697B657BD27DE3F1A4FD9A2E18F219D02081
            B0D650DDAB6F71FF8040CC81C0F8038C53D021011B1D701B8C422370FD017636
            E2A75C86934C299673C194E0DFFAF59F53D3BDAD93FBEE131E415C53DD975E57
            D7BEF08BEAF5BFF00DD5587F4EA03FCAFD743CFD26BF37776DFED448FE02FC19
            835F27FB58B51F0EC0D94CF51F7C5F4DF7B7D83C70EDFE30584C09FC3F08BD74
            5149F8E1525F99E1178D3EEFBAAA7FB3D99C105E16C7E1F82B5D8AE3F8D065DF
            634C01DAAEC771DC592C166BC47670021A12C0F606BDB4F760D87B737FD6BC61
            FD0161A46718AAB754EFC65B2A6E7575D31068020D996894F6D91F5033E64041
            027AF2515F97117B5ED1723C2FFB06F2CAE5F04EB9A7584276E47FFAC69F54E3
            C7F74FF53C9ED78046D7BEF68ABAF2B37F5A7DE46BBFA17A2F7FF4D8BEEB69F7
            D2E6F39B461EA6B0479C7DD6DB0F875F52809F9D7ED322EC87FDC183B709FCF7
            0B8F3FFC0459AA422F99DF24F0C77E3273437E32C107A7FB2AADFADF915CFF47
            46F527C98FC4A0F438A5BFBE2E2733D814F8CA57BEE2931910AFACAC3408FC5D
            FAA11B32B928CC001001470508B09DBB83954F0EE78D4BCA291DE61C81665BF5
            AE7F92ECFF96F5093011C4921F209A80491B36B5039ED35FB0987340FB08DC5E
            834F9DE9E514C677FEE937D53BFFFE9F29FD0C9D9F01E26D6E5E57973EFD65F5
            EA2FFD55B5F9D6178FF1CB9ED0C62FAFBCCE487B27B34FF7F233E0CF58EA6715
            C9CFF17E027D067B5F8800A5BD939DF718FCBAB5979ED4D3CFD2E4E595ED1FD4
            82C5C4B5FB950EF9C1EEDF12D51F73FC71C88FB677080FC3E759EC7384CB7662
            C3A6095FBF7E1D9A400BB502F007D00FBF2A6141CC31083D7035F7FCCE9DFEEA
            A7C6497DD517A7A017E82CC0B8D96312081A754D006C124492298810A1341241
            98D0B415F31D1230DD853C2100E502FF39440C8E6136E3E1FD9FA8FFFEDBBFAC
            86F77E7A82B7ECD90608BABEB2A9D63EFEB3EAD53FFB2BEADA9FF8A5A3BFF9B0
            6BF63C9E5047DA6B47BFC9E7CF6D238FC2E62FD27B79991BA9BFD0C0879487FA
            4F8430D9BEA3465B3F2292984B730F5DDF8F3F37BB7B6F37C2D9D0B1FBE7F46C
            A3C517123DB625D79FC14F388019B08D849F9D9D9DA978FD0DF85F1802E0EF73
            138408F8AD2449D81F400B4282D004D81F40EB955CF99D77F7D63F3DCDA20E92
            849804B837009140674D75AEBD25E5C2A20198FC006801922D583806CB9A4061
            12F8C5E4234E31D159ED3DF8FFFECD3F523FF877FF444D771E9EEA7904F5A66A
            6E5C532BAF7D8224FC9F5237BEF4E7547DFDCA695F9ECAC8CBD25F527A3DE3EC
            93725E06BFA3F65BF08BCA0FE0B37ACF2ABFF601CC761FA8C1C3B7E975736EEE
            C1EF43796F9AE557BB7B3FECC493BEA86CD6EE17A7DF2EEC7E5A58F587D38F30
            F098DEBB4FA6F104093FC7E9F5AF8ED378CA7D9802B40609587F00D93F971D53
            001A01FC01DD24F3BBEFF6D73FB3C8A3866FCC01D8F724E99904AE7C9C48A06E
            41CF668068044C0291260115E9A802934068084072057C813BD63229E1599FA6
            7CF0DEDBEA8FFFF9DF570FFEF71FD0433939BE2FA26B11B77BAA75F565B5FAD1
            CFA82B9FFBAABAFAF9AFD2F5AF9FF62578FA30334CDB821E63E717FDFB8CA7DF
            487E56E1E749017806FF9C9B7BB22640FF9BEEDE55A347D2CE7B51A8FD2092CB
            AD7D4CE7B5832F719C7E48F545BC7F0F853DB48D469050FBE1F47B44CFF5DE49
            DAFDEE388D477CA93F40661662A7A0D25A00B6D7E901ECCC9360E5BDFEFAA713
            15C63C7760104AEBF04845AD9EEA5E7D93CC81A6CE0C743480C0C91684E6E0D9
            FE8245848009414C8152AB315B53E42DFF05EE38E51A9E7BFFEB3FAB3BDFFE0F
            6AEF47FF578D1FDE568BF1E0A90E0BEEC510C52CC9A3769743ACF5B5CBAA79E9
            0683BD73FD23AAFBCA4779FBCC8DA75CFFDCFCCDC5E16F5B772956F96D720F40
            2B093E1CEA2370E752D99749B80F8E3E0EFB891F60BCFD1E2DEF6A52E069BC53
            8E1600FC1BCDC1EDF5C6F0910B7E7AB68CDD0FF06F994A3F7AE6EFC934DFE8F0
            830620C796EDF72C97F2C4BED7F507D0C56812F87BA40A6D12C0AF487890B304
            69590309CCD278EDF6FEFA2733CF0F5972233C186A12081B6DD52112889A1D02
            7E68B500E40878EC142C4880B5814A98D0D411181260E7207494DC9990A46084
            EA93F6F42B790A0431DB7BACE6FD1D351FECD27A4F2D86FB5C39D97DF90DD5B9
            F9FAD995E047BD8E4BEF4311DE735B75DB109F0BFEAAD497DCFE4C9A7A940940
            4BFFD1D68FD564EF1EBD6ECE91017E9FE4F8AFD6460FAEB4FB77F302FCC8F483
            DD0FF0C3EE7F2C21BF7B52DF0F1B6E7B3A9D0E8800A0C2252765F71FF5721FFB
            7757F303C81C4033D14D640A2AED10C41A24B04A206D8D17B5CDBBFDD5B78804
            026DCF0B097004A0C9E64044EAAAD5049CB5170B11184D804C02156ABF823273
            111A73C04D1E3255456EA391336C1A7CE8465E0AE208E04D159FD29E7D89EFBB
            69BDDAE6D780CF0DF8ADE45F30C8D9F137D3A1BEE1A3B7D5ACFF48927C8CDAAF
            6BFBBBD164EB7A77EF3D6D5D649978FC91EC03F023977F5BE979FD18FCD846B2
            CF49C6FB0F1BA7FD28975285490B68231988B4804BD004681F5A004800A4B042
            406C4D9378ED4E7FF513A917C6DAB32F3E01AE0CAC11097C4CC59D754D0AC60F
            60C02F6DC63D21025F7A0A28132510E7A032E680EF150460AED68B3E5DF17919
            2EEA5D73476C7C4FCA776D038FAAB3CF38FA0066D4F32F1CF01BE71FAFA76AF0
            F007A4496D4B8C3FD1C4916AF0AFD546F72FB791E26BC19F499A2F67FA295DE2
            FB48E6F583E4C7A41E8F31ABCF7C3E1F1F77AAEF512EE369DF46CF3805D14004
            5D84D050D4090F224FE08AC91404092479DCBDBDBFFAD64245F512098873B073
            F90D15772FB12FC033B502B1F410B02641A4FD02620EA8D02F92868C69200D46
            AC4660AF98A30A9C9F3AA317669492786CAB2E7D8CC19F69C96F63FBA96EE201
            F02B27CC974BBE3EABF433F1FAD3B15C427FC974A206F7BFAF12E4F627739D15
            E8807FA331B8BDD91C3ED28A46963B921F2A3D7BFC95EEED07F0DF9770DF6348
            FEC56231BA76ED1A9C8327EAF4AB8EB3F0EC5A12E8743A31B1629D2E541B9583
            E8240402302420ADC64102CD4C85EDDBFDB5376759DCD67D00C4AE8F7429716B
            F3966AAC5ED792DE01BDD9662DA0A6938B384468DB8E07857330F00A8DC04920
            727389CD667EE0273DE10A3FD3AD3EAF5D828EF8683DF5FA2CBFB2B9D397DF05
            BFF6EEEBF8BE4AB5CAAF04B09C9B9F3AF6FE5C833FB76ABF64F211192493A1EA
            DFFF9E4A695D487E9DE1A7D22CBFDCD9FFC96A3CD915C16FC1AF8ABE7EA6BEFF
            01A4BF84FE1EA3BE9FC6A8D168CC8F3BCFFF39DEA5E33F0F533A8CA2A1F1788C
            86A21DA919B8643401A5FB07A0B1488FAE589310DABCD35FFBD838ADAD7832EF
            A0CEFED312BFBE7255B5D66F694DC0FA01429D2C2464E04925A18A8ABE02A698
            487184C0F417F0CB9102A7F3502EA1C3EA15F5CA7F9E71E44FDC3DB3C37BEA81
            A7FFEE7CC9CF15901B81AF0E0BED39853C2A2D62FBC5A281CFD27FBE9070DF42
            B48105FF6F3ED8619B3F9D8E75271F5A9480DF23F17FB5BBF7A36E381B2C03BF
            D2E13E801F2DBC1F9026CB0E3FE4F823DC47AF1BA1C8479D92D3EF83DE9D633D
            17F8037EFCE31FFB6825469A40C3E408605621A40C8308688DA421341AEDD255
            6B11F0EAF7066BAF0F17F50D630E30114450F1913ADC536D32095047E04B3FC1
            02FC8E36C0FE00630EE86D9B3854693966C3869EC9287472CFABFD07CCAD3D4B
            57FA2C8FCAF5CA9DA69C25D01BA2C8A46557961D48E75569017AE3ED4F25D497
            CFE78EC34F7C00440293DDDB6AB2FD9EDE77243F3EDFA70FB8DEDB7BA715CCC7
            4BC06F62FD68EA89345F2BF9E9997D4CA0DFA5E7173500208933017EE7329F99
            C124F0BDEF7D2F40781024405A40571A89B89A002203EB281CA21B8112E3F8FE
            A0776B6FDEBCEA5BF55D6B02C81AF4E31A99041F51B5CEA696F8AEF417DF80CE
            1130F90281CD1E544E06A1ED40ECFB0501386DC9DD1A03EBA4AA161B9DB52B7E
            46865772E4B99BF901F06B279F48FBB490FAA5745EA8FB89EED7AF09403CFEE2
            ED371A001300A6E99A4ED588A4FE7CB4ABE3FB4952027FA092D94BDDDD1FD683
            C554C06F1C7E46F273810F72FCD1DC03921F1A00D4FE288A760783C188B4DA13
            4DF33DD2753FED1358764E263CB8B5B515D3456BD0053424806C41B4188729C0
            2440FB5DF804E858EDD1A8F3D2F6B47D534F3862484032008908EABDABAAB9F1
            2A83DE73B581489381272DC795710E46156DC075109A7A022603656729CA1D32
            70B5FFDC21850F661ABC2843D2755C899F17B5F9CA73547DC7C957A8F922F5C5
            D6E732DEB470F231E8A594D77AFC8DEA2FAA3EDBFEC9422DFABB6AB8F50E1D1B
            DBC880AEE597893BBDF9E4A5EEDE0FB9AA8FEB086CA88F537C9564F929EDE043
            B80F52FF01D47EB2F977E9F91D369BCD2969B7C9697AFC978DB3FA049648A041
            633299A091089B0342022003D10454978088BE83B5FD5963F3E1A8FB5AA6C250
            4B6EA92108433109BAA40DBCC1D584003E1C819E4404DC10A19B39A89C5A02E5
            1281E717B316FBC649E86A03451E61EE94197AD592C303996D67F5B6BCDFBBF9
            047F86E9BFA79CC61C7CBC027A50A8037ED3AD87557D09EF29A74F3FBCF5F91C
            FB0B2BF97329EEC925CF3F27F08F776EAB292D99795D2A525F66EE694793EDAB
            ADFDDB8197263A97283365BDF0F633F895CEF2434F3FF6F8C3E647A80FE0A765
            48A6EC14B1FEB3067E7DCDCFEEB0854304FE882E62934C822E48403A0A5D36E1
            41252480102148609E85EDBB83DEEBB3ACD6E679038C6FC0840AA3BA6A5F7A4D
            C5DDCD02F866310410578E07BAD390B2F31306656D401A8F9423069E95F4AC1D
            2C891E98F90B8E7A47CECC93E3DEA8A7BD203FFC8069C5E5790EF8332796AF1C
            1BDF51F7791FB6BE1BDE4B0B899F1BD0273AB5372F9140C2F5132392FAF3E18E
            680B3ABCA78A1E7ED9A546FFF65A63F498537B25D4A7747A2F4FDF2D73F841ED
            37893E0FCF13F88F74EF4EFBFC0C09F4FBFDB8D56A35E8E2A2C5F89A8404E110
            BC0CAD406912E8310928AF9E077EFC70D0BDB93F6F5D2D927C74B80F26816F4C
            82F55708ECB1CD09F04C0561AC3506AB09700A71505415D23A0FDC29CA8C56E0
            1544A08AED224A50AC4B25C8CE665E39EC3DEBAD7A9E77F5991FD7BC983EDB3D
            95BCBC913B2FB2F5F96E128FB1F34D475E91FA2A7524BF63EB1B2F3FDBED0CF4
            45A1FECF0B52C0FF17F0F23FFE21690113B1F7757CDF7C6EE42F26D7DA7B3F69
            8473AEE5174704EC7D93DE3B91501FABFD4AC27DB246A9EFDE79007FE9FE9CD1
            C1E7572501640C2259882EB2210198059730F780D279026DBAD47592B8F170DE
            587B305EB99591ECD7402D9B0448210609C49D0DC90790888001BF29240A2B24
            200B938A68069C4E2C91825CA206561B781A1138DD8972473BF0CA5EC427DCB1
            93B895F9E1872BA7698C7BAFF436A73C1700574F007E5E96F8CA16EF384E3E63
            EFBB76BF95FC8B12F05913984ED564FBA76A36DC628240B30F2BF1333D5F5F27
            9A3CBED2EADF21953FCD6D93405DD2EB64F8F5A5B20FDEFE4792D7FF4834817D
            38FC363636CE3CF8EDFD39E3C39280129F809232622282156802922568B20539
            598824729BC0D3A03B172759D4B83BECBD364B6B1D5300641B8C08B8A3D61A13
            41506F151101A78AD073FB0A3C8908DC946299C2DC860ECDC425A529CCCA6B37
            8468E634B0870E84148F6E3A3C9771982A6F9C76F69091ECE67FF992D8BD7E9D
            0EE349E69E21026BE32F51F75391F8027CB5D0957C4AEC77D7DE37CE3F45FB93
            FE3D35DDBDAD137FD2252A3F7DD1E5C6E0BD95C668C7CB4D498F0EF329013FAD
            C7B4DF979A7E346B84C447451FB6B74928A191277BFBC95C3D730EBF65E33C10
            803D4F4302FBFBFB115DE43A5D78AE1D88A2689DF661065C1227E186D40E7468
            1B7D0462D200A247C3CE4B7B559320D4C9438AAB0B2355EB5D53F5B51B9C4DC8
            0E40C70400012827446888C094182B99B558F9E5C623B6155925B350E70F2D27
            03CFD1FF8BDE04A697A17B554E8804AA8FB013B62B6DE505599543784EA59E1B
            C6334E3D27966F419F9A6D003E236200A075118F5A140D3BADC73F494A3E0084
            0093D19E9AECFC442D268342D587A980CF7055FEEEEE4FEA5E32F574E540D5D3
            3F9316DEA8EADB71C10F4F7F1886E8EBDF5F2C16E3198DF3027E8CF34200F65C
            DD3C0138FCE8C2B7E8708F2EFEBA380741049C2C8456E324813B24751BB45F23
            F04583697DEDC1A4F76A96EBF907B493306015DEF4108459D0587B858B8ABCD0
            8906C8DC038608347104A21D8826607B0D385D89838AA35008A168462213981C
            483736A1C3A22CB9F00F543D0347C831F8A025CB795E796919F07AE534DA5445
            7C9F25BD996CC3BEE6A09ACFF67E9A95DA722B96FA9906AD005F893DAFA4838F
            32049068EF7F3A27757FE75D35EF3FD2ADBA4C1A70920AD168951F957C975BFD
            BB50F939BC8FFE7DA0216DEFDB18BF01BFD265BD0F65C6DEC752CF3F2001343E
            4B197E471DE78900EC399BB461DA8E1A8D460D1102A4071BE7A038052FD9DA01
            1D268473B00693205361FC68DC7EA93F6F6E7A40A68914D866215AE2C32C68C0
            2C2042B052DF01BC4264201642104D40391984D649183E412B38CC47509AF2BC
            BA763A1A5B0DC1A182A5BE8243428F4FC8BBB7A02E25E0171A482EEA7D2951C7
            2500D7932F9E7DA3E2DB709E71F059D0A762E73B9E7D6C0BC0B5CAAFD73AAFDF
            380225764FEBD9DE7D35DE83BA3FD3C7E533799DA722F593C995E6FEED663C1B
            7A1AF7380F92FA257BDF26F8D0B243D2FE31099947D2D5679B80BF4BA01FA095
            170D9808E70AFC4B9E8A73332C09D0C50F6B34C80C6822421004C1AAE3178046
            001258054120422026419413C4278BB0FD70B2F2CA2C8D5A45EBF0A228C89339
            0A6BDD2BAAB6724D0568A2119A790803C71C704D03091186524B600A8C6C0E41
            205A81C92474DA925589A06A2A94CA922B15891547A23BF2279241A5D866D963
            EB4A77DEA8AC653B37893C991BBE33893C8EA47763F9027C1DCB2FC0AF89C009
            F1D9745E0D72ED03480A27202D8BE10EDBF909ABFBBA49A7924C3EB3F6E8CF6A
            7D747FBD3178E4B1B4CF3393D6AB24BE4FCB5C6AF987E2E987730FD21EF9FC5B
            B2BF4FCFDCA0DFEF4FBBDDEE9C08203D6FE0AF3E09E76D944A89491388257598
            9D83748CB5019000FA0BD27A8DFD02CA6B237D98B6637A4463207277DABAB43D
            6D5FCF48A4EBE21FED24846650A8F991AAB52FA90611811F37B4F4376ABF6B0E
            187F40E0A411BBA681C921701D85C63CB004E057128BB447C0F62EB43D0B8D69
            5098036EC251D93BEF1D58552273CA417AD9B590BBA13D89D7E779C5D697421D
            A3E2677991A76F53758B29B75CC95F48FD144D35C5564F2D09B861BEDCAAFBC6
            2148127FB8ADA67B77553A1B1666810B7EF129B4A2D92E49FD3B989CD3432F60
            7D6EACF22BDDBBCFE4F48F8CA79FB6B7C5DBBF456AFE36091868027D93D7EFF4
            F133C03F37E0771E87733B2C091001040813121BC339D89ACD663D6803F47FF4
            1A44AB316802F00BA07290D387112520C044F4114192F9F1A349F7E660D658F7
            6CF14F015E3F30208EB8A600CE42F4D333A600A70D5BD017A1411B2188B4F4CF
            83E0407762EB23702A0F0B22503AA468D38BA55D992A4C049718965E22AF72C5
            AA1AC0210EBE120FB8F5F6D8CCF292BD6F35003757DF80DD7AF48DCA2FF67EA6
            A7DB56E2E4B380B71D7BCAE0B7C53DECFD5FA8D9604BCDF6EF11F0C792109458
            9301FB4A3AF6445E32BBD41ADC6ED7A67DF81C3C8F557E56FCE992B1A34F7AF7
            4D65B24E6BEF43ED97997B39BE0F959F14CE3162FCF57A1DA461EAF9ED553A4F
            E3BC1380F90D4818C29A2304700E120134451B5835BE012101360968BF07BF00
            6DC341086D80DEE7FBA324EE3E1C756F2EB2A8E99A05CA492B56E22788DB1BAA
            DEBBAE8246EBA0D437AABF4304864C944B02027AE5559D850E2978A60A51397E
            824A376371241E98F1E8B09A035B6DE7BCC46DB46136BD422BF09E027A57D5F7
            2ADE7C1DD7CFAC4466076052A8FB9E017DE2487EA30D648608328EDFCF068F18
            F8D96262ED7EE3D8CB5C759F84FC4A7DFC70B33978E0D18EC7A582E01DDA6625
            C63AFA66D2BBCF74EE85A7DF821F1376A08907FE8FFE7DA3D1685EF1F42B750E
            C17FC893712E878D10A09CF8D6AD5BE1D6D6568D0ED589AD112AEC91FA8662A2
            75277518FBC82368431BA0ED1AFB063C2FCC728FCC82F6E5DD59F34A9A879131
            0BEC3A08ACAF004EBFB8B5A6EA2B4404F54E1101707B0A1C00BE1083EB18746B
            0B6C9852E633741D864E76216B076A4955A25C11AF945C54BED5B68F41F5421A
            E95F72F02949DA917D337DB613C2B3E0B7FB06F04E224FD5CB2FF17DE3EC6390
            1B934072FB8D36902573F6E84F19F833ABFE67C6A3EF461168BB49EAFEE546FF
            5E1CC0334F929E053EC7F533C9E7B7529F1613E263951FA0C702955F08011D7C
            C6F4B629D9FD208C84B4CEEC3C84F98E049C1768B073F0DBDFFE36FB05E8A645
            04EA3A1C843235399B0458441B3024D0A5B7923EAF1A04A7186601813DA0C725
            DC9DB736F726ADCB890AE20344E017F63E3482B0D121AD609308615DF9612C6D
            C68C03F030A7E02105469233E0957C03A6174131A989250299E0C44C75560A12
            0A37949C840E037846D257649991F6071C7B4EFCDE95FCB642CFEDC863C02F84
            A05CA79F95F28ED3CFE9E083FF2DA6FB6A31DCA2659B492077CD802C93965FEC
            DCC37EDE8A67BB1B8DC1835AB89896D47DC7D697B65DA6632F6CF97D69E2C19E
            7E5A3F466C9FA4FC3E3D2703322FC7F42CCD7BBD1EC07F6EEDFDA58039ED1338
            A6DF54320968204ED364694F80A79B6A8940CC03EC1309A80E01AE41FB753A1E
            19B3804015ECCD5A1BBBE3E6E5850AEBDA46F7CBD38D110128DFB75A41ADB1AA
            222283B0B9A2A304E6B58E33D0487EFF302DC098082693D0F807F81756320CDD
            1C82DC890C081B98C4DC83D1824A7AAEA7AC6A2FFF56E2F52B497963E31B7BDF
            34E3B05A8001BAACA5C0A674DC4DED75D728CB9D0D1F33F05384F232275D57A6
            DCCE65D1C04FF3766DB6BDD9183E8C7C487C1C17BF3EABFBDC25D0CDE8E3F01E
            F2F969BD2FEDBBB6CD22CE3F1CC76BA646E527CD323BCFF6FE6160791147C924
            40A8B0D56AC5026C540C76C519B84A8C8FE80016F805441B502D2102980561CE
            6480AEE1BEBF376BAEED8E5B57E679D8B0CE3A037CCF48F2A202119A40D4DE20
            AD6043058D8EE3FC0BB8E7A0E738028BA840750A33CF02DE460502D1045CEDC0
            9790A195FC550760259FC00CB79536EF2BEB1CB0D57A46E54FABEA7E266641E6
            54EA15CE3F7EBDD1002A61BF12092CE66A36DA66D027D341A121984C40C76C30
            7D0010D2EBC693C71B047C78F64DBEF113D47D6BEBD3D297EE3D0C7EBACF90FE
            D8DE0F8280137B689991F45F20C4F7A2A8FC4B81F2020F6B12204A80B262BAB9
            353419215240E35198052B20018559893509401BE8D1D211B3A0EE7B7E4C6B10
            410822F0097DFBB3FAEACEA47565962187C080B190DA05B0034B0A61D4547107
            5AC19A0A6A8D32B89DD2626F0921B809438519E0157E022752606FAD750B48B4
            C04D249257B97E80D2ACB9B22AC27DAEF4CF9CE9B4E1F0CB64B2CD8AB7BF2AF5
            B3BC120148D462B2AFE650F1C7BB9CD8933B36BDFB7E4B20F47D3E3142B73666
            E007C80F36C0E78ADD32F095063F808F4EBD23C9E5DF17F0C3B987197919F8F0
            F02B4D0ED34EA73347038F37DF7CF38552F90F00E4B44FE0847E239B04D00668
            3B5A5D5D8DA00DC88C44300B7AA211ACE9F4614D04B42612506DBAEBDC6C0426
            816F88208346E079C3A4D1DB99342F4FD35A07C8B4C07448A034E7809800E849
            10D47A2A6A74C9A8E8D27EADD25B6049E72147D52FABFE78AD129F80F1EA7BB6
            98A808047895B52A37DE5045DABEB20D389D92DDCC0DF115EABE77C01750C9E9
            3791000276321BAA1476FDA44FDB8322DBCF78EFC589E799FE7E763BE7705EA7
            36D95EAF8FB67C8F7379D532E03BEDB9AD934FE9093AA0D6EF19F003F8240CF6
            C8DE8703107AFE846CFDD98BE6E87B1A383E2CE3803650ABD5627A5E304716A6
            2A479F811E1C85F0111CD40654D3980504B41211282E190BA3FD79637D306BAC
            CDD2A85900B4ACC61BF53EF7CAC40042081B2B2AAA775400428013D121001B0E
            94A2A26A63D29209E03422B177B9DA8C44C27E6EE96E290CE86A02C609E8A8FB
            6EB82FCF2B493F79410048CE49A67D96F4C97448FF4A0A27209B14692934C851
            004B26B8B8598A049E95DA78A719D18769CCE79AA018F8003CEBFC62E72F2AEA
            FE48E2FAC6D647886F57BCFB7DBAD743A8FBB0F57777771764E7736CFF139FF8
            44FEA283DF79423E34A3A40DC037B0B2B2121119D066CC7D066801D8E1285C31
            DA80D21A02FA1222A4688800598431612EA0673D6467211472D20BA669DCD89B
            35D747B3DA5AA282C85305191492DCA907F08DF3CF1C0F941F37593B08E2167D
            428309821D8DCA35039CB58D1288AA9FABC224C8ABD1015510829BF4E336DE34
            0795C904D424C02075127D0CE8B16470BCD3922FC66CC763C9C8342F01BEBA6D
            B589CCFA1460C337C379BF539FEC74A3E99EC74905628FE8BC834C6C7C6C01F4
            ECE073808F861D23999987C37BC6DE370E3ED8F974AFC7749FA728E05B62EB3B
            57E0C51D1F3602B0BFD968039B9B9BFE743A0D315331FC03300BE8DF2DB207E1
            0C4436E18A380757C479A89D849ED7A4C7B1419F563B40041EE0A6513A98D7BB
            FD59637D94C42BB916E956853729BF4587E1A2F3B04B08B99800A4781019D499
            1C82B0CE29C93ED6643E940A8B4ABFF460DBF22247A0ECEDF74A66405E240719
            3301F84BD14813409F70C55D9698F5D4CEC6A3F2C3000FFC66259301EF31FBB5
            603126157FA7474BE8C121A04CED3093429A6975DFB1F1AB12DFD8F903013F92
            77007E5E90C24BD21EC53BACEE77BBDDD9D6D656E278F85F585BFFB0F1612480
            D26F5F6616D0E11AD9821C3624028046D07317D106D06BA06D8880808C28434C
            FB10D35263CC9DEE7CB42A4F09CEFBB3C6EA685EEB4DD3A89DE6A21918C79E72
            0A834A84609C7FBE3E6967BB98C7105D901B2A0822713A86745822119EA422F3
            E9E8B52F5A8696BE89D8DA522997398B731C921C129E5FCFE13707C4B6C4B7F0
            01B80057A5822031233854A7F29ABF18D5A3F9B0472A3E5A6E17110891F63803
            023E7812CE7D276FDF86F4A44BCFB8027CBBD03D64E023AC874C3E2202F6EE23
            95970820FBB0497D777C9809C08C036601427FF470C4C65148FF6F09D8BBF420
            F5B896808840340276142ACC54A4BC3A340229340AAD56E0231D45FB0AB00DD0
            1209D4890CBA9345DC9D24718BE0101A53A1E827E83BCD442BF6BE9802962C94
            9B2A6C7E96FC402E1E3A2424E8D8FFB64557A931BFC9FA53A55C005BDDA78A94
            600675A6549E2F073CD6B52019D783F9B019CFFBED6836F29538F33C36318C6D
            6F41AF74CA2E1885D57C59E6C6B36F547D13D397059EFE3E804F443E8CA2680C
            894FC7A7747F17743CF930AAFBCBC6050114C373CD823B77EE04C63F803907E8
            2142CD40CBF113F4248CC86BF80714220639571AD6A1D112D8116D40425118F8
            1EC820A0633EB45E46A52FE53CF4774C244084D0992EA2CE348DDB990E088AED
            5E54041665C2AAA80A54FE52F0DBBF55CF7FF1CF4AF65FC50760476ECD00037A
            B79167E147285E67001FFBC9A416CE87AD683E6893A40FFC34295E6399C5805E
            5915FFA0B42FA9FA90F870E02901BBA4F296A4BD017EABD59A8D4623F6EC93A9
            977E58D5FD65E38200CAE3807FC010013D481C3AA47F733211AD5BF400A2D8A8
            2B1A81AB0DB08F00AFE5E423DF875961C82038400680AE9E6084618E7C3C2284
            F67811B79234A8CFB3B0BE48835AAAA0DB6BFBDD38F58C4BBF540DB824EFDF8D
            08E4CB7E74351468865BFBEFB9D2DDFDBF066EE4A7D3D0CF665190CCEAE1624C
            127E102E03BCE91222B643AE7F91A8F845D61E2D0B67DA2DABEA2B9DBECBE0A7
            7BE012C09023B349C2D2FE02F84F1F1704B07C2C25025A87F440B1460060D3BA
            492A668BEC4AD60A84100C095822401312DA0679D440062002DA0E850C7CDA97
            C202CEB1A91082B2804EB3209A66516D9E1029A421134392FAB54516D672C302
            7911F7CFDDDBEB1DF87932F2A59BFCAA520B30FD37F0B245ECA7B3C84FA65198
            CEE22099D6425AFC645E0A1F1C04BCD4DEEB145D526FB2DCA813B94A4D271E55
            96F628CF9D4A3F3E0B7CA8FB749D8700BF001E6A3E26DD84493045069FF9AC25
            C05FF24B3FBCE382009E3C9612017C04ED36C9B7D98C3B141301A0CB90A93568
            C9BA6DF68DC600F340690D0204023260229085B5022104AF4208A2E5EB460045
            2ABFC9F3F702228128CDFC20CD959FE57E001322CBB8A029A0B58FCF269EF1E9
            388EF9780F20E97B79CA8BA257790ADB99678E79F4897E9E06044EDA4E233F4B
            30430E7FB5EDF9A7F7CC317D5AB9140B6AD5DE91F00C42EDC5B7717B2BED4D69
            AED2C09F48579E912A800FA98FB83DEF93BA8F0ABD31AD21F1D18C736E6CFC47
            8F1E6517C07FFAB82080A30D4B04DFFDEE773D34250519D0A190A44ED46C3601
            64D60AE8816C787AAE42B42803F0990468DF9043D3D10A6A4206881E444A4710
            7414411302F20A088BDC02447282D9795EA4F9E18FEFDB6D8CDC734EFAE0CFF0
            0EFC233FB0E1CAF08AF220F9007A3B2FD285391998932133ED50D415789EC7D9
            032EE0E95822DD7679961DA74007E0079861DF8F20E5A52087D7747C04D043D2
            03F4F0E66321025EC0AB4FC7D30BE03FDBB82080671B252240D4E0D2A54B3E49
            A4901E442603B42704A891610832C002325098CADC5984088C69C0E6016B051E
            3B0E5D426032A063016208A21D3011981620187991DFA772B70B60A511C08179
            0997FE4AE3E15765FD5F29E3A4D368D74C24825D19E79D96F288EEE736566F3D
            F806F0528E6BC27800FF6489D4E745127658BD17157F0ED063A65DC4F1575656
            3278F58994F30BE03FDBB82080F7376C5E2DC287F4107AC63CA0871280458F42
            3611E02FA07D104283A41608813500AC7D9D51D89046A54C0452B1C8EFB144A0
            1D88A1C7417D90817620D2B6F61F285D9720DBAA987D84A573D134C89CF4212C
            20A056795E76036AB7A457B8FD0A553E379D74D98127DE7BA5A5BC05BE537FCF
            5E7CA5A53D2F70ECA1D106FD7EA8F313AC25A63F21A0631FC430433D3EA9F720
            8E848E21790780CF9C38BE9CFD05E89F655C10C0071B9608F000BA5A0149A860
            676707523B848900F3146400708BDA5F17F023D7C0809F350247333044603403
            D767600941690D01241070493FE71C73F29C2760F70C1128133B38441370C0CF
            002F08414B7EA57BE61BD53EAD00DEC4E98D8A6F9C7900BFF1E44F05DC761BC7
            017EF37FA8F5787D144573001FD21EEA3D116A7AE3C68D14A087B477F2F5F97C
            4FFB61388FE382009EDF38A0150C0603AFD3E904B4F8F400B39900490E53811E
            EA981E6EA41F43CAD7E8588D8E1953C098059604E8BDBA6559A115845542509A
            1478F62421049C932FE0F7444BB0DB95F3B6AABC32D2DDB5E173273E2FD25D7A
            EA19D02F1CD057D57C2BF545DDE7B590C20C2A3D497748F905404F405FC86726
            003D547C63DB0BE8CD79BAEB8BF13EC605011CCF586A22D0DA07194033A0079D
            4D052C046E4C7F8EE9CE2297107C9D3F603406F81650BD180B11448610402AF4
            BA5244014440AF45C4C213326022C0B61CF3D4927860C98E2F009F1B155F156A
            3D37D4C442DFC3C0A7CF9DD3F60102C042BF6BE6029EC80ED21DEF5940C28348
            E8786A24BD013D5DAFBCA2E2BBEB8BF101C705011CEFB0D7D7380E8D66003361
            6F6F8F09214069DA6010C06CA097862003AC410820073ACE6B809E5ECA6B391E
            9AE34AFC04CA310DB449C066806F4800E794212E58904071B205D07351ED2DF0
            B1A6F758C9AFC4A12704B030FB860064213C2706E490ECB0DF17466B00E08903
            D2B5B5B5947E3FD4FA8C4CA81CA0BF70E89DCCB82080931BA5445CE959A84008
            D00C6EDEBCE92D23040C024D20A00E05D46175DBAC95260ED600300076013C6B
            00CEDA138D40728D3CD35483253FB6F5DBF9CD197D664EA7626CFE242FE7E627
            06D4F472360B325DA69BD46A356B2A00F093C92433806F341AB991F28E4D8FD3
            B900FD098D0B0238BD712442D8D8D880C6806A459FC0E313A07C92A44C124410
            D86682C002AE98CFE7BC26ACE100831D3D33B09D716BFCDCA3F77966BB744204
            7EF003496D809D35016CE318F6495AE764BA00C73C7926692A50D9C1112916DA
            CFE8FBB356AB05353E6B369BD9743ACDE89CF365127E09E0ABDB17E398C70501
            9C8D51BA0FC65CC0B6311908481E488148C0237079861808941EC88180E81972
            A07D8F406A173ACE80C7363E13DB0456BB8DB5CFFD4C9422001BC0F33E7D2F6F
            9B85BE3F07D0894472809CBE2BEBF7FB3981DE021D92BDDD6EE706ECF89C0BC0
            9FCD714100677354EF8B27C0512E31600D72B875EB96371C0E2D39E03808026B
            B34FC0E6350803EBF5F575BB6D06808C3549790B4A023B6F03DC583F7EFC38C7
            36408EFD6540C7FA10B02FDBBF18A7382E08E07C8D65F7EB0039601882300344
            B1EC03A159605DAFD70F00D380DA1D06E0180039D68700FDB06317E30C8D0B02
            7831C6B3DCC7A3BEF6A8E0BD00F9391E170470312EC68778FC7F70FB757403D7
            F4220000000049454E44AE426082280000008000000000010000010020000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000010000
            0001000000010000000100000001000000010000000100000001000000010000
            0001000000010000000100000001000000010000000100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000010000000100000002808080025555550340404004333333054949
            49074040400839393909393939094D4D4D0A4646460B4646460B4646460B4D4D
            4D0A393939094040400840404008555555063333330555555503808080020000
            0002000000010000000100000001000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000100000001808080025555
            550355555506404040084646460B4949490E3C3C3C11494949154545451A4444
            441E444444224545452541414127444444294141412B4141412B4141412B4444
            44294141412747474724464646214444441E3D3D3D1940404014404040103B3B
            3B0D4646460B4040400833333305555555038080800200000001000000010000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000100000002555555032B2B2B06393939094E4E4E0D4343
            43134242421B474747244444442D434343354444443C444444444242424D4343
            43544444445A4545455D44444461424242644444446643434367444444664242
            4264424242604545455D42424259444444534444444B454545434141413B4141
            41334141412B4444442247474719474747123B3B3B0D40404008333333055555
            5503000000020000000100000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000010000
            000255555503555555064040400C474747124242421B43434326424242324444
            44404545454E4343435C44444469444444744343437E444444884444448F4343
            4395444343994443439B4545449E444443A0454544A2454544A2454444A14443
            43A04544449D4343439B43434398434343944242428E434343864444447C4343
            437244444466454545594444444B4343433D45454530474747244545451A3C3C
            3C114D4D4D0A5555550655555503000000010000000100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000001555555032B2B2B064646
            460B474747124646461D4646462C4444443C4141414E4343435F444444704343
            43814444448E4545449A444443A3444443AB444443B2444443B7454442BC4544
            42BE454442C0464645C0464645C0454544C1454544C2454544C2454544C14545
            42C1464543C0464543C0444443BE444443BD444443BB444443B6454544B14544
            44A9444444A2434343984343438C4343437E4444446D4343435C4444444B4242
            423A444444294242421B40404010555555093333330580808002000000010000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000155555503494949074444440F4545451A4444
            44294545453B4444444F444444664242427B4343438D4444439C444443A84444
            43B2454442BB454544C0464543C3464643C6484644C8484644C9474743CA4846
            43CB494744CB494744CB4A4843CB494844CC494844CC494844CC494843CC4947
            44CC494744CB494744CB474543CB474543CB464643CA474644C9464543C74646
            45C4454442C2444443BE454544B9454444B1444444A6444444994444448B4444
            4478444444624444444B4646463743434326434343173B3B3B0D555555065555
            5503000000010000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000015555550340404008404040104242421F42424232424242494242
            4261434343794444448E444443A0444443AF464543BA464645C0474644C54846
            44C8484643CA494744CB4A4944CC4F463ED3534336DB574030E35B3E2BEB5D3C
            28EE5E3C27F05F3C25F3603C23F5613B22F7613A21F8613B22F6603C24F55F3C
            25F25E3D27F05C3D29ED5A3D2CE9564031E1524438D94E473FD24A4844CC4948
            43CC484844CC474543CB464543CA454544C6454544C3444443BE444443B74444
            44AC4444449D4444448A444444744343435C444444444343432E4040401C4444
            440F494949075555550300000001000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000015555
            5503404040084B4B4B114848482043434335434343504444446C434343864444
            439C454544AC464543B9474644C1474643C6484643CA494744CB50453BD55641
            30E35D3C28EF613B23F664391EFE673A1DFF673A1EFF693C1EFF6A3D1FFF6A3E
            1EFF6B3E1EFF6C3F1FFF6C401FFF6D411FFF6E411FFF6D401FFF6C401FFF6C3F
            1FFF6B3E1EFF6A3E1EFF6A3D1FFF693C1EFF673A1EFF663A1DFF64391FFC603C
            23F55B3D2AEC554133DF4D463FD2494843CC484644CC464643CB464645C84444
            43C5454544BF444343B6444444AA4343439843434381444444664444444B4444
            44314646461D4040401049494907555555030000000100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000155555503494949074040
            40104040402046464637444444524343436F4343438C444443A3454544B44545
            44BF464643C6494744C94D453FD0554132E05C3C28EE623920FA663A1DFF683B
            1EFF6A3E1EFF6D401FFF6F4220FF714420FF734620FF754821FF7C4C23FF804F
            24FF855125FF885326FF8B5627FF8F5828FF915929FF8E5728FF8B5527FF8753
            26FF835125FF804F24FF794B22FF744721FF724520FF704420FF6E4120FF6C40
            1FFF6A3D1FFF673B1EFF65391DFF613B21F75A3D2BEA524235DD4A4743CF4846
            44CC464543CB464645C8454544C4444443BD444444B14343439F444444874343
            436A4242424D424242324646461D4949490E5555550680808002000000010000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000002333333053B3B3B0D4242421B4141
            413342424251444444714444448E454544A5454442B7464543C2484644C84946
            42CD534133DF5E3B26F265381DFF673B1EFF6A3E1FFF6D411FFF704421FF7447
            21FF7E4D23FF8D5728FF975D2AFFA0632DFFA96930FFB26E31FFB57132FFB673
            33FFB77433FFB87433FFB87633FFB97634FFBA7733FFB97633FFB87533FFB874
            33FFB77433FFB67233FFB57132FFAF6C31FFA6682FFF9E612CFF955C2AFF8A55
            28FF7A4B22FF734620FF704320FF6C401FFF693D1FFF673B1EFF63381FFC5B3C
            2AED524338DA494744CD484644CC454544C9444443C6454544BF444444B34343
            43A1444444884343436B4545454A4444442D404040184646460B404040040000
            0001000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000015555550339393909464646164343432A444444474444
            44694343438A454544A5464543B8464543C2484844C8514339D85B3C2AED6338
            1FFD673B1EFF6A3E1FFF6E4120FF734621FF7C4D23FF8D5728FF9E612CFFAD6B
            31FFB57233FFB97634FFBB7934FFBD7B34FFBF7E35FFC18135FFC38335FFC484
            36FFC58636FFC68636FFC78836FFC88836FFC88936FFC78836FFC68736FFC686
            36FFC58535FFC48436FFC38335FFC18035FFBF7E34FFBC7A34FFBA7834FFB875
            33FFB57132FFA8692FFF995F2BFF895427FF794A22FF724520FF6D401FFF693C
            1FFF663A1EFF623921F9583E2EE84D443ED4484644CC454544CA454544C64545
            44C0434343B4434343A044444484444444624343434143434326434343134040
            4008555555030000000100000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000001333333054949490E3E3E3E214444443C4444445E434343814545
            449E444443B4464543C2494744C8524237DB5E3925F465381DFF693C1FFF6D41
            20FF724521FF7C4C23FF955B2BFFAA6A31FFB57233FFB97634FFBC7A34FFC07F
            36FFC48436FFC78836FFCA8A37FFCC8E37FFCE9137FFD19338FFD39638FFD498
            39FFD59839FFD59939FFD69A39FFD79B3AFFD79B39FFD79B3AFFD69A39FFD599
            39FFD49839FFD39739FFD29539FFD09338FFCE8F38FFCB8D38FFC98A37FFC687
            37FFC38335FFBF7E35FFBC7934FFB87533FFB47133FFA5662FFF8E5728FF784A
            22FF704421FF6C3F1FFF683B1EFF64371EFF5A3C29EF4E433CD6484644CC4545
            44CA444443C6454444BF444444B0444444994343437A43434358424242364646
            461D4040400C4040400400000001000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000018080
            800240404008404040144646462C4141414E4242427444434395444443AE4545
            44BF474543C7524035DC5F3923F565391EFF693D1FFF6E4221FF774923FF8E57
            29FFA5662FFFB57133FFBA7834FFBF7E35FFC38336FFC78837FFCB8C38FFCF91
            39FFD39639FFD69A3AFFD89D3AFFDBA03BFFDDA23BFFDFA43BFFE1A73CFFE2A8
            3CFFE2A93DFFE3AA3CFFE4AB3CFFE4AB3DFFE4AC3DFFE4AB3DFFE3AA3CFFE3A9
            3CFFE2A93DFFE2A83CFFE0A73BFFDEA43BFFDCA23BFFDA9F3AFFD89D3AFFD59A
            3AFFD29539FFCE9038FFCA8B38FFC68637FFC28137FFBD7C36FFB87634FFB26E
            32FF9F622EFF875427FF744621FF6D4120FF683B1FFF64381EFF5C3B28F04F43
            3BD8474744CC454444C9444443C5444444BB444444AA4444448F4242426C4444
            4447414141274B4B4B1155555506000000020000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000001555555034646
            460B4242421B464646374545455D44444484444443A4464545BA474744C54F41
            38D85F3823F665391EFF6A3D20FF6F4221FF7A4B24FF975E2CFFB06E34FFB876
            35FFBD7C36FFC28337FFC88938FFCD903AFFD2953BFFD69A3BFFD99E3BFFDDA3
            3CFFE1A73DFFE3AB3DFFE5AD3DFFE7AF3EFFE8B13EFFEAB33FFFECB53EFFECB6
            3FFFEDB73FFFEDB73FFFEEB740FFEEB83FFFEEB93FFFEEB83FFFEEB740FFEDB6
            3FFFEDB73FFFECB63FFFECB53EFFEAB33EFFE8B03EFFE6AF3EFFE5AC3DFFE3A9
            3DFFE0A73DFFDCA13CFFD99D3CFFD5993BFFD1943AFFCC8E39FFC68738FFC181
            37FFBC7B36FFB77435FFAB6B32FF8E5729FF744822FF6E4120FF683C1FFF6437
            1EFF5B3A28F04B443FD3474644CC444443C9454444C3434343B64343439F4343
            437D454545554242423240404018393939095555550300000001000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000001333333054949490E4242
            4223454545434343436B45454591444443AE464645C04B4540CE5A3B29EE6338
            1EFF693C1FFF6F4221FF7C4D25FF995F2DFFB26F34FFBA7836FFC08037FFC687
            39FFCC8E3AFFD1953BFFD69B3DFFDBA13EFFDFA73EFFE3AA3EFFE6AE3FFFE8B1
            40FFEBB541FFEDB741FFEEB941FFF0BB41FFF1BC41FFF2BD42FFF3BE41FFF4BF
            42FFF4C042FFF4BF42FFF4C042FFF4C042FFF5C141FFF4C042FFF4C042FFF4BF
            42FFF4C042FFF4BF42FFF3BE41FFF2BD42FFF0BB41FFEFBA41FFEEB840FFEDB7
            41FFEBB340FFE8B03FFFE5AD3FFFE2A93FFFDFA53EFFDAA03DFFD5993CFFD093
            3BFFCA8C3AFFC48539FFBE7E37FFB87636FFAD6C33FF91592BFF754824FF6D40
            20FF673B1FFF62371FFD553E2FE6494543CE464645CA454544C7434343BD4444
            44AA4444448B424242644343433D4242421F4040400C55555503000000010000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000001555555064B4B4B11444444294545
            454E444444784443439D444443B6474743C5543D31E1613720FC673B1FFF6C40
            20FF774924FF9A5E2EFFB36F36FFBA7837FFC18039FFC8893AFFCF923CFFD499
            3EFFD99F3EFFDEA63FFFE3AA40FFE7AF41FFEAB442FFECB642FFEEB942FFF0BB
            42FFF2BE44FFF3BF43FFF4C044FFF5C143FFF6C244FFF7C244FFF7C445FFF7C4
            44FFF7C444FFF8C544FFF8C544FFF8C544FFF8C544FFF8C544FFF8C544FFF8C4
            44FFF7C444FFF7C444FFF7C345FFF6C344FFF5C144FFF5C143FFF4C044FFF3BF
            43FFF2BD43FFF0BA43FFEEB843FFECB642FFE9B342FFE6AE41FFE2A940FFDDA4
            3FFFD89D3EFFD3973DFFCD8F3CFFC6873AFFBF7F38FFB87737FFAE6C34FF9058
            2BFF724522FF6A3E20FF65391EFF5F3822F74F4038DB474644CC444443C94343
            43C2434343B2444444974444447144444447474747244949490E404040040000
            0001000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000249494907404040144343432E444444564343
            4382454544A5444443BD4C423DCF5D3724F464371FFF6A3E20FF714522FF8C57
            2BFFAE6C35FFBA7838FFC1813AFFC88A3CFFCF923EFFD59B3FFFDCA340FFE1A9
            41FFE5AE42FFE9B344FFECB644FFEFB944FFF1BD45FFF2BE45FFF4C045FFF5C2
            45FFF6C346FFF7C346FFF7C447FFF7C546FFF8C546FFF8C546FFF9C646FFF9C6
            47FFF9C647FFF9C647FFF9C647FFF9C647FFF9C647FFF9C647FFF9C647FFF9C6
            47FFF9C647FFF9C647FFF9C646FFF8C546FFF8C546FFF7C446FFF7C446FFF7C3
            46FFF6C246FFF4C146FFF3BF45FFF2BE45FFF0BC45FFEEB944FFEBB544FFE8B2
            43FFE4AC43FFDFA742FFDAA140FFD4993FFFCD903DFFC6873BFFBF7F39FFB775
            37FFA76733FF825028FF6F4222FF683C20FF63371EFF583A2AED484642CF4545
            45CA444343C5444444B8434343A04343437A4545454E46464628404040103333
            3305000000010000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000024949490746464616424242324343435C444444884444
            43AB454544C0513F35DB61361FFC663A1FFF6D4121FF7F4E27FFA46633FFB675
            38FFBE7F3AFFC78A3DFFCF933FFFD59B41FFDCA342FFE1AA44FFE6B145FFEAB5
            45FFEDB846FFF0BC47FFF2BD47FFF3C047FFF4C148FFF5C248FFF6C348FFF7C4
            48FFF7C548FFF7C548FFF8C648FFF8C648FFF8C548FFF8C648FFF8C649FFF9C6
            49FFF9C649FFF9C649FFF9C649FFF9C649FFF9C649FFF9C649FFF9C649FFF9C6
            49FFF9C649FFF9C649FFF8C649FFF8C648FFF8C648FFF8C648FFF8C648FFF7C5
            48FFF7C449FFF7C348FFF6C348FFF5C348FFF4C148FFF3BF47FFF1BD47FFEFBA
            47FFECB746FFE9B446FFE5AF44FFE0A844FFDAA142FFD39940FFCD903FFFC486
            3DFFBC7B3AFFB47238FF9B5F2FFF774A24FF6A3F20FF65381EFF5D3823F64C42
            3CD5464545CB454544C7444444BC444444A544444480444444534646462C4747
            47122B2B2B060000000100000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000002494949074343431742424236444444614343438D444443AE4744
            42C4563A2BE963371EFF683B20FF704323FF925A2DFFB37037FFBB7B3BFFC485
            3DFFCC903FFFD49A42FFDBA345FFE1AA45FFE6B047FFEAB548FFEEB949FFF0BD
            49FFF2BE4AFFF3C04AFFF4C14AFFF5C34AFFF6C34AFFF6C44AFFF7C44BFFF7C4
            4BFFF7C54BFFF7C54BFFF7C54BFFF7C54AFFF7C54AFFF7C64AFFF7C64AFFF7C6
            4AFFF7C64AFFF7C64AFFF7C64AFFF7C64AFFF7C64AFFF7C64AFFF7C64AFFF7C6
            4AFFF7C64AFFF7C64AFFF7C64AFFF7C54AFFF7C54AFFF7C54AFFF7C54BFFF7C5
            4BFFF7C54BFFF7C44BFFF6C44BFFF6C44AFFF6C34AFFF5C34AFFF4C24AFFF3BF
            49FFF1BD49FFEFBC49FFECB848FFE9B448FFE4AE47FFDFA845FFD9A043FFD297
            42FFCA8D3FFFC1823CFFB9783AFFAE6D36FF86532AFF6D4122FF663A1FFF6136
            1EFD523E34E0464645CB454544C8434343BE444444A943434385434343584141
            412F434343132B2B2B0600000001000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00014949490743434317424242364343436343434390454544B14A433ECA5B36
            22F463381FFF6A3F21FF784926FFA26432FFB7753AFFC0813DFFC88C40FFD196
            42FFD9A045FFDFA947FFE5B048FFE9B54AFFECB94AFFEFBC4BFFF1BE4BFFF2C0
            4BFFF3C14CFFF4C24CFFF5C34CFFF5C34CFFF5C34CFFF6C44CFFF6C44CFFF6C4
            4CFFF6C44CFFF6C44DFFF6C44DFFF6C54DFFF6C54DFFF6C54DFFF6C54DFFF6C5
            4DFFF6C54DFFF6C54DFFF6C54DFFF6C54DFFF6C54DFFF6C54DFFF6C54DFFF6C5
            4DFFF6C54DFFF6C54DFFF6C54DFFF6C54DFFF6C54DFFF6C44DFFF6C44DFFF6C4
            4DFFF6C44CFFF6C44CFFF6C44CFFF6C44CFFF5C34CFFF5C44CFFF4C34DFFF4C2
            4CFFF3C14CFFF2C04CFFF1BE4BFFEEBC4BFFECB84AFFE8B349FFE4AD48FFDEA6
            46FFD79E45FFCF9442FFC6893FFFBE7E3CFFB47239FF965D2FFF714524FF683C
            20FF62361EFF57392AEB474544CC444443C9444444C0434343AC434343894444
            445A4141412F4747471233333305000000010000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000012B2B
            2B0649494915434343354444446243434391444443B24C423BCE5E3620F96438
            1FFF6C4021FF83512AFFAC6B37FFBA7A3BFFC4853FFFCD9243FFD59C45FFDCA5
            47FFE3AD49FFE8B44BFFECB84CFFEEBB4CFFF0BD4EFFF1BF4EFFF2C04EFFF3C1
            4EFFF4C24EFFF4C24EFFF4C24FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C3
            4FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C3
            4FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C3
            4FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C3
            4FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C34FFFF4C24FFFF4C3
            4EFFF4C24EFFF3C14EFFF2C04DFFF1BE4EFFF0BD4DFFEDBA4DFFEBB64CFFE6B2
            4BFFE1AB49FFDBA347FFD39944FFCA8F42FFC0823EFFB7753AFFA46634FF794B
            26FF693D21FF63371EFF5A3825F1474543CD444443C9434343C1444444AD4444
            4488424242594444442D4B4B4B11333333050000000100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000001333333054343
            4313424242324343435F4444448F444443B24D4038D35F351FFB65391FFF6C41
            22FF90592FFFB37239FFBC7D3DFFC68A42FFD09544FFD9A148FFDFAA4BFFE5B1
            4CFFEAB54DFFECBA4EFFEFBC4FFFF0BE50FFF1BF50FFF2C050FFF2C050FFF2C1
            50FFF3C150FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C2
            50FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C2
            50FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C2
            50FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C2
            50FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C250FFF3C2
            50FFF3C150FFF2C150FFF2C04FFFF2C050FFF1C050FFF0BE50FFEEBC4FFFECB9
            4EFFE8B44DFFE4AF4CFFDEA749FFD79F48FFCD9344FFC48640FFBA793CFFAD6D
            37FF824F2AFF6A3F21FF63381FFF5B3723F5484441D0444443C9434343C14343
            43AC43434386414141564141412B404040104040400400000001000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000001404040043C3C3C114343
            432E4343435B4343438C454544B04F3E35D55F351EFD65391FFF6E4223FF975C
            31FFB5733AFFBF8140FFC98E43FFD39A47FFDBA44BFFE2AD4DFFE7B34FFFEAB8
            50FFEDBB51FFEFBD51FFF0BE52FFF0BF51FFF1C052FFF1C052FFF1C052FFF2C0
            52FFF2C052FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C1
            52FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C1
            52FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C1
            52FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C1
            52FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C152FFF2C1
            52FFF2C052FFF2C052FFF1C052FFF1C052FFF1C052FFF0BF51FFF0BE52FFEEBD
            51FFECBA50FFEAB64FFFE6B14EFFE0AB4CFFD9A24AFFD09646FFC68A43FFBC7D
            3EFFB16F3AFF88532CFF6B3F22FF63381FFF5C3621F84A433FD3444343C94343
            43C1434343AB4242428344444452414141273737370E55555503000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000555555033B3B3B0D414141274343
            435442424287444443AE4E3D35D560341DFE65391FFF6F4324FF9C6033FFB575
            3CFFC18341FFCC9245FFD59D49FFDDA74DFFE3AF4FFFE8B451FFEBB852FFEDBB
            53FFEEBD53FFEFBE53FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF
            54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF
            54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF
            54FFF0BF54FFEABB52FFCAA147FFE8B952FFF0BF54FFF0BF54FFF0BF54FFF0BF
            54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF
            54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF
            54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFF0BF54FFEFBD
            53FFEEBC52FFECBA52FFEAB851FFE7B351FFE2AD4FFFDBA54CFFD39A48FFC98E
            45FFBE8040FFB3713AFF8C562EFF6C4022FF63381FFF5C341FFA4A433ED34343
            43C9444444C0434343A84343437E4444444B464646214D4D4D0A808080020000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000808080023333330A404040204545454A4343
            437E454444A94C3F38D05E341EFD643820FF704425FF9F6234FFB6763DFFC284
            43FFCD9348FFD7A04CFFDEA94FFFE4B051FFE8B553FFEBB954FFECBB54FFEDBC
            55FFEEBD55FFEEBE55FFEEBE55FFEEBF55FFEFBE55FFEFBE55FFEFBE55FFEFBE
            55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFEFBE
            55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFB59040FF3B2F15FF151007FF0907
            03FF020201FF000000FF000000FF000000FF010101FF070603FF110E06FF1F19
            0BFF322712FF53421DFF9D7D38FFE9BA53FFEFBE55FFEFBE55FFEFBE55FFEFBE
            55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFEFBE
            55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFEEBE55FFEEBE55FFEEBE
            55FFEEBD55FFEDBC55FFECBA54FFEAB854FFE7B453FFE2AF51FFDCA64EFFD49C
            4BFFCA8F46FFBE8141FFB3723CFF915930FF6B3F22FF63371FFF5B3420F84943
            40D1444444C8434343BE434343A344444474434343414545451A494949070000
            0001000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000001494949073D3D3D194141413F434343734242
            42A24B3F3BCA5E341EFC633820FF6F4225FFA06235FFB7763EFFC28644FFCD94
            4AFFD7A14DFFDFAB51FFE4B154FFE8B655FFEAB956FFECBB56FFECBB56FFEDBC
            57FFEDBD57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC
            57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC
            57FFEDBC57FFEDBC57FF9F7E3AFF100D06FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF010000FF100D06FF392D15FF79602CFFD0A5
            4DFFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC
            57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC57FFEDBC
            57FFEDBD57FFEDBC57FFECBB56FFEBBA56FFEAB855FFE7B455FFE3AF52FFDDA9
            51FFD59D4CFFCA9048FFBF8143FFB4733DFF915830FF6A3E23FF62361FFF5A35
            23F5474442CE444444C8434343BA4444449A4545456842424236404040143333
            3305000000010000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000140404004474747124141413344444466434343984941
            3EC35C3420FA63371FFF6D4023FF9C5F35FFB6763FFFC28645FFCE944BFFD7A1
            4FFFDFAB53FFE4B256FFE8B656FFE9B958FFEABA58FFEBBB58FFECBB58FFECBC
            58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC
            58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC
            58FFECBC58FF392D15FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF060502FF241D0EFF5A4822FFA98740FFEABA58FFECBC58FFECBC58FFECBC
            58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC
            58FFECBC58FFECBB58FFEBBB59FFEBBA58FFEABA58FFE9B857FFE7B457FFE3B0
            54FFDDA952FFD59E4EFFCB914AFFC08244FFB3733DFF8B552FFF693D22FF6135
            1EFF583725F2464443CC434343C6444444B4434343904343435B4141412B4949
            490E555555030000000100000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000808080024040400C41414127434343574343438C47423FB95A34
            21F761361EFF6A3F22FF975D32FFB5743EFFC28546FFCE954DFFD7A151FFDFAA
            54FFE4B257FFE7B559FFE8B759FFE9B95AFFEAB959FFEABA59FFEABA59FFEABA
            5AFFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA
            5AFFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA
            5AFF43351AFF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF010101FF141008FF4B3B1DFFBD96
            49FFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA5AFFEABA
            5AFFEABA5AFFEABA5AFFEABA59FFEABA59FFEAB959FFE9B95AFFE8B759FFE6B5
            58FFE2B057FFDDA954FFD59F4FFFCB914BFFBE8144FFB2703DFF86512DFF673B
            22FF60341DFF553728EE434343CA444444C3444444AD424242834343434C4040
            4020393939090000000200000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000001494949074242421B434343454444447C444444AA563625EE6035
            1EFF683C22FF915931FFB3733FFFC08446FFCD944DFFD7A152FFDEAB55FFE3B0
            58FFE6B55AFFE7B75AFFE8B75BFFE8B85BFFE9B95BFFE9B95BFFE9B95BFFE9B9
            5BFFE9B95BFFE9B95BFFE9B95BFFE9B95BFFE9B95BFFE9B95BFFE9B95BFFE9B9
            5BFFE9B95BFFE9B95BFFE9B95BFFE9B95BFFE9B95BFFE9B95BFFE9B95BFF7F64
            31FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF0D0B05FF4E3E1FFFC1994CFFE9B95BFFE9B95BFFE9B95BFFE9B95BFFE9B9
            5BFFE9B95BFFE9B95BFFE9B95BFFE9B95BFFE9B85BFFE8B85BFFE8B75AFFE7B6
            5AFFE5B459FFE2AF58FFDCA855FFD59E52FFC9904BFFBD7F44FFAF6E3CFF804E
            2BFF653920FF5F331DFF513B31E3434343C9434343BF434343A3434343724141
            413B464646163333330500000001000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0001404040043C3C3C1141414133454545684343439C523A2FDC5F331DFF653A
            20FF86512DFFB2703EFFBE8246FFCB914DFFD5A153FFDDAA57FFE2B05AFFE5B4
            5AFFE6B65CFFE7B65CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B7
            5CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B7
            5CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFB48E47FF0101
            01FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF0F0C06FF564522FFD7AB56FFE7B75CFFE7B7
            5CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B75CFFE7B6
            5CFFE6B55BFFE4B25BFFE1AF59FFDBA857FFD39C51FFC88E4BFFBB7C44FFAC6B
            3CFF774628FF633720FF5E311EFE4B403AD6444444C7434343B8434343944141
            415E4747472B4E4E4E0D55555503000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00024D4D4D0A40404024444444534444448B4C3F38C55E311DFE633720FF7747
            29FFAD6C3CFFBC7F45FFC9904EFFD49E54FFDCA958FFE1AF5BFFE4B35CFFE5B4
            5CFFE6B55DFFE6B55DFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFE6B6
            5DFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFE6B6
            5DFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFDDAF59FF0A0804FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF010101FF342915FFB892
            4AFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFE6B65DFFE6B5
            5DFFE5B65DFFE4B45DFFE3B25CFFE0AE5BFFDAA657FFD19B52FFC68B4BFFB87A
            43FFA26438FF6C4024FF61351EFF5A3320F9464241CE444444C4434343AE4343
            4381424242494646461D40404008000000010000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000013333
            3305464646164242423E4343437646413FAE5A331FF860351EFF6C4024FFA364
            39FFB87B44FFC78E4EFFD29C54FFDAA759FFDFAE5CFFE2B15EFFE4B35EFFE4B3
            5EFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B4
            5FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B4
            5FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFF624D29FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF1B150BFF8C6F3BFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B4
            5FFFE4B45FFFE4B35EFFE3B35EFFE2B05DFFDEAC5BFFD8A458FFCF9852FFC389
            4BFFB57441FF955A33FF673C22FF5F331DFF563627EF434343C9434343BE4343
            439F4343436B4343433547474712404040040000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000024040
            400C4343432A4444445E44444496553628E65E321CFF663A21FF955A33FFB575
            42FFC3894BFFD09A54FFD8A559FFDDAC5DFFE1B05EFFE2B25FFFE3B25FFFE3B2
            5FFFE3B35FFFE3B35FFFE3B35FFFE3B35FFFE3B35FFFE3B35FFFE3B35FFFE3B3
            5FFFE3B35FFFE3B35FFFE3B35FFFE3B35FFFE3B35FFFE3B35FFFE3B35FFFE3B3
            5FFFE3B35FFFE3B35FFFE3B35FFFE3B35FFFE3B35FFF0D0A06FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF261E10FFD0A457FFE3B35FFFE3B35FFFE3B35FFFE3B3
            5FFFE3B25FFFE3B25FFFE2B360FFE2B15FFFE0B05EFFDCAA5CFFD6A258FFCD95
            52FFBF8349FFB1703FFF834F2EFF633720FF5D311DFF4E3B33DE444444C74444
            44B54343438C4444445344444422393939090000000100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000012B2B2B064040
            4018454545434343437E4B3D37C15D301CFF62361FFF814D2CFFB16F40FFBF83
            4AFFCC9553FFD6A35AFFDCAB5DFFDFAE5FFFE1B060FFE1B160FFE2B160FFE2B1
            60FFE2B160FFE2B160FFE2B160FFE2B160FFE2B160FFE2B160FFE2B160FFE2B1
            60FFE2B160FFE2B160FFE2B160FFE2B160FFE2B160FFE2B160FFE2B160FFE2B1
            60FFE2B160FFE2B160FFE2B160FFE2B160FFA17E44FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF040302FF866939FFE2B160FFE2B160FFE2B1
            60FFE2B160FFE2B160FFE1B260FFE1B160FFE0B05FFFDEAE5EFFDBA95DFFD49F
            58FFC89051FFBB7E47FFAA6A3CFF714225FF60351EFF5A321FFA464241CD4343
            43C1444444A64343437343434339434343134040400400000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000024040400C4141
            412B424242614442429B593321F45F331DFF6C3F24FFA7663BFFBA7D48FFC890
            52FFD39E59FFDAA85DFFDDAC60FFDFAE61FFDFB061FFE0B062FFE0B062FFE0B0
            62FFE0B062FFE0B062FFE0B062FFE0B062FFE0B062FFE0B062FFE0B062FFE0B0
            62FFE0B062FFE0B062FFE0B062FFE0B062FFE0B062FFE0B062FFE0B062FFE0B0
            62FFE0B062FFE0B062FFE0B062FFE0B062FF68522EFF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF715932FFE0B062FFE0B0
            62FFE0B062FFE0B062FFE0B062FFE0B062FFDFB061FFDFAE60FFDDAC5FFFD9A6
            5DFFD09B57FFC48B4FFFB67745FF985C35FF653921FF5E321DFF53372AE94444
            44C8434343B74444448F45454555444444225555550900000001000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000133333305404040184444
            44444343437E50382DD35D301DFF633821FF905632FFB47544FFC48A50FFCF9B
            58FFD7A55DFFDCAB60FFDDAD62FFDEAE61FFDEAF62FFDEAF62FFDEAF62FFDEAF
            62FFDEAF62FFDEAF62FFDEAF62FFDEAF62FFDEAF62FFDEAF62FFDEAF62FFDEAF
            62FFDEAF62FFDEAF62FFDEAF62FFDEAF62FFDEAF62FFDEAF62FFDEAF62FFDEAF
            62FFDEAF62FFDEAF62FFDEAF62FFDEAF62FF564426FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF010100FFA6844AFFDEAF
            62FFDEAF62FFDEAF62FFDEAF62FFDEAF62FFDEAF62FFDEAE61FFDDAD61FFDBAA
            60FFD5A35CFFCD9656FFC0844DFFB06F41FF7D4B2CFF61351FFF5C301CFE493F
            3BD4434343C2444444A643434372444444384747471240404004000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000024646460B444444294242
            426047403CA45B311DFC5F331DFF754429FFAE6C3FFFBD824CFFCC9656FFD5A2
            5EFFD9A860FFDCAC62FFDDAD62FFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAD
            63FFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAD
            63FFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAD
            63FFDDAD63FFDDAD63FFDDAD63FFDDAD63FF67512EFF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF080604FFCFA3
            5DFFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAD63FFDDAC62FFDBAB
            62FFD9A760FFD39F5BFFC89154FFB97B48FFA4643BFF683C23FF5E311DFF5833
            23F4444444C8434343B74444448E444444534646462140404008000000010000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000040404004494949154545453F4444
            447C533527DE5C311CFF633821FF9E5F38FFB77948FFC68E53FFD19E5CFFD7A6
            60FFDAAA62FFDBAB63FFDBAB64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAC
            64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAC
            64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAC
            64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFD5A862FF030301FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF4D3C
            23FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAC64FFDBAB64FFDBAA
            63FFD9A862FFD6A460FFCF995AFFC28850FFB27244FF8B5231FF61341FFF5C30
            1CFF4C3C35DB434343C1444444A44343436F4343433540404010555555030000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000014040400842424223434343574841
            3D9E5C301CFD5F331DFF7E492BFFAF6E42FFBF854FFFCD975AFFD5A361FFD8A7
            63FFD9A963FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA
            64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA
            64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA
            64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FF594629FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0F0C
            07FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAAA64FFDAA9
            63FFD9A863FFD7A662FFD3A05FFFC99357FFBB7F4CFFA9683EFF6C3D24FF5E31
            1DFF573322F4444444C7444444B4444444884444444B4242421B555555060000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000555555034444440F45454534424242705336
            29D75C311CFF623721FF9E5F39FFB87B4AFFC79057FFD19E5FFFD6A563FFD8A8
            64FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A8
            64FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A8
            64FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A8
            64FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FF594429FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FFBD9357FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A864FFD9A8
            64FFD8A864FFD7A763FFD5A461FFCF9A5DFFC38A53FFB37446FF8B5231FF6035
            1EFF5C301CFF4B3D37D8444444BF4444449D434343634141412B4646460B0000
            0001000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000002B2B2B064545451A42424249453F3D905A30
            1CFC5E321DFF7A462AFFAE6D42FFC08752FFCD985CFFD3A162FFD6A564FFD7A6
            64FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A6
            64FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A6
            64FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A6
            64FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FF6A52
            31FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF664E2FFFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A664FFD7A6
            64FFD7A664FFD7A765FFD6A463FFD29F61FFCA945AFFBB804EFFA8663DFF693B
            23FF5C311CFF563323F2434343C5444444AD4242427B4646463E404040144040
            4004000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000014D4D4D0A464646284343435F52362ACE5C30
            1CFF60351FFF9A5C38FFB6794AFFC79059FFD09C60FFD4A364FFD5A564FFD6A5
            65FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A5
            65FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A5
            65FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A5
            65FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A5
            65FF876840FF020101FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF624C2FFFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A565FFD6A5
            65FFD6A565FFD5A565FFD5A464FFD3A163FFCE9A5EFFC28B55FFB17346FF8750
            2FFF5E331DFF5B2F1BFF4A3E39D5444444B94343439044444453484848204949
            4907000000010000000000000000000000000000000000000000000000000000
            00000000000000000000555555033C3C3C1144444438444241795A301DF85C31
            1CFF754227FFAC6C41FFBE8451FFCB975EFFD1A063FFD3A265FFD4A365FFD4A3
            65FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A3
            65FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A3
            65FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A3
            65FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A3
            65FFD4A365FF9C784BFF010000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF6A5132FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A365FFD4A3
            65FFD4A365FFD4A365FFD4A265FFD3A264FFD09E62FFC8935BFFBA7E4DFFA564
            3CFF643821FF5C301CFF543527ED434343C1444444A24343436A4343432E4040
            400C000000020000000000000000000000000000000000000000000000000000
            000000000000000000003333330547474719424242494E3A31AE5B2F1BFF5E32
            1DFF915433FFB47649FFC48E59FFCE9B61FFD1A165FFD3A265FFD3A265FFD3A2
            65FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A2
            65FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A2
            65FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A2
            65FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A2
            65FFD3A265FFD3A265FF4F3D26FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF735837FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A2
            65FFD3A265FFD3A265FFD3A265FFD2A166FFD19F64FFCC9960FFC08755FFAF70
            45FF7E482BFF5D301DFF5A301CFD464241C9444444B04343437E4646463E4343
            4313404040040000000000000000000000000000000000000000000000000000
            0000000000000000000139393909454545254343435B563324DE5C301BFF6637
            21FFA7643EFFBB8051FFC8945EFFCF9C64FFD19F65FFD1A065FFD1A065FFD1A0
            65FFD1A065FFD1A065FFD1A065FFD1A065FFD1A065FFD1A065FFD1A065FFD1A0
            65FFD1A065FFD1A065FFD1A065FFD1A065FFD1A065FF977449FF322619FF1B15
            0DFF0F0C07FF070503FF070503FF201910FF503D27FF977449FFD1A065FFD1A0
            65FFD1A065FFD1A065FFD1A065FFD1A065FFD1A065FFD1A065FFD1A065FFD1A0
            65FFD1A065FFD1A065FFD1A065FF060503FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF927046FFD1A065FFD1A065FFD1A065FFD1A065FFD1A065FFD1A065FFD1A0
            65FFD1A065FFD1A065FFD1A065FFD1A065FFD19F65FFCE9B63FFC68F5BFFB67A
            4DFF975936FF5E331DFF5B2F1BFF4E3A31DE444444B94444448E4444444F4949
            491C2B2B2B060000000100000000000000000000000000000000000000000000
            000000000000000000023B3B3B0D4444443146403D785B2F1CFD5C311CFF7E47
            2BFFAE6F45FFC18958FFCB9762FFCF9C65FFCF9E66FFD09E66FFD09E66FFD09E
            66FFD09E66FFD09E66FFD09E66FFD09E66FFD09E66FFD09E66FFD09E66FFD09E
            66FFD09E66FFD09E66FFD09E66FF785B3BFF0F0C08FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF040302FF624A
            30FFD09E66FFD09E66FFD09E66FFD09E66FFD09E66FFD09E66FFD09E66FFD09E
            66FFD09E66FFD09E66FFD09E66FF332719FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0202
            01FFD09E66FFD09E66FFD09E66FFD09E66FFD09E66FFD09E66FFD09E66FFD09E
            66FFD09E66FFD09E66FFD09E66FFD09E66FFCF9E65FFCE9C64FFC9955FFFBD83
            54FFA96840FF6A3A23FF5C301CFF563323F2444444BF4343439C424242604141
            41273333330A0000000100000000000000000000000000000000000000000000
            00000000000040404004434343134545453F51372BB35B2F1BFF5E311DFF9858
            36FFB5794DFFC5905DFFCC9963FFCE9B66FFCE9C65FFCE9C65FFCE9C65FFCE9C
            65FFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCE9C
            65FFCE9C65FFCA9A63FF36291BFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF0E0A07FFB28757FFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCE9C
            65FFCE9C65FFCE9C65FFCE9C65FF57422BFF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1D16
            0EFFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCE9C
            65FFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCE9C65FFCD9C65FFCB9763FFC28B
            5AFFB07148FF834B2DFF5C311CFF5B2F1BFF48413DCC444444A9444444714545
            45344949490E8080800200000000000000000000000000000000000000000000
            0000000000012B2B2B064242421B4545454E573221E45B2F1BFF693921FFA865
            3FFFBB8254FFC89360FFCB9965FFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCD9A
            65FFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCD9A
            65FFC79661FF130E09FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF070604FFB28557FFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCD9A
            65FFCD9A65FFCD9A65FFCD9A65FF533E29FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8061
            3FFFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCD9A
            65FFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCD9A65FFCC9A65FFCB9864FFC591
            5EFFB67A4FFF9D5A38FF5D311DFF5B2F1BFF50392EE2434343B3434343814343
            4341404040144040400400000000000000000000000000000000000000000000
            000000000001393939094545452545413F625B2F1BFD5C301BFF7F462AFFAD6E
            47FFBF885AFFC89563FFCA9865FFCA9865FFCA9965FFCA9965FFCA9965FFCA99
            65FFCA9965FFCA9965FFCA9965FFCA9965FFCA9965FFCA9965FFCA9965FFCA99
            65FF1F1810FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF0B0806FFC89765FFCA9965FFCA9965FFCA9965FFCA99
            65FFCA9965FFCA9965FFCA9965FF4F3B27FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF271D13FFCA99
            65FFCA9965FFCA9965FFCA9965FFCA9965FFCA9965FFCA9965FFCA9965FFCA99
            65FFCA9965FFCA9965FFCA9965FFCA9965FFCA9965FFCA9865FFCA9764FFC793
            62FFBC8255FFA86540FF6B3A22FF5B2F1BFF563324F1434343BA4242428E4545
            454E4242421B2B2B2B0600000001000000000000000000000000000000000000
            0000000000024040400C4444442D4F3A30925B2F1BFF5C301CFF915232FFB377
            4DFFC28D5EFFC89463FFC99665FFC99665FFC99665FFC99665FFC99665FFC996
            65FFC99665FFC99665FFC99665FFC99665FFC99665FFC99665FFC99665FF3B2C
            1EFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF533E2AFFC99665FFC99665FFC99665FFC996
            65FFC99665FFC99665FFC99665FF4B3826FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF1D160EFFB88A5DFFC996
            65FFC99665FFC99665FFC99665FFC99665FFC99665FFC99665FFC99665FFC996
            65FFC99665FFC99665FFC99665FFC99665FFC99665FFC99665FFC89564FFC794
            63FFBF885BFFAD6D47FF7D4428FF5C301BFF5A301CFD444242C0434343984444
            445A424242234040400800000001000000000000000000000000000000000000
            0000808080024949490E43434335543527BE5B2F1BFF5F321DFFA25E3AFFB87D
            53FFC38E60FFC69364FFC79464FFC79464FFC79464FFC79464FFC79464FFC794
            64FFC79464FFC79464FFC79464FFC79464FFC79464FFC79464FF936D4AFF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF030201FFC39062FFC79464FFC79464FFC794
            64FFC79464FFC79464FFC79464FF483624FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF030201FF17110CFF715438FFC79464FFC79464FFC794
            64FFC79464FFC79464FFC79464FFC79464FFC79464FFC79464FFC79464FFC794
            64FFC79464FFC79464FFC79464FFC79464FFC79464FFC79464FFC79464FFC692
            63FFC18C5EFFB2754EFF8F4F31FF5C301CFF5B2F1BFF4A3D37D0434343A14444
            44664141412B4646460B00000002000000000000000000000000000000000000
            0000555555033C3C3C114343433D583120E35B2F1BFF6D3A22FFA76541FFBB82
            58FFC38F61FFC49063FFC59163FFC59163FFC59163FFC59163FFC59163FFC591
            63FFC59163FFC59163FFC59163FFC59163FFC59163FFC59163FF130E0AFF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF876344FFC59163FFC59163FFC591
            63FFC59163FFC59163FFC59163FF493524FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF130E0AFF3426
            1AFF634932FFA17650FFC59163FFC59163FFC59163FFC59163FFC59163FFC591
            63FFC59163FFC59163FFC59163FFC59163FFC59163FFC59163FFC59163FFC591
            63FFC59163FFC59163FFC59163FFC59163FFC59163FFC59163FFC59162FFC490
            63FFC28C60FFB67C53FF9F5C3AFF5D321CFF5B2F1BFF51382DE2444444A84444
            4471414141334E4E4E0D80808002000000000000000000000000000000000000
            0000404040043A3A3A1647403C4E5B2F1BFD5B2F1BFF7E4428FFAC6C46FFBD85
            5BFFC28D61FFC28E62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E
            62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E62FF6F5138FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF4E3927FFC38E62FFC38E62FFC38E
            62FFC38E62FFC38E62FFC38E62FF916A49FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF010000FF37281CFFA67953FFC38E62FFC38E
            62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E
            62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E
            62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E62FFC38E62FFC28E
            61FFC18C60FFB98058FFA6633FFF6B3821FF5B2F1BFF563323F1444444AF4444
            447B4242423A4040401080808002000000000000000000000000000000000000
            0001333333054545451A513A2F7A5B2F1BFF5C301BFF8E4D2FFFB0724DFFBD87
            5DFFC08B61FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B
            60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FF1A130DFF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF443122FFC08B60FFC08B60FFC08B
            60FFC08B60FFC08B60FFC08B60FFC08B60FF0B0806FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF080604FF8F6848FFC08B60FFC08B60FFC08B60FFC08B
            60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B
            60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B
            60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B60FFC08B
            60FFC08A61FFBB835AFFAA6945FF7B4227FF5B2F1BFF5A301CFD444444B64444
            4484434343414343431355555503000000000000000000000000000000000000
            0001494949074242421F5335289A5B2F1BFF5C301CFF995735FFB37751FFBD85
            5EFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE88
            5FFFBE885FFFBE885FFFBE885FFFBE885FFFB8845DFF010100FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF644832FFBE885FFFBE885FFFBE88
            5FFFBE885FFFBE885FFFBE885FFFBE885FFF473323FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF020101FFA57753FFBE885FFFBE885FFFBE885FFFBE885FFFBE88
            5FFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE88
            5FFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE88
            5FFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE885FFFBE88
            5FFFBE885FFFBB835CFFAD6E4AFF86482CFF5B2F1BFF5B2F1BFF48413DC24444
            448B434343484343431740404004000000000000000000000000000000000000
            00014040400844444422563424B65B2F1BFF60321DFFA05C39FFB57A54FFBB84
            5DFFBC855EFFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC86
            5EFFBC865EFFBC865EFFBC865EFFBC865EFF684B34FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF020101FFA37552FFBC865EFFBC865EFFBC86
            5EFFBC865EFFBC865EFFBC865EFFBC865EFFB4805AFF0D0906FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF634631FFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC86
            5EFFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC86
            5EFFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC86
            5EFFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC865EFFBC86
            5EFFBC855EFFBA835CFFB0734FFF904F2FFF5B2F1BFF5B2F1BFF4C3D36CE4444
            448F4242424D4545451A33333305000000010000000000000000000000000000
            00013939390945454525583220D15B2F1BFF6A3820FFA35F3DFFB57B56FFBA82
            5CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA82
            5CFFBA825CFFBA825CFFBA825CFFBA825CFF231911FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF5F422FFFBA825CFFBA825CFFBA825CFFBA82
            5CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFA37251FF050302FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF241A12FFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA82
            5CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA82
            5CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA82
            5CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA825CFFBA82
            5CFFBA825CFFB9815CFFB17652FF9B5635FF5C301CFF5B2F1BFF50392FD94444
            4492424242514040401C55555506000000010000000000000000000000000000
            00014D4D4D0A404040285A301DEA5B2F1BFF743C24FFA56240FFB57B56FFB87F
            5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F
            5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFF040302FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF010101FF513828FFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F
            5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFF8E6245FF0302
            02FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0604
            03FFAE7956FFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F
            5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F
            5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F
            5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F5AFFB87F
            5AFFB87F5AFFB77E5AFFB27754FF9F5938FF62331EFF5B2F1BFF533629E44343
            4395434343544242421F49494907000000010000000000000000000000000000
            00014646460B46403E2F5B2F1BFE5B2F1BFF7D4126FFA76744FFB47A57FFB57C
            59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C
            59FFB57C59FFB57C59FFB57C59FF885D43FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF130D09FF97674AFFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C
            59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFAB76
            55FF312218FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF010000FF7D56
            3EFFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C
            59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C
            59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C
            59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C59FFB57C
            59FFB57C59FFB57C59FFB27754FFA15D3BFF6B3820FF5B2F1BFF563323EE4444
            4497434343574646462140404008000000010000000000000000000000000000
            00024646460B4B3A333F5B2F1BFF5B2F1BFF83462AFFA96948FFB37856FFB47A
            57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B
            57FFB47B57FFB47B57FFB47B57FF3C291DFF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF010101FF4F36
            26FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B
            57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B
            57FFB47B57FF8E6145FF1B130DFF020101FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF080504FF875D41FFB47B
            57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B
            57FF704C36FF2B1D14FF281C13FF2A1C14FF2B1D15FF2D1E15FF664632FFB47B
            57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B
            57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B57FFB47B
            57FFB47B57FFB47A58FFB27655FFA35F3EFF723C22FF5B2F1BFF583221F34343
            4398424242594444442240404008000000010000000000000000000000000000
            00024646460B4E382E4A5B2F1BFF5B2F1BFF87482CFFAA6B49FFB27756FFB379
            58FFB37958FFB37958FFB37958FFB37958FFB37958FFB37958FFB37958FFB379
            58FFB37958FFB37958FFB37958FF100B08FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF130D0AFF96664AFFB379
            58FFB37958FFB37958FFB37958FFB37958FFB37958FFB37958FFB37958FFB379
            58FFB37958FFB37958FFB37958FFB37958FFB37958FFB37958FFB37958FFB379
            58FFB37958FFB37958FFB37958FFB37958FF7E563EFF3D291EFF130D09FF0101
            01FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF241811FFAC7554FFB37958FFB379
            58FFB37958FFB37958FFB37958FFB37958FFB37958FF9E6B4EFF3D291EFF0604
            03FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0604
            03FF3F2B1FFFA46F50FFB37958FFB37958FFB37958FFB37958FFB37958FFB379
            58FFB37958FFB37958FFB37958FFB37958FFB37958FFB37958FFB37958FFB379
            58FFB37958FFB37958FFB17555FFA46240FF763F25FF5B2F1BFF59311FF64343
            4398424242594444442240404008000000010000000000000000000000000000
            00014646460B51372B555B2F1BFF5C301CFF8B4A2DFFAB6C4CFFB17757FFB277
            56FFB27756FFB27756FFB27756FFB27756FFB27756FFB27756FFB27756FFB277
            56FFB27756FFB27756FFAC7354FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF010101FF4F3526FFB27756FFB27756FFB277
            56FFB27756FFB27756FFB27756FFB27756FFB27756FFB27756FFB27756FFB277
            56FFB27756FFB27756FFB27756FFB27756FFB27756FFB27756FFB27756FFB277
            56FFB27756FFB27756FFB27756FFB27756FFB27756FFB27756FFB27756FFB077
            56FF764F39FF37251BFF100A08FF010000FF000000FF000000FF000000FF0000
            00FF000000FF0B0806FF39261CFF895C43FFB27756FFB27756FFB27756FFB277
            56FFB27756FFB27756FFB27756FFB27756FF4D3325FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF010000FF342219FFB27756FFB27756FFB27756FFB27756FFB277
            56FFB27756FFB27756FFB27756FFB27756FFB27756FFB27756FFB27756FFB277
            56FFB27756FFB27756FFB07454FFA56343FF794127FF5B2F1BFF5A301DFA4444
            4496434343574646462149494907000000010000000000000000000000000000
            00014D4D4D0A5234275E5B2F1BFF5C301CFF8E4D2EFFAB6E4EFFB17556FFB177
            58FFB17758FFB17758FFB17758FFB17758FFB17758FFB17758FFB17758FFB177
            58FFB17758FFB17758FF674633FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF17100CFF98664BFFB17758FFB17758FFB17758FFB177
            58FFB17758FFB17758FFB17758FFB17758FFB17758FFB17758FFB17758FFB177
            58FFB17758FFB17758FFB17758FFB17758FFB17758FFB17758FFB17758FFB177
            58FFB17758FFB17758FFB17758FFB17758FFB17758FFB17758FFB17758FFB177
            58FFB17758FFB17758FFB17758FFAD7556FF885C44FF855942FF835841FF8056
            40FF99674CFFB17758FFB17758FFB17758FFB17758FFB17758FFB17758FFB177
            58FFB17758FFB17758FFB17758FF533829FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF221711FFAF7758FFB17758FFB17758FFB177
            58FFB17758FFB17758FFB17758FFB17758FFB17758FFB17758FFB17758FFB177
            58FFB17758FFB17758FFAF7455FFA66545FF7D4229FF5C301CFF5B2F1CFD4343
            4394434343544242421F49494907000000010000000000000000000000000000
            000139393909563425685B2F1BFF5C301CFF914F30FFAB6D4EFFAF7355FFAF75
            57FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF75
            57FFAF7557FFAF7557FF2A1D15FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF020101FF583B2CFFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF75
            57FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF75
            57FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF75
            57FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF75
            57FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF75
            57FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF75
            57FFAF7557FFAF7557FF5E3F2FFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF241812FFAF7557FFAF7557FFAF75
            57FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF7557FFAF75
            57FFAF7557FFAF7557FFAF7354FFA66545FF80442AFF5C301CFF5B2F1BFF4543
            4295434343504040401C55555506000000010000000000000000000000000000
            000140404008573323715B2F1BFF5C311DFF965131FFAB6D4EFFAE7355FFAF75
            56FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF75
            56FFAF7556FFAF7556FF0F0A08FF000000FF000000FF000000FF040302FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1D13
            0EFF9C694DFFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF75
            56FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF75
            56FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF75
            56FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF75
            56FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF75
            56FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF75
            56FFAF7556FFAF7556FF0B0706FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF734D39FFAF7556FFAF75
            56FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF7556FFAF75
            56FFAF7556FFAF7456FFAE7253FFA76647FF83472CFF5C301CFF5B2F1BFF4741
            3F964343434C4747471933333305000000010000000000000000000000000000
            0001494949075733236B5B2F1BFF5C311DFF955032FFA96C4DFFAE7154FFAF74
            56FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF74
            56FFAF7456FFAF7456FF090604FF000000FF000000FF000000FF885A43FF5438
            2AFF010100FF000000FF000000FF000000FF000000FF070503FF624130FFAF74
            56FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF74
            56FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF74
            56FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF74
            56FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF74
            56FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF74
            56FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF74
            56FFAF7456FFA56E52FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF0A0705FFAF7456FFAF74
            56FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF7456FFAF74
            56FFAF7456FFAE7355FFAD7152FFA66547FF83462CFF5C301CFF5B2F1BFF4541
            3F91444444474646461640404004000000000000000000000000000000000000
            0001333333055733235C5B2F1BFF5C311DFF925033FFA86A4DFFAD7054FFAD72
            55FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD72
            55FFAD7255FFAD7255FF040302FF000000FF000000FF150E0AFFAD7255FFAD72
            55FF98644BFF644231FF412B20FF442D21FF8D5D45FFAD7255FFAD7255FFAD72
            55FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD72
            55FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD72
            55FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD72
            55FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD72
            55FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD72
            55FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD72
            55FFAD7255FFA97053FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF8B5C44FFAD72
            55FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD7255FFAD72
            55FFAD7255FFAD7154FFAC6F52FFA56346FF80452BFF5C301CFF5B2F1BFF4342
            4184444444404343431355555503000000000000000000000000000000000000
            0000404040045532224C5B2F1BFF5C311DFF8F4E33FFA8684BFFAC6F54FFAD71
            55FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD72
            56FFAD7256FFAD7256FF010101FF000000FF000000FF6E4937FFAD7256FFAD72
            56FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD72
            56FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD72
            56FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD72
            56FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD72
            56FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD72
            56FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD72
            56FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD72
            56FFAD7256FFAD7256FF020101FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF483024FFAD72
            56FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD7256FFAD72
            56FFAD7256FFAD7155FFAB6E51FFA56446FF7E442BFF5C311DFF5A301CFC4343
            437A434343394040401080808002000000000000000000000000000000000000
            0000555555035432233D5B2F1BFF5C311DFF8C4E31FFA66749FFAB6F52FFAD71
            55FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD71
            55FFAD7155FFAD7155FF010101FF1B120DFF614030FFAD7155FFAD7155FFAD71
            55FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD71
            55FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD71
            55FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD71
            55FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD71
            55FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD71
            55FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD71
            55FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD71
            55FFAD7155FFAD7155FF241812FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF1F140FFFAD71
            55FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD7155FFAD71
            55FFAD7155FFAC7054FFA96C50FFA46144FF7B432AFF5C311DFF59301EF74343
            436F424242323B3B3B0D00000002000000000000000000000000000000000000
            0000808080025636272D5B2F1BFF5C311DFF894C30FFA56648FFAA6D51FFAC70
            54FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC70
            55FFAC7055FFAC7055FFA66C53FFAC7055FFAC7055FFAC7055FFAC7055FFAC70
            55FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC70
            55FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC70
            55FFAC7055FFAC7055FFAC7055FFA86E53FF865742FF624030FF744B39FFA66C
            53FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC70
            55FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC70
            55FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC70
            55FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC70
            55FFAC7055FFAC7055FF815440FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF160E0BFFAC70
            55FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC7055FFAC70
            55FFAC7055FFAC6F54FFAA6D50FFA36043FF78422AFF5C311DFF59311FF14242
            42644343432A4D4D4D0A00000001000000000000000000000000000000000000
            00000000000254372A1D5B2F1BFF5C311DFF864A30FFA56447FFA96C51FFAB70
            55FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC71
            57FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC71
            57FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC71
            57FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC71
            57FF875944FF241812FF030202FF000000FF000000FF000000FF000000FF0000
            00FF080504FF1E1410FF784F3DFFAC7157FFAC7157FFAC7157FFAC7157FFAC71
            57FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC71
            57FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC71
            57FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC71
            57FFAC7157FFAC7157FFAC7157FF0E0907FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF140D0AFFAC71
            57FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC7157FFAC71
            57FFAC7157FFAB6F54FFA96A4DFFA25F41FF733E27FF5C311DFF583220EA4343
            4358444444224040400800000001000000000000000000000000000000000000
            000000000001433E3C095B2F1BF75C311DFF7D462DFFA46245FFA96C4FFFAB70
            54FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC71
            56FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC71
            56FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC71
            56FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FF9A654DFF160F
            0BFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF19110DFF885A45FFAC7156FFAC7156FFAC71
            56FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC71
            56FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC71
            56FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC71
            56FFAC7156FFAC7156FFAC7156FF55372AFF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF110B09FFAC71
            56FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC7156FFAC71
            56FFAC7156FFAB6F54FFA86A4DFFA15E40FF6B3B25FF5C301CFF563323DC4343
            434C4545451A3333330500000001000000000000000000000000000000000000
            0000000000002B2B2B065B2F1CD65C311DFF744029FFA26042FFA86A4FFFAC70
            56FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD72
            58FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD72
            58FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD72
            58FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FF905F49FF060403FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF5A3B2DFFAD7258FFAD72
            58FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD72
            58FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD72
            58FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD72
            58FFAD7258FFAD7258FFAD7258FFAB7056FF030201FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF211611FFAD72
            58FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD7258FFAD72
            58FFAC7158FFAB6F55FFA7684DFFA05B3EFF623521FF5C301CFF533527C44545
            453F434343134040400400000000000000000000000000000000000000000000
            000000000000555555035A301DB05C311DFF6B3A25FFA25E41FFA96A4EFFAD71
            56FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE73
            59FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE73
            59FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE73
            59FFAE7359FFAE7359FFAE7359FFAE7359FF97644DFF040202FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF010101FF885946FFAE73
            59FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE73
            59FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE73
            59FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE73
            59FFAE7359FFAE7359FFAE7359FFAE7359FF35231BFF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF472E24FFAE73
            59FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE73
            59FFAE7359FFAC7056FFA7674BFF99583AFF5E331FFF5C301CFF51372BA64242
            42323737370E0000000200000000000000000000000000000000000000000000
            000000000000000000025A301D895C301CFF613521FFA05D3EFFA86A4EFFAD73
            59FFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF76
            5CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF76
            5CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF76
            5CFFAF765CFFAF765CFFAF765CFFAF765CFF1D140FFF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF080504FFA972
            58FFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF76
            5CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF76
            5CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF76
            5CFFAF765CFFAF765CFFAF765CFFAF765CFF9C6A52FF010000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF79513FFFAF76
            5CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF765CFFAF76
            5CFFAE755BFFAC7156FFA6674AFF8F5336FF5E321FFF5B2F1BFF4F3B32824343
            4326393939090000000100000000000000000000000000000000000000000000
            000000000000000000015A301D615C301CFF5E331FFF99573BFFA86A4EFFAE74
            5AFFB0785FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB079
            5FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB079
            5FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB079
            5FFFB0795FFFB0795FFFB0795FFF6F4C3DFF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF5D40
            32FFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFF5A3D31FF291C
            16FF1A120EFF0E0A08FF0A0705FF17100CFF2B1E17FF453026FF8A5F4AFFB079
            5FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB079
            5FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFF231813FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FFAC775DFFB079
            5FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB0795FFFB079
            5FFFAF775EFFAC7257FFA56649FF864B32FF5D311EFF5B2F1BFF483F3A5A4242
            421B2B2B2B060000000000000000000000000000000000000000000000000000
            00000000000000000000582F1D375B2F1BFF5E321FFF8D5035FFA7684BFFAE73
            59FFB1785FFFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A
            61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A
            61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A
            61FFB17A61FFB17A61FFB17A61FF090605FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2519
            14FFB17A61FFB17A61FFB17A61FFB17A61FF624436FF080604FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF3E2B
            22FFAF7A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A
            61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FF885E4BFF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF100B09FFB17A61FFB17A
            61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A61FFB17A
            61FFB0785EFFAC7156FFA46346FF7B452CFF5D311EFF5A301DF54444443C4747
            4712555555030000000000000000000000000000000000000000000000000000
            00000000000000000000583F34075B2F1BF35D311EFF7D472FFFA56548FFAE73
            59FFB27A62FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D
            64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D
            64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D
            64FFB37D64FFB37D64FF9E6F58FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF261A
            15FFB37D64FFB37D64FFB37D64FF6B4B3BFF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF0C0806FF895F4CFFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D
            64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FF140E0BFF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF765242FFB37D64FFB37D
            64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D64FFB37D
            64FFB17960FFAC7055FFA36143FF693B26FF5C311DFF573221CE4646462C4040
            400C000000020000000000000000000000000000000000000000000000000000
            00000000000000000000000000015B2F1BB85C311DFF6C3C27FFA46245FFAD72
            58FFB37C63FFB47F67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F
            67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F
            67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F
            67FFB57F67FFB57F67FF5F4336FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF5139
            2EFFB57F67FFB57F67FF986B57FF020101FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF030202FF976A56FFB57F67FFB57F67FFB57F67FFB57F67FFB57F
            67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FF735041FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF17100DFFB57F67FFB57F67FFB57F
            67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FFB57F67FFB47F
            67FFB17A61FFAB6E53FF9C5B3EFF603521FF5C301CFF5435279B4444441E4949
            4907000000010000000000000000000000000000000000000000000000000000
            00000000000000000000000000005A2F1C775C301CFF603521FF9D5C3FFFAC70
            55FFB37D64FFB58169FFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB681
            6AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB681
            6AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB681
            6AFFB6816AFFB6816AFF2E211BFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF020101FFA676
            61FFB6816AFFB6816AFF412E26FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF090605FFAA7964FFB6816AFFB6816AFFB6816AFFB681
            6AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFF0806
            05FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF87604FFFB6816AFFB6816AFFB681
            6AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB6816AFFB580
            68FFB17A61FFA96B50FF8B5137FF5E331FFF5C301CFF4E392F5C474747125555
            5503000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000582E1A345C301CFF5E331FFF8D5338FFAA6D
            51FFB37C63FFB6826BFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFFB884
            6DFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFFB884
            6DFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFFB884
            6DFFB8846DFFB8846DFF140F0CFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF4E382EFFB884
            6DFFB8846DFFB8846DFF16100DFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF150F0DFFB6826DFFB8846DFFB8846DFFB884
            6DFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFF4E38
            2EFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF17110DFFB8846DFFB8846DFFB8846DFFB884
            6DFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFFB8846DFFB7836CFFB681
            6AFFB1785FFFA7684BFF7A472FFF5D311EFF5A301CF1404040284D4D4D0A0000
            0001000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000003D1F12035B2F1BEE5D311EFF7B472FFFA768
            4CFFB17A61FFB7836CFFB98670FFB98670FFB98670FFB98670FFB98670FFB986
            70FFB98670FFB98670FFB98670FFB98670FFB98670FFB98670FFB98670FFB986
            70FFB98670FFB98670FFB98670FFB98670FFB98670FFB98670FFB98670FFB986
            70FFB98670FFB98670FF1A1310FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF0C0907FFB98670FFB986
            70FFB98670FFB98670FF030202FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF553E34FFB98670FFB98670FFB986
            70FFB98670FFB98670FFB98670FFB98670FFB98670FFB98670FFB98670FFB986
            70FF19120FFF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF785749FFB98670FFB98670FFB98670FFB986
            70FFB98670FFB98670FFB98670FFB98670FFB98670FFB98670FFB8866FFFB681
            6AFFAF765CFFA56447FF683B26FF5C311DFF583220C13D3D3D192B2B2B060000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000005B2F1BAA5C311DFF663925FFA462
            47FFAF765DFFB7836CFFBA8772FFBA8973FFBA8973FFBA8973FFBA8973FFBA89
            73FFBA8973FFBA8973FFBA8973FFBA8973FFBA8973FFBA8973FFBA8973FFBA89
            73FFBA8973FFBA8973FFBA8973FFBA8973FFBA8973FFBA8973FFBA8973FFBA89
            73FFBA8973FFBA8973FF241B17FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF815F50FFBA8973FFBA89
            73FFBA8973FFBA8973FF010101FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF201713FFBA8973FFBA8973FFBA89
            73FFBA8973FFBA8973FFBA8973FFBA8973FFBA8973FFBA8973FFBA8973FFBA89
            73FFAC7F6AFF070504FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF0C0907FFBA8973FFBA8973FFBA8973FFBA8973FFBA89
            73FFBA8973FFBA8973FFBA8973FFBA8973FFBA8973FFBA8973FFB98771FFB581
            69FFAD7157FF95583DFF603521FF5C301CFF5634257F3333330F000000030000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000005A2F1B4F5C301CFF5F3420FF9055
            3AFFAC7156FFB6826BFFBB8974FFBC8B75FFBC8C76FFBC8C76FFBC8C76FFBC8C
            76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C
            76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C
            76FFBC8C76FFBC8C76FF31241FFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF3A2B24FFBC8C76FFBC8C76FFBC8C
            76FFBC8C76FFBC8C76FF010101FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF040303FFBC8C76FFBC8C76FFBC8C
            76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C
            76FFBC8C76FFBC8C76FF7D5D4EFF362822FF0E0B09FF000000FF000000FF0000
            00FF000000FF000000FF533E35FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C
            76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8C76FFBC8B75FFBA8872FFB47E
            66FFA96B50FF7C4831FF5E321FFF5B2F1BF94C3D362B49494907000000010000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000005B2F1B055B2F1BEB5D311EFF7744
            2FFFA96A4FFFB47F67FFBB8975FFBD8D78FFBD8E79FFBD8E79FFBD8E79FFBD8E
            79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E
            79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E
            79FFBD8E79FFBD8E79FF4A372FFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF100C0BFFBB8C79FFBD8E79FFBD8E79FFBD8E
            79FFBD8E79FFBD8E79FF010101FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FFB58875FFBD8E79FFBD8E
            79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E
            79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FF0B0807FF000000FF0000
            00FF000000FF010101FFB58873FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E
            79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8E79FFBD8D78FFBA8871FFB17A
            61FFA46447FF663A26FF5C311DFF59311FBA4040401055555503000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000005A2F1B935C311DFF6238
            24FFA06246FFB17960FFBA8973FFBE8F7AFFBF917CFFBF917CFFBF917CFFBF91
            7CFFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFFBF91
            7CFFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFFBF91
            7CFFBF917CFFBF917CFFA27B69FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF010101FFA27B69FFBF917CFFBF917CFFBF917CFFBF91
            7CFFBF917CFFBF917CFF020101FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF010101FFBF917CFFBF917CFFBF91
            7CFFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFFBF91
            7CFFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFF050403FF000000FF0000
            00FF000000FF261D19FFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFFBF91
            7CFFBF917CFFBF917CFFBF917CFFBF917CFFBF917CFFBD8E79FFB8866FFFAE73
            59FF8F553BFF603521FF5C301CFF553324604040400800000001000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000005A2E1B355C301CFF5F34
            20FF895138FFAD7258FFB8866FFFBE907BFFC0937FFFC0937FFFC0937FFFC093
            7FFFC0937FFFC0937FFFC0937FFFC0937FFFC0937FFFC0937FFFC0937FFFC093
            7FFFC0937FFFC0937FFFC0937FFFC0937FFFC0937FFFC0937FFFC0937FFFC093
            7FFFC0937FFFC0937FFFC0937FFF0E0B09FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF201815FFC0937FFFC0937FFFC0937FFFC0937FFFC093
            7FFFC0937FFFC0937FFF040303FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF080605FFC0937FFFC0937FFFC093
            7FFFC0937FFFC0937FFFC0937FFFC0937FFFC0937FFFC0937FFFC0937FFFC093
            7FFFC0937FFFC0937FFFC0937FFFC0937FFFC0937FFF010100FF000000FF0000
            00FF000000FF89695AFFC0937FFFC0937FFFC0937FFFC0937FFFC0937FFFC093
            7FFFC0937FFFC0937FFFC0937FFFC0937FFFC0927EFFBD8E79FFB6816AFFA96C
            50FF75442EFF5E321FFF5B2F1CED4E4642155555550300000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000005B2F1BD35D31
            1EFF6C3E29FFA7694DFFB57F67FFBE8F7AFFC19480FFC29582FFC29582FFC295
            82FFC29582FFC29582FFC29582FFC29582FFC29582FFC29582FFC29582FFC295
            82FFC29582FFC29582FFC29582FFC29582FFC29582FFC29582FFC29582FFC295
            82FFC29582FFC29582FFC29582FF473630FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF5A453CFFC29582FFC29582FFC29582FFC29582FFC295
            82FFC29582FFC29582FF070605FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF17110FFFC29582FFC29582FFC295
            82FFC29582FFC29582FFC29582FFC29582FFC29582FFC29582FFC29582FFC295
            82FFC29582FFC29582FFC29582FFC29582FFB38978FF000000FF000000FF0000
            00FF2D231EFFC29582FFC29582FFC29582FFC29582FFC29582FFC29582FFC295
            82FFC29582FFC29582FFC29582FFC29582FFC0937FFFBC8C76FFB17A61FF9C5F
            44FF613623FF5C311DFF59311F99404040080000000100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000005A2F1B5D5C30
            1CFF603521FF8F563DFFAF765DFFBB8A75FFC19581FFC39884FFC39885FFC398
            85FFC39885FFC39885FFC39885FFC39885FFC39885FFC39885FFC39885FFC398
            85FFC39885FFC39885FFC39885FFC39885FFC39885FFC39885FFC39885FFC398
            85FFC39885FFC39885FFC39885FFAA8574FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FFAC8575FFC39885FFC39885FFC39885FFC39885FFC398
            85FFC39885FF927264FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF5F4A41FFC39885FFC39885FFC398
            85FFC39885FFC39885FFC39885FFC39885FFC39885FFC39885FFC39885FFC398
            85FFC39885FFC39885FFC39885FFC39885FF8C6D60FF000000FF000000FF0605
            04FFBA917FFFC39885FFC39885FFC39885FFC39885FFC39885FFC39885FFC398
            85FFC39885FFC39885FFC39885FFC39884FFC0937FFFB98670FFAC7055FF7C49
            32FF5E331FFF5C301CFA52352829555555030000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000005B2F1B035B2F
            1BDD5D311EFF6F412CFFA96C50FFB7836CFFC0937FFFC49A87FFC59B88FFC59B
            88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B
            88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B
            88FFC59B88FFC59B88FFC59B88FFC59B88FF1A1412FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF080605FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B
            88FFC59B88FF1C1613FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF040303FFC19986FFC59B88FFC59B88FFC59B
            88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B
            88FFC59B88FFC59B88FFC59B88FFC59B88FFB68F7EFF3D302AFF070505FF8266
            59FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B88FFC59B
            88FFC59B88FFC59B88FFC49A88FFC39885FFBE907BFFB47E66FF9F6247FF6338
            25FF5C311DFF5A301EA349494907000000010000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000005B2F
            1B675C301CFF613623FF935940FFB17A61FFBE8F7AFFC49A87FFC69D8BFFC69D
            8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D
            8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D
            8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFF3C302BFF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF2A211DFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D
            8BFFA48273FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF3F322CFFC69D8BFFC69D8BFFC69D8BFFC69D
            8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D
            8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D
            8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D8BFFC69D
            8BFFC69D8BFFC69D8BFFC69C8AFFC39884FFBB8A74FFAD7359FF7F4C35FF5E33
            1FFF5C301CFC5533242C80808002000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000005B2F
            1B075B2F1BE55E321FFF71422EFFAB6E53FFB98670FFC29783FFC69E8CFFC8A0
            8EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A0
            8EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A0
            8EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFF392E29FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF68534AFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A0
            8EFF362B27FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF060505FFB89483FFC8A08EFFC8A08EFFC8A08EFFC8A0
            8EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A0
            8EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A0
            8EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A08EFFC8A0
            8EFFC8A08EFFC79F8DFFC69D8BFFC0937FFFB57F67FFA16449FF643A26FF5C31
            1DFF5A301DAB4040400400000001000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00005B2F1B715C311DFF613623FF8F573FFFB17A61FFBF907CFFC69D8BFFC8A1
            90FFC9A291FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A3
            91FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A3
            91FFC9A391FFC9A391FFC9A391FFC9A391FF3D322CFF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF211B18FFC5A18FFFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC5A1
            8FFF030202FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF010101FF957A6CFFC9A391FFC9A391FFC9A391FFC9A391FFC9A3
            91FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A3
            91FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A3
            91FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A391FFC9A3
            91FFC9A291FFC8A18FFFC59B88FFBB8A75FFAD7258FF7C4933FF5F3420FF5C30
            1CFD573120320000000100000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00005B2F1B065C301CD85E321FFF693D29FFA56A50FFB8856EFFC49886FFC9A2
            91FFCAA494FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA5
            94FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA5
            94FFCAA594FFCAA594FFCAA594FFCAA594FF453832FF000000FF000000FF0000
            00FF000000FF020202FF010101FF000000FF000000FF000000FF000000FF2E26
            22FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FF9277
            6BFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF655249FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA5
            94FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA5
            94FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA5
            94FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA594FFCAA5
            94FFCAA493FFC8A08FFFC19480FFB47E66FF975E44FF613724FF5C311DFF5A30
            1C9C555555030000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000005B2F1B445C301CFF603521FF804E38FFAF765DFFBE8F7BFFC89F
            8EFFCBA596FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA7
            97FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA7
            97FFCCA797FFCCA797FFCCA797FFCCA797FF4E3F39FF000000FF000000FF0000
            00FF000000FF766157FFCCA797FFA08377FF635249FF574740FFA8897CFFCCA7
            97FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FF9177
            6BFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF473A34FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA7
            97FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA7
            97FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA7
            97FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA797FFCCA7
            96FFCAA594FFC69B8AFFBA8973FFAB6E55FF6F422EFF5E321FFF5C301CEB5632
            2215000000010000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000005B2F1BA95C311DFF633926FF9B6148FFB6806AFFC398
            85FFCAA494FFCDA99AFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA9
            9BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA9
            9BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFF564741FF000000FF000000FF0000
            00FF050404FFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA9
            9BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFF987D
            72FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF020101FF7661
            59FFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA9
            9BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA9
            9BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA9
            9BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCEA99BFFCDA7
            98FFC9A291FFC0937FFFB17A61FF8A543DFF603622FF5C311DFF5B301D650000
            0001000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000005B2F1B1B5C301CF35E331FFF70432FFFAB6F55FFBC8A
            75FFC79E8DFFCDA99AFFCFAB9DFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC
            9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC
            9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFF7E6960FF000000FF000000FF0000
            00FF161210FFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC
            9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC
            9EFF2F2724FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF090707FFA4887EFFCFAC
            9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC
            9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC
            9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC
            9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAB9DFFCCA7
            97FFC49988FFB7836CFFA0664BFF663B28FF5D311EFF5B2F1BC774655E030000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000005B2F1B715C301CFF603622FF825039FFB178
            60FFC0927FFFCBA495FFD0AD9FFFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AF
            A1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AF
            A1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFC7A799FF000000FF000000FF0000
            00FF2E2623FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AF
            A1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AF
            A1FFD1AFA1FF2A2421FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF221C1AFFC5A599FFD1AFA1FFD1AF
            A1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AF
            A1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AF
            A1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AF
            A1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AFA1FFD1AEA0FFCFAB9DFFC8A0
            90FFBC8B77FFAB7056FF724430FF5E331FFF5C301CFA5C321E31000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000005B2F1B015B2F1BB85D311EFF633926FF945E
            45FFB6806AFFC59A88FFCEAA9BFFD2B0A3FFD3B2A4FFD3B2A5FFD3B2A5FFD3B2
            A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2
            A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FF0C0A09FF000000FF0000
            00FF4D413CFFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2
            A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2
            A5FFD3B2A5FFD3B2A5FFB2968BFF443935FF090707FF000000FF000000FF0000
            00FF000000FF000000FF000000FF564943FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2
            A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2
            A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2
            A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2
            A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A5FFD3B2A4FFD1B0A2FFCCA797FFC194
            81FFB17860FF815039FF603622FF5C301CFF5B301C7400000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000005B2F1B155C301CE55E321FFF693F
            2BFFA36A50FFBA8873FFC8A090FFD1AEA0FFD4B4A7FFD5B5A9FFD5B5A9FFD5B5
            A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5
            A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FF2E2725FF000000FF2C25
            23FFC8AA9FFFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5
            A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5
            A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FF8B766FFF000000FF000000FF0000
            00FF000000FF000000FF2E2724FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5
            A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5
            A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5
            A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5A9FFD5B5
            A9FFD5B5A9FFD5B5A9FFD5B5A9FFD4B4A8FFD3B2A5FFCFAB9DFFC59B89FFB680
            6AFF945D45FF633926FF5D311EFF5B2F1BB30000000100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000005B2F1B3F5C301CFC5F34
            20FF744631FFAC7359FFBE8E7AFFCBA596FFD3B2A4FFD5B7AAFFD6B8ACFFD6B8
            ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8
            ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFF7F6E67FF7B6962FFD6B8
            ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8
            ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8
            ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFF201C1AFF000000FF000000FF0000
            00FF000000FF0E0C0BFFD1B4A8FFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8
            ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8
            ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8
            ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8ACFFD6B8
            ACFFD6B8ACFFD6B8ACFFD6B8ACFFD5B6A9FFD1B0A1FFC8A18FFFBA8771FFA167
            4FFF683D2AFF5E321FFF5C301CE2572D1A130000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000005B2F1B7D5C31
            1DFF603622FF7C4D38FFAF785EFFC0937FFFCDAA9AFFD5B5A9FFD7B9ADFFD8BB
            AFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BB
            AFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BB
            AFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BB
            AFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BB
            AFFFD8BBAFFFD8BBAFFFD8BBAFFFBBA297FF000000FF000000FF000000FF0000
            00FF020202FFB49C92FFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BB
            AFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BB
            AFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BB
            AFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BBAFFFD8BB
            AFFFD8BBAFFFD8BBAFFFD7B9ADFFD3B3A6FFCAA594FFBC8B77FFA76D55FF6E43
            2FFF5E331FFF5C301CFB5A2E1B3B000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000005B2F1B025B2F
            1BAA5C311DFF613724FF82513CFFB27B63FFC39784FFD0AD9FFFD7B9ADFFD9BD
            B2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BD
            B2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BD
            B2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BD
            B2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BD
            B2FFD9BDB2FFD9BDB2FFD9BDB2FF2E2826FF000000FF000000FF000000FF0000
            00FF806F69FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BD
            B2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BD
            B2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BD
            B2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BDB2FFD9BD
            B2FFD9BDB2FFD9BCB1FFD5B7AAFFCDA899FFBF907CFFAA725AFF734632FF6035
            21FF5C301CFF5A2F1B6700000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000005B2F
            1B065B2F1BBC5D311EFF633926FF88563FFFB47E67FFC59A88FFD1B0A2FFD8BB
            B0FFDBC0B5FFDBC0B6FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1
            B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1
            B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1
            B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1
            B7FFDBC1B7FFDBC1B7FF9E8A83FF000000FF000000FF000000FF010101FF8373
            6DFFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1
            B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1
            B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1
            B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC1B7FFDBC0
            B6FFDABFB4FFD7B9ADFFCFAC9CFFC19380FFAE765EFF774A36FF603622FF5C31
            1DFF5B2F1B7E0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00005B2F1B0C5B2F1BCB5D311EFF633A27FF8D5943FFB58068FFC69B8AFFD2B1
            A4FFD9BEB2FFDCC2B8FFDDC3B9FFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4
            BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4
            BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4
            BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4
            BAFFDDC4BAFFDDC4BAFF72655FFF000000FF000000FF040404FFA08E86FFDDC4
            BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4
            BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4
            BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4
            BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC4BAFFDDC3B9FFDBC1
            B7FFD8BBAFFFCFAC9EFFC29482FFB0785FFF7B4D38FF613623FF5C311DFF5B2F
            1B94000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000005B2F1B155C301CD95D311EFF633A27FF8A5842FFB57F68FFC59C
            89FFD3B2A4FFDABFB4FFDDC4BBFFDEC6BCFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6
            BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6
            BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6
            BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6
            BDFFDFC6BDFFDFC6BDFFDDC4BBFF060605FF0A0908FFBCA79FFFDFC6BDFFDFC6
            BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6
            BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6
            BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6
            BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDFC6BDFFDEC6BCFFDDC4BAFFD9BC
            B1FFD0AD9FFFC19581FFAE775EFF7A4D38FF613724FF5C311DFF5B2F1BAA5B2F
            1B02000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000005B2F1B205C301CDF5D311EFF633A27FF84543FFFB47E
            67FFC59B88FFD3B2A4FFDBC1B5FFDFC6BDFFE0C9C0FFE0C9C0FFE0C9C0FFE0C9
            C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9
            C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9
            C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9
            C0FFE0C9C0FFE0C9C0FFE0C9C0FF867872FFCDB8B0FFE0C9C0FFE0C9C0FFE0C9
            C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9
            C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9
            C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9
            C0FFE0C9C0FFE0C9C0FFE0C9C0FFE0C9C0FFDFC8BFFFDEC5BBFFD9BDB2FFCFAC
            9EFFC0937FFFAB755CFF764936FF613623FF5C311DFF5B2F1BB35B2F1B060000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000005B2F1B195C301CD15D311EFF633926FF8051
            3DFFB17B63FFC39785FFD1B0A2FFDBC0B5FFDFC8BFFFE1CBC2FFE2CCC4FFE2CC
            C4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CC
            C4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CC
            C4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CC
            C4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CC
            C4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CC
            C4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CC
            C4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CCC4FFE2CC
            C4FFE2CCC4FFE2CCC4FFE2CBC3FFE1CAC1FFDEC6BCFFD9BCB1FFCEA99BFFBF90
            7CFFA87159FF724733FF603622FF5C311DFF5B2F1B9F5B2F1B04000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000005B2F1B0F5C301CC15D311EFF6238
            25FF794D38FFAA755CFFC0927EFFCFAB9CFFD9BDB2FFDFC8BFFFE2CDC5FFE3CE
            C6FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CF
            C7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CF
            C7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CF
            C7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CF
            C7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CF
            C7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CF
            C7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CFC7FFE4CF
            C7FFE4CFC7FFE3CEC6FFE2CCC4FFDEC6BCFFD7B9ADFFCAA594FFBB8975FF9F6A
            52FF6E4430FF603622FF5C311DFF5B2F1B890000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000005B2F1B085B2F1BAF5C31
            1DFF603622FF6E4430FF9E6952FFBB8975FFCAA594FFD7BAAEFFDFC7BEFFE3CD
            C6FFE5D0C9FFE5D1CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2
            CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2
            CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2
            CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2
            CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2
            CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2
            CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D2CAFFE5D1
            CAFFE4CFC9FFE2CCC5FFDDC4BBFFD4B4A8FFC69D8CFFB7826CFF8F5E47FF673E
            2BFF5F3420FF5C311DFE5B2F1B71000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000005B2F1B035B2F
            1B845C311DFE5F3420FF673E2BFF8C5B46FFB5816AFFC69B8AFFD3B2A5FFDDC3
            B9FFE3CCC5FFE6D1CBFFE6D4CDFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4
            CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4
            CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4
            CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4
            CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4
            CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4
            CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D4CEFFE7D3CEFFE6D3CDFFE5D1
            C9FFE1CBC2FFDBBFB5FFD0AD9FFFC19581FFAD7760FF7E513DFF633A27FF5E32
            1FFF5C301CEE5B2F1B4F00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00005B2F1B465C301CEA5E321FFF633A27FF7A4E3AFFA8735BFFBE8F7BFFCDA7
            98FFD9BBB1FFE1C9C1FFE5D1CAFFE8D5CFFFE8D6D1FFE9D7D2FFE9D7D2FFE9D7
            D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7
            D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7
            D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7
            D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7
            D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7D2FFE9D7
            D2FFE9D7D2FFE9D7D2FFE9D7D2FFE8D7D1FFE8D6D0FFE7D4CEFFE4CFC9FFDFC6
            BDFFD5B6AAFFC8A090FFBA8872FF9E6952FF704532FF613724FF5D311EFF5C30
            1CC95B2F1B1F0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000005B2F1B1A5C301CC15D311EFF603622FF69412EFF8E5D48FFB380
            68FFC49987FFD2B0A3FFDCC2B8FFE3CDC6FFE7D4CEFFE9D8D3FFEAD9D4FFEADA
            D5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADA
            D5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADA
            D5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADA
            D5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADA
            D5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADAD5FFEADA
            D5FFEADAD5FFEAD9D4FFEAD8D3FFE9D7D2FFE6D3CDFFE2CBC3FFDABEB3FFCEAA
            9BFFC0927FFFAC7660FF81533FFF653C29FF5F3420FF5C311DFF5B2F1B8F5B2F
            1B05000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000005B2F1B035B2F1B7F5C301CF85E331FFF633A27FF7349
            36FF9E6B54FFBA8873FFC8A08FFFD5B4A9FFDEC5BBFFE5D0C9FFE8D6D1FFEADA
            D5FFEBDBD7FFECDCD7FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDC
            D8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDC
            D8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDC
            D8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDC
            D8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDCD8FFECDC
            D7FFEBDBD7FFEAD9D4FFE8D5CFFFE3CDC6FFDBC1B7FFD1B0A2FFC49988FFB581
            6CFF91604BFF6C4230FF613724FF5D311EFF5C301CE75B2F1B4F000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000005B2F1B245C301CB95C311DFF6035
            21FF663D2AFF80533EFFA6725BFFBC8B76FFC9A191FFD5B5A9FFDFC5BDFFE5D1
            CAFFE9D8D2FFEBDBD7FFECDDD9FFEDDEDBFFEEDFDCFFEEDFDCFFEEDFDCFFEEDF
            DCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDF
            DCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDF
            DCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDF
            DCFFEEDFDCFFEEDFDCFFEEDFDCFFEEDFDCFFEDDEDBFFEDDEDAFFECDDD9FFEBDA
            D6FFE8D6D0FFE4CEC7FFDCC1B8FFD2B0A3FFC59B89FFB8866FFF9B6952FF7549
            37FF633A27FF5E331FFF5C311DFC5B2F1B905B2F1B0E00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000005B2F1B555C30
            1CE45D311EFF603622FF673E2CFF7F523FFFA4715AFFBC8B76FFC89F90FFD3B3
            A6FFDCC2B8FFE4CEC7FFE8D6D1FFEBDBD7FFEDDEDBFFEEE1DDFFEFE1DEFFEFE1
            DEFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2
            DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2
            DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2DFFFEFE2
            DFFFEFE2DFFFEFE1DEFFEEE1DDFFEEE0DCFFEDDEDAFFEBDAD6FFE7D4CEFFE2CB
            C3FFDABFB4FFD1AEA0FFC59A88FFB8846FFF9A6852FF754B38FF653B28FF5F34
            20FF5C311DFF5C301CC55B2F1B2F000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000005B2F
            1B0C5B2F1B865C301CF25E321FFF613523FF673E2BFF7C513DFFA06C56FFB885
            70FFC49886FFCFAA9CFFD8BBAFFFE0C8C0FFE6D2CBFFEAD8D3FFECDCD8FFEEE0
            DCFFEFE2DFFFF0E3E1FFF0E4E1FFF0E4E1FFF1E5E2FFF1E5E2FFF1E5E2FFF1E5
            E2FFF1E5E3FFF1E5E3FFF1E5E3FFF1E5E3FFF1E5E3FFF1E5E3FFF1E5E3FFF1E5
            E3FFF1E5E3FFF1E5E2FFF1E5E2FFF1E5E2FFF1E5E2FFF0E4E1FFF0E4E1FFF0E3
            E0FFEFE1DEFFEEDFDCFFECDCD7FFE9D7D2FFE4CFC9FFDEC4BBFFD5B7AAFFCCA6
            96FFC0937FFFB37F69FF96664FFF744937FF653B28FF603521FF5D311EFF5C30
            1CDF5B2F1B605B2F1B0100000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000005B2F1B115B2F1B7F5C301CEE5D311EFF603622FF653C29FF7249
            36FF8E5F4AFFAA7761FFBC8C77FFC79E8DFFD0AD9FFFD8BAAFFFDEC4BBFFE3CE
            C6FFE8D5D0FFEBDBD6FFEDDEDAFFEEE0DCFFEFE2DFFFF0E3E1FFF1E5E2FFF2E6
            E4FFF2E6E4FFF2E7E5FFF2E7E5FFF2E7E5FFF2E7E5FFF2E7E5FFF2E7E5FFF2E7
            E5FFF2E6E4FFF1E5E3FFF1E5E2FFF0E3E1FFEFE1DEFFEEE0DCFFECDDD9FFEADA
            D5FFE7D3CEFFE2CCC4FFDCC2B8FFD6B7ABFFCEA99BFFC49987FFB98772FFA271
            5BFF865844FF6C4331FF633A27FF5F3420FF5D301EFF5C301CD95B2F1B605B2F
            1B04000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000005B2F1B0D5B2F1B775C301CE95D311EFF5F34
            20FF623825FF683F2DFF7A4E3BFF956450FFAA7861FFBB8974FFC29683FFCAA4
            94FFD2B0A3FFD8BBAFFFDCC2B8FFE0C8C0FFE4CFC7FFE7D4CEFFEAD9D3FFECDC
            D7FFECDED9FFEDDEDBFFEEDFDCFFEEDFDCFFEEE0DCFFEEDFDCFFEDDFDBFFEDDF
            DAFFECDDD9FFEBDBD7FFE9D8D2FFE6D3CCFFE3CCC5FFDFC7BEFFDBC0B7FFD7B9
            ADFFD0AD9FFFC8A090FFC0927FFFB7856FFFA4735CFF8E5D4AFF724937FF663D
            2AFF613623FF5E331FFF5C311DFF5C301CD25B2F1B585B2F1B02000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000005B2F1B055B2F1B505C30
            1CAD5C311DF95D311EFF603521FF633926FF673E2CFF714836FF855945FF9969
            54FFAC7964FFBA8871FFBF907DFFC49988FFCAA292FFCFAB9CFFD3B2A5FFD6B7
            ABFFD8BAAFFFD9BCB1FFDABEB3FFDBBFB6FFDBC0B6FFDBC0B5FFDABDB3FFD9BB
            B1FFD7B9ADFFD5B6A9FFD2B0A3FFCDA99AFFC8A090FFC39785FFBE8E7AFFB784
            6FFFA7755FFF946550FF7F5340FF6D4532FF663D2AFF623725FF5F3420FF5D31
            1EFF5C301CEB5B2F1B935B2F1B35000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00005B2F1B125B2F1B695C301CC75C311DFE5D311EFF5F3420FF613623FF6439
            28FF673E2CFF6F4633FF7D513EFF8A5B47FF956651FFA06F5AFFAA7861FFB07D
            68FFB4806CFFB78570FFBA8873FFBC8A75FFBC8B76FFBB8A75FFBA8772FFB784
            6EFFB2806AFFAE7C65FFA87660FF9E6D57FF92624EFF855945FF794D3BFF6D43
            31FF673E2BFF633926FF603622FF5E331FFF5D311EFF5C301CF85C301CAD5B2F
            1B4F5B2F1B050000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000005B2F1B145B2F1B565C301C995C301CDC5C31
            1DFF5D311EFF5E331FFF603521FF613724FF633926FF653B28FF663D2AFF673E
            2CFF69402EFF6A4230FF6D4532FF714835FF744A37FF714735FF6C4331FF6A41
            30FF683F2DFF673E2BFF653C29FF643A28FF633926FF613623FF603521FF5E32
            1FFF5D311EFF5C311DFC5C301CC95B2F1B865B2F1B435B2F1B08000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000005B2F
            1B1F5B2F1B5F5B2F1B8A5C301CB05C301CD55C301CF85C311DFF5C311DFF5C31
            1DFF5D311EFF5E321FFF5E321FFF5E331FFF5E331FFF5E331FFF5E321FFF5D31
            1EFF5D311EFF5C311DFF5C311DFF5C311DFF5C301CF15C301CCB5C301CA55B2F
            1B7F5B2F1B4E5B2F1B0F00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000005B2F1B025B2F1B215B2F1B455B2F
            1B555B2F1B615B2F1B6D5B2F1B795B2F1B865C301D8D5B2F1B825B2F1B765B2F
            1B6A5B2F1B5E5B2F1B515B2F1B3D5B2F1B170000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FFFFFFFFFFFFFF8000FF
            FFFFFFFFFFFFFFFFFFFFFFFFE0000003FFFFFFFFFFFFFFFFFFFFFFFE00000000
            3FFFFFFFFFFFFFFFFFFFFFF00000000007FFFFFFFFFFFFFFFFFFFF8000000000
            00FFFFFFFFFFFFFFFFFFFE0000000000003FFFFFFFFFFFFFFFFFF80000000000
            000FFFFFFFFFFFFFFFFFE000000000000003FFFFFFFFFFFFFFFF800000000000
            0000FFFFFFFFFFFFFFFE00000000000000003FFFFFFFFFFFFFFC000000000000
            00001FFFFFFFFFFFFFF0000000000000000007FFFFFFFFFFFFE0000000000000
            000003FFFFFFFFFFFF80000000000000000001FFFFFFFFFFFF00000000000000
            0000007FFFFFFFFFFE000000000000000000003FFFFFFFFFFC00000000000000
            0000001FFFFFFFFFF8000000000000000000000FFFFFFFFFF000000000000000
            00000007FFFFFFFFE00000000000000000000003FFFFFFFFC000000000000000
            00000001FFFFFFFF800000000000000000000000FFFFFFFF0000000000000000
            000000007FFFFFFE0000000000000000000000007FFFFFFE0000000000000000
            000000003FFFFFFC0000000000000000000000001FFFFFF80000000000000000
            000000000FFFFFF000000000000000000000000007FFFFF00000000000000000
            0000000007FFFFE000000000000000000000000003FFFFC00000000000000000
            0000000003FFFFC000000000000000000000000001FFFF800000000000000000
            0000000001FFFF8000000000000000000000000000FFFF000000000000000000
            0000000000FFFF00000000000000000000000000007FFE000000000000000000
            00000000007FFE00000000000000000000000000003FFE000000000000000000
            00000000003FFC00000000000000000000000000003FFC000000000000000000
            00000000001FFC00000000000000000000000000001FF8000000000000000000
            00000000000FF800000000000000000000000000000FF8000000000000000000
            00000000000FF0000000000000000000000000000007F0000000000000000000
            000000000007F0000000000000000000000000000007E0000000000000000000
            000000000007E0000000000000000000000000000003E0000000000000000000
            000000000003E0000000000000000000000000000003E0000000000000000000
            000000000003E0000000000000000000000000000003C0000000000000000000
            000000000003C0000000000000000000000000000003C0000000000000000000
            000000000001C0000000000000000000000000000001C0000000000000000000
            000000000001C0000000000000000000000000000001C0000000000000000000
            000000000001C0000000000000000000000000000001C0000000000000000000
            000000000001C0000000000000000000000000000001C0000000000000000000
            000000000001C0000000000000000000000000000001C0000000000000000000
            000000000003C0000000000000000000000000000003E0000000000000000000
            000000000003E0000000000000000000000000000003E0000000000000000000
            000000000003E0000000000000000000000000000003E0000000000000000000
            000000000003F0000000000000000000000000000007F0000000000000000000
            000000000007F0000000000000000000000000000007F0000000000000000000
            00000000000FF800000000000000000000000000000FF8000000000000000000
            00000000000FF800000000000000000000000000000FFC000000000000000000
            00000000001FFC00000000000000000000000000001FFC000000000000000000
            00000000003FFE00000000000000000000000000003FFE000000000000000000
            00000000003FFE00000000000000000000000000007FFF000000000000000000
            00000000007FFF0000000000000000000000000000FFFF800000000000000000
            0000000000FFFF8000000000000000000000000001FFFF800000000000000000
            0000000001FFFFC000000000000000000000000003FFFFC00000000000000000
            0000000003FFFFE000000000000000000000000007FFFFE00000000000000000
            000000000FFFFFF00000000000000000000000000FFFFFF80000000000000000
            000000001FFFFFF80000000000000000000000003FFFFFFC0000000000000000
            000000007FFFFFFC000000000000000000000000FFFFFFFE0000000000000000
            00000000FFFFFFFF000000000000000000000001FFFFFFFF8000000000000000
            00000003FFFFFFFF800000000000000000000007FFFFFFFFC000000000000000
            0000000FFFFFFFFFE0000000000000000000001FFFFFFFFFF000000000000000
            0000001FFFFFFFFFF8000000000000000000003FFFFFFFFFFC00000000000000
            0000007FFFFFFFFFFE00000000000000000001FFFFFFFFFFFF00000000000000
            000003FFFFFFFFFFFF80000000000000000007FFFFFFFFFFFFE0000000000000
            00000FFFFFFFFFFFFFF000000000000000001FFFFFFFFFFFFFF8000000000000
            00007FFFFFFFFFFFFFFE0000000000000000FFFFFFFFFFFFFFFF800000000000
            0003FFFFFFFFFFFFFFFFC000000000000007FFFFFFFFFFFFFFFFF00000000000
            001FFFFFFFFFFFFFFFFFFC0000000000007FFFFFFFFFFFFFFFFFFF0000000000
            03FFFFFFFFFFFFFFFFFFFFE0000000000FFFFFFFFFFFFFFFFFFFFFFC00000000
            7FFFFFFFFFFFFFFFFFFFFFFFC0000007FFFFFFFFFFFFFFFFFFFFFFFFFE0001FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF28000000400000008000
            0000010020000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000140404004494949074949
            4907333333058080800200000001000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000015555
            55064444440F464646164545451A4444441E494949234747472F4444443C4444
            444043434335464646284242421F4242421B4040401847474712393939098080
            8002000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000008080800239393909474747124444441E4343
            43394646465F4444447F454444924444439F454544AA444443AF444443B24444
            43B3454544B1454544AD444343A445444497424242884343436F434343484343
            4326434343173B3B3B0D40404004000000010000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000808080023737370E44444422454545464343436F454444964444
            43AF464643BB474743C3494643C84C443CD04F423AD7524136DD574130E25441
            33DF504239DA4D443CD44A4440CE494744C8484744C5454544BF444443B44343
            43A344444480444444564747472F494949152B2B2B0600000001000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008080
            80024646460B424242234343435845454495454542B3474643BF4D433CD0573F
            2EE4643D25F6693F21FC6A3F1EFF6C3F1FFF6E411FFF734621FD7A4C25FD7747
            23FD6F4221FE6D401FFF6B3E1EFF6A3E1FFD673E23F95B3E2BEB504238DA4845
            43CB464543C3454544B8444444A6444444714545453440404014404040040000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000001393939094242
            421F434343504544448F464645B64E423AD35A3F2DE7673E23F96C3F1FFF7A4B
            24FD965D2AFFA5682EFFAC6D30FFB47332FFBA7834FFBD7B34FFC07F35FFBE7C
            34FFBB7834FFB67533FFAF7031FFA76A2FFF9C622BFF835226FE6F4220FF693E
            21FD5F3E29EE534036DE464542CB444443BE444444A44343436B4343432E5050
            5010555555030000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000008080800243434313424242424444
            4488454544B34C4139D1603D26F36B3F1FFF7F4E26FE9A602CFFB07131FFBF7E
            35FFC88A37FFCF9138FFD29539FFD59939FFD99D3AFFDBA03BFFDDA23BFFDCA2
            3AFFD99E3AFFD79B3AFFD39739FFD09238FFCB8D38FFC28136FFB77634FFA366
            2EFF895528FE714322FE663C21FA543F34E0474442CA434342BC4444449E4242
            42603E3E3E212B2B2B0600000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000404040044242421B4343435B434342A54C44
            3DCB5D3C28EE6A3E20FF875228FEB07033FFC18037FFCA8B39FFD3973BFFDCA2
            3CFFE3AA3EFFE8B03FFFEAB43FFFEDB63FFFEFB940FFF1BB40FFF2BC41FFF1BB
            40FFF0B941FFEEB740FFEBB440FFE9B23FFFE5AD3EFFDEA53DFFD79C3CFFCD90
            3AFFC48538FFB97835FF985E2DFF6F4322FE643C23F7514137DC464645C84343
            43B44343437D4141412F55555509000000010000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000001494949074343432644444470454343B4583C2CE8693D
            21FE804F28FEAA6C33FFC2823AFFD2963EFFDCA33FFFE3AB41FFEAB442FFF0BB
            44FFF2BE44FFF4C145FFF6C244FFF7C345FFF8C545FFF9C545FFF9C645FFF9C5
            45FFF8C445FFF7C345FFF6C345FFF5C244FFF3BF44FFF0BC43FFECB743FFE6AE
            42FFDFA540FFD79C3FFFC8893BFFB67536FF925B2CFF6D4021FE603A25F44B41
            3BD3434343BD434343904242423E505050108080800200000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000001393939094040403443434385484440C05F3924F4724525FEA468
            33FFBF7F3BFFCE923FFFDBA343FFE8B246FFEEB947FFF1BD48FFF4C148FFF6C3
            49FFF7C449FFF7C54AFFF7C549FFF7C649FFF8C649FFF8C649FFF8C549FFF8C6
            49FFF8C649FFF8C649FFF7C549FFF7C549FFF7C449FFF6C449FFF5C248FFF2BE
            48FFEFBB48FFEBB647FFE0A844FFD39941FFC4863DFFB17137FF855129FE653A
            20FD4E3F37DA444443C3434343A0464646504040401400000002000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00004949490746464633434343914C423BCC643A22FA7C4C28FEB47339FFCA8F
            41FFD89F46FFE4AE49FFECB84BFFF1BF4CFFF3C14DFFF4C24DFFF4C34DFFF5C4
            4DFFF5C34DFFF5C34DFFF5C34DFFF5C34DFFF5C34DFFF5C34DFFF5C34DFFF5C3
            4DFFF5C34DFFF5C34DFFF5C34DFFF5C34DFFF5C34DFFF5C44DFFF5C34DFFF4C2
            4DFFF3C24DFFF2C04DFFEEBA4CFFE8B34AFFDCA546FFD09643FFBE7F3CFF935B
            2EFF683C20FF533D31E4454544C7444444A84242425547474712000000010000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000004040
            40044646462845454586503F35D4653A21FE89552CFEBA7A3DFFD09645FFE0AB
            4CFFE9B54FFFEEBB50FFF0BF50FFF2C051FFF2C151FFF2C151FFF2C150FFF2C1
            51FFF2C151FFF2C151FFF2C151FFF2C151FFF2C151FFF2C151FFF2C151FFF2C1
            51FFF2C151FFF2C151FFF2C151FFF2C151FFF2C151FFF2C151FFF2C151FFF2C1
            51FFF2C151FFF2C151FFF1C051FFEFBD50FFEAB84FFFE4AF4DFFD79F49FFC284
            40FFA06433FF6B3F22FE583A2AEC464443C9434343A4414141473B3B3B0D0000
            0001000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000555555034242
            421F434343764F3D33D3663A1FFF965D32FFBE8041FFD39B49FFE2AF51FFEAB9
            53FFEDBC54FFEEBE54FFEFBF55FFEFBF55FFEFBF55FFEFBF55FFEFBF55FFEFBF
            55FFEFBF55FFEFBF55FFEBBD53FF7C642CFF4E3E1CFF342A13FF3D3116FF5745
            1FFF775F2AFFAD8B3DFFEFBF55FFEFBF55FFEFBF55FFEFBF55FFEFBF55FFEFBF
            55FFEFBF55FFEFBF55FFEFBF55FFEFBE54FFEEBD55FFECBB53FFE6B352FFD9A2
            4CFFC68A44FFAA6C38FF704324FE5A3827F0444242C5434343994646463A4040
            4008000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000002464646164242
            42654A3F39C3623820FE965D32FFC28545FFD59E4EFFE2B054FFE9B957FFECBB
            57FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC
            58FFECBC58FF634F25FF040301FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF010100FF120E07FF413418FF866B32FFDAAE52FFECBC
            58FFECBC58FFECBC58FFECBC58FFECBC58FFECBC58FFECBB57FFEABA57FFE5B4
            55FFDAA550FFC98F48FFAD6F3CFF6B3E23FE533B2DE7434343C14343438D4444
            442D666666050000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000004040400C4444444B4641
            3DB3603720FB89532DFFC08345FFD6A151FFE2B057FFE7B759FFE9B95BFFE9BA
            5BFFEAB95AFFEAB95AFFEAB95AFFEAB95AFFEAB95AFFEAB95AFFEAB95AFFEAB9
            5AFF4C3C1DFF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0807
            03FF503F1FFFCBA14EFFEAB95AFFEAB95AFFEAB95AFFEAB95AFFE9BA5BFFE8B7
            5AFFE4B259FFDBA754FFC98F4BFFA36738FF663A20FF4F3D34DE444444BC4343
            437A4242421B0000000100000000000000000000000000000000000000000000
            0000000000000000000000000000000000005555550347474724444040935C36
            23F57B492AFEB97B43FFD39D52FFE1AF5AFFE5B55CFFE6B75DFFE6B75DFFE6B7
            5DFFE6B75DFFE6B75DFFE6B75DFFE6B75DFFE6B75DFFE6B75DFFE6B75DFF8A6D
            38FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF18140AFF785F30FFE2B55BFFE6B75DFFE6B75DFFE6B7
            5DFFE6B55CFFE3B15BFFD9A556FFC4884AFF975D34FF623820FE4B4039D64343
            43AF4141414A2E2E2E0B00000000000000000000000000000000000000000000
            000000000000000000000000000000000000404040104343435C563627E46E41
            26FEB27441FFCD9752FFDDAC5CFFE2B35FFFE4B45FFFE4B45FFFE4B45FFFE4B4
            5FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFFE4B45FFF110D
            07FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF020101FF48391EFFE0B25DFFE4B4
            5FFFE4B45FFFE3B35EFFE0AF5DFFD5A057FFBE8148FF89542FFF5E3420FC4642
            3FC94343438C4444442200000003000000000000000000000000000000000000
            0000000000000000000000000000404040044646462C4A3D37AF60341EFFA567
            3BFFC89051FFD9A65CFFDFB060FFE1B160FFE1B161FFE1B161FFE1B161FFE1B1
            61FFE1B161FFE1B161FFE1B161FFE1B161FFE1B161FFE1B161FFDAAB5EFF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF0B0905FFC49A
            55FFE1B161FFE1B160FFE0B161FFDCAB5EFFD09A57FFB87B46FF6E4125FE5438
            2AE9444444B4434343583333330F000000000000000000000000000000000000
            0000000000000000000000000000434343134343436A593523EF7E4A2CFEBF84
            4DFFD5A25DFFDCAB61FFDDAD63FFDEAE62FFDEAE62FFDEAE62FFDEAE62FFDEAE
            62FFDEAE62FFDEAE62FFDEAE62FFDEAE62FFDEAE62FFDEAE62FF9A7943FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0F0B
            06FFDAAC60FFDEAE62FFDEAE62FFDDAD62FFD9A75FFFCA9254FF9C6139FF5E34
            1EFE47403DCE444444973E3E3E29404040040000000000000000000000000000
            00000000000000000000555555034141412B4C3B34BC623620FEAA6C40FFCE98
            5AFFD9A862FFDBAB64FFDBAB64FFDBAB64FFDBAB64FFDBAB64FFDBAB64FFDBAB
            64FFDBAB64FFDBAB64FFDBAB64FFDBAB64FFDBAB64FFDBAB64FFDBAB64FF1A14
            0CFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF6F5733FFDBAB64FFDBAB64FFDBAB64FFDAA963FFD4A15FFFBB7F4CFF7544
            29FE573628EE434343B64343435B4949490E0000000000000000000000000000
            000000000000000000004040400C454242535B331FF4864F2FFFC08651FFD4A2
            62FFD7A764FFD8A864FFD8A864FFD8A864FFD8A864FFD8A864FFD8A864FFD8A8
            64FFD8A864FFD8A864FFD8A864FFD8A864FFD8A864FFD8A864FFD8A864FFC69A
            5CFF050402FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF21190FFFD8A864FFD8A864FFD8A864FFD8A864FFD6A664FFCA9359FFA165
            3DFF5E321DFF4A3F3AD0434343894545451A0000000000000000000000000000
            00000000000000000000434343174F392FAB60331FFEAE7044FFCB965DFFD4A3
            65FFD5A465FFD5A465FFD5A465FFD5A465FFD5A465FFD5A465FFD5A465FFD5A4
            65FFD5A465FFD5A465FFD5A465FFD5A465FFD5A465FFD5A465FFD5A465FFD5A4
            65FFAD8552FF030201FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF16110BFFD5A465FFD5A465FFD5A465FFD5A465FFD5A466FFD19E61FFBB80
            4FFF794429FE573424F1424242A9444444314040400400000000000000000000
            0000000000000000000246464628573424E57B4529FFBF8654FFCF9D63FFD2A0
            66FFD2A066FFD2A066FFD2A066FFD2A066FFD2A066FFD2A066FFD2A066FF9874
            4AFF5B452CFF4B3924FF7B5D3CFFC4955FFFD2A066FFD2A066FFD2A066FFD2A0
            66FFD2A066FF9F794DFF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF221A11FFD2A066FFD2A066FFD2A066FFD2A066FFD2A066FFD1A065FFC792
            5DFF9C5F3BFF5C311CFE464241BC464646584E4E4E0D00000000000000000000
            0000000000004646460B46403D545C2F1CFD975C39FFC8935FFFCF9C65FFCF9C
            65FFCF9C65FFCF9C65FFCF9C65FFCF9C65FFCF9C65FFB28757FF241B11FF0000
            00FF000000FF000000FF000000FF000000FF4E3A26FFCF9C65FFCF9C65FFCF9C
            65FFCF9C65FFCF9C65FF030201FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF755839FFCF9C65FFCF9C65FFCF9C65FFCF9C65FFCF9C65FFCF9D65FFCC99
            62FFB4774BFF61341EFE4D3B33D8444444843D3D3D1900000000000000000000
            000000000000434343134E392E9F5E321EFEB07249FFCA9663FFCB9965FFCB99
            66FFCB9966FFCB9966FFCB9966FFCB9966FFA37A51FF010100FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF1D160FFFCB9966FFCB99
            66FFCB9966FFCB9966FF0E0A07FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0403
            02FFCB9966FFCB9966FFCB9966FFCB9966FFCB9966FFCB9966FFCB9966FFCB98
            65FFBE8658FF794329FE563526EF444444A54646462880808002000000000000
            00000000000047474719563425D4734026FEBA8055FFC79464FFC89464FFC894
            64FFC89464FFC89464FFC89464FFC69264FF0C0906FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF8A6645FFC894
            64FFC89464FFC89464FF0F0B07FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF010000FF261C13FF916B
            48FFC89464FFC89464FFC89464FFC89464FFC89464FFC89464FFC89464FFC894
            64FFC28D5EFF925736FF5B301CFE454242B24343433955555506000000000000
            0000000000004A41411F5C311DF98C5032FFBE875CFFC48F63FFC48F63FFC48F
            63FFC48F63FFC48F63FFC48F63FF3E2D1FFF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF261C13FFC48F
            63FFC48F63FFC48F63FF19120CFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF020201FF2A1F15FF6B4D36FFBB895FFFC48F63FFC48F
            63FFC48F63FFC48F63FFC48F63FFC48F63FFC48F63FFC48F63FFC48F63FFC48F
            63FFC28D62FFAA6B46FF5C301CFE4C3C35CB434343483333330A000000000000
            0000000000014B332B405B2F1BFFA0603EFFBE885FFFBF8960FFBF8960FFBF89
            60FFBF8960FFBF8960FFBD8760FF010100FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF1E150FFFBF89
            60FFBF8960FFBF8960FF614631FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF050302FFA57653FFBF8960FFBF8960FFBF8960FFBF8960FFBF89
            60FFBF8960FFBF8960FFBF8960FFBF8960FFBF8960FFBF8960FFBF8960FFBF89
            60FFBF8860FFB27651FF683720FD51382CDC444444563B3B3B0D000000000000
            0000555555035234275E5B2F1BFFA96846FFBB835DFFBB845EFFBB845EFFBB84
            5EFFBB845EFFBB845EFF75533BFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF7B573EFFBB84
            5EFFBB845EFFBB845EFFB9825EFF130E0AFF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF010101FF9E6F4FFFBB845EFFBB845EFFBB845EFFBB845EFFBB845EFFBB84
            5EFFBB845EFFBB845EFFBB845EFFBB845EFFBB845EFFBB845EFFBB845EFFBB84
            5EFFBB845EFFB57B56FF723C22FF543627E44242426440404010000000000000
            0000555555065435277D5F321EFDAB6B49FFB77D5AFFB77E5AFFB77E5AFFB77E
            5AFFB77E5AFFB77E5AFF2E2017FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF010100FF533929FFB77E5AFFB77E
            5AFFB77E5AFFB77E5AFFB77E5AFFAD7856FF1F150FFF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF624330FFB77E5AFFB77E5AFFB77E5AFFB77E5AFFB77E5AFFB77E5AFFB77E
            5AFFB77E5AFFB77E5AFFB77E5AFFB77E5AFFB77E5AFFB77E5AFFB77E5AFFB77E
            5AFFB77E5AFFB57A56FF7A4125FF583424ED4444447143434313000000000000
            0000404040085534259566351FFCAC6D4BFFB47958FFB47958FFB47958FFB479
            58FFB47958FFB47958FF060403FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF130D09FF99674BFFB47958FFB47958FFB479
            58FFB47958FFB47958FFB47958FFB47958FFB47958FF7B533CFF2B1D15FF0704
            03FF000000FF000000FF000000FF000000FF000000FF000000FF010101FF6746
            33FFB47958FFB47958FFB47958FF8B5D44FF2B1D15FF080604FF080604FF100B
            08FF573A2AFFB27756FFB47958FFB47958FFB47958FFB47958FFB47958FFB479
            58FFB47958FFB37956FF83462BFF5B3321F54343437949494915000000000000
            000055555506583322A56E3A22FDAC704FFFB17757FFB17757FFB17757FFB177
            57FFB17757FFAD7555FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF010000FF503627FFB17757FFB17757FFB17757FFB17757FFB177
            57FFB17757FFB17757FFB17757FFB17757FFB17757FFB17757FFB17757FFB177
            57FF9E6A4DFF573B2BFF271A13FF221711FF251912FF573A2BFFA77153FFB177
            57FFB17757FFB17757FF402B1FFF000000FF000000FF000000FF000000FF0000
            00FF000000FF030201FF956449FFB17757FFB17757FFB17757FFB17757FFB177
            57FFB17757FFB17656FF8B4D30FF5B311EFA4444447043434313000000000000
            00005555550359311FB6763E25FFAC6F51FFAF7457FFAF7457FFAF7457FFAF74
            57FFAF7457FF7D533FFF000000FF000000FF000000FF000000FF000000FF0000
            00FF1A110DFF96634BFFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF74
            57FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF74
            57FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF74
            57FFAF7457FF644332FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF090604FFA97055FFAF7457FFAF7457FFAF7457FFAF74
            57FFAF7457FFAE7355FF915336FF5D301CFE4442426440404010000000000000
            0000000000005A301EAF763D25FFAB6E50FFAE7256FFAE7256FFAE7256FFAE72
            56FFAE7256FF4C3226FF000000FF2F1F17FF7D523EFF201510FF211611FF8B5B
            45FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE72
            56FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE72
            56FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE72
            56FFAE7256FF3F2A1FFF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF36231BFFAE7256FFAE7256FFAE7256FFAE72
            56FFAE7256FFAD7154FF915337FF5C311DFE414141563B3B3B0D000000000000
            0000000000005A311E966E3B24FCA96A4DFFAC7155FFAC7155FFAC7155FFAC71
            55FFAC7155FF956249FF402A20FFAA7155FFAC7155FFAC7155FFAC7155FFAC71
            55FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC71
            55FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC71
            55FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC71
            55FFAC7155FF472F23FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF18100CFFAC7155FFAC7155FFAC7155FFAC71
            55FFAC7155FFAB6F53FF8A4E33FF5C321FF94444444739393909000000000000
            0000000000005831217C673723FAA76749FFAC7054FFAC7155FFAC7155FFAC71
            55FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC71
            55FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FF503528FF291B14FF1B12
            0DFF35231AFF704A38FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC71
            55FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC7155FFAC71
            55FFAC7155FFA26A4FFF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF090604FFAC7155FFAC7155FFAC7155FFAC71
            55FFAC7155FFAA6D52FF83492EFF5B3422F14646463755555506000000000000
            00000000000059312160623520FBA46347FFAC7055FFAD7257FFAD7257FFAD72
            57FFAD7257FFAD7257FFAD7257FFAD7257FFAD7257FFAD7257FFAD7257FFAD72
            57FFAD7257FFAD7257FFAD7257FF7D533FFF090605FF000000FF000000FF0000
            00FF000000FF000000FF100B08FF98644DFFAD7257FFAD7257FFAD7257FFAD72
            57FFAD7257FFAD7257FFAD7257FFAD7257FFAD7257FFAD7257FFAD7257FFAD72
            57FFAD7257FFAD7257FF241812FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF040302FFAD7257FFAD7257FFAD7257FFAD72
            57FFAD7257FFAA6D51FF7C432AFF573424E54343432600000002000000000000
            000000000000583521415E321FFEA26245FFAD7256FFAF7459FFAF7459FFAF74
            59FFAF7459FFAF7459FFAF7459FFAF7459FFAF7459FFAF7459FFAF7459FFAF74
            59FFAF7459FFAF7459FF7B513FFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF0E0907FFAD7459FFAF7459FFAF7459FFAF74
            59FFAF7459FFAF7459FFAF7459FFAF7459FFAF7459FFAF7459FFAF7459FFAF74
            59FFAF7459FFAF7459FF845843FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF150E0BFFAF7459FFAF7459FFAF7459FFAF74
            59FFAE7459FFAA6D50FF743F28FE553526CB4040401800000000000000000000
            000000000000583018205E321FFF9C5C41FFAF765CFFB17960FFB17960FFB179
            60FFB17960FFB17960FFB17960FFB17960FFB17960FFB17960FFB17960FFB179
            60FFB17960FFB17960FF0B0806FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF885D4AFFB17960FFB17960FF3725
            1EFF090605FF0D0907FF100B09FF1A120EFF8B5F4BFFB17960FFB17960FFB179
            60FFB17960FFB17960FFB17960FF120C09FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF3C2921FFB17960FFB17960FFB17960FFB179
            60FFB0785EFFA96B50FF6A3C26FD553425A83B3B3B0D00000000000000000000
            000000000000000000005E321DEA884F34FFB0785EFFB47E66FFB47E66FFB47E
            66FFB47E66FFB47E66FFB47E66FFB47E66FFB47E66FFB47E66FFB47E66FFB47E
            66FFB47E66FF926753FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF8B624FFFAA7860FF140E0BFF0000
            00FF000000FF000000FF000000FF000000FF000000FF5D4134FFB47E66FFB47E
            66FFB47E66FFB47E66FFB47E66FF714F40FF000000FF000000FF000000FF0000
            00FF000000FF000000FF010100FFA5745EFFB47E66FFB47E66FFB47E66FFB47E
            66FFB27A62FFA26448FF5F331FFE523629634040400400000000000000000000
            000000000000000000005B2F1D99723F29FCAE735AFFB6816AFFB7836CFFB783
            6CFFB7836CFFB7836CFFB7836CFFB7836CFFB7836CFFB7836CFFB7836CFFB783
            6CFFB7836CFF5A4135FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF050303FFB37F6AFF755445FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF7B5849FFB783
            6CFFB7836CFFB7836CFFB7836CFFB7836CFF140F0CFF000000FF000000FF0000
            00FF000000FF000000FF3A2922FFB7836CFFB7836CFFB7836CFFB7836CFFB783
            6CFFB37C63FF8C5239FF5C321FF84040361C0000000000000000000000000000
            000000000000000000005B2F1D45603520FCA6694FFFB7836CFFBA8871FFBA88
            71FFBA8871FFBA8871FFBA8871FFBA8871FFBA8871FFBA8871FFBA8871FFBA88
            71FFBA8871FF5C4438FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF6F5143FFBA8871FF584036FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF0C0907FFBA88
            71FFBA8871FFBA8871FFBA8871FFBA8871FF946C5AFF000000FF000000FF0000
            00FF000000FF000000FFA97C67FFBA8871FFBA8871FFBA8871FFBA8871FFB986
            71FFB17960FF74422BFE573221C24949490E0000000000000000000000000000
            00000000000000000000404000045E331EF590573DFFB8866FFFBD8D78FFBD8D
            78FFBD8D78FFBD8D78FFBD8D78FFBD8D78FFBD8D78FFBD8D78FFBD8D78FFBD8D
            78FFBD8D78FF74574AFF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF281E1AFFBD8D78FFBD8D78FF3F2F28FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFBB8B
            76FFBD8D78FFBD8D78FFBD8D78FFBD8D78FFBD8D78FFAC806DFF5F473CFF0100
            00FF000000FF2D221CFFBD8D78FFBD8D78FFBD8D78FFBD8D78FFBD8D78FFBA89
            73FFAB6F55FF613622FD5435246A555555030000000000000000000000000000
            00000000000000000000000000005C2F1BAA76442CFCB58068FFBE907BFFC092
            7EFFC0927EFFC0927EFFC0927EFFC0927EFFC0927EFFC0927EFFC0927EFFC092
            7EFFC0927EFFBA8E7AFF010000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF020101FFBA8E7AFFC0927EFFC0927EFF3D2E28FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFC092
            7EFFC0927EFFC0927EFFC0927EFFC0927EFFC0927EFFC0927EFFC0927EFF0000
            00FF000000FFA77F6EFFC0927EFFC0927EFFC0927EFFC0927EFFBF917DFFBA89
            73FF955B41FF5E311FFA463A2E16000000000000000000000000000000000000
            00000000000000000000000000005C2E1C48603520FCA46A50FFBE8F7AFFC297
            83FFC29783FFC29783FFC29783FFC29783FFC29783FFC29783FFC29783FFC297
            83FFC29783FFC29783FF1B1512FF000000FF000000FF000000FF000000FF0000
            00FF000000FF201915FFC29783FFC29783FFC29783FF372A25FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF0C0908FFC297
            83FFC29783FFC29783FFC29783FFC29783FFC29783FFC29783FFBE9581FF0000
            00FF302520FFC29783FFC29783FFC29783FFC29783FFC29783FFC0937FFFB47E
            66FF71402BFC5A301DB400000002000000000000000000000000000000000000
            0000000000000000000000000000000000005D301CC77B4832FCB8866FFFC499
            86FFC59C89FFC59C89FFC59C89FFC59C89FFC59C89FFC59C89FFC59C89FFC59C
            89FFC59C89FFC59C89FF473831FF000000FF000000FF000000FF000000FF0000
            00FF000000FF57453DFFC59C89FFC59C89FFBF9885FF010101FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF876B5EFFC59C
            89FFC59C89FFC59C89FFC59C89FFC59C89FFC59C89FFC59C89FFC59C89FF100C
            0BFFAE8A79FFC59C89FFC59C89FFC59C89FFC59C89FFC59B88FFBF917CFF975F
            46FF5E331FFD5432212D00000000000000000000000000000000000000000000
            0000000000000000000000000000000000005B301D355F3420FEA16850FFC398
            84FFC8A18FFFC8A190FFC8A190FFC8A190FFC8A190FFC8A190FFC8A190FFC8A1
            90FFC8A190FFC8A190FF786157FF000000FF000000FF000000FF000000FF0000
            00FF010101FFAB8A7BFFC8A190FFC8A190FF7F665CFF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF29211EFFC8A190FFC8A1
            90FFC8A190FFC8A190FFC8A190FFC8A190FFC8A190FFC8A190FFC8A190FF997B
            6EFFC8A190FFC8A190FFC8A190FFC8A190FFC8A190FFC69C8AFFB58068FF6C3E
            2AFC5A311E9F0000000100000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000005E301BAD75452FF9BA88
            72FFC9A291FFCBA596FFCBA596FFCBA596FFCBA596FFCBA596FFCBA596FFCBA5
            96FFCBA596FFCBA596FFA38478FF000000FF000000FF1A1513FF2C2421FF2D25
            21FF9C7E73FFCBA596FFCBA596FFCBA596FF40342FFF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF040303FFBA978AFFCBA596FFCBA5
            96FFCBA596FFCBA596FFCBA596FFCBA596FFCBA596FFCBA596FFCBA596FFCBA5
            96FFCBA596FFCBA596FFCBA596FFCBA596FFCBA495FFC39884FF925C44FF5F33
            1FF752331E190000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000005A2D1E225E3420FC9B63
            4BFFC49988FFCEA99BFFCFAB9CFFCFAB9CFFCFAB9CFFCFAB9CFFCFAB9CFFCFAB
            9CFFCFAB9CFFCFAB9CFFCBA798FF000000FF000000FFC19F91FFCFAB9CFFCFAB
            9CFFCFAB9CFFCFAB9CFFCFAB9CFFCFAB9CFF453934FF000000FF000000FF0000
            00FF000000FF000000FF000000FF0F0C0BFFB69689FFCFAB9CFFCFAB9CFFCFAB
            9CFFCFAB9CFFCFAB9CFFCFAB9CFFCFAB9CFFCFAB9CFFCFAB9CFFCFAB9CFFCFAB
            9CFFCFAB9CFFCFAB9CFFCFAB9CFFCEAA9BFFC9A291FFB27D66FF683C28FA5B30
            1C81000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000005D311D82663A
            26FAAB755EFFCAA494FFD2B0A3FFD2B1A4FFD2B1A4FFD2B1A4FFD2B1A4FFD2B1
            A4FFD2B1A4FFD2B1A4FFD2B1A4FF020101FF1B1615FFD2B1A4FFD2B1A4FFD2B1
            A4FFD2B1A4FFD2B1A4FFD2B1A4FFD2B1A4FFD2B1A4FF493D38FF060504FF0000
            00FF000000FF000000FF27211FFFCEAFA2FFD2B1A4FFD2B1A4FFD2B1A4FFD2B1
            A4FFD2B1A4FFD2B1A4FFD2B1A4FFD2B1A4FFD2B1A4FFD2B1A4FFD2B1A4FFD2B1
            A4FFD2B1A4FFD2B1A4FFD2B0A3FFCEAA9BFFBC8B77FF7A4934FC5E321DDE5D2F
            170B000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000015E31
            1DB56F412DF9B6846EFFD0AD9FFFD5B6A9FFD5B7AAFFD5B7AAFFD5B7AAFFD5B7
            AAFFD5B7AAFFD5B7AAFFD5B7AAFF0C0A09FF9F887FFFD5B7AAFFD5B7AAFFD5B7
            AAFFD5B7AAFFD5B7AAFFD5B7AAFFD5B7AAFFD5B7AAFFD5B7AAFF8B786FFF0000
            00FF000000FF25201EFFD5B7AAFFD5B7AAFFD5B7AAFFD5B7AAFFD5B7AAFFD5B7
            AAFFD5B7AAFFD5B7AAFFD5B7AAFFD5B7AAFFD5B7AAFFD5B7AAFFD5B7AAFFD5B7
            AAFFD5B7AAFFD5B7AAFFD3B2A5FFC49886FF88543FFE603120F3552B1C240000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000552B
            150C5D321EDA7A4B35FBC0927FFFD4B4A8FFD8BBB0FFD9BCB1FFD9BCB1FFD9BC
            B1FFD9BCB1FFD9BCB1FFD9BCB1FF6F605AFFD9BCB1FFD9BCB1FFD9BCB1FFD9BC
            B1FFD9BCB1FFD9BCB1FFD9BCB1FFD9BCB1FFD9BCB1FFD9BCB1FF1B1816FF0000
            00FF090807FFD1B4ABFFD9BCB1FFD9BCB1FFD9BCB1FFD9BCB1FFD9BCB1FFD9BC
            B1FFD9BCB1FFD9BCB1FFD9BCB1FFD9BCB1FFD9BCB1FFD9BCB1FFD9BCB1FFD9BC
            B1FFD9BCB1FFD7B9ADFFCAA393FF98634DFF603520FC582E1B42000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00005D2E17215F3320F1875640FEC59B89FFD7B9ADFFDBC1B7FFDCC2B8FFDCC2
            B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2
            B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FF040404FF0D0B
            0BFFC5ADA4FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2
            B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2B8FFDCC2
            B7FFDABEB3FFCDA99AFFA57059FF623824FC5B2F1B6800000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000059311C3F5F3321F984543FFCC19482FFD7BAAEFFDFC6BDFFDFC8
            BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8
            BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFC7B3ABFFD7C0
            B7FFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8
            BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC8BFFFDFC7BEFFDBC0
            B7FFCBA596FF9E6B53FF633925FB5D301E930000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000005A2D19335F331EEA774935FAB98A76FFD7BAAEFFE1CB
            C2FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CD
            C5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CD
            C5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CD
            C5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE3CDC5FFE2CCC4FFDCC2B7FFC89F
            8FFF905F48FE613622FD5C311E79000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000005C331F195E321DCF6E422EF9AF7E69FFD5B6
            A9FFE1CAC1FFE6D1CBFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3
            CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3
            CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D3
            CDFFE6D3CDFFE6D3CDFFE6D3CDFFE6D2CCFFE3CDC6FFDBBFB5FFC19583FF8352
            3DFB5F3420F75A301A4F00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000602020085D301CA9653A27FA9461
            4CFFC49988FFDCC1B7FFE5D1CAFFE9D8D2FFEAD8D3FFEAD8D3FFEAD8D3FFEAD8
            D3FFEAD8D3FFEAD8D3FFEAD8D3FFEAD8D3FFEAD8D3FFEAD8D3FFEAD8D3FFEAD8
            D3FFEAD8D3FFEAD8D3FFEAD8D3FFEAD8D3FFEAD8D3FFEAD8D3FFEAD8D3FFEAD8
            D3FFEAD8D3FFE9D8D3FFE7D4CEFFE0C8C0FFCFAB9CFFA87661FF724531F95E33
            1FE6592C1C2E0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000005E311D686033
            1FED6E412FF99E6D57FFCBA596FFE0C9C0FFE8D5D0FFEBDBD7FFEDDEDAFFEDDE
            DAFFEDDEDAFFEDDEDAFFEDDEDAFFEDDEDAFFEDDEDAFFEDDEDAFFEDDEDAFFEDDE
            DAFFEDDEDAFFEDDEDAFFEDDEDAFFEDDEDAFFEDDEDAFFEDDEDAFFEDDEDAFFECDC
            D8FFE9D8D3FFE4CEC8FFD5B6AAFFB1836EFF7D4D3AFA613622FD5D311D9B5531
            1815000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000005D2E
            170B5D311D7E603521F6744635F9A67560FFCAA494FFDDC3BAFFE6D2CBFFEADA
            D5FFEEE0DCFFF0E3E0FFF0E3E1FFF0E3E1FFF0E3E1FFF0E3E1FFF0E3E1FFF0E3
            E1FFF0E3E1FFF0E3E1FFF0E3E1FFF0E3E1FFEFE1DEFFECDCD7FFE8D5CFFFE1CB
            C2FFD2B0A4FFB78A75FF855541FC633926FE5E321EB25C2E1A27000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000553118155D301E93603722FB6A412DF9855541FDA97A66FFC9A2
            92FFDCC2B8FFE6D3CDFFE9D7D2FFEAD9D4FFECDCD7FFEDDEDAFFEEDFDCFFEDDE
            DBFFECDCD8FFEADBD5FFE9D8D3FFE7D5CEFFE1CBC2FFD1AEA0FFB58875FF9160
            4CFF734734F9633926FF5F321EC65D2E1C370000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000552B1C125C2E1B5E5F311EB3633724F8683F
            2CFB7F513BFB94644EFFA3745FFFAF816EFFBA8F7EFFC69D8DFFCCA797FFC9A1
            91FFBF9584FFB38775FFA77965FF996954FF885743FE704532F9633926FF5F33
            1FD45A2F1B7C5D2E1D2C00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000055391C095C2E
            1A4E5E301D9D603420CB633623E6633725F9643A28FF663D2AFF693F2DFC673E
            2BFF653B28FF643926FD623724ED613521D65F311EB45C2F1A6C582C1A1D0000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000603020105B31182A5D2E1B425D31
            1D345C331F195555000300000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000FFFF
            FFF80FFFFFFFFFFFFE00007FFFFFFFFFF0000007FFFFFFFFC0000001FFFFFFFF
            00000000FFFFFFFC000000003FFFFFF8000000001FFFFFF00000000007FFFFC0
            0000000003FFFF800000000001FFFF800000000000FFFF0000000000007FFE00
            00000000007FFC0000000000003FFC0000000000001FF80000000000001FF800
            00000000000FF00000000000000FF000000000000007E000000000000007E000
            000000000007E000000000000003C000000000000003C000000000000003C000
            000000000001C000000000000001C00000000000000180000000000000018000
            0000000000018000000000000001800000000000000180000000000000018000
            000000000001C000000000000001C000000000000001C000000000000001C000
            000000000001C000000000000003C000000000000003E000000000000003E000
            000000000007E000000000000007E000000000000007F00000000000000FF000
            00000000000FF80000000000001FF80000000000001FFC0000000000003FFC00
            00000000007FFE0000000000007FFE000000000000FFFF000000000001FFFF80
            0000000003FFFFC00000000007FFFFE0000000000FFFFFF0000000001FFFFFF8
            000000003FFFFFFE000000007FFFFFFF00000001FFFFFFFFC0000007FFFFFFFF
            F000001FFFFFFFFFFE0000FFFFFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFF2800
            0000300000006000000001002000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000005555550333333305555555064949
            4907404040084040400849494907555555063333330555555503000000010000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000001404040044040400840404010444444314242424D4343435F4643
            437244424281464444854343437643434363444444524444443C464646163333
            330A333333050000000200000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000014949
            490746464616434343454441417C434342AD464543C2494743C64B453FCC5144
            3AD3544334DA534436D84F443CD14A4440C9484744C5464543C3444443B84444
            448B454545554444442239393909000000020000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000012B2B2B06464646164242
            4261444443AF4A4541C6544235DA613E28F06C4021FC714521FD794A24FC8152
            26FC8A5829FD865428FD7D4E25FC754723FC6F4322FD683D23F85A3E2EE64F43
            3BD3464543C6444443BB4242427C434343263939390900000001000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000023C3C3C1143434357454544AA4F42
            39D3643D26F4714522FD895629FDA4682EFFBA7933FFC28235FFC68736FFCB8C
            37FFCF9138FFCD8F37FFC98937FFC48436FFC07F35FFB17231FF985F2BFE7B4C
            25FC6B3F22FB5B3E2DE9494541CB454444B8444444713C3C3C1E404040040000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000004040400442424223454444924B423CCD613D27F2794B
            26FCA6692FFFC08036FFCD8F39FFD99F3CFFE2A93EFFE6AD3EFFE8B03EFFEBB4
            3FFFEDB640FFECB53FFFEAB23EFFE7AF3EFFE4AB3EFFDFA53CFFD3963AFFC788
            38FFB67635FF925C2CFD6B4022FC573F31E3474645C7434343AB3F3F3F3D4040
            4008000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000004949490744444438454342AA5B3E2CEA734624FCA06530FFC485
            3BFFD89E40FFE3AA41FFEAB443FFF1BD44FFF5C145FFF6C346FFF7C346FFF7C4
            45FFF8C546FFF8C545FFF7C346FFF7C246FFF6C245FFF4C045FFEEB843FFE6B0
            43FFDFA641FFCF933DFFB67737FF8A562BFD683E23FA4E4139D7434343BA4040
            405B3B3B3B0D0000000100000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000404040084545454E47433FBD623B25F58B572DFDBE7F3BFFD49942FFE3AC
            46FFEFBA49FFF2BF4AFFF4C14BFFF6C34BFFF7C44BFFF7C44BFFF7C44CFFF7C4
            4CFFF7C44CFFF7C44CFFF7C44CFFF7C44BFFF7C44BFFF6C44BFFF5C34AFFF3C1
            4AFFF2BE4AFFEAB448FFDDA545FFCA8E40FFAD6F35FF6F4324FC543F33E14343
            43C1414141794040401000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000002B2B
            2B06444444404B403CC6673C22FA9A6132FEC88D42FFDEA84AFFEAB74EFFEFBD
            50FFF2C050FFF2C150FFF3C150FFF3C150FFF3C150FFF3C150FFF3C150FFF3C1
            50FFF3C150FFF3C150FFF3C150FFF3C150FFF3C150FFF3C150FFF3C150FFF2C1
            50FFF2C150FFF1BF50FFEEBB4EFFE5B04CFFD69E47FFB7793BFF794A29FC5B3D
            2CEC434342C34545456F4646460B000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000555555034343
            432E4A3F3BBE673D23FCA76B37FFCD9348FFE2AD50FFEBBA54FFEEBD54FFEFBE
            55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFEFBE55FFBF9844FF413417FF3E31
            16FF443618FF48391AFF52411DFF927334FFE4B651FFEFBE55FFEFBE55FFEFBE
            55FFEFBE55FFEFBE55FFEEBE55FFEDBB54FFE8B653FFD9A24DFFBF8142FF8452
            2DFD5B3928F0444444BF43434357404040080000000000000000000000000000
            00000000000000000000000000000000000000000000000000013E3E3E1D4640
            3DA9643923FAA56938FFD0974CFFE2AE55FFE9B859FFEBBA59FFEBBB59FFEBBB
            59FFEBBB59FFEBBB59FFEBBB59FFEBBB59FF3C3017FF010100FF000000FF0000
            00FF000000FF000000FF000000FF010100FF000000FF060502FF2A2110FF775E
            2DFFE3B557FFEBBB59FFEBBB59FFEBBA59FFEABA59FFE7B558FFDAA451FFC285
            45FF7B4A2AFC553D2FE6434343BA4545453F4040400400000000000000000000
            000000000000000000000000000000000000000000003333330A444141775F39
            25F4965E34FECC944EFFE1AF59FFE6B55CFFE7B75CFFE7B75CFFE7B75CFFE7B7
            5CFFE7B75CFFE7B75CFFE7B75CFF68522AFF010100FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0101
            00FF010100FF2A2111FFA48242FFE7B75CFFE7B75CFFE7B65DFFE4B35BFFD9A5
            56FFB97C43FF6E4127FC4E3E35DB434343A34040401400000000000000000000
            000000000000000000000000000000000000808080024040402C57382AE38450
            2FFDC48B4DFFDCAA5BFFE2B35FFFE3B35FFFE3B35FFFE3B35FFFE3B35FFFE3B3
            5FFFE3B35FFFE3B35FFFE3B35FFF040302FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF010100FF070603FFB28D4AFFE3B35FFFE3B35FFFE1B0
            5EFFD39E55FFAE713FFF633922FC47413ECB4242425D49494907000000000000
            0000000000000000000000000000000000004646460B483E3A96653A23FCBA7E
            48FFD6A45CFFDEAE61FFDFAF62FFDFAF62FFDFAF62FFDFAF62FFDFAF62FFDFAF
            62FFDFAF62FFDFAF62FFBC9453FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF010101FF9A7943FFDFAF62FFDFAF
            61FFDCAB60FFCC9655FF915935FE593828EE434343AF4646461D000000010000
            000000000000000000000000000055555503414141335A3727EC945C36FFCF9A
            5AFFDAAA62FFDBAB64FFDBAB64FFDBAB64FFDBAB64FFDBAB64FFDBAB64FFDBAB
            64FFDBAB64FFDBAB64FFD3A560FF060503FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF020201FFDBAB64FFDBAB
            64FFDBAB64FFD7A660FFBD814DFF683D24FC483E3BCF45454568494949070000
            0000000000000000000000000000494949074B3C3589683B24FCBC824FFFD5A4
            62FFD7A764FFD7A764FFD7A764FFD7A764FFD7A764FFD7A764FFD7A764FFD7A7
            64FFD7A764FFD7A764FFD7A764FFA8824EFF010101FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FFC89B5DFFD7A7
            64FFD7A764FFD7A664FFCD995DFF99603AFF5B3624F3434343A43B3B3B0D0000
            00000000000000000000000000003737370E5A3525E5965B38FFCB965EFFD3A2
            65FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A265FFD3A2
            65FFD3A265FFD3A265FFD3A265FFD3A265FF8E6D44FF010000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF010100FF917046FFD3A2
            65FFD3A265FFD3A265FFD29F64FFBD8352FF663923FC49403BCA3D3D3D2E8080
            8002000000000000000080808002443F3F345D331EFCB5794DFFCE9B64FFCF9D
            66FFCF9D66FFCF9D66FFCF9D66FFCD9B66FF533F28FF010101FF010000FF0302
            01FF0F0B07FFA98053FFCF9D66FFCF9D66FFCF9D66FF100C08FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF010000FFBA8D5CFFCF9D
            66FFCF9D66FFCF9D66FFCF9D65FFC99460FF874F30FE52392DE2424242654949
            49070000000000000000555555064F382F8D6F3E27FBC18B5BFFCB9765FFCB98
            65FFCB9865FFCB9865FFCB9865FF17110BFF010000FF000000FF000000FF0000
            00FF000000FF010101FF99724CFFCB9865FFCB9865FF2C2116FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF010000FF201810FFCB9865FFCB98
            65FFCB9865FFCB9865FFCB9865FFCA9664FFA56A43FF5C3321F7444444974D4D
            4D0A0000000000000000404040085A3625CE8E5435FFC38E61FFC69163FFC691
            63FFC69163FFC69163FF57402CFF010000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF251B13FFC69163FFC69163FF553E2BFF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF010000FF010101FF1B140DFF76573BFFC69163FFC69163FFC691
            63FFC69163FFC69163FFC69163FFC69163FFB87D53FF603420FC46413EB74040
            400C0000000000000000393939095D321EF3A66744FFC08A60FFC08B61FFC08B
            61FFC08B61FFBE8961FF010101FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF080604FFC08B61FFC08B61FF815D42FF010000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF010000FF513B29FFC08B61FFC08B61FFC08B61FFC08B61FFC08B61FFC08B
            61FFC08B61FFC08B61FFC08B61FFC08B61FFBC845BFF754027FC4D3B33D43939
            391200000000000000004646460B5E311DFAAE6F4BFFBA835CFFBA835CFFBA83
            5CFFBA835CFF76533AFF010100FF000000FF000000FF000000FF000000FF0000
            00FF000000FF010000FF533A29FFBA835CFFBA835CFFB8815CFF281C14FF0100
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF513928FFBA835CFFBA835CFFBA835CFFBA835CFFBA835CFFBA835CFFBA83
            5CFFBA835CFFBA835CFFBA835CFFBA835CFFBA825BFF83492DFF51392DDD4646
            462100000001000000004D3333145F321EFBAD704EFFB47B58FFB47B58FFB47B
            58FFB47B58FF2D1E16FF000000FF000000FF000000FF000000FF000000FF0000
            00FF020101FF644531FFB47B58FFB47B58FFB47B58FFB47B58FFB47B58FF4F36
            26FF020101FF010100FF000000FF000000FF000000FF000000FF000000FF4730
            23FFB47B58FFB47B58FFB27B58FF684833FF553A29FF6D4B35FFB47B58FFB47B
            58FFB47B58FFB47B58FFB47B58FFB47B58FFB47B58FF8B5033FF553729E74242
            423255555503000000005431262C633520F9AE7251FFB27757FFB27757FFB277
            57FFB27757FF080504FF000000FF000000FF000000FF000000FF010000FF1B12
            0DFFA46E51FFB27757FFB27757FFB27757FFB27757FFB27757FFB27757FFB277
            57FFB27757FF8E5F46FF483023FF140D0AFF19100CFF39271CFF6C4935FFB277
            57FFB27757FF6B4734FF010101FF010100FF010000FF010000FF030201FF7A51
            3CFFB27757FFB27757FFB27757FFB27757FFB27757FF955739FF5A3525EE4444
            442D8080800200000000593320426A3823F8AD7153FFAF7457FFAF7457FFAF74
            57FFAF7457FF010000FF010101FF000000FF000000FF050303FF634232FFAF74
            57FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF74
            57FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF74
            57FFAD7255FF000000FF000000FF000000FF000000FF000000FF000000FF0201
            01FF98654CFFAF7457FFAF7457FFAF7457FFAF7457FF9B5B3EFF5C3422F44040
            401C000000010000000058302133673722F6AC6F52FFAE7256FFAE7256FFAE72
            56FFA66C52FF070503FF835641FF9B664DFF6F4937FFAE7256FFAE7256FFAE72
            56FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE72
            56FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE7256FFAE72
            56FF99644CFF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF3C271DFFAE7256FFAE7256FFAE7256FFAD7155FF97593DFF5D3625EF3333
            330F00000000000000004F31271962331FF7A86A4EFFAC6F55FFAC6F55FFAC6F
            55FFAC6F55FFAC6F55FFAC6F55FFAC6F55FFAC6F55FFAC6F55FFAC6F55FFAC6F
            55FFAC6F55FF885844FF55372AFF5E3D2FFF6B4535FFAA6F55FFAC6F55FFAC6F
            55FFAC6F55FFAC6F55FFAC6F55FFAC6F55FFAC6F55FFAC6F55FFAC6F55FFAC6F
            55FFAC6F55FF050302FF000000FF000000FF000000FF000000FF000000FF0000
            00FF211510FFAC6F55FFAC6F55FFAC6F55FFAC6F54FF8F5237FF593628E14040
            400C0000000000000000333333055F321FF8A7684CFFAC7157FFAC7158FFAC71
            58FFAC7158FFAC7158FFAC7158FFAC7158FFAC7158FFAC7158FFAC7158FFAC71
            58FF3A261EFF010000FF010100FF010101FF010100FF040202FF855744FFAC71
            58FFAC7158FFAC7158FFAC7158FFAC7158FFAC7158FFAC7158FFAC7158FFAC71
            58FFAC7158FF452E24FF000000FF000000FF000000FF000000FF000000FF0000
            00FF1E140FFFAC7158FFAC7158FFAC7158FFAC7056FF864B32FF563829C73939
            39090000000000000000000000015F331EEFA4664AFFAF775DFFAF775EFFAF77
            5EFFAF775EFFAF775EFFAF775EFFAF775EFFAF775EFFAF775EFFAF775EFF6846
            37FF010000FF000000FF000000FF000000FF000000FF000000FF070504FFAF77
            5EFFAF775EFF7B5442FF583B2FFF5D3F32FF7F5644FFAF775EFFAF775EFFAF77
            5EFFAF775EFFA57159FF010100FF000000FF000000FF000000FF000000FF0101
            01FF664637FFAF775EFFAF775EFFAF775EFFAF765CFF7B442DFD5335289A3333
            330500000000000000000000000061331EC8955A3FFFB37C63FFB37D65FFB37D
            65FFB37D65FFB37D65FFB37D65FFB37D65FFB37D65FFB37D65FFB37D65FF130D
            0BFF000000FF000000FF000000FF000000FF000000FF000000FF020101FFB37D
            65FF453027FF010000FF010100FF010100FF000000FF523A2FFFB37D65FFB37D
            65FFB37D65FFB37D65FF2E211AFF000000FF000000FF000000FF000000FF0101
            01FFB17D65FFB37D65FFB37D65FFB37D65FFAF765CFF673824FB57372A4F0000
            00010000000000000000000000005B301D6C79442DF9B58069FFB7836CFFB783
            6CFFB7836CFFB7836CFFB7836CFFB7836CFFB7836CFFB7836CFFB7836CFF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF221914FFB783
            6CFF000000FF000000FF000000FF000000FF000000FF000000FF422F27FFB783
            6CFFB7836CFFB7836CFFA97964FF010101FF000000FF000000FF000000FF2319
            15FFB7836CFFB7836CFFB7836CFFB7836CFFA76C51FF5E331FF84040400C0000
            000000000000000000000000000059311E1A623520F4B27A63FFBB8A74FFBB8A
            75FFBB8A75FFBB8A75FFBB8A75FFBB8A75FFBB8A75FFBB8A75FFBB8A75FF0202
            01FF000000FF000000FF000000FF000000FF000000FF010100FFAA7E6AFFB182
            6FFF000000FF000000FF000000FF000000FF000000FF000000FF040303FFBB8A
            75FFBB8A75FFBB8A75FFBB8A75FF6A4E42FF0B0807FF000000FF000000FF9870
            60FFBB8A75FFBB8A75FFBB8A75FFBA8872FF90573FFF5D3623C1333333050000
            00000000000000000000000000000000000060341FD9A0674EFFBE8F7BFFBF91
            7DFFBF917DFFBF917DFFBF917DFFBF917DFFBF917DFFBF917DFFBF917DFF130E
            0CFF000000FF000000FF000000FF000000FF000000FF372A24FFBF917DFFA47C
            6BFF010100FF000000FF000000FF000000FF000000FF000000FF020201FFBF91
            7DFFBF917DFFBF917DFFBF917DFFBF917DFFBF917DFF000000FF1E1714FFBF91
            7DFFBF917DFFBF917DFFBF917DFFBB8A74FF703E28F959322355000000000000
            0000000000000000000000000000000000005B2F1B6875422BF4BE8E7AFFC398
            84FFC39884FFC39884FFC39884FFC39884FFC39884FFC39884FFC39884FF4133
            2CFF000000FF000000FF000000FF000000FF010000FFB78E7CFFC39884FF8A6B
            5DFF010100FF000000FF000000FF000000FF000000FF000000FF090706FFC398
            84FFC39884FFC39884FFC39884FFC39884FFC39884FF010101FFA07D6DFFC398
            84FFC39884FFC39884FFC29683FFA77057FF603420F04D33330A000000000000
            0000000000000000000000000000000000004040000460331EE5A46E55FFC59C
            89FFC79F8DFFC79F8DFFC79F8DFFC79F8DFFC79F8DFFC79F8DFFC79F8DFF7860
            55FF010101FF000000FF000000FF000000FF120E0DFFC79F8DFFC79F8DFF201A
            17FF000000FF000000FF000000FF000000FF000000FF010100FF8B6F63FFC79F
            8DFFC79F8DFFC79F8DFFC79F8DFFC79F8DFFC79F8DFF5E4B43FFC79F8DFFC79F
            8DFFC79F8DFFC79F8DFFC0937FFF72422DF95C31206B00000000000000000000
            000000000000000000000000000000000000000000005C2E1C536E3E28F3C295
            83FFCAA594FFCBA595FFCBA595FFCBA595FFCBA595FFCBA595FFCBA595FFA98A
            7CFF000000FF010101FF100D0BFF171311FFAB8B7EFFCBA595FFCBA595FF0303
            02FF000000FF000000FF000000FF000000FF010000FF2A221FFFCBA595FFCBA5
            95FFCBA595FFCBA595FFCBA595FFCBA595FFCBA595FFCBA595FFCBA595FFCBA5
            95FFCBA595FFC9A291FFA36D55FF5F331FE35500000300000000000000000000
            000000000000000000000000000000000000000000000000000061331ED59965
            4DFECCA797FFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCDAA
            9CFF000000FF3C312EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFF1410
            0FFF010000FF000000FF000000FF010000FF3F3430FFCFAC9EFFCFAC9EFFCFAC
            9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC9EFFCFAC
            9EFFCFAB9CFFC0937FFF6B3C27F45A2E1D4C0000000000000000000000000000
            00000000000000000000000000000000000000000000000000005E2F1B266235
            21F0AE7B66FFD1B0A2FFD4B4A7FFD4B4A7FFD4B4A7FFD4B4A7FFD4B4A7FFD4B4
            A7FF060505FFB3978CFFD4B4A7FFD4B4A7FFD4B4A7FFD4B4A7FFD4B4A7FFD4B4
            A7FF675852FF000000FF000000FF675852FFD4B4A7FFD4B4A7FFD4B4A7FFD4B4
            A7FFD4B4A7FFD4B4A7FFD4B4A7FFD4B4A7FFD4B4A7FFD4B4A7FFD4B4A7FFD3B3
            A6FFCAA292FF7F4D37F860321FA9000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000005B2F
            1A46673A23F2BE917FFFD6B8ACFFD8BBB0FFD8BBB0FFD8BBB0FFD8BBB0FFD8BB
            B0FF6B5D58FFD8BBB0FFD8BBB0FFD8BBB0FFD8BBB0FFD8BBB0FFD8BBB0FFD8BB
            B0FF453C38FF000000FF3E3633FFD8BBB0FFD8BBB0FFD8BBB0FFD8BBB0FFD8BB
            B0FFD8BBB0FFD8BBB0FFD8BBB0FFD8BBB0FFD8BBB0FFD8BBB0FFD8BBAFFFD2B0
            A3FF935F48FC60341FD2552B2B06000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00005C301D7472422DF2C69D8CFFDABFB4FFDDC3B9FFDDC3B9FFDDC3B9FFDDC3
            B9FFDDC3B9FFDDC3B9FFDDC3B9FFDDC3B9FFDDC3B9FFDDC3B9FFDDC3B9FFDDC3
            B9FF2C2725FF393230FFDDC3B9FFDDC3B9FFDDC3B9FFDDC3B9FFDDC3B9FFDDC3
            B9FFDDC3B9FFDDC3B9FFDDC3B9FFDDC3B9FFDDC3B9FFDCC2B8FFD5B7AAFFA26F
            57FF623520E85D2E171600000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000005F311E8A6C3E29F2BB8F7CFFDDC4BAFFE1CAC1FFE1CBC2FFE1CB
            C2FFE1CBC2FFE1CBC2FFE1CBC2FFE1CBC2FFE1CBC2FFE1CBC2FFE1CBC2FFE1CB
            C2FFE1CBC2FFE1CBC2FFE1CBC2FFE1CBC2FFE1CBC2FFE1CBC2FFE1CBC2FFE1CB
            C2FFE1CBC2FFE1CBC2FFE1CBC2FFE1CBC2FFE0C9C0FFD4B4A8FF95614BFC6135
            21E65D3219290000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000005B2F1C5C643924F1AC7C68FFDEC5BBFFE4CEC8FFE6D1
            CBFFE6D1CBFFE6D1CBFFE6D1CBFFE6D1CBFFE6D1CBFFE6D1CBFFE6D1CBFFE6D1
            CBFFE6D1CBFFE6D1CBFFE6D1CBFFE6D1CBFFE6D1CBFFE6D1CBFFE6D1CBFFE6D1
            CBFFE6D1CBFFE6D1CBFFE5D1CAFFE2CCC5FFD0AD9FFF83523BF561331FCF5933
            1A14000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000005D2E1C37613521EC895742F8C9A394FFE5D2
            CAFFE9D7D2FFEAD9D4FFEAD9D4FFEAD9D4FFEAD9D4FFEAD9D4FFEAD9D4FFEAD9
            D4FFEAD9D4FFEAD9D4FFEAD9D4FFEAD9D4FFEAD9D4FFEAD9D4FFEAD9D4FFEAD9
            D4FFEAD8D3FFE7D4CEFFDDC3B9FFAE806DFF6D3E2AF260311DA3663333050000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000006227140D60321D8C643824F19768
            52FBD3B3A7FFE9D7D2FFECDCD7FFEDDEDBFFEEE1DDFFEEE1DDFFEEE1DDFFEEE1
            DDFFEEE1DDFFEEE1DDFFEEE1DDFFEEE1DDFFEEE1DDFFEEDFDCFFECDDD9FFEADB
            D5FFE3CDC6FFBC9280FF774832F2623520DB5D2E1B4200000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000058311D1A6133
            1EA8663A24F286543FF6B38876FFD6B7ACFFEBDAD6FFEEE1DDFFEFE2DFFFF0E3
            E0FFF0E3E1FFF0E3E1FFEFE2DFFFEFE1DEFFEEE0DCFFE2CCC4FFC7A191FF9E6F
            5BFE72442DEF623422E85E321E5C000000010000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000602B20185D2F1E66643623C5633823F3764530F08C5A46F79C6D59FFAB7F
            6DFFB88F7FFFB28876FFA47764FF946450FC82513BF36C3C28EF623622EA6235
            21975A2D1D3E5555000300000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000005D2E170B5A2F1D475E342066613421826436
            21A6643723C2643722B6633622965F331F735C301D59592F1E2B000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000FFFFE003FFFFFFFFFFFE00007FFFFFFFFFF800001FFFFFFFFFE0
            000007FFFFFFFFC0000003FFFFFFFF80000001FFFFFFFF000000007FFFFFFE00
            0000007FFFFFFC000000003FFFFFF8000000001FFFFFF0000000000FFFFFF000
            0000000FFFFFE00000000007FFFFE00000000003FFFFC00000000003FFFFC000
            00000003FFFFC00000000001FFFF800000000001FFFF800000000001FFFF8000
            00000001FFFF800000000001FFFF800000000000FFFF800000000000FFFF8000
            00000000FFFF800000000000FFFF800000000001FFFF800000000001FFFF8000
            00000001FFFF800000000001FFFFC00000000001FFFFC00000000003FFFFC000
            00000003FFFFE00000000007FFFFE00000000007FFFFE0000000000FFFFFF000
            0000000FFFFFF8000000001FFFFFF8000000003FFFFFFC000000003FFFFFFE00
            0000007FFFFFFF00000000FFFFFFFF80000001FFFFFFFFC0000003FFFFFFFFE0
            00000FFFFFFFFFF800001FFFFFFFFFFE00007FFFFFFFFFFFC007FFFFFFFFFFFF
            FFFFFFFFFFFF2800000020000000400000000100200000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000243434313464646165555550300000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000004040400C454141474444
            4285444443B548433FCD4C413BD54A423DD4464340CC454544B9444443914444
            4453464646160000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000004949490E4545426F4C413BD065452DEB784B
            28F6835229FA8B572AFB955F2CFC915C2BFC88562AFA805128F9724929F45C44
            32E346423FCF434343864444441E000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000004545454E4D4139CE6F4629F5935D2DFCBB7D34FFD396
            39FFE0A73BFFE6AE3DFFEAB33EFFE9B23EFFE4AB3DFFDDA33CFFCD8F38FFAF72
            32FF83522AFA65432CEE46423FCD4343436F5555550300000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000404040044745417C64422BEF8E5B2EFCC6893CFFE3AC43FFECB745FFF2BE
            46FFF6C347FFF8C647FFF9C748FFF9C648FFF7C447FFF5C147FFF0BC46FFEAB4
            44FFDCA341FFB77938FF7D4F2AFA574134E1434343983C3C3C11000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000147403D946C442AF5AF7538FEDDA649FFEAB64DFFF2C150FFF3C24FFFF4C3
            4FFFF4C350FFF4C350FFF4C350FFF4C350FFF4C350FFF4C350FFF3C24FFFF3C2
            4FFFF0BE4FFFE6B34CFFD49B46FF945E31FC60412EEA434343AB4040400C0000
            0000000000000000000000000000000000000000000000000000000000004641
            3E766D4229F7BD8241FFE0AC50FFECBB55FFEEBD57FFEEBE56FFEEBE56FFEEBE
            56FF665125FF110E06FF110D06FF100D06FF2C2310FF9B7C38FFEEBE56FFEEBE
            56FFEEBD56FFEEBD57FFE9B855FFD9A34DFFA46C38FE5F3E2BEE444444938080
            80020000000000000000000000000000000000000000000000004644443D653F
            2AF3B77D42FFDFAB57FFE8B75BFFE8B75CFFE8B75CFFE8B75CFFE8B75CFF3E31
            19FF010100FF000000FF000000FF000000FF000000FF010101FF050402FF1611
            09FF70582CFFDAAB56FFE8B75CFFE6B65BFFD9A454FF986137FC563D31E44444
            44620000000000000000000000000000000000000000808080025A3C2DD7A36B
            3DFED9A65BFFE2B260FFE2B361FFE2B361FFE2B361FFE2B361FFE2B361FF0504
            02FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF030301FF2C2313FFE2B361FFE1B15FFFD09A54FF814F31FB483F
            3BCD40404014000000000000000000000000000000004A403C5B76462CF9CE99
            59FFDCAC62FFDCAC63FFDCAC63FFDCAC63FFDCAC63FFDCAC63FFCDA05DFF0403
            02FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF010000FF2E2415FFDCAC63FFDAAA61FFBE844EFF633D
            29F24343437A000000000000000000000000000000005C3928DAB17647FFD5A4
            63FFD6A665FFD6A665FFD6A665FFD6A665FFD6A665FFD6A665FFD6A665FF765C
            38FF020201FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF0B0905FFD6A665FFD6A665FFD19F61FF8B59
            36FC4B3E37CE3333330500000000000000003F3B39136D412BF7C9945EFFD19F
            65FFD19F65FFD19F65FF926F46FF120E09FF15100AFF4F3C26FFD19F65FFD19F
            65FF241B11FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF0B0805FFD19F65FFD19F65FFD09E65FFB980
            51FF5E3929F042424236000000000000000050382D71905A3AFCC99664FFCA97
            64FFCA9764FF75573AFF020101FF000000FF000000FF010000FF2D2116FFCA97
            64FF5A432DFF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF010100FF050403FF674D33FFCA9764FFCA9764FFCA9764FFC591
            60FF6C402AF84343426F00000000000000005E3724C2AB704BFFC28C61FFC28C
            61FFC28C61FF060403FF000000FF000000FF000000FF000000FF070504FFC28C
            61FF8B6545FF010101FF000000FF000000FF000000FF000000FF000000FF0000
            00FF0D0906FF77563CFFC08A61FFC28C61FFC28C61FFC28C61FFC28C61FFC18C
            61FF895437FC4B3D369E0000000000000000613623DCB17551FFB9815BFFB981
            5BFF7F593EFF010100FF000000FF000000FF000000FF020101FF38271BFFB981
            5BFFB9815BFF2B1E15FF020101FF000000FF000000FF000000FF000000FF0D09
            06FFB37D59FFB9815BFFB9815BFFB9815BFFB9815BFFB9815BFFB9815BFFB981
            5BFF985E3EFF503A31BE0000000000000000633723E3AF7353FFB27857FFB278
            57FF2C1E15FF000000FF000000FF000000FF050403FF754F3AFFB27857FFB278
            57FFB27857FFB27857FF78503AFF281A13FF0A0705FF0A0705FF1C130DFFA872
            53FFA36E4FFF19110CFF060403FF110B08FF62422FFFB27857FFB27857FFB278
            57FF9E6142FF56392CD20000000000000000663722E3AD7354FFAF7457FFAF74
            57FF0F0A07FF0D0806FF050403FF2B1D15FFA97055FFAF7457FFAF7457FFAF74
            57FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF7457FFAF74
            57FF110B08FF000000FF000000FF000000FF020201FF885A44FFAF7457FFAF74
            57FFA16447FF5B3828D30000000000000000653622DAAB6E52FFAD7156FFAD71
            56FF885943FFAD7156FFAD7156FFAD7156FFAD7156FFAD7156FF734B39FF754D
            3AFF9F674EFFAD7156FFAD7156FFAD7156FFAD7156FFAD7156FFAD7156FFAD71
            56FF35221BFF000000FF000000FF000000FF000000FF482F24FFAD7156FFAD71
            56FF995E44FF59382ABC0000000000000000633520CBAA6B51FFAE7359FFAE73
            59FFAE7359FFAE7359FFAE7359FFAE7359FFA46D55FF0B0706FF010101FF0101
            01FF050302FF7F5441FFAE7359FFAE7359FFAE7359FFAE7359FFAE7359FFAE73
            59FF805541FF020101FF000000FF000000FF000000FF4A3126FFAE7359FFAE73
            59FF93583FFF53382C8C000000000000000064341E99A2674DFFB27B63FFB27B
            63FFB27B63FFB27B63FFB27B63FFB27B63FF412D24FF000000FF000000FF0000
            00FF000000FF140E0BFF785342FF060403FF050403FF120C0AFFAA755FFFB27B
            63FFB27B63FF090605FF000000FF000000FF030202FFA6735DFFB27B63FFB27B
            63FF835038FC5333243E00000000000000005B2F1B3389543DF7B8866FFFB886
            6FFFB8866FFFB8866FFFB8866FFFB8866FFF0E0A09FF000000FF000000FF0000
            00FF010101FF5C4337FF0E0A08FF000000FF000000FF000000FF0E0A08FFB886
            6FFFB8866FFF785749FF020101FF000000FF120E0BFFB8866FFFB8866FFFB783
            6CFF683A26F0000000000000000000000000000000006E3C25DABD8C78FFBE8F
            7AFFBE8F7AFFBE8F7AFFBE8F7AFFBE8F7AFF2C211CFF000000FF000000FF0000
            00FF090706FFBE8F7AFF090706FF000000FF000000FF000000FF050403FFBE8F
            7AFFBE8F7AFFBE8F7AFF9F7865FF000000FF8C6A5AFFBE8F7AFFBE8F7AFFAF79
            63FF623622C10000000000000000000000000000000064341E97A7735CFEC49A
            87FFC49A87FFC49A87FFC49A87FFC49A87FF71594EFF000000FF000000FF0101
            01FF765D52FFC29885FF050404FF000000FF000000FF000000FF0A0807FFC49A
            87FFC49A87FFC49A87FFC49A87FF221B18FFC49A87FFC49A87FFC49A87FF8352
            3CF85E311C31000000000000000000000000000000005B2F1B0E6F3E28E0C69D
            8CFFCAA392FFCAA392FFCAA392FFCAA392FFAA8A7BFF000000FF080606FF1A15
            13FFCAA392FF8F7468FF010101FF000000FF000000FF020202FF8F7367FFCAA3
            92FFCAA392FFCAA392FFCAA392FFBF9B8AFFCAA392FFCAA392FFB78772FF6435
            20C100000000000000000000000000000000000000000000000064331E7B9C6A
            53F8D1AEA0FFD1AEA0FFD1AEA0FFD1AEA0FFD1AEA0FF020202FFCDAC9EFFD1AE
            A0FFD1AEA0FFA98C81FF0B0909FF010100FF040303FF846F65FFD1AEA0FFD1AE
            A0FFD1AEA0FFD1AEA0FFD1AEA0FFD1AEA0FFD1AEA0FFCDA798FF794733EB5B2F
            1B22000000000000000000000000000000000000000000000000000000006434
            1EB5B38672FED7B9ADFFD7B9ADFFD7B9ADFFD7B9ADFF6D5E58FFD7B9ADFFD7B9
            ADFFD7B9ADFFD7B9ADFF85736BFF000000FF9C867DFFD7B9ADFFD7B9ADFFD7B9
            ADFFD7B9ADFFD7B9ADFFD7B9ADFFD7B9ADFFD6B7ACFF8F5E49F362331D600000
            0000000000000000000000000000000000000000000000000000000000005B2F
            1B08663620CDBD9483FEDEC5BBFFDEC5BBFFDEC5BBFFDEC5BBFFDEC5BBFFDEC5
            BBFFDEC5BBFFDEC5BBFF7F716BFF867771FFDEC5BBFFDEC5BBFFDEC5BBFFDEC5
            BBFFDEC5BBFFDEC5BBFFDEC5BBFFDCC1B7FF9F6F5BF764331E93000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00005B2F1B0F63331EC1B08471F8E4CEC7FFE4D0C9FFE4D0C9FFE4D0C9FFE4D0
            C9FFE4D0C9FFE4D0C9FFE4D0C9FFE4D0C9FFE4D0C9FFE4D0C9FFE4D0C9FFE4D0
            C9FFE4D0C9FFE4D0C9FFDDC4BAFF8D5D49ED63331D8100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000005B2F1B0263331D96875844E7D0B0A4FFEBDBD7FFEBDBD7FFEBDB
            D7FFEBDBD7FFEBDBD7FFEBDBD7FFEBDBD7FFEBDBD7FFEBDBD7FFEBDBD7FFEBDB
            D7FFE8D6D1FFBD9585FD71412BDC61321D4F0000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000005B2F1B2265341EB990634FEBC39E90FEE6D1
            CBFFF2E7E5FFF2E7E5FFF2E7E5FFF2E7E5FFF2E7E5FFF1E6E2FFDCC1B8FFB48D
            7CFB7A4B36E264331E8E5B2F1B0A000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000005B2F1B1C62331D7B6735
            1EC6784832DA895D4AE59C7260EC976D5AEA845642E3713F29D566341EB65F31
            1C575B2F1B0B0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000005B2F1B055B2F1B1E5B2F1B165B2F1B0100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FFFC3FFFFFC003FFFF0000FFFE00003FF800
            001FF000000FF0000007E0000007C0000003C0000003C0000001800000018000
            0001800000018000000180000001800000018000000180000001800000018000
            0003C0000003C0000003C0000007E0000007F000000FF000001FF800003FFC00
            007FFF0000FFFFC003FFFFFC3FFF280000001000000020000000010020000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000003B3B3B0D494342374D3D347A4C3E36784642413B4040
            4010000000000000000000000000000000000000000000000000000000000000
            000049494907573B2CAB6E4328F591602BFAB57F32FDAF7A31FD8B5C2AFA683F
            26F4503D339F4040400C00000000000000000000000000000000000000004B39
            3231643B27EBBF8937FEF9C645FFFBC746FFFBC846FFFBC846FFFBC746FFF6C2
            45FFAD7933FD5C3929E5453E3B320000000000000000000000003E322C076E43
            27EEDFAB4EFFEFBF55FFF0C055FFA4833AFF403317FF4A3B1AFF7E652DFFC49D
            45FFEFBF55FFD49F4AFF613C28E74D4D4D0A00000000000000005B3728B7C391
            4EFEE4B45FFFE4B45FFFE4B45FFF3C2F19FF000000FF000000FF000000FF0403
            01FF392D18FFCDA355FFAF7E45FD513A30A8000000005B2F1B0A8F6440F8DBAE
            6CFFDBAD6CFF9F7E4EFFCEA366FF715937FF000000FF000000FF000000FF0000
            00FF010100FF98784BFFDAAC6BFF7A5135F65555550357342448B2865FFED5A9
            78FF594632FF000000FF4C3C2BFFC89E70FF080604FF000000FF000000FF120F
            0AFF70593FFFD5A978FFD5A978FF9D7452FB4D3D37345E36249AC19778FFB390
            73FF060504FF1B1511FF9B7C63FFCEA584FF826853FF3D3127FF3A2F25FFAA89
            6DFF8D715BFFA6856AFFCEA584FFB2876CFD51382C7B633520A7C39A85FFA382
            71FF997A6AFFC09884FFC79F8AFFC89F8AFFC9A08BFFC9A08BFFC9A08BFF9A7A
            6AFF010101FF1D1714FFC59D88FFB58B76FF5835257C5F311C56B08472FEC79F
            8DFFC79F8DFFB89382FF231C19FF1B1613FFA78576FF7F665AFFAC897AFFC59D
            8BFF201A17FF0F0C0BFFBB9685FF9C7462FB573120305B2F1B1EA07A6BF6D2B0
            A3FFD2B0A3FF9A8178FF000000FF201B19FF988076FF040303FF3E3430FFD2B0
            A3FF947C73FF52443FFFD2B0A3FF8C6657F35B2F1B0200000000744936D1D8BC
            B2FFDDC3B9FFD5BCB2FF241F1EFF83736EFF736660FF000000FF655955FFDDC3
            B9FFDDC3B9FFCCB4AAFFCFB2A6FF6B3E2BB600000000000000005B2F1B1F9C78
            69F0E8D5CFFFE8D5CFFFB4A5A1FFE8D5CFFFB6A7A2FF494341FFE2CFC9FFE8D5
            CFFFE8D5CFFFE7D5CEFF865F4FE95B2F1B0C0000000000000000000000006433
            1E65AB8B7EF0EFE2E0FFF2E7E5FFF2E7E5FFF0E5E3FFF2E7E5FFF2E7E5FFF2E7
            E5FFEBDDD8FF997568EC61321D3F000000000000000000000000000000000000
            00005C301B2A835C49D7D4BFB7FCEFE5E2FFFDFAFCFFFDF9FAFFECDFDCFFCCB4
            ACFA794D3BC45B2F1B1700000000000000000000000000000000000000000000
            0000000000005B2F1B035B2F1B3E63331D83754934BE6F412DB762321D765B2F
            1B340000000000000000000000000000000000000000F81FAC41E007AC41C003
            AC418001AC418001AC410000AC410000AC410000AC410000AC410000AC410000
            AC418001AC418001AC41C003AC41E007AC41F01FAC41}
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
