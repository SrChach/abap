*&---------------------------------------------------------------------*
*&  Include           YPROOF4_F01
*&---------------------------------------------------------------------*

FORM fdx.

  SELECT *
    FROM kna1
    INTO TABLE it_kna1
    WHERE kunnr = numC
  .

  SELECT *
    FROM adrc
    INTO TABLE it_adrc
    FOR ALL ENTRIES IN it_kna1
    WHERE addrnumber = it_kna1-adrnr
  .

ENDFORM.

FORM fdy USING e1 e2.

  e1 = e1 + e2.
  WRITE: 'ola k ase :v ', e1.

ENDFORM.