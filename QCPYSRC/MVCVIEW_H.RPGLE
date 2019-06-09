       dcl-c MVCView_F03 const(X'33');
       dcl-c MVCView_F05 const(X'35');
       dcl-c MVCView_ENTER const(X'F1');

       dcl-s MVCView_Error char(7);
       dcl-s MVCView_Message char(70);
       dcl-s MVCView_FuncKey char(1);

      /If Defined(mvc_clienti)

       dcl-ds MVCView_dSMvcClieF1_VIEW extname('MVCCLIEF1':'VIEW':*ALL)
                                     qualified;
       END-DS;

       dcl-pr MVCView_MVCCLIEF1_VIEW;
         v1DsCliente  likeds(MVCView_dSMvcClieF1_VIEW);
         v1FuncKey char(1);
         v1Message like(MvcView_Message);
       END-PR;

      /Endif
