using {
    managed,
    cuid,
    sap.common.CodeList
} from '@sap/cds/common';

namespace sap.tickets;

entity Incidents : cuid, managed {
    customer     : Association to customers;
    title        : String @title: 'Title';
    urgency      : Association to Urgency default 'M';
    status       : Association to Status default 'N';
    priority     : String  default 'Normal';
    conversation : Composition of many Conversations
                       on conversation.parent = $self;

}

entity Conversations : cuid, managed {
    parent    : Association to Incidents;
    timestamp : type of managed : createdAt;
    author    : type of managed : createdBy;
    message   : String;

}

entity customers : managed {
    key ID        : String;
        firstName : String;
        lastName  : String;
        name      : String = firstName || ' ' || lastName;
        email         : EMailAddress;
phone         : PhoneNumber;
incidents     : Association to many Incidents on incidents.customer = $self;
creditCardNo  : String(16) @assert.format: '^[1-9]\d{15}$';
addresses     : Composition of many Addresses on addresses.customer = $self;


}

entity Addresses : cuid, managed {
customer      : Association to customers;
city          : String;
postCode      : String;
streetAddress : String;
}

entity Status : CodeList {
key code: String enum {
    new = 'N';
    assigned = 'A'; 
    in_process = 'I'; 
    on_hold = 'H'; 
    resolved = 'R'; 
    closed = 'C'; 
};
criticality : Integer;
}

entity Urgency : CodeList {
key code: String enum {
    high = 'H';
    medium = 'M'; 
    low = 'L'; 
};
}

type EMailAddress : String;
type PhoneNumber : String;