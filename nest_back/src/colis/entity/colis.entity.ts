import { Entity, Column, PrimaryGeneratedColumn, } from 'typeorm';

@Entity()
export class Colis {
    @PrimaryGeneratedColumn("uuid")
    id: string;

    @Column()
    name: string;

    @Column()
    track: string;

    @Column()
    delivered: boolean;

    @Column()
    userId: string;
}