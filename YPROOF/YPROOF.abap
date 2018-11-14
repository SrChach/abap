REPORT  yproof.

INCLUDE yproof_top.
INCLUDE yproof_f01.

START-OF-SELECTION.
  PERFORM slct_wa_adrp.

  IF wa_adrp IS NOT INITIAL.
    WRITE: wa_adrp-name_text.
  ELSE.
    WRITE: 'Sin valores'.
  ENDIF.