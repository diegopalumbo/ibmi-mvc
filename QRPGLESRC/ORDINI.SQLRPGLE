**FREE

       CTL-OPT DftActGrp(*No) ACTGRP('QILE');

       dcl-f ORDINIFM workstn;
       DCL-DS dsClienti EXTNAME('CLIENTI') QUALIFIED ALIAS ;
       END-DS;
       DCL-DS dsProdotti EXTNAME('PRODOTTI') QUALIFIED ALIAS ;
       END-DS;
       DCL-DS dsListino EXTNAME('LISTINO') QUALIFIED ALIAS;
       END-DS;

       dcl-s done ind inz(*off);

       doU done;
          exfmt view;
          clear msg;
          clear v1nome;
          clear v1desc;
          clear v1prezzo;
          select;
             when *in05;
             when *in03;
                *inlr = '1';
                return;
             other;
                controlliVideo();
          endsl;
       enddo;
       //-------------------------------------------
       dcl-proc controlliVideo;

           // controllo esistenza cliente
           EXEC SQL
             SELECT *
               INTO :dsClienti
               FROM CLIENTI
               WHERE ID = :V1CLIE;
           if SQLCODE = 100;
              msg = 'Errore cliente non presente in archivio';
              *in01 = *on;
              return;
           else;
             v1nome = dsclienti.nome + ' ' + dsClienti.cognome;
           ENDIF;

           EXEC SQL
             SELECT * INTO :dsprodotti FROM PRODOTTI
               WHERE ID = :V1PROD;
           if SQLCODE = 100;
              msg = 'Errore prodotto non presente in archivio';
              *in02 = *on;
              return;
           else;
              v1desc = dsprodotti.descrizione;
           ENDIF;

           V1PREZZO = 0;

           EXEC SQL
             SELECT PREZZO INTO : V1PREZZO FROM LISTINO
               WHERE AREA = :dsClienti.AREA AND
               PRODOTTO_ID = :V1PROD ;

           IF SQLCODE = 100;
              msg = 'NON TROVATO LISTINO PER IL PRODOTTO';
              *in02 = *on;
              return;
           ENDIF;


       END-PROC;

