*&---------------------------------------------------------------------*
*& Report  YPROOF7_IMA
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  YPROOF7_IMA.

PARAMETERS:
  pa_msg TYPE c LENGTH 1
.

CASE pa_msg.
  WHEN 'I'.
    MESSAGE 'Un mensaje de tu gfa :v' TYPE 'I'.
  WHEN OTHERS.
    WRITE / 'El tipo de mensaje no existe'.
ENDCASE.

*DATA:
*      cn TYPE string VALUE 'Uno      Dos         Tres',
*      pos TYPE i
*.
*
*CONDENSE cn. " NO-GAPS.
*
*WRITE cn.
*
*cn = 'W23#456#ABC#789'.
*
*REPLACE ALL OCCURRENCES OF '#' IN cn WITH 'KEHSESO'.
*
*WRITE / cn.
*
*DO.
*  WRITE pos.
*  IF pos > 3 .
*    EXIT.
*  ENDIF.
*  pos = pos + 1.
*ENDDO.