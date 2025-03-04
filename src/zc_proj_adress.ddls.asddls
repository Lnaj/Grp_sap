 @AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection adress'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

define view entity zc_proj_adress   as projection on zc_compo_adress
{
    key AddressId,
    key CustomerId,
    Street,
    City,
    PostalCode,
    Country,
    Housenumber,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    _cust :  redirected to parent zc_proj_custo
       
}
