program IDENTIFYCIGAR (INPUT, OUTPUT);

{ -- This programme reads in four properties of cigar ash.
  -- The properties are coded as numbers.
  -- The programme attempts to identify the ash according to the
  -- properties, and prints a message giving its findings. }

const
   DARK      = 1;
   DARKGREY  = 2;
   LIGHTGREY = 3;
   BROWNTINT = 4;
   FLAKY     = 1;
   CAKED     = 2;
   GRANULAR  = 3;
   FLUFFY    = 4;
   PLUS1     = 1;
   PLUS2     = 2;
   PLUS3     = 3;
   NORMAL    = 1;
   ABNORMAL  = 2;
   NO        = 1;
   YES       = 2;

var
   TEXTURE, COLOUR, PARTICLES, NICOTINE, STOCK, NORMALITY :  INTEGER;

begin
   READ (TEXTURE, COLOUR, PARTICLES, NICOTINE);

   if (TEXTURE = FLAKY) or (TEXTURE = CAKED) then
      STOCK := 1
   else
      STOCK := 2;

   if (NICOTINE = PLUS2) and (PARTICLES = NO) then
      NORMALITY := NORMAL
   else
      NORMALITY := ABNORMAL;

   if (NORMALITY = NORMAL) and (STOCK = 1) then
      if (COLOUR = DARK) and (TEXTURE = FLAKY) then
         WRITE ('CIGAR IS A TRICHINOPOLY')
      else if (COLOUR = DARK) and (TEXTURE = FLAKY) then
         WRITE ('CIGAR IS AN ESPANADA')
      else if (COLOUR = DARKGREY) and (TEXTURE = FLAKY) then
         WRITE ('CIGAR IS A MACDUFFY')
      else if (COLOUR = DARKGREY) and (TEXTURE = CAKED) then
         WRITE ('CIGAR IS A TOP HAT')
      else if (COLOUR = LIGHTGREY) and (TEXTURE = FLAKY) then
         WRITE ('CIGAR IS A HERITAGE')
      else if (COLOUR = BROWNTINT) and (TEXTURE = CAKED) then
         WRITE ('CIGAR IS A LONDONER')
      else
         WRITE ('*** UNIDENTIFIED NOMAL CIGAR OF STOCK 1');

   if (NORMALITY = NORMAL) and (STOCK = 2) then
      if (COLOUR = DARKGREY) and (TEXTURE = GRANULAR) then
         WRITE ('CIGAR IS A LUNKAH')
      else if (COLOUR = LIGHTGREY) and (TEXTURE = FLUFFY) then
         WRITE ('CIGAR IS A WEST COUNTRY')
      else
         WRITE ('*** UNIDENTIFIED NORMAL CIGAR OF STOCK 2');
   if (NORMALITY = ABNORMAL) then
      if (COLOUR = BROWNTINT) and (NICOTINE = PLUS3) then
         WRITE ('CIGAR IS AN OLD WOOD')
      else if (COLOUR = DARK) and (NICOTINE = PLUS1) and (PARTICLES = YES) then
         WRITE ('CIGAR IS A LATINO')
      else
         WRITE ('*** UNIDENTIFIED ABNORMAL CIGAR')
end.


