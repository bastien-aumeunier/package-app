import { AccountJWT } from '../model/user.model';
import { Body, Controller, Delete, Get, HttpException, HttpStatus, Param, ParseUUIDPipe, Post, Req, UseGuards, UsePipes, ValidationPipe } from '@nestjs/common';
import { ApiOkResponse, ApiTags } from '@nestjs/swagger';
import { AuthService } from 'src/auth/services/auth.service';
import { JwtAuthGuard } from './../../auth/guard/jwt.guard';
import { CreateUserDTO, LoginUserDTO } from '../dto/user.dto';
import { User } from '../entity/user.entity';
import { UserService } from '../service/user.service';
import { ColisService } from 'src/colis/service/colis.service';

@Controller('users')
export class UserController {
    constructor(
        private readonly userService: UserService,
        private readonly authService: AuthService,
        private readonly colisService: ColisService
    ) {}

    @Get()
    @ApiTags('users')
    @ApiOkResponse({ description: 'Get all users' })
    async findAll(): Promise<User[]> {
        return await this.userService.findAll();
    }

    @Get('me')
    @ApiTags('users')
    @ApiOkResponse({ description: 'Get my profile' })
    @UseGuards(JwtAuthGuard)
    async myProfile(@Req() req: any): Promise<User> {
        return await this.userService.findOneById(req.user.id);
    }

    @Post('register')
    @ApiTags('users')
    @ApiOkResponse({ description: 'Register a new user' })
    @UsePipes(ValidationPipe)
    async register(@Body() body: CreateUserDTO): Promise<AccountJWT> {
        const user = await this.userService.findOneByEmail(body.email);
        if (user) {
            throw new HttpException('Email already exists', HttpStatus.BAD_REQUEST);
        } else if (body.password !== body.confirmpassword) {
            throw new HttpException('Password and confirm password are not the same', HttpStatus.BAD_REQUEST);
        }
        const use = await this.userService.create(body);
        const jwt = await this.authService.register(use.id);
        const newUser = new AccountJWT(use.id, body.email, body.firstname, body.lastname, jwt.access_token );
        return newUser;
    }

    @Post('login')
    @ApiTags('users')
    @ApiOkResponse({ description: 'Login a user' })
    @UsePipes(ValidationPipe)
    async login(@Body() body: LoginUserDTO) {
        const user = await this.userService.findOneByEmail(body.email);
        if (!user) {
            throw new HttpException('Account not found', HttpStatus.BAD_REQUEST);
        }
        const jwt = await this.authService.login(body);
        const newUser = new AccountJWT(user.id, user.email, user.firstname, user.lastname, jwt.access_token );
        return newUser;
    }

    @Delete(':id')
    @ApiTags('users')
    @ApiOkResponse({ description: 'Delete a user' })
    @UseGuards(JwtAuthGuard)
    async remove(@Param('id', new ParseUUIDPipe()) id: string, @Req() req: any): Promise<void> {
        const colisList = await this.colisService.findbyUserId(req.user.id)
        for(let colis of colisList){
            await this.colisService.remove(colis.id);
        }
        return await this.userService.remove(id);
    }
}
