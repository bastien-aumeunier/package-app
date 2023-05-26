import { ColisService } from './../../colis/service/colis.service';
import { ForbiddenException, Inject, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import axios from 'axios'
import { ReturnColissimo } from '../model/colissimo.model';
import { Events, ReturnParcel } from '../model/parcel.model';

@Injectable()
export class ParcelService {
    @Inject(ConfigService)
    public config: ConfigService;

    constructor(
      private colisService: ColisService, 
    ){}

    async getPackageInfo(id:string, track: string): Promise<ReturnParcel> {
        const config = {
            headers: {
              'X-Okapi-Key': this.config.get('COLISSIMO_KEY'),
              Accept : 'application/json',
            }
          }
        try {
          const response = await axios.get(`https://api.laposte.fr/suivi/v2/idships/${track}?lang=fr_FR`, config)
          const data:ReturnColissimo = response.data
          const listEvent:Events[] =[]
          response.data.shipment.event.forEach(element => {
            listEvent.push(new Events(element.label, element.date))
          });
          if(data.shipment.isFinal){
            this.colisService.setDelivered(id,true)
            return new ReturnParcel(listEvent, true)
          }
          return new ReturnParcel(listEvent, false)
        } catch (error) {
          throw new ForbiddenException(error)
        }

    }
}
