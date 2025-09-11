sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ns/custcomp/custcomplaints/test/integration/pages/IncidentsList",
	"ns/custcomp/custcomplaints/test/integration/pages/IncidentsObjectPage"
], function (JourneyRunner, IncidentsList, IncidentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ns/custcomp/custcomplaints') + '/index.html',
        pages: {
			onTheIncidentsList: IncidentsList,
			onTheIncidentsObjectPage: IncidentsObjectPage
        },
        async: true
    });

    return runner;
});

