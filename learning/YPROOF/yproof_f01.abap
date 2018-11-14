*&---------------------------------------------------------------------*
*&  Include           YPROOF_F01
*&---------------------------------------------------------------------*

FORM slct_wa_adrp.

  SELECT *
    FROM usr21
    INTO TABLE it_usr21
    WHERE bname = user
  .

  IF sy-subrc = 0.
    READ TABLE it_usr21 INTO wa_usr21 INDEX 1.

    SELECT *
      FROM adrp
      INTO TABLE it_adrp
      WHERE persnumber = wa_usr21-persnumber
    .

    IF sy-subrc = 0.
      READ TABLE it_adrp INTO wa_adrp INDEX 1.
    ENDIF.
  ENDIF.

ENDFORM.