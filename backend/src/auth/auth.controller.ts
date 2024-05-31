import { Body, Controller, HttpCode, Post, ValidationPipe } from '@nestjs/common';
import { AuthService } from './auth.service';
import { LoginUserDto } from '../users/dto/login-user.dto';

@Controller('auth')
export class AuthController {
    constructor(private readonly authService: AuthService){}
    
    @Post("login")
    @HttpCode(200)
    loginUser(@Body(ValidationPipe) loginUserDto: LoginUserDto): Promise<{token: string}>{
        console.log("from auth.controller.ts");
        return this.authService.login(loginUserDto.userId,
            loginUserDto.role,
            loginUserDto.password);
    }

}
