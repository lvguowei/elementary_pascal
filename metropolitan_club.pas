program METROPOLITANCLUB (OUTPUT);

{ -- This programme examines the clues given for the murder
  -- at the Metropolitan Club. The tree arrays HAIR, ATTIRE, and
  -- ROOM are used to establish the facts as they are determined.
  -- The programme outputs the name of the murderer. }

const
   UNKNOWN    = 0;
   RED        = 1; BLACK = 2; GREY = 3; BROWN = 4;
   PINCENES   = 1; GOLDWATCH = 2; RUBYRING = 3; TATTEREDCUFFS = 4;
   COLWOODLEY = 1; MRHOLMAN = 2; MRPOPE = 3; SIRRAYMOND = 4;

var
   SUSPECT, MURDERER : INTEGER;
   HAIR              : array[COLWOODLEY .. SIRRAYMOND] of INTEGER;
   ATTIRE            : array[COLWOODLEY .. SIRRAYMOND] of INTEGER;
   ROOM              : array[COLWOODLEY .. SIRRAYMOND] of INTEGER;


begin
   { -- Assume nothing is known }
   MURDERER := UNKNOWN;
   for SUSPECT := COLWOODLEY to SIRRAYMOND do begin
      HAIR[SUSPECT]   := UNKNOWN;
      ATTIRE[SUSPECT] := UNKNOWN;
      ROOM[SUSPECT]   := UNKNOWN
   end;

   { -- Establish known clues }
   ROOM[SIRRAYMOND] := 10;
   ATTIRE[MRPOPE] := GOLDWATCH;
   ATTIRE[MRHOLMAN] := RUBYRING;
   ROOM[MRHOLMAN] := 12;

   { -- Repeatedly try the remaining clues }
   SUSPECT := COLWOODLEY;
   while MURDERER = UNKNOWN do begin
      if (ROOM[SUSPECT] = 14) then
         HAIR[SUSPECT] := BLACK;
      if (ATTIRE[SIRRAYMOND] <> UNKNOWN) and (ATTIRE[SIRRAYMOND] <> PINCENES) then
         ATTIRE[COLWOODLEY] := PINCENES;
      if (ATTIRE[COLWOODLEY] <> UNKNOWN) and (ATTIRE[COLWOODLEY] <> PINCENES) then
         ATTIRE[SIRRAYMOND] := PINCENES;
      if (ATTIRE[SUSPECT] = PINCENES) then
         HAIR[SUSPECT] := BROWN;
      if (ATTIRE[SUSPECT] = TATTEREDCUFFS) then
         HAIR[SUSPECT] := RED;
      if (ROOM[SUSPECT] = 16) then
         ATTIRE[SUSPECT] := TATTEREDCUFFS;
      if (ROOM[SUSPECT] = 12) then
         HAIR[SUSPECT] := GREY;
      if (ATTIRE[SUSPECT] = GOLDWATCH) then
         ROOM[SUSPECT] := 14;

      if (ROOM[SUSPECT] = 10) and (SUSPECT <> COLWOODLEY) then
         ROOM[COLWOODLEY] := 16;
      if (ROOM[SUSPECT] = 16) and (SUSPECT <> COLWOODLEY) then
         ROOM[COLWOODLEY] := 10;

      if (HAIR[SUSPECT] = BROWN) then
         MURDERER := SUSPECT;

      if (SUSPECT = SIRRAYMOND) then
         SUSPECT := COLWOODLEY
      else
         SUSPECT := SUSPECT + 1
   end; { -- remaining clues }

   { -- Print the name of the murderer }
   if MURDERER = COLWOODLEY then
      WRITE ('THE MURDERER IS COLONEL WOODLEY.')
   else if MURDERER = MRHOLMAN then
      WRITE ('THE MURDERER IS MR. HOLMAN.')
   else if MURDERER = MRPOPE then
      WRITE ('THE MURDERER IS MR. POPE.')
   else
      WRITE ('THE MURDERER IS SIR RAYMOND.')
end.
