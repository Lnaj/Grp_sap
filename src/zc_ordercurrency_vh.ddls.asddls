@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Currency Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel : { resultSet.sizeCategory: #XS }

define view entity zc_ordercurrency_vh
as select from I_Currency
association [0..*] to I_CurrencyText as _Text 
    on $projection.Currency = _Text.Currency
    and _Text.Language = 'N'
{
    key Currency,
//    Decimals,
//    CurrencyISOCode,
//    AlternativeCurrencyKey,
//    IsPrimaryCurrencyForISOCrcy,
    /* Associations */
    _Text.CurrencyName
    
    
    }
