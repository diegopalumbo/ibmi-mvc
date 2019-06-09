**FREE

    // CTL-OPT DftActGrp(*No) ACTGRP('QILE');
       CTL-OPT BndDir('MVCDIRE');

      // dcl-f MVCCLIEF1 workstn;
       dcl-s done ind inz(*off);

       // includo le definizioni necessarie al pgm
       /define mvc_clienti
       /copy qcpysrc,MVCModel_h
       /copy qCpySrc,MVCView_h

       dcl-ds this_DsClienti likeds(mvcModel_DsClienti);
       dcl-s this_ErrorCode like(mvcModel_ErrorCode);
       dcl-s this_ErrorMessage like(mvcModel_ErrorMessage);
       dcl-ds this_dsMvcClieF1_View likeds(MVCView_dSMvcClieF1_VIEW);
       dcl-s  this_FuncKey like(MVCView_FuncKey);
       dcl-s  this_Message like(MVCView_Message);

       doU done;

          // emissione screen VIEW
          MVCView_MVCCLIEF1_VIEW(
            this_dSMvcClieF1_VIEW:
            this_FuncKey:
            this_Message
          );

          select;
             when this_FuncKey = MVCView_F03;
                *inlr = '1';
                return;
             when this_FuncKey = MVCView_ENTER;
               // controllo esistenza cliente
               mvcModel_Clienti_Read(
                    this_dSMvcClieF1_View.ID:
                    this_DsClienti:
                    this_ErrorCode:
                    this_ErrorMessage
               );

               if this_ErrorCode <> *blanks ;
                  this_Message = this_ErrorMessage;
               else;
                  this_dsMvcClieF1_VIEW.nome = this_Dsclienti.NOME;
                  this_dsMvcClieF1_VIEW.cognome = this_DsClienti.COGNOME;
                  this_dsMvcClieF1_VIEW.telefono = this_DsClienti.TELEFONO;
               ENDIF;
          endsl;
       enddo;


