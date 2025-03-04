@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic interface view Customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true

define view entity zi_Custo as select from  zcustomer
{
    key customer_id as CustomerId,
    @Search.defaultSearchElement: true
    first_name as FirstName,
    @Search.defaultSearchElement: true
    last_name as LastName,
    date_of_birth as DateOfBirth,
    nationality as Nationality,
    email as Email,
    phone as Phone,
    local_created_by as LocalCreatedBy,
    local_created_at as LocalCreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt
}
