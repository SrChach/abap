*&---------------------------------------------------------------------*
*&  Include           YPROOF2_TOP
*&---------------------------------------------------------------------*

TYPE-POOLS: slis.

DATA:
      wa_layout TYPE slis_layout_alv,
      ti_fieldcat TYPE slis_t_fieldcat_alv WITH HEADER LINE,
      it_makt TYPE STANDARD TABLE OF makt,
      wa_makt LIKE LINE OF it_makt,
      flag TYPE boolean
.

PARAMETERS: material TYPE makt-matnr.