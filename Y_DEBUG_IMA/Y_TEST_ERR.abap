*&---------------------------------------------------------------------*
*& Report  Y_DEBUG_IMA
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Y_DEBUG_IMA.

TYPES : BEGIN OF ST_TRANSP,
 name1      LIKE adrc-NAME1,     " Razón social del transportista
 name2      LIKE adrc-name2,     "Nombre 2
 house_num1 LIKE adrc-house_num1,  "Numero Interno
 street     LIKE adrc-STREET,    " Calle
 STR_SUPPL1 like adrc-STR_SUPPL1,
 mc_city1   LIKE adrc-mc_city1,  " Delegacion
 country    LIKE adrc-country,   " Municipio
 post_code1 LIKE adrc-post_code1," Codigo Postal
 stcd1      LIKE lfa1-stcd1,     " R.F.C
 tel_number LIKE adrc-tel_number," Tels
 END OF ST_TRANSP.
TYPES : BEGIN OF lugar_exp,
 street      LIKE adrc-street,     " Domicilio
 NAME1       LIKE ADRC-NAME1,
 house_num1  LIKE adrc-house_num1, " Domicilio
 str_suppl1  LIKE adrc-str_suppl1, " Origen
 mc_city1    LIKE adrc-mc_city1,   " Domicilio
 DTABF       LIKE VTTK-DTABF,
 END OF lugar_exp.
TYPES : BEGIN OF ST_KNA1,
ort01       LIKE kna1-ort01,      " Destino
regio       LIKE kna1-regio,      " Destino
name1       LIKE kna1-name1,      " Destinatario
ADRNR       LIKE KNA1-ADRNR,      " NUM.DIRECCION
KUNNR       LIKE KNA1-KUNNR,      " CLIENTE
  END OF ST_KNA1.
TYPES : BEGIN OF lugar_dest,
street      LIKE adrc-street,     " Domicilio
house_num1  LIKE adrc-house_num1, " Domicilio
str_suppl1  LIKE adrc-str_suppl1, " Domicilio
mc_city1    LIKE adrc-mc_city1 ,  " Domicilio
END OF lugar_dest.
TYPES : BEGIN OF ENTREGA,
street     LIKE adrc-street,     " Entrega
house_num1 LIKE adrc-house_num1, " Entrega
str_suppl1 LIKE adrc-str_suppl1, " Entrega
mc_city1   LIKE adrc-mc_city1 ,  " Entrega
END OF ENTREGA.
types : BEGIN OF cant_pruduc ,
 matnr LIKE lips-matnr, " Material
 lfimg LIKE lips-lfimg, " Cantidad
 vrkme LIKE lips-vrkme, " Unidad
 brgew LIKE lips-brgew, " Peso Bruto
 maktx LIKE makt-maktx, " Producto descripcion
 END OF cant_pruduc.
types : BEGIN OF ST_MAT ,
 matnr LIKE lips-matnr, " Material
 lfimg LIKE lips-lfimg, " Cantidad
 vrkme LIKE lips-vrkme, " Unidad
 brgew LIKE lips-brgew, " Peso Bruto
 maktx LIKE makt-maktx, " Producto descripcion
 END OF ST_MAT.
types  : BEGIN OF st_makt,
matnr like makt-matnr, "Material.
maktx LIKE makt-maktx, " Producto descripcion
end of st_makt.
TYPES : BEGIN OF remisiones,
vbelv LIKE vbfa-vbelv, " Numero de remisiones
 END OF remisiones.
TYPES : BEGIN OF st_vttk,
tknum  LIKE vttk-tknum, " Numero de transporte
tdlnr  LIKE vttk-tdlnr, " Num.Transportista
dtabf  LIKE vttk-dtabf, " Fecha
uzabf  LIKE vttk-uzabf, " Hora
daten  like vttk-daten, " Fecha ultima de transporte
signi  LIKE vttk-signi, " Operador
add01  LIKE vttk-add01, " Operador match "add dtbmresendiz.
exti1  LIKE vttk-exti1, " Placas
exti2  LIKE vttk-exti2, " No.Economico transporte
TPLST  LIKE VTTK-TPLST, " PtoPlanifTransp
tpbez  LIKE vttk-tpbez, " Remision ultima
text1  LIKE vttk-text1, " Placa 2
text2  LIKE vttk-text2, " Placa 3
text3  LIKE vttk-text3, " No. Eco. 2
text4  LIKE vttk-text4, " No. Eco. 3
tndr_carr like vttk-tndr_carr, " En caso de Compras.
 END OF st_vttk.
