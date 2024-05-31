import { Body, Controller, Delete, Get, Param, Patch, Post, UseGuards, ValidationPipe } from '@nestjs/common';
import { QuestionsService } from './questions.service';
import { Question } from './question.schema';
import { CreateQuestionDto } from './create-question.dto';
import { UpdateQuestionDto } from './update-question.dto';
import { AuthGuard } from 'src/auth/auth.guard';
import { RolesGuard } from 'src/auth/roles.guard';
import { Roles } from 'src/auth/decorators/roles.decorator';


@Controller('questions')
export class QuestionsController {
  constructor(private readonly questionsService: QuestionsService) {}

  @UseGuards(AuthGuard) //All users(INSTRUCTORS | STUDENTS) can access the route.
  @Get()
  async findSome(): Promise<Question[]> {
    console.log('from questoins.controller.ts');
    return await this.questionsService.findSome();
  }

  @UseGuards(AuthGuard, RolesGuard)
  @Roles('INSTRUCTOR') // Only INSTRUCTORS can access this route
  @Post()
  async postQuestions(@Body(ValidationPipe) question: CreateQuestionDto): Promise<Question> {
    return await this.questionsService.createQuestion(question);
  }

    @UseGuards(AuthGuard, RolesGuard)
    @Roles('INSTRUCTOR') // Only INSTRUCTORS can access this route
    @Patch(':num')
    async updateQuestion(@Param('num') num: number, @Body(ValidationPipe) question: UpdateQuestionDto): Promise<Question> {
      return await this.questionsService.updateQuestion(num, question);
    }

  @UseGuards(AuthGuard, RolesGuard)
  @Roles('INSTRUCTOR') // Only INSTRUCTORS can access this route
  @Delete(':num')
  deleteQuestion(@Param('num') num: number): void {
    const removedQuestion = this.questionsService.deleteQuestion(num);
    console.log(removedQuestion);
  }
}
