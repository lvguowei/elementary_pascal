program MOLECULARWEIGHT (INPUT, OUTPUT);

{ -- This programme reads in a chemical formula. Each element
  -- and its quantity are requested by the programme. Entering
  -- ZZ indicates the end of formula.
  -- The programme determines the atomic components of the formula
  -- and prints out the total molecular weight. Only elements from
  -- the first five series of Mendeleeff's table are considered. }

const
   BLANK =  ' ';

type
   ELEMENT = (HYDROGEN, LITHIUM, BERYLLIUM, BORON, CARBON,
              NITROGEN, OXYGEN, FLUORINE, SODIUM, MAGNESIUM,
              ALUMINUIM, SILICON, PHOSPHORUS, SULPHUR, CHLORINE,
              POTASSIUM, CALCIUM, TITANIUM, VANADIUM, CHROMIUM,
              MANGANESE, IRON, COBALT, NICKEL, COPPER,
              ZINC, ARSENIC, SELENIUM, BROMINE, DONE, UNKNOWN);
   PERIODICTABLE = array [ELEMENT] of REAL;

var
   NEXTELEMENT  : ELEMENT;
   NUMATOMS     : INTEGER;
   TOTALWEIGHT  : REAL;
   ATOMICWEIGHT : PERIODICTABLE;

procedure SETUPTABLE({initializing} var ATOMICWEIGHT : PERIODICTABLE );

begin
   ATOMICWEIGHT[HYDROGEN] := 1.0;
   ATOMICWEIGHT[LITHIUM] := 7.0;
   ATOMICWEIGHT[BERYLLIUM] := 9.4;
   ATOMICWEIGHT[BORON] := 11.0;
   ATOMICWEIGHT[CARBON] := 12.0;

   ATOMICWEIGHT[NITROGEN] := 14.0;
   ATOMICWEIGHT[OXYGEN] := 16.0;
   ATOMICWEIGHT[FLUORINE] := 19.0;
   ATOMICWEIGHT[SODIUM] := 23.0;
   ATOMICWEIGHT[MAGNESIUM] := 24.0;

   ATOMICWEIGHT[ALUMINUIM] := 27.3;
   ATOMICWEIGHT[SILICON] := 28.0;
   ATOMICWEIGHT[PHOSPHORUS] := 31.0;
   ATOMICWEIGHT[SULPHUR] := 32.0;
   ATOMICWEIGHT[CHLORINE] := 35.5;

   ATOMICWEIGHT[POTASSIUM] := 39.0;
   ATOMICWEIGHT[CALCIUM] := 40.0;
   ATOMICWEIGHT[TITANIUM] := 48.0;
   ATOMICWEIGHT[VANADIUM] := 51.0;
   ATOMICWEIGHT[CHROMIUM] := 52.0;

   ATOMICWEIGHT[MANGANESE] := 55.0;
   ATOMICWEIGHT[IRON] := 56.0;
   ATOMICWEIGHT[COBALT] := 59.0;
   ATOMICWEIGHT[NICKEL] := 59.0;
   ATOMICWEIGHT[COPPER] := 63.0;

   ATOMICWEIGHT[ZINC] := 65.0;
   ATOMICWEIGHT[ARSENIC] := 75.0;
   ATOMICWEIGHT[SELENIUM] := 78.0;
   ATOMICWEIGHT[BROMINE] := 80.0;
end;

procedure GETNAME (    {using} CHAR1, CHAR2 : CHAR;
                       {giving} var NAME: ELEMENT);
var
   ABBREVIATION : packed array[1..2] of CHAR;

begin
   ABBREVIATION[1] := CHAR1;
   ABBREVIATION[2] := CHAR2;

   if ABBREVIATION = 'H ' then NAME := HYDROGEN
   else if ABBREVIATION = 'LI' then NAME := LITHIUM
   else if ABBREVIATION = 'BE' then NAME := BERYLLIUM
   else if ABBREVIATION = 'B ' then NAME := BORON
   else if ABBREVIATION = 'C ' then NAME := CARBON
   else if ABBREVIATION = 'N ' then NAME := NITROGEN
   else if ABBREVIATION = 'O ' then NAME := OXYGEN
   else if ABBREVIATION = 'F ' then NAME := FLUORINE
   else if ABBREVIATION = 'NA' then NAME := SODIUM
   else if ABBREVIATION = 'MG' then NAME := MAGNESIUM
   else if ABBREVIATION = 'AL' then NAME := ALUMINUIM
   else if ABBREVIATION = 'SI' then NAME := SILICON
   else if ABBREVIATION = 'P ' then NAME := PHOSPHORUS
   else if ABBREVIATION = 'S ' then NAME := SULPHUR
   else if ABBREVIATION = 'CL' then NAME := CHLORINE
   else if ABBREVIATION = 'K ' then NAME := POTASSIUM
   else if ABBREVIATION = 'CA' then NAME := CALCIUM
   else if ABBREVIATION = 'TI' then NAME := TITANIUM
   else if ABBREVIATION = 'V ' then NAME := VANADIUM
   else if ABBREVIATION = 'CR' then NAME := CHROMIUM
   else if ABBREVIATION = 'MN' then NAME := MANGANESE
   else if ABBREVIATION = 'FE' then NAME := IRON
   else if ABBREVIATION = 'CO' then NAME := COBALT
   else if ABBREVIATION = 'NI' then NAME := NICKEL
   else if ABBREVIATION = 'CU' then NAME := COPPER
   else if ABBREVIATION = 'ZN' then NAME := ZINC
   else if ABBREVIATION = 'AS' then NAME := ARSENIC
   else if ABBREVIATION = 'SE' then NAME := SELENIUM
   else if ABBREVIATION = 'BR' then NAME := BROMINE
   else if ABBREVIATION = 'ZZ' then NAME := DONE
   else
      NAME := UNKNOWN
end;

procedure GETELEMENT({ giving } var NEWELEMENT : ELEMENT;
                                var NUMATOMS   : INTEGER);
var
   CHAR1, CHAR2 : CHAR;
   VALIDENTRY   : BOOLEAN;

begin
   VALIDENTRY := FALSE;
   repeat
      WRITE ('ENTER ELEMENT ABBREVIATION:');
      READ (CHAR1);
      if not EOLN then
         READ (CHAR2)
      else
         CHAR2 := BLANK;
      READLN;
      GETNAME({ using } CHAR1, CHAR2, { giving } NEWELEMENT);
      if NEWELEMENT = DONE then
         VALIDENTRY := TRUE
      else if NEWELEMENT = UNKNOWN then
         WRITELN ('ELEMENT NOT RECOGNIZED')
      else
         begin
            WRITE ('ENTER QUANTITY OF ELEMENT:');
            READLN (NUMATOMS);
            VALIDENTRY := TRUE
         end
   until VALIDENTRY
end;

begin { -- main algorithm }
   SETUPTABLE ({ giving } ATOMICWEIGHT);
   TOTALWEIGHT := 0.0;

   WRITELN ('ENTER EACH ELEMENT; WHEN DONE ENTER ZZ.');
   GETELEMENT ({ giving } NEXTELEMENT, NUMATOMS);
   while NEXTELEMENT <> DONE do begin
      TOTALWEIGHT := TOTALWEIGHT + ATOMICWEIGHT[NEXTELEMENT] * NUMATOMS;
      GETELEMENT({ giving } NEXTELEMENT, NUMATOMS)
   end;
   WRITELN ('THE MOLECULAR WEIGHT IS ', TOTALWEIGHT:6:1)
end.
