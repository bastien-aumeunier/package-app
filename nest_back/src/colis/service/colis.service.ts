import { CreateColisDTO } from './../dto/colis.dto';
import { Colis } from './../entity/colis.entity';
import { Repository } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class ColisService {
    constructor(
        @InjectRepository(Colis) private readonly colisRepository: Repository<Colis>,
    ) { }

    async findAll(): Promise<Colis[]> {
        return await this.colisRepository.find();
    }

    async findOneById(id: string): Promise<Colis> {
        return await this.colisRepository.findOne({ where: { id: id } });
    }

    async findbyUserId(id: string): Promise<Colis[]> {
        return await this.colisRepository.find({ where: { userId: id } });
    }

    async create(body: CreateColisDTO, id:string): Promise<Colis> {
        const colis = this.colisRepository.create(body);
        colis.delivered = false;
        colis.userId = id;
        await this.colisRepository.save(colis);
        return colis
    }

    async setDelivered(id:string, delivered:boolean): Promise<Colis>{
        const colis = await this.colisRepository.findOne({ where: { id: id } });
        colis.delivered= delivered
        return this.colisRepository.save(colis)
    }

    async remove(id: string): Promise<void> {
        await this.colisRepository.delete(id);
    }
}
