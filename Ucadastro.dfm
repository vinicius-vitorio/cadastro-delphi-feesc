object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro de clientes'
  ClientHeight = 617
  ClientWidth = 1343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1343
    Height = 617
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Inserir'
      object Labbel1: TLabel
        Left = 616
        Top = 45
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object edEstado: TLabeledEdit
        Left = 24
        Top = 328
        Width = 49
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Estado'
        TabOrder = 0
      end
      object edRg: TLabeledEdit
        Left = 616
        Top = 152
        Width = 121
        Height = 21
        EditLabel.Width = 14
        EditLabel.Height = 13
        EditLabel.Caption = 'RG'
        TabOrder = 1
      end
      object edEmail: TLabeledEdit
        Left = 24
        Top = 152
        Width = 297
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Email'
        TabOrder = 2
      end
      object edCidade: TLabeledEdit
        Left = 24
        Top = 240
        Width = 241
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        TabOrder = 3
      end
      object edNome: TLabeledEdit
        Left = 24
        Top = 64
        Width = 329
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        TabOrder = 4
      end
      object edCpf: TMaskEdit
        Left = 616
        Top = 64
        Width = 120
        Height = 21
        EditMask = '999.999.999-99;1;_'
        MaxLength = 14
        TabOrder = 5
        Text = '   .   .   -  '
      end
      object Panel1: TPanel
        Left = 0
        Top = 520
        Width = 1335
        Height = 69
        Align = alBottom
        BevelInner = bvLowered
        Color = clNavy
        ParentBackground = False
        TabOrder = 6
        object Button1: TButton
          Left = 24
          Top = 16
          Width = 105
          Height = 41
          Caption = 'Inserir'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 176
          Top = 16
          Width = 105
          Height = 41
          Caption = 'Novo'
          TabOrder = 1
          OnClick = Button2Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Buscar'
      ImageIndex = 1
      object edBuscaNome: TLabeledEdit
        Left = 12
        Top = 64
        Width = 197
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        TabOrder = 0
      end
      object edBuscaCodigo: TLabeledEdit
        Left = 12
        Top = 232
        Width = 197
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo'
        TabOrder = 1
      end
      object Button4: TButton
        Left = 272
        Top = 63
        Width = 75
        Height = 23
        Caption = 'Buscar Nome'
        TabOrder = 2
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 272
        Top = 231
        Width = 75
        Height = 23
        Caption = 'Buscar Codigo'
        TabOrder = 3
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 362
        Top = 230
        Width = 75
        Height = 25
        Caption = 'Apagar'
        TabOrder = 4
        OnClick = Button6Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Listar'
      ImageIndex = 2
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 1335
        Height = 589
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Init' +
      'ial Catalog="";Data Source=(local);Initial File Name="";Server S' +
      'PN="";'
    Provider = 'SQLNCLI11.1'
    Left = 816
    Top = 568
  end
  object QAux: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 888
    Top = 568
  end
  object QAux2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 940
    Top = 568
  end
end
