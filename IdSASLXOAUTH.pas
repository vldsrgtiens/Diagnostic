unit IdSASLXOAUTH;

interface

uses
  Classes, SysUtils,
  IdSASL,EncdDecd
  ;

type
  TIdSASLXOAuth = class(TIdSASL)
  private
    FToken: string;
    FUser: string;
  public
    property Token: string read FToken write FToken;
    property User: string read FUser write FUser;
    class function ServiceName: TIdSASLServiceName; override;
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    function TryStartAuthenticate(const AHost, AProtocolName : String; var VInitialResponse: String): Boolean; override;
    function ContinueAuthenticate(const ALastResponse, AHost, AProtocolName : string): string; override;
    function StartAuthenticate(const AChallenge, AHost, AProtocolName: string): string; override;
    { For cleaning up after Authentication }
    procedure FinishAuthenticate; override;
  end;

implementation

{ TIdSASLXOAuth }

class function TIdSASLXOAuth.ServiceName: TIdSASLServiceName;
begin
  Result := 'XOAUTH2';
end;

constructor TIdSASLXOAuth.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TIdSASLXOAuth.Destroy;
begin
  inherited;
end;

function TIdSASLXOAuth.TryStartAuthenticate(const AHost, AProtocolName: String; var VInitialResponse: String): Boolean;
begin
 // VInitialResponse := 'user=' + FUser + '\001' + 'auth=Bearer ' + FToken + '\001' + '\001';
    VInitialResponse := 'user=' + FUser + Chr($01) + 'auth=Bearer ' + FToken + Chr($01) + Chr($01);
                     //user=<�����>\@yandex.ru\001auth=Bearer <OAuth-�����>\001\001

  Result := True;
end;

function TIdSASLXOAuth.StartAuthenticate(const AChallenge, AHost, AProtocolName: string): string;
begin
  Result := 'user=' + FUser + Chr($01) + 'auth=Bearer ' + FToken + Chr($01) + Chr($01);
end;

function TIdSASLXOAuth.ContinueAuthenticate(const ALastResponse, AHost, AProtocolName: string): string;
begin
  // Nothing to do
end;

procedure TIdSASLXOAuth.FinishAuthenticate;
begin
  // Nothing to do
end;

end.

