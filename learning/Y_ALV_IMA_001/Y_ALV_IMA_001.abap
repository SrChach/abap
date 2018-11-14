*&---------------------------------------------------------------------*
*& Report  Y_ALV_IMA_001
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Y_ALV_IMA_001.

TYPE-POOLS: slis.

" Variables para la estructura y layout del reporte
DATA: fieldcat TYPE slis_t_fieldcat_alv WITH HEADER LINE, " Catálogo de campos del reporte
      ls_layout TYPE slis_layout_alv, " Presentación del reporte
      i_repid LIKE sy-repid.  " Nombre del programa

"  Variables para la cabecera del reporte
DATA: gt_events TYPE slis_T_event WITH HEADER LINE,
      t_header TYPE slis_t_listheader,
      l_header TYPE slis_listheader.

" Estructura de la tabla de vuelos

DATA: BEGIN OF st_spfli.
          INCLUDE STRUCTURE spfli.
DATA: traffic_light TYPE c, " Luz de tráfico
      line_color(4) TYPE c. " Color de la línea de la tabla
DATA: END OF st_spfli.

DATA: it_spfli LIKE TABLE OF st_spfli WITH HEADER LINE.

" Comienzo de selección

START-OF-SELECTION.

  i_repid = sy-repid.
  " TRAER DATOS
  PERFORM extrae-datos.
  PERFORM merge_field_catalog.
  PERFORM define_layout.
  PERFORM build_top_of_page.
  PERFORM top_of_page.
  PERFORM mostrar_alv.

END-OF-SELECTION.


*&---------------------------------------------------------------------*
*&      Form  EXTRAE-DATOS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM EXTRAE-DATOS .
  clear: it_spfli.
  refresh: it_spfli.
  SELECT * FROM SPFLI INTO CORRESPONDING FIELDS OF TABLE it_spfli.
  LOOP AT it_spfli.
    IF it_spfli-distance < 1500.
      it_spfli-traffic_light = 1.
      it_spfli-line_color = 'C600'.
    ELSEIF it_spfli-distance < 5000.
      it_spfli-traffic_light = 2.
      it_spfli-line_color = 'C300'.
    ELSE.
      it_spfli-traffic_light = 3.
      it_spfli-line_color = 'C300'.
    ENDIF.
    MODIFY it_spfli.
  ENDLOOP.

  SORT it_spfli BY traffic_light carrid connid.
ENDFORM.                    " EXTRAE-DATOS

*&---------------------------------------------------------------------*
*&      Form  MERGE_FIELD_CATALOG
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM MERGE_FIELD_CATALOG .
  CLEAR: fieldcat.
  REFRESH: fieldcat.

  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
   EXPORTING
     I_PROGRAM_NAME               = i_repid
     I_INTERNAL_TABNAME           = 'ST_SPFLI'
     I_INCLNAME                   = i_repid
    CHANGING
      CT_FIELDCAT                  =  fieldcat[].
ENDFORM.                    " MERGE_FIELD_CATALOG

*&---------------------------------------------------------------------*
*&      Form  DEFINE_LAYOUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM DEFINE_LAYOUT .
  ls_layout-zebra = 'X'.
  ls_layout-colwidth_optimize = 'X'.
  ls_layout-lights_fieldname = 'TRAFFIC_LIGHT'.
  ls_layout-info_fieldname = 'LINE_COLOR'.
  ls_layout-window_titlebar = 'Historial de Vuelos'.
ENDFORM.                    " DEFINE_LAYOUT

*&---------------------------------------------------------------------*
*&      Form  BUILD_TOP_OF_PAGE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM BUILD_TOP_OF_PAGE .
  CLEAR: gt_events.
  REFRESH: gt_events.
  gt_events-name = 'TOP_OF_PAGE'.
  gt_events-form = 'TOP_OF_PAGE'.
  APPEND gt_events.
ENDFORM.                    " BUILD_TOP_OF_PAGE

*&---------------------------------------------------------------------*
*&      Form  TOP_OF_PAGE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM TOP_OF_PAGE .
  CLEAR: t_header.
  REFRESH: t_header.

  CLEAR: l_header.
  l_header-typ = 'H'.
  l_header-info = 'REPORTE DE VUELOS POR AEROLINEA'.
  APPEND l_header TO t_header.

  CLEAR: l_header.
  l_header-typ = 'S'.
  l_header-key = 'Actualizado al '.
  WRITE sy-datum TO l_header-info DD/MM/YYYY.
  APPEND l_header TO t_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      IT_LIST_COMMENTARY = t_header[].
ENDFORM.                    " TOP_OF_PAGE

FORM set_pf_status USING rt_extab TYPE slis_t_extab.
  SET PF-STATUS 'STATUS100'.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  MOSTRAR_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM MOSTRAR_ALV .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
   EXPORTING
     I_CALLBACK_PROGRAM                = i_repid
     I_CALLBACK_PF_STATUS_SET          = 'SET_PF_STATUS'
     I_GRID_TITLE                      = 'TABLA SPFLIGHT'
     IS_LAYOUT                         = ls_layout
     IT_FIELDCAT                       = fieldcat[]
     I_SAVE                            = 'X'
     IT_EVENTS                         = gt_Events[]
    TABLES
      T_OUTTAB                          = it_spfli.

ENDFORM.                    " MOSTRAR_ALV