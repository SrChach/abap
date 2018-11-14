*&---------------------------------------------------------------------*
*&  Include           YPROOF3_TOP
*&---------------------------------------------------------------------*

DATA:
      it_vbrp TYPE STANDARD TABLE OF vbrp,
      wa_vbrp LIKE LINE OF it_vbrp,
      it_makt TYPE STANDARD TABLE OF makt,
      wa_makt LIKE LINE OF it_makt
.

PARAMETERS: llave TYPE vbrp-vbeln.