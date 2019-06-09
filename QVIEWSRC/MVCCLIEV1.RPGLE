
       // Autore: Diego Palumbo e Andrea Valerio
       // Titolo: MVC View Module

       CTL-OPT NOMAIN;

       /define mvc_clienti
       /Copy qCpySrc,MvcView_H

       //------------------------------------------------
       // emissione
       dcl-proc mvcClieV1_View_Emit export;

         dcl-pi mvcClieV1_View_Emit;
           v1DsCliente  likeds(mvcClieV1_DSVIEW) ;
           v1FuncKey char(1);
           v1Message like(MvcView_Message);
         END-PI;

         dcl-f MVCCLIEF1 workstn infds(thisInfDs);

         DCL-DS thisInfDs qualified;
           filler char(368);
           funckey char(1);
         END-DS;
         // valorizza i dati a video

         mvcClieV1_DSVIEW = v1DsCliente;
         mvcClieV1_DSVIEW.msg = v1message;

         // emette screen in base a DS
         write view mvcClieV1_DSVIEW;
         // legge dati di input
         read view mvcClieV1_DSVIEW;

         // restituisce i valori letti al chimante
         v1FuncKey = thisInfDs.funcKey;
         v1DsCliente = mvcClieV1_DSVIEW;

         return;

       END-PROC;

       //------------------------------------------------
       // validazione
       dcl-proc mvcClieV1_View_Validate export;

         dcl-pi mvcClieV1_View_Validate;
           v1DsCliente  likeds(mvcClieV1_DSVIEW) ;
           v1Error like(MvcView_Error);
           v1Message like(MvcView_Message);
         END-PI;

         // le logiche di validazione Qui!!

         return ;

       END-PROC;

