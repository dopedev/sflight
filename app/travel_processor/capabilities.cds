using TravelService from '../../srv/travel-service';

annotate TravelService.Travel with @odata.draft.enabled;
annotate TravelService.Travel with @Common.SemanticKey: [TravelID];
annotate TravelService.Booking with @Common.SemanticKey: [BookingID];
annotate TravelService.BookingSupplement with @Common.SemanticKey: [BookingSupplementID];

annotate TravelService.Travel with @(Capabilities: {
    NavigationRestrictions: {
        $Type               : 'Capabilities.NavigationRestrictionsType',
        RestrictedProperties: [{
            $Type             : 'Capabilities.NavigationPropertyRestriction',
            NavigationProperty: DraftAdministrativeData,
            FilterRestrictions: {
                $Type     : 'Capabilities.FilterRestrictionsType',
                Filterable: false,
            },
        }, ],
    },
    DeleteRestrictions    : {
        $Type    : 'Capabilities.DeleteRestrictionsType',
        Deletable: DeleteRecord
    },
    FilterRestrictions    : {
        FilterExpressionRestrictions: [
        {
            Property          : 'BeginDate',
            AllowedExpressions: 'SingleValue'
        },
        {
            Property          : 'EndDate',
            AllowedExpressions: 'SingleRange'
        }
    ],
    NonFilterableProperties:[DeleteRecord]
    }
});
