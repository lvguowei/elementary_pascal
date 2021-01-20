program ENCIPHER (INPUT, OUTPUT);

{ -- This programme reads in the characters of a message and
  -- enciphers each letter. Based on the letter and the next
  -- letter of the keyword, the enciphered letter is obtained
  -- from a cipher table initially read into the program. The
  -- message is terminated by a slash. }

const
   NUMKEYLETTERS = 6;
   SLASH         = '/';

type
   LETTER = 'A'..'Z';

var
   ROW, COLUMN             : LETTER;
   MESSAGECHAR, CIPHERCHAR : CHAR;
   CIPHERTABLE             : array [LETTER, LETTER] of LETTER;
   KEYWORD                 : packed array [1..NUMKEYLETTERS] of CHAR;
   KEYINDEX                : INTEGER;

begin
   KEYWORD := 'WATSON';
   for ROW := 'A' to 'Z' do begin
      for COLUMN := 'A' to 'Z' do
         READ (CIPHERTABLE [ROW, COLUMN]);
         READLN
   end;

   KEYINDEX := 1;
   repeat
      READ (MESSAGECHAR);
      if MESSAGECHAR in ['A'..'Z'] then
         begin
            ROW := KEYWORD[KEYINDEX];
            COLUMN := MESSAGECHAR;
            CIPHERCHAR := CIPHERTABLE[ROW, COLUMN];
            WRITE (CIPHERCHAR);
            if KEYINDEX = NUMKEYLETTERS then
               KEYINDEX := 1
            else
               KEYINDEX := KEYINDEX + 1
         end
   else
      WRITE (MESSAGECHAR)
   until MESSAGECHAR = SLASH
end.
