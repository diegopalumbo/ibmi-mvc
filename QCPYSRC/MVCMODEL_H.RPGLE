
        dcl-s MVCModel_ErrorCode char(7);
        dcl-s MVCModel_ErrorMessage char(70);

       /If Defined(mvc_clienti)

        dcl-ds MVCModel_DsClienti extname('CLIENTI') qualified ALIAS inz;
        end-ds;

        dcl-pr mvcModel_Clienti_Read;
            id int(10) value;
            record likeds(MVCModel_DsCLienti);
            errCode like(MVCModel_ErrorCode);
            errMsg like(MVCModel_ErrorMessage);
        end-pr;

       /Endif

