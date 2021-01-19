program COMPUTEDATE (INPUT, OUTPUT);

{ -- January 1, 1889 was a Tuesday.
  -- This programme reads in a number named NUMOFDAYS,
  -- representing the number of days since Januray 1.
  -- The programme prints the corresponding date. }

type
   DAYNAME   = (SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY);
   MONTHNAME = (JANUARY, FEBRUARY, MARCH, APRIL, MAY, JUNE, JULY, AUGUST, SEPTEMBER, OCTOBER, NOVEMBER, DECEMBER);

var
   DAYOFWEEK  : DAYNAME;
   MONTH      : MONTHNAME;
   DAYOFMONTH : 1..31;
   CURRENTNUM : 1..365;
   NUMOFDAYS  : 1..365;

begin
   MONTH := JANUARY;
   DAYOFMONTH := 1;
   DAYOFWEEK := TUESDAY;

   READ (NUMOFDAYS);

   for CURRENTNUM := 2 to NUMOFDAYS do begin
      if DAYOFWEEK = SATURDAY then
         DAYOFWEEK := SUNDAY
      else
         DAYOFWEEK := SUCC(DAYOFWEEK);

      if (MONTH = JANUARY) and (DAYOFMONTH = 31)
         or (MONTH = FEBRUARY) and (DAYOFMONTH = 28)
         or (MONTH = MARCH) and (DAYOFMONTH = 31)
         or (MONTH = APRIL) and (DAYOFMONTH = 30)
         or (MONTH = MAY) and (DAYOFMONTH = 31)
         or (MONTH = JUNE) and (DAYOFMONTH = 30)
         or (MONTH = JULY) and (DAYOFMONTH = 31)
         or (MONTH = AUGUST) and (DAYOFMONTH = 31)
         or (MONTH = SEPTEMBER) and (DAYOFMONTH = 30)
         or (MONTH = OCTOBER) and (DAYOFMONTH = 31)
         or (MONTH = NOVEMBER) and (DAYOFMONTH = 30) then
         begin
            MONTH := SUCC(MONTH);
            DAYOFMONTH := 1
         end
      else
         DAYOFMONTH := DAYOFMONTH + 1
   end;

   case DAYOFWEEK of
     SUNDAY    : WRITE ('SUNDAY, ');
     MONDAY    : WRITE ('MONDAY, ');
     TUESDAY   : WRITE ('TUESDAY, ');
     WEDNESDAY : WRITE ('WEDNESDAY, ');
     THURSDAY  : WRITE ('THURSDAY, ');
     FRIDAY    : WRITE ('FRIDAY, ');
     SATURDAY  : WRITE ('SATURDAY, ');
   end;

   case MONTH of
     JANUARY   : WRITE ('JANUARY', DAYOFMONTH:3);
     FEBRUARY  : WRITE ('FEBRUARY', DAYOFMONTH:3);
     MARCH     : WRITE ('MARCH', DAYOFMONTH:3);
     APRIL     : WRITE ('APRIL', DAYOFMONTH:3);
     MAY       : WRITE ('MAY', DAYOFMONTH:3);
     JUNE      : WRITE ('JUNE', DAYOFMONTH:3);
     JULY      : WRITE ('JULY', DAYOFMONTH:3);
     AUGUST    : WRITE ('AUGUST', DAYOFMONTH:3);
     SEPTEMBER : WRITE ('SEPTEMBER', DAYOFMONTH:3);
     OCTOBER   : WRITE ('OCTOBER', DAYOFMONTH:3);
     NOVEMBER  : WRITE ('NOVEMBER', DAYOFMONTH:3);
     DECEMBER  : WRITE ('DECEMBER', DAYOFMONTH:3);
   end
end.
