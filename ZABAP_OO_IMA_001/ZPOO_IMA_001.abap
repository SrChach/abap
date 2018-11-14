*&---------------------------------------------------------------------*
*& Report  ZPOO_IMA_001
*& Ignacio Martinez Avila
*&---------------------------------------------------------------------*
*&    SE80/ZABAP_OO_IMA_001(paquete)/PROGRAMS/ZPOO_IMA_001
*&
*&---------------------------------------------------------------------*

REPORT  ZPOO_IMA_001.

CLASS formulas DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS media_aritmetica
      IMPORTING num1 TYPE i num2 TYPE i num3 TYPE i
      RETURNING VALUE(media) TYPE i.
ENDCLASS.

CLASS formulas IMPLEMENTATION.
  METHOD media_aritmetica.
      media = ( num1 + num2 + num3 ) / 3.
  ENDMETHOD.
ENDCLASS.

CLASS factura DEFINITION.
  PUBLIC SECTION.
    DATA sociedad TYPE bukrs.
    METHODS:  emitir_factura,
              verificarSociedad IMPORTING i_sociedad TYPE bukrs
                                RETURNING VALUE(existe) TYPE i
    .
  PROTECTED SECTION.
    DATA fecha TYPE sydatum.
  PRIVATE SECTION.
    METHODS aceptar_pago IMPORTING cuenta TYPE hkont.
ENDCLASS.

CLASS factura IMPLEMENTATION.
  METHOD emitir_factura.

  ENDMETHOD.

  METHOD  aceptar_pago.

  ENDMETHOD.
  METHOD verificarSociedad.
      DATA lv_soc TYPE bukrs.
      SELECT SINGLE bukrs FROM t001
        INTO lv_soc
        WHERE bukrs = i_sociedad.
      IF sy-subrc = 0.
        existe = 1.
      ENDIF.
  ENDMETHOD.
ENDCLASS.

CLASS tarifa DEFINITION.
  PUBLIC SECTION.
    METHODS:  set_tar_corp  IMPORTING tarifa TYPE wertv8
                            EXPORTING total TYPE wertv8
                            EXCEPTIONS no_aplica.
    CLASS-METHODS:  set_tar_base IMPORTING tarifa TYPE wertv8.

  PRIVATE SECTION.
    data: tar_corp TYPE wertv8.
    CLASS-DATA tar_bas TYPE wertv8.
ENDCLASS.

CLASS tarifa IMPLEMENTATION.
  METHOD set_tar_corp.
    tar_corp = tarifa.
    IF sy-datum+4(2) = 04.
      total = ( tar_bas + tar_corp ) * ( 8 / 10 ).
    ELSE.
      total = tar_bas + tar_corp.
      RAISE no_aplica.
    ENDIF.
  ENDMETHOD.
  METHOD set_tar_base.
    tar_bas = tarifa.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA: gr_factura TYPE REF TO factura,
        gr_tarifa TYPE REF TO tarifa,
        gv_total TYPE wertv8,
        drogas TYPE i.

  tarifa=>set_tar_base( tarifa = '10.20' ).
  CREATE OBJECT:  gr_tarifa,
                  gr_factura.

  CALL METHOD gr_tarifa->set_tar_corp(
      EXPORTING tarifa = '20.40'
      IMPORTING total = gv_total
      EXCEPTIONS no_aplica = 1 OTHERS = 2
  ).

  IF sy-subrc <> 0.
    MESSAGE 'No se aplica la tarifa especial' TYPE 'I'.
  ENDIF.

  WRITE: / 'Total de la tarifa aplicada ', gv_total.

  drogas = gr_factura->verificarSociedad( '100' ).

  IF drogas = 1.
    MESSAGE 'La sociedad existe' TYPE 'I'.
  ELSE.
    MESSAGE 'La sociedad no existe' TYPE 'I' DISPLAY LIKE 'E'.
  ENDIF.

*  IF gr_factura->verificarSociedad( '100' ) = 1.
*    MESSAGE 'La sociedad existe' TYPE 'I'.
*  ELSE.
*    MESSAGE 'La sociedad no existe' TYPE 'I' DISPLAY LIKE 'E'.
*  ENDIF.
drogas = formulas=>media_aritmetica( num1 = 3  num2 = 4 num3 = 5 ).

WRITE: / 'media: ' ,drogas.