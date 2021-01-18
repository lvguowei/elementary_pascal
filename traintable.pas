program TRAINTABLE (INPUT, OUTPUT);

{ -- This programme reads in a series of train times on the route
  -- from Birmingham to London.
  -- The programme calculates the total time of a journey from
  -- Birmingham to London, assuming a stop at Oxford. }
const
   OXFORD = 1524; { code for Oxford }
   LONDON = 1215; { code for London }

var
   CITY, TRAINNUM, CONNECTION, JOURNEY,
   STARTTIME, STOPTIME, ARRIVALTIME,
   NEXTSTARTTIME, NEXTSTOPTIME, NEXTARRIVALTIME: INTEGER;

begin
   { -- Set up for first train }
   WRITELN ('DEPARTING     OXFORD      TOTAL');
   WRITELN ('  TRAIN     CONNECTION   JOURNEY');
   WRITELN ('---------   ----------   -------');
   WRITELN;

   READ (CITY, STARTTIME);
   while (CITY <> OXFORD) do
      READ (CITY, STOPTIME);
   while (CITY <> LONDON) do
      READ (CITY, ARRIVALTIME);

   { -- Handle each connecting train }
   for TRAINNUM := 2 to 10 do begin
      READ (CITY, NEXTSTARTTIME);
      while (CITY <> OXFORD) do
         READ (CITY, NEXTSTOPTIME);
      while (CITY <> LONDON) do
         READ (CITY, NEXTARRIVALTIME);
      CONNECTION := NEXTSTOPTIME - STOPTIME;
      JOURNEY := NEXTARRIVALTIME - STARTTIME;
      if (STOPTIME mod 100) > (NEXTSTOPTIME mod 100) then
         CONNECTION := CONNECTION - 40;
      if (STARTTIME mod 100) > (NEXTARRIVALTIME mod 100) then
         JOURNEY := JOURNEY - 40;
      WRITELN ((TRAINNUM - 1):5, CONNECTION:13, JOURNEY:11);

      { -- Prepare for handling the next train }
      STARTTIME := NEXTSTARTTIME;
      STOPTIME := NEXTSTOPTIME
   end;
   WRITELN;
   WRITELN ('BIRMINGHAM TO LONDON TIMES, STOPPING AT OXFORD')
end.
