import { ColisModule } from 'src/colis/colis.module';
import { ParcelService } from './service/parcel.service';
import { forwardRef, Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [ConfigModule.forRoot({ isGlobal: true }), forwardRef(()=> ColisModule)],
  controllers: [],
  providers: [ParcelService],
  exports:[ParcelService]
})
export class ParcelModule {}
