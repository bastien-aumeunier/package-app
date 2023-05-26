export interface ReturnColissimo {
    lang:       string;
    scope:      string;
    returnCode: number;
    shipment:   Shipment;
}

export interface Shipment {
    idShip:       string;
    holder:       number;
    product:      string;
    isFinal:      boolean;
    deliveryDate: Date;
    entryDate:    Date;
    timeline:     Timeline[];
    event:        Event[];
    contextData:  ContextData;
    estimDate:    Date;
    url:          string;
}

export interface ContextData {
    deliveryChoice: DeliveryChoice;
    originCountry:  string;
    arrivalCountry: string;
}

export interface DeliveryChoice {
    deliveryChoice: number;
}

export interface Event {
    code:  string;
    label: string;
    date:  Date;
}

export interface Timeline {
    shortLabel: string;
    longLabel:  string;
    id:         number;
    date?:      Date;
    country:    string;
    status:     boolean;
    type:       number;
}
