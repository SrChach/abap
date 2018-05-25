*&---------------------------------------------------------------------*
*&  El servicio corre en: 
*&    SICF/[ejecutar]/default_hots/sap/bc/ZDEMO_SERVICE
*&  Servicio web que implementa el metodo IF_HTTP_EXTENSION
*&---------------------------------------------------------------------*
*& |Archivo de configoracion:
*&  SE24/ZCCL_DEMO_SERVI_HANDLER
*&  Archivo para manejar peticiones HTTPS, web de referencia: 
*&    http://freesapabap.blogspot.mx/2013/11/creating-service-in-sicf-transaction.html
*&---------------------------------------------------------------------*


method IF_HTTP_EXTENSION~HANDLE_REQUEST.

    DATA: req_par TYPE string,
          res_data TYPE string,
          cml TYPE x VALUE '27'.

    req_par = server->request->get_header_field( name = '~path_info' ).

    SHIFT req_par LEFT BY 1 PLACES.
*    res_data = '{"sEcho":1,"iTotalRecords":2,"iTotalDisplayRecords":2,"aaData":[["a","b"],["c","d"]]}'.
    res_data = ` {"TEXT": "Hola ABAP, ¡soy JSON!"} `.
    server->response->set_cdata(
      EXPORTING data = res_data " Character data
    ).

endmethod.