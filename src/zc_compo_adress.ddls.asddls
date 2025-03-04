@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'compo adress'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity zc_compo_adress
  as select from zi_adress as adress
  association to parent zc_compo_custo as _cust on $projection.CustomerId = _cust.CustomerId



{
  key adress.AddressId,
  key adress.CustomerId,
      adress.Street,
      adress.City,
      adress.PostalCode,
      adress.Country,
      adress.Housenumber,
      @Semantics.user.createdBy: true
      adress.LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      adress.LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      adress.LocalLastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      adress.LocalLastChangedAt,
      _cust

}
