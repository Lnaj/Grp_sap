@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection custo'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zc_proj_custo provider contract transactional_query as projection on zc_compo_custo

{

   key CustomerId,
   FirstName,   
   LastName,
   DateOfBirth,
   Nationality,
   Email,
   Phone,
   LocalCreatedBy, 
   LocalCreatedAt,
   LocalLastChangedBy,
   LocalLastChangedAt,
   /* Associations */
   _adress : redirected to composition child zc_proj_adress,
   _order : redirected to composition child zc_proj_order
    
}
