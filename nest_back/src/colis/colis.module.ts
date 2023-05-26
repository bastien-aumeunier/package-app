import { ParcelModule } from './../parcel/parcel.module';
import { ColisService } from './service/colis.service';
import { ColisController } from './controller/colis.controller';
import { forwardRef, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Colis } from './entity/colis.entity';

@Module({
    imports: [TypeOrmModule.forFeature([Colis]), forwardRef(()=> ParcelModule)],
    controllers: [ColisController],
    providers: [ColisService],
    exports: [ColisService]
})
export class ColisModule {}
