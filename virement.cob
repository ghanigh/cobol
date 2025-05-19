       IDENTIFICATION DIVISION.
       PROGRAM-ID. VIREMENT-BANCAIRE.
       AUTHOR. GHANI.
       DATE-WRITTEN. 2025-04-20.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SOURCE-COMPUTER. THINKPAD.
           OBJECT-COMPUTER. X395.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMERO-COMPTE-SOURCE PIC 9(5).
       01 NUMERO-COMPTE-DESTINATION PIC 9(5).
       01 MONTANT-VIREMENT PIC 9(10)V99.
       01 CONFIRMATION PIC X.
       01 SOLDE-SOURCE PIC 9(10)V99 VALUE 1000.00. *> Solde du compte source (simplifié)
       01 SOLDE-DESTINATION PIC 9(10)V99 VALUE 500.00. *> Solde du compte destination (simplifié)
       01 MESSAGE-ERREUR PIC X(50).

       PROCEDURE DIVISION.
       MAIN-PARAGRAPH.
           DISPLAY '--- Simulation de Virement Bancaire ---'.
           DISPLAY ' '.

           DISPLAY 'Entrez le numéro de compte source (5 chiffres) : '.
           ACCEPT NUMERO-COMPTE-SOURCE.

           DISPLAY 'Entrez le numéro de compte destinataire (5 chiffres) : '.
           ACCEPT NUMERO-COMPTE-DESTINATION.

           DISPLAY 'Entrez le montant à virer : '.
           ACCEPT MONTANT-VIREMENT.

           DISPLAY ' '.
           DISPLAY 'Confirmer le virement de ' MONTANT-VIREMENT ' EUR'.
           DISPLAY 'du compte ' NUMERO-COMPTE-SOURCE.
           DISPLAY 'vers le compte ' NUMERO-COMPTE-DESTINATION ' (O/N) ?'.
           ACCEPT CONFIRMATION.

           IF CONFIRMATION = 'O' OR CONFIRMATION = 'o' THEN
               IF MONTANT-VIREMENT > SOLDE-SOURCE THEN
                   MOVE 'Solde insuffisant pour effectuer le virement.'
                       TO MESSAGE-ERREUR.
                   DISPLAY MESSAGE-ERREUR.
               ELSE
                   SUBTRACT MONTANT-VIREMENT FROM SOLDE-SOURCE.
                   ADD MONTANT-VIREMENT TO SOLDE-DESTINATION.
                   DISPLAY ' '.
                   DISPLAY 'Virement de ' MONTANT-VIREMENT ' EUR effectué'.
                   DISPLAY 'du compte ' NUMERO-COMPTE-SOURCE.
                   DISPLAY 'vers le compte ' NUMERO-COMPTE-DESTINATION.
                   DISPLAY 'Nouveau solde du compte source : ' SOLDE-SOURCE.
                   DISPLAY 'Nouveau solde du compte destinataire : ' SOLDE-DESTINATION.
               END-IF
           ELSE
               DISPLAY 'Virement annulé par l''utilisateur.'.
           END-IF.

           STOP RUN.