TYPES : BEGIN OF st_lfa1,
lifnr LIKE lfa1-lifnr,
adrnr LIKE lfa1-adrnr,
stcd1 like lfa1-stcd1,
 END OF st_lfa1.
TYPES : TI_TRANSP TYPE STANDARD TABLE OF ST_TRANSP,
        ti_exp TYPE STANDARD TABLE OF lugar_exp,
        ti_dest TYPE STANDARD TABLE OF lugar_dest,
        TI_cp TYPE STANDARD TABLE OF cant_pruduc,
        ti_remisiones TYPE STANDARD TABLE OF remisiones,
        ti_vttk TYPE STANDARD TABLE OF st_vttk,
        ti_lfa1 TYPE STANDARD TABLE OF st_lfa1,
        TI_ENTREGA TYPE STANDARD TABLE OF ENTREGA,
        TI_KNA1 TYPE STANDARD TABLE OF ST_KNA1,
        ti_makt TYPE STANDARD TABLE OF st_makt,
        TI_MAT TYPE STANDARD TABLE OF ST_MAT.

*  GLOBAL DATAS

DATA W_SHIPMENT_NUMBER LIKE VTTK-TKNUM .
DATA IT_VTTK TYPE TI_VTTK .
DATA IT_LFA1 TYPE TI_LFA1 .
DATA IT_TRANSP TYPE TI_TRANSP .
DATA STR_CP TYPE CANT_PRUDUC .
DATA IT_MAKT TYPE TI_MAKT .
DATA STR_LFA1 TYPE ST_LFA1 .
DATA W_VBELV LIKE VBFA-VBELV .
DATA W_VSTEL LIKE LIKP-VSTEL .
DATA W_ADRNR LIKE TVST-ADRNR .
DATA IT_EXP TYPE TI_EXP .
DATA IT_ENTREGA TYPE TI_ENTREGA .
DATA W_KUNAG LIKE LIKP-KUNAG .
DATA IT_DEST TYPE TI_DEST .
DATA W_KUNNR LIKE LIKP-KUNNR .
DATA W_ADRNR1 LIKE KNA1-ADRNR .
DATA IT_KNA1 TYPE TI_KNA1 .
DATA IT_CP TYPE TI_CP .
DATA IT_REMISIONES TYPE TI_REMISIONES .
DATA STR_REMISIONES TYPE REMISIONES .
DATA STR_TRANSP TYPE ST_TRANSP .
DATA STR_VTTK TYPE ST_VTTK .
DATA STR_EXP TYPE LUGAR_EXP .
DATA LS_MAKTX LIKE MAKT-MAKTX .
DATA LS_CP TYPE CANT_PRUDUC .
DATA V_IND TYPE SY-TABIX .
DATA STR_MAKT TYPE ST_MAKT .
DATA WA_BUKRS LIKE TTDS-BUKRS .
DATA WA_PAVAL LIKE T001Z-PAVAL .
DATA IT_MAT TYPE TI_MAT .
DATA STR_MAT TYPE ST_MAT .
DATA FS_HD_ADR TYPE TI_MAT .
DATA STR_KNA1 TYPE ST_KNA1 .
DATA STR_LUG TYPE LUGAR_DEST .
DATA STR_ENT TYPE ENTREGA .
DATA WA_LIFNR LIKE LFA1-LIFNR .
DATA WA_ADRDR LIKE ADRC-ADDRNUMBER .
DATA NAME2 TYPE KNA1-NAME2 .
DATA VL_LOGO TYPE STRING .
DATA ORG LIKE VTTK-TPLST .
DATA W TYPE I .
DATA QR TYPE CHAR20 .
DATA H .
FIELD-SYMBOLS <FS_HD_ADR> TYPE TI_MAT.



