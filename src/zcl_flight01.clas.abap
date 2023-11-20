*----------------------------------------------------------------------*
*       CLASS /NEPTUNE/CL_FLIGHT01  DEFINITIO
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
class ZCL_FLIGHT01 definition
  public
  final
  create public .

*"* public components of class ZCL_FLIGHT01
*"* do not include other source files here!!!
public section.

  interfaces /NEPTUNE/IF_NAD_SERVER .

  types:
    s_mandt type c length 3 .
  types:
    s_carr_id type c length 3 .
  types:
    s_conn_id type n length 4 .
  types S_DATE type D .
  types:
    s_book_id type n length 8 .
  types:
    s_customer type n length 8 .
  types:
    s_custtype type c length 1 .
  types:
    s_smoker type c length 1 .
  types:
    s_lugweigh type  p length 8 decimals 4 .
  types:
    s_weiunit type c length 3 .
  types:
    s_invflag type c length 1 .
  types:
    s_class type c length 1 .
  types:
    s_f_cur_pr type  p length 15 decimals 2 .
  types:
    s_curr type c length 5 .
  types:
    s_l_cur_pr type  p length 15 decimals 2 .
  types:
    s_currcode type c length 5 .
  types S_BDATE type D .
  types:
    s_countnum type n length 8 .
  types:
    s_agncynum type n length 8 .
  types:
    s_cancel type c length 1 .
  types:
    s_reserv type c length 1 .
  types:
    s_passname type c length 25 .
  types:
    s_form    type c length 15 .
  types S_BIRTHDAT type D .
  types:
    s_carrname type c length 20 .
  types:
    s_fromairp type c length 3 .
  types:
    s_from_cit type c length 20 .
  types:
    s_toairp type c length 3 .
  types:
    s_to_city type c length 20 .
  types S_DEP_TIME type T .
  types S_ARR_TIME type T .
  types S_ARRDATE type D .
  types:
    s_price_2 type p length 12 decimals 4 .
  types:
    s_curr_iso type c length 3 .
  types S_FLTIME type I .
  types:
    s_distance type p length 5 decimals 4 .
  types:
    s_mun type c length 3 .
  types:
    s_mun_iso type c length 3 .
  types:
    s_planetye type c length 10 .
  types:
    s_fltype type c length 1 .
  types S_SEATSMAX type I .
  types S_SEATSFRE type I .
  types S_SMAX_B type I .
  types S_SMAX_F type I .
  types:
    begin of ty_sbook,
            mandt	type s_mandt,
            carrid  type s_carr_id,
            connid  type s_conn_id,
            fldate  type s_date,
            bookid  type s_book_id,
            customid  type s_customer,
            custtype  type s_custtype,
            smoker  type s_smoker,
            luggweight  type s_lugweigh,
            wunit	type s_weiunit,
            invoice	type s_invflag,
            class	type s_class,
            forcuram  type s_f_cur_pr,
            forcurkey	type s_curr,
            loccuram  type s_l_cur_pr,
            loccurkey	type s_currcode,
            order_date  type s_bdate,
            counter	type s_countnum,
            agencynum	type s_agncynum,
            cancelled	type s_cancel,
            reserved  type s_reserv,
            passname  type s_passname,
            passform  type s_form,
            passbirth	type s_birthdat,
    end of ty_sbook .
  types:
    begin of bapisfldat,
            airlineid type  s_carr_id,
            airline type  s_carrname,
            connectid type  s_conn_id,
            flightdate  type s_date,
            airportfr type  s_fromairp,
            cityfrom  type s_from_cit,
            airportto type  s_toairp,
            cityto  type s_to_city,
            deptime type  s_dep_time,
            arrtime type  s_arr_time,
            arrdate type  s_arrdate,
            price type  s_price_2,
            curr  type s_currcode,
            curr_iso  type s_curr_iso,
           end of   bapisfldat .
  types:
    begin of ty_select,
               carr_id  type s_carrid,
      end of ty_select .
  types:
    begin of ty_flights.
    include  type bapisfldat.
    types:   key      type string,
             title    type string,
             intro    type string,
    end of ty_flights .
  types:
    tt_flights type standard table of ty_flights .
  types:
    begin of ty_flight_detail.
    include  type bapisfldat.
    types:
      end of ty_flight_detail .
  types:
    begin of bapisfladd,
            flighttime  type  s_fltime,
            distance  type  s_distance,
            unit  type  s_mun,
            unit_iso  type  s_mun_iso,
            planetype type  s_planetye,
            flighttype  type  s_fltype,
           end of   bapisfladd .
  types:
    begin of bapisflava ,
           economax  type  s_seatsmax,
               econofree type  s_seatsfre,
               businmax  type  s_smax_b,
               businfree type  s_seatsfre,
               firstmax  type  s_smax_f,
               firstfree type  s_seatsfre,
           end of   bapisflava .
  types:
    ty_t_sbook type standard table of ty_sbook with non-unique default key .

  data IT_FLIGHTS type TT_FLIGHTS .
  data WA_SELECT type TY_SELECT .
  data WA_FLIGHT_DETAIL type TY_FLIGHT_DETAIL .             "#EC NEEDED
  data WA_ADDITIONAL_INFO type BAPISFLADD .
  data WA_AVAILABILITY type BAPISFLAVA .
  data IT_SBOOK type TY_T_SBOOK .
