**FREE

       CTL-OPT DftActGrp(*No) ACTGRP('QILE');
       CTL-OPT BndDir('MVCDIRE');

       dcl-f CLIENTIFM workstn;
       dcl-s done ind inz(*off);

       // includo le definizioni necessarie al pgm
       /define mvc_clienti
       /copy qcpysrc,MVCModel_h

       dcl-ds thisDsClienti likeds(mvcModel_DsClienti);
       dcl-s thisErrorCode like(mvcModel_ErrorCode);
       dcl-s thisErrorMessage like(mvcModel_ErrorMessage);

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
               mvcModel_Clienti_read(
                    id:
                    thisDsClienti:
                    thisErrorCode:
                    thisErrorMessage
               );

               if thisErrorCode <> *blanks ;
                  msg = thisErrorMessage;
               else;
                  nome = thisDsclienti.NOME;
                  cognome = thisDsClienti.COGNOME;
                  telefono = thisDsClienti.TELEFONO;
               ENDIF;
          endsl;
       enddo;


