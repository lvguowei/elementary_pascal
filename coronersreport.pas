program CORONERSREPORT (INPUT, OUTPUT);

{ -- This programme reads in data corresponding to the items in
  -- a coroner's report. The items are separated by colons.
  -- The program prints a summary report of the coroner's data. }

const
   SPACE     = ' ';
   SEPARATOR = ':';

type
   HEADERSTR = packed array [1..18] of CHAR;

procedure SKIPLINES (NUMLINES : INTEGER);
var
   I : INTEGER;

begin
   for I := 1 to NUMLINES do
      WRITELN
end;

procedure PROCESSNEXTITEM ({ using } ITEMWIDTH : INTEGER);
var
   NEXTCHAR    : CHAR;
   I, NUMCHARS : INTEGER;

begin
   READ (NEXTCHAR);
   while (NEXTCHAR = SPACE) do
      READ (NEXTCHAR);

   NUMCHARS := 1;
   while NEXTCHAR <> SEPARATOR do begin
      WRITE (NEXTCHAR);
      READ (NEXTCHAR);
      NUMCHARS := NUMCHARS + 1
   end;

   for I := NUMCHARS + 1 to ITEMWIDTH do
      WRITE (SPACE)
end;

procedure PROCESSFIELD ({ using} HEADER : HEADERSTR);
var
   I : INTEGER;

begin
   for I := 1 to 5 do
      WRITE (SPACE);
   for I := 1 to 18 do
      WRITE (HEADER[I]);
   PROCESSNEXTITEM (40);
   WRITELN
end;

procedure PRINTTITLE;
begin
   WRITELN ('              CORONER''S REPORT');
   WRITELN ('              ---------- ------')
end;

procedure PRINTGENERALINFO;
begin
   WRITE ('CORONER: ');
   PROCESSNEXTITEM(20);
   WRITE ('     SUBJECT''S NAME; ');
   PROCESSNEXTITEM (20);
   WRITELN;
   WRITE ('                                   STATED AGE    : ');
   PROCESSNEXTITEM (20);
   WRITELN
end;

procedure PRINTBASICDATA;
begin
   WRITELN ('BASIC DATA');
   WRITELN ('----- ----');
   SKIPLINES (1);
   PROCESSFIELD ('HEIGHT IN INCHES: ');
   PROCESSFIELD ('HAIR COLOUR     : ');
   PROCESSFIELD ('EYE COLOUR      : ');
   PROCESSFIELD ('SEX             : ');
end;

procedure PRINTTOXICOLOGYDATA;
begin
   WRITELN ('TOXICOLOGY DATA');
   WRITELN ('---------- ----');
   SKIPLINES (1);
   PROCESSFIELD ('ALCOHOL TEST    : ');
   PROCESSFIELD ('SALICYLATES     : ');
   PROCESSFIELD ('BILE MORPHINE   : ');
   PROCESSFIELD ('GASTRIC CONTENT : ')
end;

procedure PRINTANATOMICDATA;
begin
   WRITELN ('ANATOMIC DATA');
   WRITELN ('-------- ----');
   SKIPLINES (1);
   PROCESSFIELD ('BRUISES      : ');
   PROCESSFIELD ('LACERATIONS  : ');
   PROCESSFIELD ('LEISIONS     : ');
   PROCESSFIELD ('HAEMORRHAGES : ');
   PROCESSFIELD ('FRACTURES    : ')
end;

procedure PRINTREMARKS;
var
   I        : INTEGER;
   NEXTCHAR : CHAR;

begin
   WRITELN ('GENERAL REMARKS');
   WRITELN ('------- -------');
   SKIPLINES (1);

   while (not EOF) do begin
      for I := 1 to 5 do
         WRITE (SPACE);
      while not EOLN do begin
         READ (NEXTCHAR);
         WRITE (NEXTCHAR)
      end;
      READLN;
      WRITELN;
   end
end;

begin {-- Main algorithm }
   SKIPLINES (7);
   PRINTTITLE;
   SKIPLINES (2);
   PRINTGENERALINFO;
   SKIPLINES (2);
   PRINTBASICDATA;
   SKIPLINES (2);
   PRINTTOXICOLOGYDATA;
   SKIPLINES (2);
   PRINTANATOMICDATA;
   SKIPLINES(2);
   PRINTREMARKS
end.
