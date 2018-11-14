*&---------------------------------------------------------------------*
*& Report  Y_DEBUG_IMA
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Y_DEBUG_IMA.

TABLES trdir.

PARAMETERS:
      p_ape1 TYPE c LENGTH 20,
      p_ape2 TYPE c LENGTH 20,
      p_nombre TYPE c LENGTH 30
.

SELECTION-SCREEN skip.

PARAMETERS:
      fechaN TYPE datum,
      p_dni TYPE c LENGTH 15,
      p_domici TYPE c LENGTH 50,
      p_email TYPE c LENGTH 30
.

SELECTION-SCREEN skip.

PARAMETERS:
      p_cntr_i RADIOBUTTON GROUP cntr,
      p_cntr_t RADIOBUTTON GROUP cntr DEFAULT 'X',
      p_cntr_p RADIOBUTTON GROUP cntr
.

SELECTION-SCREEN skip.

PARAMETERS:
      p_tick_r TYPE c AS CHECKBOX,
      p_tick_m TYPE c AS CHECKBOX,
      p_tick_p TYPE c AS CHECKBOX,
      p_horas TYPE i, " Horas semanales
      p_sal_m TYPE i  " Salario Mensual
.

PARAMETERS:
      p_fechaa TYPE sydatum
.

SELECTION-SCREEN skip.

SELECT-OPTIONS s_prog FOR trdir-name.