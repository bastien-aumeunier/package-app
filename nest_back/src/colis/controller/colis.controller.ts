import { ParcelService } from './../../parcel/service/parcel.service';
import { Controller, Get, Req, UseGuards, Post, Body, HttpException, HttpStatus, Delete, Param, ParseUUIDPipe, UnauthorizedException  } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { JwtAuthGuard } from 'src/auth/guard/jwt.guard';
import { CreateColisDTO } from '../dto/colis.dto';
import { ColisService } from '../service/colis.service';
import {ReturnColis, ReturnParcel } from '../model/colis.model';
import { Colis } from '../entity/colis.entity';

@Controller('colis')
export class ColisController {
    constructor(
        private readonly colisService: ColisService,
        private readonly parcelService: ParcelService
    ) {}

    @Get()
    @ApiTags('colis')
    async findAll() {
        return await this.colisService.findAll();
    }

    @Get('my-colis')
    @ApiTags('colis')
    @UseGuards(JwtAuthGuard)
    async myColis(@Req() req: any) {
        return await this.colisService.findbyUserId(req.user.id);
    }

    @Get(':id')
    @ApiTags('colis')
    @UseGuards(JwtAuthGuard)
    async findOne(@Req() req: any, @Param('id', new ParseUUIDPipe()) id: string): Promise<ReturnColis> {
        const colis = await this.colisService.findOneById(id);
        if(!colis){
            throw new HttpException('Colis not found', HttpStatus.NOT_FOUND);
        } else if (colis.userId !== req.user.id){
            throw new UnauthorizedException('this package is not your')
        }
        const resp:ReturnParcel =await this.parcelService.getPackageInfo(colis.id,colis.track)
        return new ReturnColis(colis.id, colis.name, colis.track, resp.delivered, colis.userId, resp.events)
    }

    @Post('new-colis')
    @ApiTags('colis')
    @UseGuards(JwtAuthGuard)
    async newColis(@Req() req: any, @Body() body: CreateColisDTO) {
        await this.colisService.create(body, req.user.id);
        return await this.colisService.findbyUserId(req.user.id)
    }

    @Delete('my-colis')
    @ApiTags('colis')
    @UseGuards(JwtAuthGuard)
    async deleteAllColis(@Req() req){
        const colisList = await this.colisService.findbyUserId(req.user.id)
        for(let colis of colisList){
            await this.colisService.remove(colis.id);
        }
    }


    @Delete(':id')
    @ApiTags('colis')
    @UseGuards(JwtAuthGuard)
    async deleteColis(@Req() req: any) {
        const colis = await this.colisService.findOneById(req.params.id);
        if(!colis){
            throw new HttpException('Colis not found', HttpStatus.NOT_FOUND);
        }
        await this.colisService.remove(req.params.id);
        return await this.colisService.findbyUserId(req.user.id)
    }

}
