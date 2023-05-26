export class Events {
    constructor(
        public text: string,
        public date:  Date,
    ){}
}

export class ReturnParcel {
    constructor(
        public events: Events[],
        public delivered: boolean,
    ){}
}