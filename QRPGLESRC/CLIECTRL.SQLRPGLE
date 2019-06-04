**FREE

       CTL-OPT DftActGrp(*No) ACTGRP('QILE');

       dcl-f CLIENTIFM workstn;
       DCL-f clienti KEYED;
       dcl-s done ind inz(*off);

       doU done;
          exfmt view;
          clear msg;
          clear nome;
          clear cognome;
          clear telefono;
          select;
             when *in05;
             when *in03;
                *inlr = '1';
                return;
             other;
               // controllo esistenza cliente
               chain id clienti;
               if not %found ;
                  msg = 'Errore cliente non presente in archivio';
               ENDIF;
          endsl;
       enddo;


