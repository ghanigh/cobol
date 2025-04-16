IDENTIFICATION DIVISION.
       PROGRAM-ID. JEU-DIX-QUESTIONS-FLEXIBLE.
       AUTHOR. GHANI.
       DATE-WRITTEN. 2025-04-16.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. THINKPAD.
       OBJECT-COMPUTER. X395.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 QUESTION-INDEX PIC 9 VALUE 1.
       01 REPONSE-UTILISATEUR PIC X(30).
       01 BONNE-REPONSE PIC X(30).
       01 REPONSE-MAJUSCULES PIC X(30).
       01 BONNE-REPONSE-MAJUSCULES PIC X(30).
       01 SCORE PIC 99 VALUE 0.

       01 QUESTIONS-TABLE.
           05 QUESTION OCCURS 10 TIMES INDEXED BY Q-INDEX.
              10 Q-TEXT PIC X(80).
              10 A-TEXT PIC X(30).

       PROCEDURE DIVISION.
       INITIALIZE QUESTIONS-TABLE.
       MAIN-PARAGRAPH.
           MOVE "Quelle est la capitale de la France ?" TO Q-TEXT(1).
           MOVE "Paris" TO A-TEXT(1).
           MOVE "Quel est le plus haut sommet du monde ?" TO Q-TEXT(2).
           MOVE "Mont Everest" TO A-TEXT(2).
           MOVE "Quel est le symbole chimique de l'eau ?" TO Q-TEXT(3).
           MOVE "H2O" TO A-TEXT(3).
           MOVE "Qui a peint la Joconde ?" TO Q-TEXT(4).
           MOVE "Leonard de Vinci" TO A-TEXT(4).
           MOVE "En quelle année a débuté la Première Guerre mondiale ?" TO Q-TEXT(5).
           MOVE "1914" TO A-TEXT(5).
           MOVE "Quel est le nom de la planète rouge ?" TO Q-TEXT(6).
           MOVE "Mars" TO A-TEXT(6).
           MOVE "Quel est le plus grand océan ?" TO Q-TEXT(7).
           MOVE "Pacifique" TO A-TEXT(7).
           MOVE "Quel est le langage de programmation que nous apprenons ?" TO Q-TEXT(8).
           MOVE "COBOL" TO A-TEXT(8).
           MOVE "Quel est le nom du vaisseau spatial qui a aluni en premier ?" TO Q-TEXT(9).
           MOVE "Apollo 11" TO A-TEXT(9).
           MOVE "Combien de côtés a un hexagone ?" TO Q-TEXT(10).
           MOVE "Six" TO A-TEXT(10).

           PERFORM VARYING QUESTION-INDEX FROM 1 BY 1 UNTIL QUESTION-INDEX > 10
               DISPLAY "Question " QUESTION-INDEX " : " Q-TEXT(QUESTION-INDEX)
               ACCEPT REPONSE-UTILISATEUR

               *> Convertir la réponse de l'utilisateur en majuscules
               PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF REPONSE-UTILISATEUR
                   IF REPONSE-UTILISATEUR(I:1) IS LOWER-CASE THEN
                       MOVE FUNCTION UPPER-CASE(REPONSE-UTILISATEUR(I:1)) TO REPONSE-MAJUSCULES(I:1)
                   ELSE
                       MOVE REPONSE-UTILISATEUR(I:1) TO REPONSE-MAJUSCULES(I:1)
                   END-IF
               END-PERFORM

               *> Convertir la bonne réponse en majuscules
               MOVE A-TEXT(QUESTION-INDEX) TO BONNE-REPONSE
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > LENGTH OF BONNE-REPONSE
                   IF BONNE-REPONSE(J:1) IS LOWER-CASE THEN
                       MOVE FUNCTION UPPER-CASE(BONNE-REPONSE(J:1)) TO BONNE-REPONSE-MAJUSCULES(J:1)
                   ELSE
                       MOVE BONNE-REPONSE(J:1) TO BONNE-REPONSE-MAJUSCULES(J:1)
                   END-IF
               END-PERFORM

               *> Comparer les réponses en majuscules
               IF REPONSE-MAJUSCULES = BONNE-REPONSE-MAJUSCULES THEN
                   DISPLAY "Bonne réponse !"
                   ADD 1 TO SCORE
               ELSE
                   DISPLAY "Mauvaise réponse. La réponse était : " A-TEXT(QUESTION-INDEX)
               END-IF
           END-PERFORM.

           DISPLAY "Jeu terminé ! Votre score final est : " SCORE " sur 10.".
           STOP RUN.

       *> Fonction pour obtenir la longueur d'une chaîne (implémentation simple)
       LENGTH FUNCTION LENGTH OF REPONSE-UTILISATEUR.
       LENGTH FUNCTION LENGTH OF BONNE-REPONSE. 