import { CreateUserDTO } from './../dto/user.dto';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from '../entity/user.entity';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UserService {
    constructor(
        @InjectRepository(User) private UserRepository: Repository<User>,
    ) {}

    async findAll(): Promise<User[]> {
        return await this.UserRepository.find();
    }

    async findOneByEmail(email: string): Promise<User> {
        return await this.UserRepository.findOne({ where: { email: email } });
    }

    async findOneById(id: string): Promise<User> {
        return await this.UserRepository.findOne({ where: { id: id } });
    }

    async create(body: CreateUserDTO): Promise<User> {
        const user = this.UserRepository.create(body);
        user.password = await bcrypt.hash(user.password, 10);
        await this.UserRepository.save(user);
        user.password = '';
        return user
    }

    async remove(id: string): Promise<void> {
        await this.UserRepository.delete(id);
    }

}
