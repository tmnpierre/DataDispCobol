       IDENTIFICATION DIVISION.
       PROGRAM-ID. DataDisp.
       AUTHOR. Pierre.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  I         PIC 9(02) VALUE 1.
       
      *    Définition de la structure pour les données de test.
       01  TEST-DATA.
           03 FILLER PIC X(32) VALUE "0001HOKKAI       TARO       0400".
           03 FILLER PIC X(32) VALUE "0002AOMORI       JIRO       0350".
           03 FILLER PIC X(32) VALUE "0003AKITA        SABURO     0300".
           03 FILLER PIC X(32) VALUE "0004IWATE        SHIRO      0900".
           03 FILLER PIC X(32) VALUE "0005MIYAGI       GORO       0200".
           03 FILLER PIC X(32) VALUE "0006FUKUSHIMA    RIKURO     0150".
           03 FILLER PIC X(32) VALUE "0007TOCHIGI      SHICHIRO   0100".
           03 FILLER PIC X(32) VALUE "0008IBARAKI      HACHIRO    1050".
           03 FILLER PIC X(32) VALUE "0009GUMMA        KURO       0200".
           03 FILLER PIC X(32) VALUE "0010SAITAMA      JURO       0350".
      
       01  WS-USER-DATA REDEFINES TEST-DATA.
           03  WS-USER-RECORDS OCCURS 10 TIMES.
               05 WS-ID                 PIC X(04).
               05 WS-REGION             PIC X(12).
               05 WS-NAME               PIC X(12).
               05 WS-SCORE              PIC X(04).
       
       PROCEDURE DIVISION.

      *    Démarre le point d'entrée du programme principal.
       1000-MAIN.

           PERFORM 1100-PROCESS-DATA THRU 1100-EXIT.
           STOP RUN.

      * Démarre la section de traitement des données.
       1100-PROCESS-DATA.

      * Affiche l'en-tête des données.
           DISPLAY "ID   Région        Nom        Score".
           DISPLAY "-----------------------------------".
           
      * Effectue une boucle de traitement pour chaque enregistrement.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               DISPLAY WS-ID OF WS-USER-RECORDS (I) 
               SPACE 
               WS-REGION OF WS-USER-RECORDS (I) 
               SPACE 
               WS-NAME OF WS-USER-RECORDS (I) 
               SPACE 
               WS-SCORE OF WS-USER-RECORDS (I)
           END-PERFORM.
           DISPLAY "-----------------------------------".
           DISPLAY " ".

           DISPLAY "ID  Région       Nom       Score".
           DISPLAY "--------------------------------".
           DISPLAY WS-USER-RECORDS (2).
           DISPLAY WS-USER-RECORDS (5).
           DISPLAY WS-USER-RECORDS (10).
           DISPLAY "-----------------------------------".
           DISPLAY " ".

           DISPLAY "ID   Région        Nom        Score".
           DISPLAY "-----------------------------------".
           DISPLAY WS-ID OF WS-USER-RECORDS (2) " " 
      -            WS-REGION OF WS-USER-RECORDS (2) " "  
      -            WS-NAME OF WS-USER-RECORDS (2) " "  
      -            WS-SCORE OF WS-USER-RECORDS (2).
           DISPLAY WS-ID OF WS-USER-RECORDS (5) " "  
      -            WS-REGION OF WS-USER-RECORDS (5) " "  
      -            WS-NAME OF WS-USER-RECORDS (5) " "  
      -            WS-SCORE OF WS-USER-RECORDS (5).
           DISPLAY WS-ID OF WS-USER-RECORDS (10) " "  
      -            WS-REGION OF WS-USER-RECORDS (10) " "  
      -            WS-NAME OF WS-USER-RECORDS (10) " "  
      -            WS-SCORE OF WS-USER-RECORDS (10).


       1100-EXIT.
           EXIT.
