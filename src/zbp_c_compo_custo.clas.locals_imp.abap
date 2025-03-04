CLASS lhc_adress DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS precheck_delete FOR PRECHECK
      IMPORTING keys FOR DELETE adress.


ENDCLASS.

CLASS lhc_adress IMPLEMENTATION.

  METHOD precheck_delete.

    LOOP AT keys INTO DATA(ls_address).
      DATA(lv_address_id) = ls_address-AddressId.

      DATA(lv_block_delete) = abap_false.
      DATA(lv_has_orders) = abap_false.
      DATA(lv_has_stock) = abap_false.

      " Check the stock (Implementation needed)

      " Check the orders
      SELECT SINGLE @abap_true
        FROM zorder as o JOIN zadress as a
          ON o~customer_id = a~customer_id
        WHERE o~order_status = 'P'
          AND a~address_id = @lv_address_id
        INTO @lv_has_orders.

      IF lv_has_orders = abap_true OR lv_has_stock = abap_true.
        lv_block_delete = abap_true.
      ENDIF.

      IF lv_block_delete = abap_true.
        APPEND VALUE #( %tky = ls_address-%tky ) TO failed-adress. " Use failed-book

        APPEND VALUE #( %tky = ls_address-%tky
                        %element-addressid = if_abap_behv=>mk-on
                        %msg = new_message( id       = 'ZM_MESSAGES_G2'
                                            number   = '001'
                                            severity = if_abap_behv_message=>severity-error )
                      ) TO reported-adress.
      ENDIF.
    ENDLOOP.



ENDMETHOD.

ENDCLASS.
