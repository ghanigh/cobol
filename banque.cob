       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIMULATION-BANQUE.
       AUTHOR. GHANI.
       DATE-WRITTEN. 2025-04-17.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. THINKPAD.
       OBJECT-COMPUTER. X395.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CHOIX-MENU PIC 9 VALUE 0.
       01 NUMERO-COMPTE PIC 9(5).
       01 MONTANT PIC 9(10)V99.
       01 SOLDE PIC 9(10)V99 VALUE 1000.00.
       01 NOM-CLIENT PIC X(30).
       01 CONTINUER PIC X VALUE 'O'.

       01 MESSAGE-ERREUR PIC X(50).

       01 COMPTE-BANCAIRE.
           05 NUMERO-CPTE PIC 9(5).
           05 NOM-CLI PIC X(30).
           05 SOLDE-CPTE PIC 9(10)V99.

       PROCEDURE DIVISION.
       MAIN-PARAGRAPH.
           PERFORM UNTIL CONTINUER = 'N'
               DISPLAY " "
               DISPLAY "--- Simulation Bancaire ---"
               DISPLAY "1. Créer un compte (non implémenté)"
               DISPLAY "2. Déposer de l'argent"
               DISPLAY "3. Retirer de l'argent"
               DISPLAY "4. Consulter le solde"
               DISPLAY "9. Quitter"
               DISPLAY "Entrez votre choix : "
               ACCEPT CHOIX-MENU

               EVALUATE CHOIX-MENU
                   WHEN 1
                       DISPLAY "Fonctionnalité non implémentée."
                   WHEN 2
                       PERFORM DEPOT
                   WHEN 3
                       PERFORM RETRAIT
                   WHEN 4
                       PERFORM CONSULTER-SOLDE
                   WHEN 9
                       MOVE 'N' TO CONTINUER
                   WHEN OTHER
                       MOVE "Choix invalide." TO MESSAGE-ERREUR
                       DISPLAY MESSAGE-ERREUR
               END-EVALUATE
           END-PERFORM.

           DISPLAY "Merci d'utiliser notre simulation bancaire."
           STOP RUN.

       DEPOT SECTION.
       DEPOT-PARAGRAPH.
           DISPLAY "Entrez le montant à déposer : "
           ACCEPT MONTANT
           ADD MONTANT TO SOLDE
           DISPLAY "Dépot de " MONTANT " effectué."
           DISPLAY "Nouveau solde : " SOLDE.

       RETRAIT SECTION.
       RETRAIT-PARAGRAPH.
           DISPLAY "Entrez le montant à retirer : "
           ACCEPT MONTANT
           IF MONTANT > SOLDE THEN
               MOVE "Solde insuffisant." TO MESSAGE-ERREUR
               DISPLAY MESSAGE-ERREUR
           ELSE
               SUBTRACT MONTANT FROM SOLDE
               DISPLAY "Retrait de " MONTANT " effectué."
               DISPLAY "Nouveau solde : " SOLDE
           END-IF.

       CONSULTER-SOLDE SECTION.
       CONSULTER-SOLDE-PARAGRAPH.
           DISPLAY "Votre solde actuel est : " SOLDE.