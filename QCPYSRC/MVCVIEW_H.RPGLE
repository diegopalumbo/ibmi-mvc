       dcl-c MVCView_F03 const(X'33');
       dcl-c MVCView_F05 const(X'35');
       dcl-c MVCView_ENTER const(X'F1');

       dcl-s MVCView_Error char(7);
       dcl-s MVCView_Message char(70);
       dcl-s MVCView_FuncKey char(1);

      /If Defined(mvc_clienti)

       dcl-ds mvcClieV1_DSVIEW extname('MVCCLIEF1':'VIEW':*ALL)
                                     qualified;
       END-DS;

       dcl-pr mvcClieV1_View_Emit;
         v1DsCliente  likeds(mvcClieV1_DSVIEW);
         v1FuncKey char(1);
         v1Message like(MvcView_Message);
       END-PR;

       dcl-pr mvcClieV1_View_Validate;
           v1DsCliente  likeds(mvcClieV1_DSVIEW) ;
           v1Error like(MvcView_Error);
           v1Message like(MvcView_Message);
       end-pr;

      /Endif
