import { IsString, Length} from "class-validator";
import { MAX_PASSWORD_LENGTH, Min_PASSWORD_LENGTH } from "src/constants";

export class ChangePasswordDto {
    @IsString()
    @Length(Min_PASSWORD_LENGTH, MAX_PASSWORD_LENGTH)
    oldPassword: string;

    @IsString()
    @Length(Min_PASSWORD_LENGTH, MAX_PASSWORD_LENGTH)
    newPassword: string;

}