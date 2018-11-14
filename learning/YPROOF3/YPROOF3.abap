*&---------------------------------------------------------------------*
*& Report  YPROOF3
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  YPROOF3.

INCLUDE yproof3_top.
INCLUDE yproof3_f1.

START-OF-SELECTION.
  PERFORM slct_it_vbrp_it_makt.

  IF sy-subrc = 0.
    LOOP AT it_vbrp INTO wa_vbrp.
      READ TABLE it_makt INTO wa_makt WITH KEY matnr = wa_vbrp-matnr.
      WRITE: / wa_vbrp-matnr, wa_makt-maktx.
    ENDLOOP.
  ELSE.
    WRITE 'No existe esa factura'.
  ENDIF.