export interface ReturnParcel {
    events: Events[];
    delivered: boolean;
}


export interface Events {
    text: string;
    date: Date;
}

export class ReturnColis{
    constructor(
    public id: string,
    public name: string,
    public track: string,
    public delivered: boolean,
    public userId: string,
    public events: Events[],
    ) {}
}