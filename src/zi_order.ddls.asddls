@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BIV order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity zi_order
  as select from zorder
{

  key order_id              as OrderId,
  key customer_id           as CustomerId,
  key   address_id            as AddressID,
      order_date            as OrderDate,
      order_status          as OrderStatus,
    quantity as Quantiy,
      billing_adress        as BillingAdress,
      delivery_adress       as DeliveryAdress,
      item_count            as ItemCount,
      currency              as Currency,
      total_price           as TotalPrice,
      local_created_by      as LocalCreatedBy,
      local_created_at      as LocalCreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt
}
