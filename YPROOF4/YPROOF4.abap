*&---------------------------------------------------------------------*
*& Report  YPROOF4
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  YPROOF4.

include YPROOF4_top.
include YPROOF4_F01.

START-OF-SELECTION.

  PERFORM fdx.
  PERFORM fdy USING int1 int2.
  WRITE int1.

  IF sy-subrc = 0.
    LOOP AT it_kna1 INTO wa_kna1.
      READ TABLE it_adrc INTO wa_adrc WITH KEY addrnumber = wa_kna1-adrnr.
      CONCATENATE wa_adrc-name1 wa_adrc-city1 wa_adrc-street INTO c1 SEPARATED BY ' ,'.
      WRITE: c1.
*  $    WRITE: wa_adrc-name1, ' ', wa_adrc-city1, ' ', wa_adrc-street.
    ENDLOOP.
  ELSE.
    WRITE: 'Ninguna dirección encontrada. Nada que mostrar'.
  ENDIF.