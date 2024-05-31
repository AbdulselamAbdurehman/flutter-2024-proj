import { IsEmail, IsNotEmpty, IsString, Length } from "class-validator";
import { MAX_PASSWORD_LENGTH, Min_PASSWORD_LENGTH } from "src/constants";

export class CreateUserDto {
    @IsNotEmpty()
    @IsString()
    username: string;

    @IsString()
    @Length(Min_PASSWORD_LENGTH, MAX_PASSWORD_LENGTH)
    password: string;

    @IsEmail()
    email: string;

    role: "INSTRUCTOR" | "STUDENT";
}