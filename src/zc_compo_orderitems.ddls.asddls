@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'compo order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_COMPO_ORDERITEMS
  as select from ZI_ORDERITEM
  association to parent zc_compo_order as _Oitems on  $projection.OrderId    = _Oitems.OrderId
                                                  and $projection.AddressId  = _Oitems.AddressID
                                                  and $projection.CustomerId = _Oitems.CustomerId

  association to zc_compo_custo        as _cust   on  $projection.CustomerId = _cust.CustomerId

{
  key ZI_ORDERITEM.OrderitemId,
  key ZI_ORDERITEM.OrderId,
  key ZI_ORDERITEM.CustomerId,
      ZI_ORDERITEM.BookId,
      ZI_ORDERITEM.Quantity,
      ZI_ORDERITEM.AddressId,
      ZI_ORDERITEM.Price,
      ZI_ORDERITEM.TotalPrice,
      ZI_ORDERITEM.LocalCreatedBy,
      ZI_ORDERITEM.LocalCreatedAt,
      ZI_ORDERITEM.LocalLastChangedBy,
      ZI_ORDERITEM.LocalLastChangedAt,
      _Oitems,
      _cust


}
