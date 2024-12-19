sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/fe/cap/travel/fpm/test/integration/FirstJourney',
		'sap/fe/cap/travel/fpm/test/integration/pages/TravelMain'
    ],
    function(JourneyRunner, opaJourney, TravelMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/fe/cap/travel/fpm') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTravelMain: TravelMain
                }
            },
            opaJourney.run
        );
    }
);