**FREE

      // CTL-OPT DftActGrp(*No) ACTGRP('QILE');
       CTL-OPT BndDir('MVCDIRE');

       // includo le definizioni necessarie al pgm
       /define mvc_clienti
       /copy qcpysrc,MVCModel_h
       /copy qCpySrc,MVCView_h

       // variabili interne
       dcl-ds this_DsClienti likeds(mvcModel_DsClienti);
       dcl-ds this_DsView likeds(mvcClieV1_DSVIEW);
       dcl-s  this_ErrorCode like(mvcModel_ErrorCode);
       dcl-s  this_ErrorMessage like(mvcModel_ErrorMessage);
       dcl-s  this_FuncKey like(MVCView_FuncKey);
       dcl-s  this_Message like(MVCView_Message);
       dcl-s  this_Error like(MVCView_Error);
       dcl-s  done ind inz(*off);

       doU done;

          // emissione screen VIEW
          mvcClieV1_View_emit(
            this_DSView:
            this_FuncKey:
            this_Message
          );

          select;
             when this_FuncKey = MVCView_F03;
                *inlr = '1';
                return;

             when this_FuncKey = MVCView_ENTER;

               //esegue validazione dati VIEW
               mvcClieV1_View_Validate(
                  this_DSView:
                  this_Error:
                  this_Message
               );

               if ( this_Error = *blanks ) ;
                 // controllo esistenza cliente
                 mvcModel_Clienti_Read(
                      this_DSView.ID:
                      this_DsClienti:
                      this_ErrorCode:
                      this_ErrorMessage
                 );

                 if this_ErrorCode <> *blanks ;
                    this_Message = this_ErrorMessage;
                 else;
                   // potrei aggiungere anche altre validazioni o operazioni qui!
                    this_DSView.nome = this_Dsclienti.NOME;
                    this_DSView.cognome = this_DsClienti.COGNOME;
                    this_DSView.telefono = this_DsClienti.TELEFONO;
                 ENDIF;

               ENDIF;
          endsl;
       enddo;


