

       // Autore: Diego Palumbo e Andrea Valerio
       // Titolo: MVC View Module

       CTL-OPT NOMAIN;


       /define mvc_clienti
       /Copy qCpySrc,MvcView_H

       dcl-proc MVCView_MVCCLIEF1_VIEW export;

         dcl-pi MVCView_MVCCLIEF1_VIEW;
           v1DsCliente  likeds(MVCView_dSMvcClieF1_VIEW) ;
           v1FuncKey char(1);
           v1Message like(MvcView_Message);
         END-PI;


         dcl-f MVCCLIEF1 workstn infds(thisInfDs);

         DCL-DS thisInfDs qualified;
           filler char(368);
           funckey char(1);
         END-DS;
         // valorizza i dati a video

         // msg = v1message;
         MVCView_dSMvcClieF1_VIEW  = v1DsCliente;

         // emette screen e legge dati di input
         write view MVCView_dSMvcClieF1_VIEW;
         read view MVCView_dSMvcClieF1_VIEW;

         // restituisce i valori letti al chimante
         v1FuncKey = thisInfDs.funcKey;
         v1DsCliente = MVCView_dSMvcClieF1_VIEW;

         return;

       END-PROC;


