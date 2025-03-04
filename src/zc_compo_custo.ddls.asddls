@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'compo view Customer'
@Metadata.ignorePropagatedAnnotations: true
 
define root view entity zc_compo_custo as select from zi_Custo as custo
 composition [0..*] of zc_compo_adress as _adress
 
 composition [0..*] of  zc_compo_order as _order
//    on $projection.CustomerId = _order.CustomerId
   
    
{
     key custo.CustomerId,
     custo.FirstName,
     custo.LastName,
     custo.DateOfBirth,
     custo.Nationality,
     custo.Email,
     custo.Phone,
     @Semantics.user.createdBy: true
     custo.LocalCreatedBy,
     @Semantics.systemDateTime.createdAt: true
     custo.LocalCreatedAt,
     @Semantics.user.lastChangedBy: true
     custo.LocalLastChangedBy,
     @Semantics.systemDateTime.lastChangedAt: true
     custo.LocalLastChangedAt,
    _adress,
    _order
       // Make association public
}
