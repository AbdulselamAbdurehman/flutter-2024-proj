import { IsString, Length} from "class-validator";
import { MAX_USERNAME_LENGTH, MIN_USERNAME_LENGTH } from "src/constants";

export class ChangeUsernameDto {
    @IsString()
    @Length(MIN_USERNAME_LENGTH, MAX_USERNAME_LENGTH)
    newUsername: string;


}