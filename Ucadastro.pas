unit Ucadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    edNome: TLabeledEdit;
    edEmail: TLabeledEdit;
    edCidade: TLabeledEdit;
    edEstado: TLabeledEdit;
    edCpf: TMaskEdit;
    Labbel1: TLabel;
    edRg: TLabeledEdit;
    ADOConnection1: TADOConnection;
    QAux: TADOQuery;
    edBuscaNome: TLabeledEdit;
    edBuscaCodigo: TLabeledEdit;
    Button4: TButton;
    Button5: TButton;
    Memo1: TMemo;
    Button6: TButton;
    QAux2: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button6Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    Procedure LimparDados;
    Procedure preencheCampo;
    
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

  
 try
 
    QAux2.SQL.Text := 'select * from cliente where cpf = :cpf';
    QAux2.Parameters.ParamByName('cpf').Value := edCpf.Text;
    QAux2.Open;
    if QAux2.IsEmpty then
    begin
      QAux.SQl.Text := 'insert into cliente (nome,  email,  cidade,  estado,  CPF,  RG)' +
                  ' values (:nome, :email, :cidade, :estado, :CPF, :RG)' ;
 

     QAux.Parameters.ParamByName('nome').Value   := edNome.Text;
     QAux.Parameters.ParamByName('email').Value  := edEmail.Text;
     QAux.Parameters.ParamByName('cidade').Value := edCidade.Text;
     QAux.Parameters.ParamByName('estado').Value := edEstado.Text;
     QAux.Parameters.ParamByName('CPF').Value    := edCpf.Text;
     QAux.Parameters.ParamByName('RG').Value     := edRg.Text;
 

      try
      begin
        QAux.ExecSQL;
        LimparDados;
        edNome.SetFocus;
        ShowMessage ('Dados inseridos com sucesso');
      end
      Except
        ShowMessage ('Ocorreu algum erro');
      end;
    end
    else
    showmessage ('CPF já cadastrado');
 except 
    showmessage ('Ocorreu algum erro');
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    LimparDados;
    edNome.SetFocus
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
    QAux.SQL.Text := 'select * from cliente where nome like '''+edBuscaNome.Text+'''';
    QAux.Open;
    preencheCampo;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin

  try
    strtoint(edBuscaCodigo.Text);
    QAux.SQL.Text := 'select * from cliente where idCliente = :id';
    QAux.Parameters.ParamByName('id').Value := edBuscaCodigo.Text;
    QAux.Open;
    preencheCampo;
  except 
    showmessage ('Não foi possível encontrar esse código');
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin

    try
      strtoint(edBuscaCodigo.Text);
      QAux.SQL.Text := 'delete cliente where idCliente = :id';
      QAux.Parameters.ParamByName('id').Value := edBuscaCodigo.Text;
      QAux.ExecSQL;
      if QAux.RowsAffected >0 then
        showmessage('Registro apagado com sucesso')
      else
      showmessage('Não existe registro para apagar');
    except 
      showmessage ('Não foi possível encontrar esse código');
    end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
        ADOConnection1.ConnectionString := 'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Initial Catalog=dados;Data Source=(local);Initial File Name="";Server SPN="";password="95525445vv"';
        ADOConnection1.Connected        := true;
end;

procedure TForm1.LimparDados;
begin
    edNome.Clear;
    edEmail.Clear;
    edCidade.Clear;
    edEstado.Clear;
    edCpf.Clear;
    edRg.Clear;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
    Memo1.Clear;
    QAux.SQL.Text := 'select idCliente, nome from cliente ';
    QAux.Open;
    QAux.First;

    while not(QAux.Eof) do
    begin
       Memo1.Lines.Add(QAux.FieldByName('idCliente').AsString +' - '+QAux.FieldByName('nome').AsString);
       QAux.Next;
    end;

end;

procedure TForm1.preencheCampo;
begin

    if not QAux.IsEmpty then
    begin
      edNome.Text     := QAux.FieldByName('nome').AsString;
      edEmail.Text    :=  QAux.FieldByName('email').AsString;
      edCidade.Text   := QAux.FieldByName('cidade').AsString;
      edEstado.Text   := QAux.FieldByName('estado').AsString;
      edCpf.Text      := QAux.FieldByName('CPF').AsString;
      edRg.Text       := QAux.FieldByName('RG').AsString;


      showmessage (format('Registros encontrados'+#13#10+
                        'Email:  %s'+#13#10+
                        'Cidade: %s'+#13#10+
                        'Estado: %s'+#13#10+
                        'CPF:    %s'+#13#10+
                        'RG:     %s',
                        [edEmail.Text, edCidade.Text, edEstado.Text, edCpf.Text, edRg.Text]));
    end
    else
      showmessage ('Não existe registros para o filtro');

end;
    
end.