DATA: it_likp TYPE STANDARD TABLE OF likp,  " imartineza add to header
      wa_likp LIKE LINE OF it_likp.         " imartineza add to header






PARAMETERS: is_nast TYPE nast-objky.  " Ignore
w_shipment_number = is_nast.          " Ignore

SELECT * " /1BCDWB/LSF00000545F01  540
  INTO CORRESPONDING FIELDS OF TABLE it_vttk
  FROM vttk
  WHERE tknum = w_shipment_number.

  WRITE: / sy-subrc, '168'. " Ignore
LOOP AT it_vttk INTO str_vttk.
ENDLOOP.
* ADD DTBMRESENDIZ 26.10.2012
if  str_vttk-add01 <> ''.
  select single  bezei
    into str_vttk-signi
    from VTADD01T
    where ADD_INFO = str_vttk-add01
    and spras = 'S'.
      WRITE: / sy-subrc, '179'. " Ignore
endif.
* FIN  DTBMRESENDIZ 26.10.2012
IF NOT it_vttk[] IS INITIAL.
  SELECT *
   INTO CORRESPONDING FIELDS OF TABLE it_lfa1
   FROM  lfa1
   FOR ALL ENTRIES IN it_vttk
        WHERE lifnr EQ it_vttk-tdlnr.
   WRITE: / sy-subrc, '188'.  " Ignore
ENDIF.
IF NOT it_lfa1[] IS INITIAL.
  SELECT *
  INTO CORRESPONDING FIELDS OF TABLE it_transp
    FROM adrc
      FOR ALL ENTRIES IN it_lfa1
    WHERE addrnumber EQ it_lfa1-adrnr.
  WRITE: / sy-subrc, '196'. " Ignore
ENDIF.
LOOP AT it_transp INTO str_transp.
ENDLOOP.
LOOP AT it_lfa1 INTO str_lfa1.
  MOVE-CORRESPONDING str_lfa1 TO str_transp.
ENDLOOP.
SELECT *
  FROM vbfa
    INTO CORRESPONDING FIELDS OF TABLE it_remisiones
  WHERE vbeln = w_shipment_number .
WRITE: / sy-subrc, '207'. " Ignore
IF str_vttk-tndr_carr = ' '.
  LOOP AT it_remisiones INTO str_remisiones.
    SELECT SINGLE vstel
      FROM likp
      INTO w_vstel
      WHERE vbeln = str_remisiones-vbelv .
        WRITE: / sy-subrc, '214'. " Ignore
    SELECT SINGLE adrnr
      FROM tvst
      INTO w_adrnr
      WHERE vstel = w_vstel.
        WRITE: / sy-subrc, '219'. " Ignore
    SELECT *
        INTO CORRESPONDING FIELDS OF TABLE it_exp
      FROM adrc
    WHERE  addrnumber = w_adrnr.
        WRITE: / sy-subrc, '224'. " Ignore
    SELECT SINGLE bukrs
      INTO wa_bukrs
     FROM ttds
    WHERE tplst = str_vttk-tplst.
        WRITE: / sy-subrc, '229'. " Ignore
    SELECT SINGLE paval
      INTO wa_paval
     FROM t001z
    WHERE bukrs = wa_bukrs.
        WRITE: / sy-subrc, '234'. " Ignore
    EXIT.
ENDLOOP.
ELSE.
  SELECT SINGLE lifnr
    INTO wa_lifnr
    FROM ekko
    WHERE ebeln = str_vttk-tndr_carr.
      WRITE: / sy-subrc, '242'. " Ignore
  SELECT SINGLE adrnr
    INTO (wa_adrdr)
    FROM lfa1
    WHERE lifnr = wa_lifnr.
      WRITE: / sy-subrc, '247'. " Ignore
  SELECT *
      INTO CORRESPONDING FIELDS OF TABLE it_exp
      FROM adrc
      WHERE  addrnumber = wa_adrdr.
      WRITE: / sy-subrc, '252'. " Ignore
  SELECT SINGLE STCD1
      INTO wa_paval
      FROM LFA1
      WHERE lifnr = wa_lifnr.
      WRITE: / sy-subrc, '257'. " Ignore
