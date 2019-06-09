       // ------------------------------------------------------------------------------------------
       // ModelClientiRead
       dcl-proc mvcModel_Clienti_Read export;

          // Procedure Interface
          dcl-pi mvcModel_Clienti_Read ;
              id int(10) value;
              record likeds(MVCModel_dsCLienti);
              errCode char(7); // potrebbe essere anche una ds
              errMsg char(70);
          end-pi;

          // Clear dati di output
          clear record;
          clear errCode;
          clear errMsg;

          // lettura dati
          EXEC SQL
            SELECT * into :record
            FROM  CLIENTI
            WHERE ID = :id;

            // Acquisizione eventuale errore
          if (sqlCode <> 0);
              errCode = 'CST0001';
              errMsg = 'Customer Not Found!' ;
          endIf;

          return;

       end-proc;