protected section.
*"* protected components of class ZCL_FLIGHT01
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_FLIGHT01
*"* do not include other source files here!!!

  constants C_KEY_SEPARATOR type CHAR1 value '_'. "#EC NOTEXT

  methods GET_FLIGHTS
    importing
      !IW_CARRIER type BAPISFLKEY-AIRLINEID .
  methods GET_FLIGHT_DETAIL
    importing
      !AJAX_VALUE type STRING .
  methods GET_BOOKINGS
    importing
      !IW_CARR_ID type CLIKE
      !IW_CONN_ID type N
      !IW_DEP_DATE type D .
ENDCLASS.



CLASS ZCL_FLIGHT01 IMPLEMENTATION.


method /NEPTUNE/IF_NAD_SERVER~HANDLE_ON_AJAX.

  case ajax_id.
    when 'GET_FLIGHTS'.

      call method me->get_flights
        exporting
          iw_carrier = wa_select-carr_id.

    when 'GET_FLIGHT_DETAIL'.

      call method me->get_flight_detail
        exporting
          ajax_value = ajax_value.

    when others.

  endcase.

endmethod.


method /NEPTUNE/IF_NAD_SERVER~HANDLE_ON_REQUEST.

endmethod.


method /NEPTUNE/IF_NAD_SERVER~HANDLE_ON_RESPONSE.

endmethod.


method /NEPTUNE/IF_NAD_SERVER~HANDLE_ON_SUBMIT.

endmethod.


method /NEPTUNE/IF_NAD_SERVER~HANDLE_ON_SYNC_IN.
endmethod.


method /NEPTUNE/IF_NAD_SERVER~HANDLE_ON_SYNC_OUT.
endmethod.


method GET_BOOKINGS.

  data: lwa_sbook type ty_sbook.

  clear it_sbook.

  check iw_carr_id  is not initial.
  check iw_conn_id  is not initial.
  check iw_dep_date is not initial.

* Get Bookings
  try.
      select *
             from ('SBOOK')
             into corresponding fields of table it_sbook
             where carrid eq iw_carr_id
               and connid eq iw_conn_id
               and fldate eq iw_dep_date.                "#EC CI_DYNTAB
    catch cx_sy_dynamic_osql_semantics.
  endtry.
* Update Smoker to Boolean
  loop at it_sbook into lwa_sbook.

    if lwa_sbook-smoker is initial.
      lwa_sbook-passform = 'false'.
    else.
      lwa_sbook-passform = 'true'.
    endif.

    modify it_sbook from lwa_sbook index sy-tabix.

  endloop.

endmethod.


method GET_FLIGHTS.

  data: lit_flights_bapi type standard table of bapisfldat,
        lwa_flights_bapi type bapisfldat,
        lwa_flights      type ty_flights,
        lw_date          type char10,
        lw_time          type char10.

  clear: it_flights, lit_flights_bapi.

  try.
      call function 'BAPI_FLIGHT_GETLIST'
        exporting
          airline          = iw_carrier
*         destination_from =
*         destination_to   =
        tables
          flight_list      = lit_flights_bapi.

    catch cx_sy_dyn_call_illegal_func.

  endtry.

  loop at lit_flights_bapi into lwa_flights_bapi.
    clear: lwa_flights, lw_date, lw_time.
    move-corresponding lwa_flights_bapi to lwa_flights.

    concatenate lwa_flights_bapi-airportfr '-' lwa_flights_bapi-airportto
           into lwa_flights-title.

    write lwa_flights_bapi-flightdate to lw_date.
    write lwa_flights_bapi-deptime    to lw_time.
    concatenate lwa_flights_bapi-airlineid lwa_flights_bapi-connectid lw_date lw_time(5)
           into lwa_flights-intro separated by space.

    concatenate lwa_flights_bapi-airlineid lwa_flights_bapi-connectid lwa_flights_bapi-flightdate
           into lwa_flights-key separated by c_key_separator.

    append lwa_flights to it_flights.
  endloop.

endmethod.


method GET_FLIGHT_DETAIL.

  data: lw_carr_id          type c length 3,
        lw_conn_id          type n length 4,
        lw_flightdate       type d.

  check ajax_value is not initial.
  split ajax_value at c_key_separator into lw_carr_id
                                           lw_conn_id
                                           lw_flightdate.

  check lw_carr_id    is not initial.
  check lw_conn_id    is not initial.
  check lw_flightdate is not initial.

* Get additional info
  clear: wa_additional_info, wa_availability.

  try.
      call function 'BAPI_FLIGHT_GETDETAIL'
        exporting
          airlineid       = lw_carr_id
          connectionid    = lw_conn_id
          flightdate      = lw_flightdate
        importing
          additional_info = wa_additional_info
          availibility    = wa_availability.
    catch cx_sy_dyn_call_illegal_func.

  endtry.

* Get bookings
  call method me->get_bookings
    exporting
      iw_carr_id  = lw_carr_id
      iw_conn_id  = lw_conn_id
      iw_dep_date = lw_flightdate.

endmethod.
ENDCLASS.
