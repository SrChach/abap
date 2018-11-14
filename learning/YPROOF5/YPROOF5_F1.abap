*&---------------------------------------------------------------------*
*&  Include           YPROOF5_F1
*&---------------------------------------------------------------------*

FORM suma_referencia USING e1 TYPE i e2 TYPE i.
  DATA e3 TYPE i.

  e3 = e1 + e2.
  WRITE: e3, /.
ENDFORM.

FORM fibonacci using e1 TYPE i.

  DATA:
    temp1 TYPE i VALUE 0,
    temp2 TYPE i VALUE 1,
    actual TYPE i VALUE 0
  .

  WHILE actual <= e1.
    actual = temp1 + temp2.
    temp1 = temp2.
    temp2 = actual.
    skip.
    WRITE: ' ', temp1.
  ENDWHILE.

ENDFORM.