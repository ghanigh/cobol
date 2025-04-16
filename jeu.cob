IDENTIFICATION DIVISION.
       PROGRAM-ID. JEU-QUESTION-REPONSE-CONTINU.
       AUTHOR. GHANI.
       DATE-WRITTEN. 2025-04-16.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. THINKPAD.
       OBJECT-COMPUTER. X395.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 REPONSE-UTILISATEUR PIC X(30).
       01 BONNE-REPONSE PIC X(30) VALUE "Paris".
       01 EST-CORRECT PIC X VALUE "N".
           88 REPONSE-CORRECTE VALUE "O".

       PROCEDURE DIVISION.
       MAIN-PARAGRAPH.
           PERFORM UNTIL REPONSE-CORRECTE
               DISPLAY "Question 1 : Quelle est la capitale de la France ?"
               ACCEPT REPONSE-UTILISATEUR
               IF REPONSE-UTILISATEUR = BONNE-REPONSE THEN
                   MOVE "O" TO EST-CORRECT
                   DISPLAY "Bonne réponse !"
               ELSE
                   DISPLAY "Mauvaise réponse. Essayez encore."
               END-IF
           END-PERFORM.

           DISPLAY "Félicitations ! Vous avez trouvé la réponse.".
           STOP RUN.