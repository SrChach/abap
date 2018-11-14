*&---------------------------------------------------------------------*
*& Report  Y_ALV_IMA_002
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Y_ALV_IMA_002.

DATA: it_YTBL_IMA_001 TYPE STANDARD TABLE OF YTBL_IMA_001,
      wa_YTBL_IMA_001 LIKE LINE OF it_YTBL_IMA_001.

TYPE-POOLS: slis.
DATA: wa_layout TYPE slis_layout_alv,
      ti_fieldcat TYPE slis_t_fieldcat_alv WITH HEADER LINE.

PERFORM campos.
PERFORM salida.
*&---------------------------------------------------------------------*
*&      Form  CAMPOS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM CAMPOS .
    SELECT * FROM YTBL_IMA_001 INTO CORRESPONDING FIELDS OF TABLE it_YTBL_IMA_001.

    CLEAR ti_fieldcat.
    ti_fieldcat-fieldname = 'USUARIO'.
    ti_fieldcat-tabname = 'it_ytbl_ima_001'.
    ti_fieldcat-seltext_l = 'Usuario'.
    ti_fieldcat-just = 'C'.
    ti_fieldcat-outputlen = 20.
    ti_fieldcat-emphasize = 'C710'.
    APPEND ti_fieldcat.

    CLEAR ti_fieldcat.
    ti_fieldcat-fieldname = 'APE1'.
    ti_fieldcat-tabname = 'it_ytbl_ima_001'.
    ti_fieldcat-seltext_l = 'Ap Paterno'.
    ti_fieldcat-just = 'C'.
    ti_fieldcat-outputlen = 20.
    ti_fieldcat-emphasize = 'C710'.
    APPEND ti_fieldcat.

    CLEAR ti_fieldcat.
    ti_fieldcat-fieldname = 'APE2'.
    ti_fieldcat-tabname = 'it_ytbl_ima_001'.
    ti_fieldcat-seltext_l = 'Ap Materno'.
    ti_fieldcat-just = 'C'.
    ti_fieldcat-outputlen = 20.
    ti_fieldcat-emphasize = 'C710'.
    APPEND ti_fieldcat.

    CLEAR ti_fieldcat.
    ti_fieldcat-fieldname = 'FECHAN'.
    ti_fieldcat-tabname = 'it_ytbl_ima_001'.
    ti_fieldcat-seltext_l = 'Fecha Nacimiento'.
    ti_fieldcat-just = 'C'.
    ti_fieldcat-outputlen = 20.
    ti_fieldcat-emphasize = 'C710'.
    APPEND ti_fieldcat.

    CLEAR ti_fieldcat.
    ti_fieldcat-fieldname = 'VKORG'.
    ti_fieldcat-tabname = 'it_ytbl_ima_001'.
    ti_fieldcat-seltext_l = 'Organizacion'.
    ti_fieldcat-just = 'C'.
    ti_fieldcat-outputlen = 20.
    ti_fieldcat-emphasize = 'C710'.
    APPEND ti_fieldcat.

    CLEAR ti_fieldcat.
    ti_fieldcat-fieldname = 'FECHAA'.
    ti_fieldcat-tabname = 'it_ytbl_ima_001'.
    ti_fieldcat-seltext_l = 'Fecha alta'.
    ti_fieldcat-just = 'C'.
    ti_fieldcat-outputlen = 20.
    ti_fieldcat-emphasize = 'C710'.
    APPEND ti_fieldcat.

ENDFORM.                    " CAMPOS

*&---------------------------------------------------------------------*
*&      Form  SALIDA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM SALIDA .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      it_fieldcat = ti_fieldcat[]
    TABLES
      t_outtab    = it_ytbl_ima_001.
ENDFORM.                    " SALIDA