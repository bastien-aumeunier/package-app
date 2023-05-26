export class Account{
    constructor(
        public id: string,
        public email: string,
        public firstname: string,
        public lastname: string
    ){}
}

export class AccountJWT{
    constructor(
        public id: string,
        public email: string,
        public firstname: string,
        public lastname: string,
        public jwt: string
    ){}
}