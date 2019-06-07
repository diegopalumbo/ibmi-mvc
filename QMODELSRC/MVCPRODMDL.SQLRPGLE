       // ------------------------------------------------------------------------------------------
       // ModelsCustomersRead
       dcl-proc ModelCustomersRead export;

          // Procedure Interface
          dcl-pi *n;
              id int(10) value;
              record likeds(dsCustomer);
              errorCode char(7); // potrebbe essere anche una ds
              errorMsg char(70);
          end-pi;

          // Clear dati di output
          clear record;
          clear errorCod;
          clear errorMsg;

          // lettura dati
          EXEC SQL
            SELECT * into : record
            FROM  CUSTOMERS
            WHERE ID = :id;

            // Acquisizione eventuale errore
          if (sqlCode <> 0);
              errorCod = 'CST0001';
              errorMsg = 'Customer Not Found!' ;
          endIf;

          return;

       end-proc;
