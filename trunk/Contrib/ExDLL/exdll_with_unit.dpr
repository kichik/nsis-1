{
  NSIS ExDLL2 example
  Original is ExDLL
  (C) 2001 - Peter Windridge

  Changed with delphi unit nsis.pas
  by bernhard mayer

  Tested in Delphi 7.0
}

library exdll;

uses
  nsis, windows;

procedure ex_dll(hwndParent: HWND; string_size: integer; variables: PChar; stacktop: pointer); cdecl;
begin
  // set up global variables
  Init(hwndParent, string_size, variables, stacktop);

  NSISDialog(GetUserVariable(INST_0), 'The value of $0', MB_OK);
  NSISDialog(PopString, 'pop', MB_OK);
  PushString('Hello, this is a push');
  SetUserVariable(INST_0, 'This is 0');
end;

exports ex_dll;

begin
end.
