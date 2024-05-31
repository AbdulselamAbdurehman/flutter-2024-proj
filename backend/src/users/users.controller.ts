import { Body, Controller, Delete, Patch, Post, UseGuards} from '@nestjs/common';
import { UsersService } from './users.service';
import { ValidationPipe } from '@nestjs/common';
import { UserEmail } from 'src/auth/decorators/user-email.decorator';
import { CreateUserDto } from './dto/create-user.dto';
import { ChangePasswordDto } from './dto/change-password.dto';
import { AuthGuard } from 'src/auth/auth.guard';
import { ChangeUsernameDto } from './dto/change-username.dto';

@Controller('users')
export class UsersController {
    constructor(private readonly usersService: UsersService) { }

    @Post("/signup") // create a new user account
    create(@Body(ValidationPipe) createUserDto: CreateUserDto){
        console.log("signup end point get called.");
        return this.usersService.signupUser(createUserDto);
    }

    // @UserEmail() decorator in the below end points takes the email directly from authenticated token used by AUTHGUARD.

    @UseGuards(AuthGuard) //All users(INSTRUCTORS | STUDENTS) can access the route.
    @Patch("password")
    updatePassword(@UserEmail() email: string, @Body(ValidationPipe) changePasswordDto: ChangePasswordDto){
        return this.usersService.updatePassword(email, changePasswordDto.oldPassword, changePasswordDto.newPassword)
    }


    @UseGuards(AuthGuard) //All users(INSTRUCTORS | STUDENTS) can access the route.
    @Delete("")
    deleteAccount(@UserEmail() email: string){
        return this.usersService.deleteUser(email);
    }
   
    @UseGuards(AuthGuard) //All users(INSTRUCTORS | STUDENTS) can access the route.
    @Patch("username")
    updateUsername(@UserEmail() email: string, @Body(ValidationPipe) changeUsernameDto: ChangeUsernameDto){
        return this.usersService.updateUsername(email, changeUsernameDto.newUsername);
    }

}