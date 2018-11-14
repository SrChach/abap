*&---------------------------------------------------------------------*
*& Report  YPROOF6
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  YPROOF6.

DATA: lv_total  TYPE i VALUE 0,
      lv_aux    TYPE i,
      lv_inicio TYPE i,
      lv_fin    TYPE i,
      operador  TYPE i VALUE 1000.

PARAMETER lp_suma TYPE i DEFAULT 9999.

START-OF-SELECTION.

  lv_aux = lp_suma. "Almacenamos el valor
  GET RUN TIME FIELD lv_inicio.
* Metodo con secursividad --------------------------------------------------------

  PERFORM suma USING lp_suma lv_total.

*  -------------------------------------------------------------------------------
  GET RUN TIME FIELD lv_fin.
  lv_fin = ( lv_fin - lv_inicio ) / operador.
  WRITE: / '(RECURSIVO) tiempo de respuesta: ', lv_fin , ' milisegundos'.
* ---------------------------------------------------------------------------------
* ---------------------------------------------------------------------------------
  WRITE: /.
  WRITE: /.
* ---------------------------------------------------------------------------------
* ---------------------------------------------------------------------------------
  lp_suma = lv_aux. "cargamos su valor
  lv_aux = lv_fin.
  lv_total = 0.
  GET RUN TIME FIELD lv_inicio.
* Metodo sin secursividad --------------------------------------------------------

  WHILE lp_suma > 0.
    lv_total = lv_total + lp_suma.
    lp_suma = lp_suma - 1.
  ENDWHILE.
  WRITE: 'resultado ', lv_total.

* --------------------------------------------------------------------------------
  GET RUN TIME FIELD lv_fin.
  lv_fin = ( lv_fin - lv_inicio ) / operador.
  WRITE: / '(NO RECURSIVO) tiempo de respuesta: ', lv_fin , ' milisegundos'.

  WRITE: /.
  WRITE: /.
  IF lv_aux < lv_fin.
    WRITE: / 'La recursividad es la mejor solución'.
  ELSEIF lv_aux = lv_fin.
    WRITE: / 'EMPATE!!!!'.
  ELSE.
    WRITE: / 'El while es la mejor solución'.
  ENDIF.

FORM suma USING lv_suma TYPE i lv_total TYPE i.

  IF lv_suma > 0.
    lv_total = lv_total + lv_suma.
    lv_suma = lv_suma - 1.
    PERFORM suma USING lv_suma lv_total.
  ELSE.
    WRITE: 'resultado ', lv_total.
  ENDIF.

ENDFORM.