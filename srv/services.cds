
using { sap.tickets as srv } from '../db/schema';
@odata.draft.enabled
service TicketService {

@odata.draft.enabled
entity Incidents as projection on srv.Incidents; 

@Capabilities : { Insertable: false }
entity Customers as projection on srv.customers;
function trigger_workflow() returns String;
}
// annotate TicketService with @(requires: 'support');
annotate TicketService with @odata.draft.enabled; 

service AdminService {

  entity Customers as projection on srv.customers;
    entity Incidents as projection on srv.Incidents;  

}

annotate AdminService with @(requires: 'Admin') ;
