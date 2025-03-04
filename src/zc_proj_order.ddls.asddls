@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Order'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

define view entity zc_proj_order
  as projection on zc_compo_order
{

  key OrderId,
  key CustomerId,
  key AddressID,
      OrderDate,
      OrderStatus,
      BillingAdress,
      DeliveryAdress,Quantiy,
      ItemCount,
      Currency,
      TotalPrice,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      /* Associations */
      _cust : redirected to parent zc_proj_custo,
      _Oitems : redirected to composition child zc_proj_orderitem
      

}
