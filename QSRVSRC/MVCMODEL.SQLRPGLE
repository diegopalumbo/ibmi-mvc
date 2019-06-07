**FREE
      //----------------------------------------------------------------------------
      //  Per creare il service program...
      //  Libreria corrente impostata a LIBOBJ
      //  Libreria sorgenti impostata a LIBSRC
      //
      //  1. CRTSQLRPGI OBJ(MVC/MVCMODEL) SRCFILE(MVC/QSRVSRC)
      //     SRCMBR(MVCMODEL) OBJTYPE(*MODULE) OPTION(*EVENTF)
      //     RPGPPOPT(*LVL2) TGTRLS(*CURRENT) REPLACE(*YES)
      //     DBGVIEW(*SOURCE)
      //  2. Se non presente creare bind directory: CRTBNDDIR BNDDIR(LIBOBJ/MVCDIRE)
      //  3. se necessario aggiornare MVCDIRE.BND in LIBSRC/QSRVSRC
      //  4. Ricompilare il service program:
      //          CRTSRVPGM SRVPGM(LIBOBJ/MVCMODEL)
      //          MODULE(*LIBL/MVCMODEL)
      //          SRCFILE(LIBSRC/QSRVSRC)
      //  5. Aggiungere il service programm ad indirizzario di binding:
      //          ADDBNDDIRE BNDDIR(LIBOBJ/MVCDIRE) OBJ((MVCMODEL *SRVPGM))
      //----------------------------------------------------------------------------

     CTL-OPT NOMAIN BNDDIR('MVCDIRE');

     // compile options
     /define mvc_clienti
     /include qCpySrc,MVCModel_H

      // modulo_base_account
     /include qModelSrc,MvcClieMdl


