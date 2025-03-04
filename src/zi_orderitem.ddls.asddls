@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'basic view order item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_ORDERITEM as select from zorderitem
{
 key orderitem_id as OrderitemId,
 key order_id as OrderId,
 key customer_id as CustomerId,
 book_id as BookId,
 quantity as Quantity,
 address_id as AddressId,
 price as Price,
 total_price as TotalPrice,
 local_created_by as LocalCreatedBy,
 local_created_at as LocalCreatedAt,
 local_last_changed_by as LocalLastChangedBy,
 local_last_changed_at as LocalLastChangedAt
}
