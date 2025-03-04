@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'compo order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zc_compo_order
  as select from zi_order
  association to parent zc_compo_custo      as _cust on $projection.CustomerId = _cust.CustomerId
  composition [0..*] of ZC_COMPO_ORDERITEMS as _Oitems
{

  key  zi_order.OrderId,
  key  zi_order.CustomerId,
  key  zi_order.AddressID,
       zi_order.OrderDate,
       zi_order.OrderStatus,
       zi_order.BillingAdress,
       zi_order.DeliveryAdress,
zi_order.Quantiy,
       zi_order.ItemCount,
       zi_order.Currency,
       zi_order.TotalPrice,
       @Semantics.user.createdBy: true
       zi_order.LocalCreatedBy,
       @Semantics.systemDateTime.createdAt: true
       zi_order.LocalCreatedAt,
       @Semantics.user.lastChangedBy: true
       zi_order.LocalLastChangedBy,
       @Semantics.systemDateTime.lastChangedAt: true
       zi_order.LocalLastChangedAt,
       _Oitems,
       _cust
}
