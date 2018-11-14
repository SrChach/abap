*&---------------------------------------------------------------------*
*&  Include           YPROOF2_F01
*&---------------------------------------------------------------------*

FORM slct_wa_makt.
  SELECT *
    FROM makt
    INTO CORRESPONDING FIELDS OF TABLE it_makt
    WHERE matnr = material
  .

  IF sy-subrc = 0.
    flag = 1.

    CLEAR ti_fieldcat.

    ti_fieldcat-fieldname = 'MATNR'.
    ti_fieldcat-tabname = 'it_makt'.
    ti_fieldcat-seltext_l = 'Material'.
    ti_fieldcat-just = 'C'. " keseso?
    ti_fieldcat-outputlen = 6.
    ti_fieldcat-NO_ZERO = 'X'. " Keh balores puede tomar además de X? :v
    ti_fieldcat-emphasize = 'C310'.

    APPEND ti_fieldcat.
    CLEAR ti_fieldcat.

    ti_fieldcat-fieldname = 'MAKTX'.
    ti_fieldcat-tabname = 'it_makt'.
    ti_fieldcat-seltext_l = 'Denominación'.
    ti_fieldcat-just = 'L'.
    ti_fieldcat-outputlen = 50.
    ti_fieldcat-NO_ZERO = 'X'. " Keh balores puede tomar además de X? :v
    ti_fieldcat-emphasize = 'C410'.

    APPEND ti_fieldcat.
    CLEAR ti_fieldcat.
  ENDIF.
ENDFORM.

FORM salida.
    IF flag = 1.
        CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        it_fieldcat = ti_fieldcat[]
      TABLES
        t_outtab    = it_makt.
    ELSE.
      WRITE: 'Registro ', material, ' no existente'.
    ENDIF.
ENDFORM.