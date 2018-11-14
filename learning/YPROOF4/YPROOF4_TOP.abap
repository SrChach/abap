*&---------------------------------------------------------------------*
*&  Include           YPROOF4_TOP
*&---------------------------------------------------------------------*

DATA:
      it_kna1 TYPE STANDARD TABLE OF kna1,
      wa_kna1 LIKE LINE OF it_kna1,
      it_adrc TYPE STANDARD TABLE OF adrc,
      wa_adrc LIKE LINE OF it_adrc,
      c1(250) TYPE c,
      e3 TYPE i
.

PARAMETERS:
      numC TYPE kna1-kunnr,
      int1 TYPE i,
      int2 TYPE i
.