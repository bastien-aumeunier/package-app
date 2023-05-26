import { ApiProperty } from "@nestjs/swagger";
import { IsNotEmpty, IsString } from "class-validator";

export class CreateColisDTO{
    @IsString()
    @IsNotEmpty()
    @ApiProperty()
    name: string;
    @IsString()
    @IsNotEmpty()
    @ApiProperty()
    track: string;
}