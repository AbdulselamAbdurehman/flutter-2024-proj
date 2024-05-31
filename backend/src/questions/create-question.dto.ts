import { IsString, IsNotEmpty, IsArray } from "class-validator";

export class CreateQuestionDto{
    @IsNotEmpty()
    @IsString()
    description: string;

    @IsNotEmpty()
    answer: number;

    @IsArray()
    options: string[];

    @IsString()
    explanation: string;
}