ENDIF.
  LOOP AT it_exp INTO str_exp.
        MOVE-CORRESPONDING str_vttk TO str_exp.
      ENDLOOP.
    LOOP AT it_remisiones INTO str_remisiones.
      SELECT *
        APPENDING CORRESPONDING FIELDS OF TABLE it_cp
        FROM lips
        WHERE vbeln = str_remisiones-vbelv.
          WRITE: / sy-subrc, '267'. " Ignore
    ENDLOOP.
    LOOP AT it_cp INTO str_cp.
      MOVE-CORRESPONDING str_cp TO str_mat.
      COLLECT str_mat INTO it_mat.
    ENDLOOP.
    IF NOT it_mat[] IS INITIAL.
      SELECT *
          INTO CORRESPONDING FIELDS OF TABLE it_makt
        FROM makt
    FOR ALL ENTRIES IN it_mat
        WHERE  matnr = it_mat-matnr
        AND spras = sy-langu.
          WRITE: / sy-subrc, '280'. " Ignore
    ENDIF.
    IF str_vttk-tpbez = ' '.
      LOOP AT it_remisiones INTO str_remisiones.
        EXIT.
      ENDLOOP.
      SELECT SINGLE kunag
        FROM likp
        INTO w_kunag
        WHERE vbeln = str_remisiones-vbelv.
      SELECT *
        INTO CORRESPONDING FIELDS OF TABLE it_kna1
        FROM kna1
        WHERE kunnr = w_kunag.
      SELECT *
    INTO CORRESPONDING FIELDS OF TABLE it_dest
     FROM adrc
         FOR ALL ENTRIES IN it_kna1
     WHERE  addrnumber = it_kna1-adrnr.
      SELECT SINGLE kunnr
       FROM likp
       INTO w_kunnr
       WHERE vbeln = str_remisiones-vbelv.
      SELECT SINGLE adrnr
      FROM kna1
      INTO w_adrnr1
      WHERE kunnr = w_kunnr.
      SELECT *
         INTO CORRESPONDING FIELDS OF TABLE it_entrega
        FROM adrc
       WHERE  addrnumber = w_adrnr1.
    ELSE.
*&--------------------------------------------------------------*
*& imartineza
*&--------------------------------------------------------------*
      DATA: parche TYPE likp-vbeln.
      parche = str_vttk-tpbez.
      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
        EXPORTING
          INPUT = parche
        IMPORTING
          OUTPUT = parche.
      SELECT SINGLE kunag
        FROM likp
        INTO w_kunag
        WHERE vbeln = parche.
          WRITE: / sy-subrc, '322'. " Ignore
          WRITE: 'donde encuentre likp-vbeln =', str_vttk-tpbez, ' pondrá ', w_kunag. " Ignore
*&--------------------------------------------------------------*
*& imartineza
*&--------------------------------------------------------------*

      SELECT *
        INTO CORRESPONDING FIELDS OF TABLE it_kna1
        FROM kna1
        WHERE kunnr = w_kunag.
      SELECT *
    INTO CORRESPONDING FIELDS OF TABLE it_dest
     FROM adrc
         FOR ALL ENTRIES IN it_kna1
     WHERE  addrnumber = it_kna1-adrnr.
          WRITE: / sy-subrc, '333'. " Ignore
      SELECT SINGLE kunnr
       FROM likp
       INTO w_kunnr
*&parche aqui [original: vbeln = str_vttk-tpbez]
       WHERE vbeln = parche.  " imartineza ADD
          WRITE: / sy-subrc, '338'. "Ignore
      SELECT SINGLE adrnr
      FROM kna1
      INTO w_adrnr1
      WHERE kunnr = w_kunnr.
          WRITE: / sy-subrc, '342'. " Ignore
      SELECT *
         INTO CORRESPONDING FIELDS OF TABLE it_entrega
        FROM adrc
       WHERE  addrnumber = w_adrnr1.
          WRITE: / sy-subrc, '348'.
    ENDIF.
    DATA: ls_vttk like LINE OF it_vttk.
    read table it_vttk into ls_vttk index 1.
    org = ls_vttk-tplst.