program TIDES (INPUT, OUTPUT);

{ -- This programme reads in the day of the month and the hour of
  -- high tide, as well as the day and hour of some aerlier event.
  -- Times must be given in 24-hour form; for instance
  -- 3 p.m. is given as 18.
  -- The programme computes the number of tide cycles during the elapsed time. }

const
   MINSPERHR        = 60;
   MINSPERDAY       = 1440;
   MINSPERTIDECYCLE =  745;

var
   TODAYSDATE, TIDEHR,
   EVENTDATE, EVENTHR,
   MINSTOHIGHTIDE, MINSTOEVENT, ELAPSEDTIME: LONGINT;

   TIDECYCLES:REAL;

begin
   READ (TODAYSDATE, TIDEHR, EVENTDATE, EVENTHR);

   MINSTOHIGHTIDE := (TODAYSDATE - 1) * MINSPERDAY;
   MINSTOHIGHTIDE := MINSTOHIGHTIDE + TIDEHR * MINSPERHR;

   MINSTOEVENT := (EVENTDATE - 1) * MINSPERDAY;
   MINSTOEVENT := MINSTOEVENT + EVENTHR * MINSPERHR;

   ELAPSEDTIME := MINSTOHIGHTIDE - MINSTOEVENT;
   TIDECYCLES := ELAPSEDTIME / MINSPERTIDECYCLE;

   WRITE ('THE NUMBER OF TIDE CYCLES IS', TIDECYCLES)
end.
