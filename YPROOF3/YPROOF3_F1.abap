*&---------------------------------------------------------------------*
*&  Include           YPROOF3_F1
*&---------------------------------------------------------------------*

FORM slct_it_vbrp_it_makt.
  SELECT *
    FROM vbrp
    INTO TABLE it_vbrp
    WHERE vbeln = llave
  .

  SELECT *
    FROM makt
    INTO TABLE it_makt
    FOR ALL ENTRIES IN it_vbrp
    WHERE matnr = it_vbrp-matnr
  .
ENDFORM.