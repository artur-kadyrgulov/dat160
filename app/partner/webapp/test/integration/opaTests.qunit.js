sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'partner/test/integration/FirstJourney',
		'partner/test/integration/pages/PartnerList',
		'partner/test/integration/pages/PartnerObjectPage'
    ],
    function(JourneyRunner, opaJourney, PartnerList, PartnerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('partner') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePartnerList: PartnerList,
					onThePartnerObjectPage: PartnerObjectPage
                }
            },
            opaJourney.run
        );
    }
);