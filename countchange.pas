program COUNTCHANGE (INPUT, OUTPUT);

var
   NUMPENNIES, NUMNICKELS, NUMDIMES,
   NUMQUARTERS, NUMHALVES, NUMDOLLARS,
   TOTALCHANGE, DOLLARS, CENTS : INTEGER;

begin
   TOTALCHANGE := 0;

   READ (NUMPENNIES);
   TOTALCHANGE := TOTALCHANGE + 01 * NUMPENNIES;

   READ (NUMNICKELS);
   TOTALCHANGE := TOTALCHANGE + 05 * NUMNICKELS;

   READ (NUMDIMES);
   TOTALCHANGE := TOTALCHANGE + 10 * NUMDIMES;

   READ (NUMQUARTERS);
   TOTALCHANGE := TOTALCHANGE + 25 * NUMQUARTERS;

   READ (NUMHALVES);
   TOTALCHANGE := TOTALCHANGE + 50 * NUMHALVES;

   READ (NUMDOLLARS);
   TOTALCHANGE := TOTALCHANGE + 100 * NUMDOLLARS;

   DOLLARS := TOTALCHANGE div 100;
   CENTS := TOTALCHANGE mod 100;

   WRITE ('CHANGE IS ', DOLLARS:2, ' DOLLARS AND ', CENTS:2, ' CENTS.')

end.
