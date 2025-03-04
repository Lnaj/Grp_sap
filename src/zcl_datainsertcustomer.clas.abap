CLASS zcl_datainsertcustomer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DATAINSERTCUSTOMER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
        " Clear all tables
*        DELETE FROM zg1_order_items.
        DELETE FROM zorder.
        DELETE FROM zadress.
        DELETE FROM zcustomer.

        GET TIME STAMP FIELD DATA(lv_timestamp).

        " Create Customers and Addresses (Important: Addresses must be created *before* Orders)
        DATA lt_customers TYPE TABLE OF zcustomer.
        lt_customers = VALUE #(
          ( customer_id   = cl_system_uuid=>create_uuid_x16_static( )
            first_name   = 'Alice'
            last_name    = 'Johnson'
            date_of_birth = '19950510'
            nationality  = 'Canadian'
            email        = 'alice.j@example.com'
            phone        = '+15551234567'
            local_created_by  = sy-uname
            local_created_at  = lv_timestamp
            local_last_changed_by = sy-uname
            local_last_changed_at = lv_timestamp )
        ).
        INSERT zcustomer FROM TABLE @lt_customers.
        IF sy-subrc <> 0.
          out->write( |Error inserting customers.| ).
          RETURN.
        ENDIF.

        DATA lt_addresses TYPE TABLE OF zadress.
        lt_addresses = VALUE #(
          ( address_id  = cl_system_uuid=>create_uuid_x16_static( )
            customer_id = lt_customers[ 1 ]-customer_id
            street  = 'Oak Street'
            city        = 'Toronto'
            country     = 'CA'
            housenumber = '789'
            postal_code = 'M4W 1A2'
            local_created_by  = sy-uname
            local_created_at  = lv_timestamp
            local_last_changed_by = sy-uname
            local_last_changed_at = lv_timestamp )
        ).
        INSERT zadress FROM TABLE @lt_addresses.
        IF sy-subrc <> 0.
          out->write( |Error inserting addresses.| ).
          RETURN.
        ENDIF.

        " Create Orders
        DATA lt_orders TYPE TABLE OF zorder.
        lt_orders = VALUE #(
          ( order_id          = cl_system_uuid=>create_uuid_x16_static( )
            customer_id     = lt_customers[ 1 ]-customer_id
            order_date      = '20240401'
            order_status    = 'P'
            total_price     = '55.00'
            billing_adress = lt_addresses[ 1 ]-address_id
            delivery_adress = lt_addresses[ 1 ]-address_id
            local_created_by  = sy-uname
            local_created_at  = lv_timestamp
            local_last_changed_by = sy-uname
            local_last_changed_at = lv_timestamp )
        ).
        INSERT zorder FROM TABLE @lt_orders.
        IF sy-subrc <> 0.
          out->write( |Error inserting orders.| ).
          RETURN.
        ENDIF.

        out->write( |Test data created successfully!| ).

      CATCH cx_uuid_error INTO DATA(lx_uuid_error).
        out->write( |Error generating GUID: | && lx_uuid_error->get_text( ) ).
        RETURN.
    ENDTRY.


    TRY.
        " Clear all tables
*        DELETE FROM zg1_order_items.
        DELETE FROM zbook09.
        DELETE FROM zauthor09.

        " Create Authors and Books
        DATA lt_authors TYPE TABLE OF zauthor09.
        lt_authors = VALUE #(
          ( author_id   = cl_system_uuid=>create_uuid_x16_static( )
            address   = '20 Northmoor Road, Oxford, England'
            biography    =   |John Ronald Reuel Tolkien, known as J.R.R. Tolkien, was an English writer, poet, philologist, |
                          && |and academic. He was best known for his high fantasy works "The Hobbit" and "The Lord of the|
                          && | Rings." He was a professor of Anglo-Saxon at the University of Oxford and a member of the|
                          && | literary group The Inklings. Tolkien's works have had a significant impact on modern fantasy|
                          && | literature. He passed away on September 2, 1973, in Bournemouth, England.|
            date_of_birth = '18920301'
            email  = 'jrr.tolkien@fictionalmail.com'
            first_name        = 'John'
            last_name        = 'Tolkien'
            nationality = 'Bri'
            phone = '+44 1234 567890'
            local_created_by  = sy-uname
            local_created_at  = lv_timestamp
            local_last_changed_by = sy-uname
            local_last_changed_at = lv_timestamp )
        ).

        INSERT zauthor09 FROM TABLE @lt_authors.

        IF sy-subrc <> 0.
          out->write( |Error inserting customers.| ).
          RETURN.
        ENDIF.

        DATA lt_books TYPE TABLE OF zbook09.
        lt_books = VALUE #(
          (  book_id = cl_system_uuid=>create_uuid_x16_static( )
            author_id = lt_authors[ 1 ]-author_id
            cover_type  = 'Hardcover'
            edition        = '1'
            genre     = 'Fantasy'
            isbn = '978-0-123456-78-9'
            keywords = 'Adventure, Magic, Mythology, Heroic Quest'
            language = 'English'
            pagess = '350'
            publisher = 'Mythical Publishing House'
            release_date = '19820512'
            synopsis = |In "The Enchanted Woods," J.R.R. Tolkien weaves a tale of mystical forests, |
                    && |ancient magic, and brave heroes. When the young protagonist stumbles upon a hidden path, |
                    && |he discovers a world filled with fantastical creatures and a quest that will test his courage and resolve. |
                    && |Alongside a band of loyal companions, he must navigate through dangers and unlock the secrets of the enchanted woods |
                    && |to restore peace to the land.|
            title = 'The Enchanted Woods'
            price = '29.99'
            current_stock = 0
            local_created_by  = sy-uname
            local_created_at  = lv_timestamp
            local_last_changed_by = sy-uname
            local_last_changed_at = lv_timestamp )
        ).
        INSERT zbook09 FROM TABLE @lt_books.

        IF sy-subrc <> 0.
          out->write( |Error inserting books.| ).
          RETURN.
        ENDIF.


        out->write( |Test data created successfully!| ).

      CATCH cx_uuid_error INTO DATA(lx_uuid_error2).
        out->write( |Error generating GUID: | && lx_uuid_error->get_text( ) ).
        RETURN.
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
