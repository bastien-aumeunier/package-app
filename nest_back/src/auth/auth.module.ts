import { JwtStrategy } from './strategie/jwt.strategie';
import { AuthService } from './services/auth.service';
import { UserModule } from './../users/user.module';

import { forwardRef, Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { jwtConstants } from './constants';

@Module({
  imports: [forwardRef(() => UserModule), PassportModule, JwtModule.register({
    secret: jwtConstants.secret,
    signOptions: { expiresIn: '30d' },
  })],
  providers: [AuthService, JwtStrategy],
  exports: [AuthService],
})
export class AuthModule {}
