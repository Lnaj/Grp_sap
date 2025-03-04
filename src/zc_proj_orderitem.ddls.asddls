@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Order'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

define view entity zc_proj_orderitem
  as projection on ZC_COMPO_ORDERITEMS
{
 key OrderitemId,
 key OrderId,
 key CustomerId,
 BookId,
 Quantity,
 AddressId,
 Price,
 TotalPrice,
 LocalCreatedBy,
 LocalCreatedAt,
 LocalLastChangedBy,
 LocalLastChangedAt,
 /* Associations */
 _cust  : redirected to zc_proj_custo,
 _Oitems: redirected to parent zc_proj_order
 
      

}
