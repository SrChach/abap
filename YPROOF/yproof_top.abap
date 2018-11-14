*&---------------------------------------------------------------------*
*&  Include           YPROOF_TOP
*&---------------------------------------------------------------------*

DATA:
      it_usr21 TYPE STANDARD TABLE OF usr21,
      wa_usr21 LIKE LINE OF it_usr21,
      it_adrp TYPE STANDARD TABLE OF adrp,
      wa_adrp LIKE LINE OF it_adrp
.

PARAMETERS user TYPE usr21-bname.