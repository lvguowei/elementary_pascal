program SEARCH (INPUT, OUTPUT, MASTERFILE);
{ -- This programme reads in values corresponding to data saved
  -- in a file of records kept on known criminals. For
  -- each item, a prompt indicates which item is to be input.
  -- A value of 0 indicates that the item is unknown.
  -- The programme outputs the name of each criminal for which
  -- the input values match those on the criminal's record. }
const
   UNKNOWN = 0;
type
   YESNOCODE  = 0..2;
   NAMESTRING = packed array[1..30] of CHAR;
   DATARECORD = record
                   NAME       : NAMESTRING;
                   HEIGHT     : 0..84;
                   HAIRCOLOUR : 0..4;
                   EYECOLOUR  : 0..3;
                   HATSIZE    : 0..10;
                   SHOESIZE   : 0..15;
                   TEETHMARKS : 0..5;
                   CIGARTYPE  : 0..8;
                   FACIALSCAR : YESNOCODE;
                   HANDSCAR   : YESNOCODE;
                   EYEPATCH   : YESNOCODE;
                   BALDPATCH  : YESNOCODE;
                   LEGLIMP    : YESNOCODE;
                   TATTOO     : YESNOCODE;
                end;

var
   SUSPECT, CRIMINAL : DATARECORD;
   MASTERFILE        : file of DATARECORD;

procedure GETSUSPECTINFO (var SUSPECT: DATARECORD);
begin
   WRITELN ('IN ENTERING DATA, USE 0 IF ITEM IS UNKNOWN.');
   WRITELN ('ENTER HEIGHT IN INCHES:');
   READLN (SUSPECT.HEIGHT);

   WRITELN ('ENTER HAIR COLOUR CODE:');
   WRITELN ('1 BROWN, 2 BLACK, 3 RED, 4 GREY');
   READLN (SUSPECT.HAIRCOLOUR);

   WRITELN ('ENTER EYE COLOUR CODE:');
   WRITELN ('1 BROWN, 2 BLUE, 3 HAZEL');
   READLN (SUSPECT.EYECOLOUR);

   WRITELN ('ENTER SHOE SIZE:');
   READLN (SUSPECT.SHOESIZE);

   WRITELN ('ENTER TEETH MARKS CODE:');
   WRITELN ('1 NORMAL, 2 CROOKED, 3 GOLD FILLED,');
   WRITELN ('4 PARTIAL, 5 MISSING');
   READLN (SUSPECT.TEETHMARKS);

   WRITELN ('ENTER CIGAR TYPE CODE:');
   WRITELN ('1 LUNKAH, 2 TRICHINOPOLY, 3 ESPANADA,');
   WRITELN ('4 HERITAGE, 5 LONDONER, 6 MACDUFF,');
   WRITELN ('7 TOP HAT, 8 WEST COUNTRY');
   READLN (SUSPECT.CIGARTYPE);

   WRITELN ('NOW USE 1 FOR YES, 2 FOR NO:');
   WRITELN ('FACIAL SCAR? HAND SCAR? EYEPATCH?');
   WRITELN ('BALD PATCH? LEG LIMP? TATTOO?');
   READLN (SUSPECT.FACIALSCAR, SUSPECT.HANDSCAR, SUSPECT.EYEPATCH, SUSPECT.BALDPATCH, SUSPECT.LEGLIMP, SUSPECT.TATTOO)
end;

function ITEMMATCH (ITEM1, ITEM2: INTEGER): BOOLEAN;
begin
   if (ITEM1 = UNKNOWN) or (ITEM2 = UNKNOWN) or (ITEM1 = ITEM2) then
      ITEMMATCH := TRUE
   else
      ITEMMATCH := FALSE
end;

function MATCH ({between} SUSPECT, CRIMINAL : DATARECORD): BOOLEAN;
begin
   if ITEMMATCH (SUSPECT.HEIGHT, CRIMINAL.HEIGHT)
      and ITEMMATCH (SUSPECT.HAIRCOLOUR, CRIMINAL.HAIRCOLOUR)
      and ITEMMATCH (SUSPECT.EYECOLOUR, CRIMINAL.EYECOLOUR)
      and ITEMMATCH (SUSPECT.HATSIZE, CRIMINAL.HATSIZE)
      and ITEMMATCH (SUSPECT.SHOESIZE, CRIMINAL.SHOESIZE)
      and ITEMMATCH (SUSPECT.TEETHMARKS, CRIMINAL.TEETHMARKS)
      and ITEMMATCH (SUSPECT.CIGARTYPE, CRIMINAL.CIGARTYPE)
      and ITEMMATCH (SUSPECT.FACIALSCAR, CRIMINAL.FACIALSCAR)
      and ITEMMATCH (SUSPECT.HANDSCAR, CRIMINAL.HANDSCAR)
      and ITEMMATCH (SUSPECT.EYEPATCH, CRIMINAL.EYEPATCH)
      and ITEMMATCH (SUSPECT.BALDPATCH, CRIMINAL.BALDPATCH)
      and ITEMMATCH (SUSPECT.LEGLIMP, CRIMINAL.LEGLIMP)
      and ITEMMATCH (SUSPECT.TATTOO, CRIMINAL.TATTOO) then
      MATCH := TRUE
   else
      MATCH := FALSE
end;

begin { -- Main Algorithm }
   GETSUSPECTINFO (SUSPECT);
   RESET (MASTERFILE);

   while not EOF(MASTERFILE) do begin
      READ (MASTERFILE, {giving} CRIMINAL);
      if MATCH (SUSPECT, CRIMINAL) then
         WRITELN ('POSSIBLE SUSPECT ', CRIMINAL.NAME)
   end;
end.
