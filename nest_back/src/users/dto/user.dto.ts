import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, MinLength} from 'class-validator';

export class CreateUserDTO {
  @IsNotEmpty()
  @ApiProperty({ description: 'required' })
  lastname: string;

  @IsNotEmpty()
  @ApiProperty({ description: 'required' })
  firstname: string;

  @IsNotEmpty()
  @ApiProperty({ description: 'type Email, must be unique' })
  email: string;

  @IsNotEmpty()
  @MinLength(8)
  @ApiProperty({ description: 'need 8 characters minimum' })
  password: string;

  @IsNotEmpty()
  @MinLength(8)
  @ApiProperty({ description: 'required' })
  confirmpassword: string;
}

export class LoginUserDTO {
  @IsNotEmpty()
  @ApiProperty({ description: 'type Email, must be unique' })
  readonly email: string;

  @IsNotEmpty()
  @ApiProperty({ description: 'required' })
  readonly password: string;
}
