import { IsString, Length } from "class-validator";
import { MAX_PASSWORD_LENGTH, Min_PASSWORD_LENGTH } from "src/constants";

export class LoginUserDto {
    @IsString()
    @Length(Min_PASSWORD_LENGTH, MAX_PASSWORD_LENGTH)
    password: string;

    @IsString()
    userId: string;

    role: "INSTRUCTOR" | "STUDENT";
}