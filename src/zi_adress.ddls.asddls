@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BIV adress'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_adress as select from zadress
{
   key address_id as AddressId,
   key customer_id as CustomerId,
   street as Street,
   city as City,
   postal_code as PostalCode,
   country as Country,
   housenumber as Housenumber,
   local_created_by as LocalCreatedBy,
   local_created_at as LocalCreatedAt,
   local_last_changed_by as LocalLastChangedBy,
   local_last_changed_at as LocalLastChangedAt
}
