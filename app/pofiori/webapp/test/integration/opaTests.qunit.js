sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/teched/pofiori/test/integration/FirstJourney',
		'sap/teched/pofiori/test/integration/pages/POHeadersList',
		'sap/teched/pofiori/test/integration/pages/POHeadersObjectPage',
		'sap/teched/pofiori/test/integration/pages/POItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POHeadersList, POHeadersObjectPage, POItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/teched/pofiori') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOHeadersList: POHeadersList,
					onThePOHeadersObjectPage: POHeadersObjectPage,
					onThePOItemsObjectPage: POItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);