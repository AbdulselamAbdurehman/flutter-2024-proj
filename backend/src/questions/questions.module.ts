import { Module } from '@nestjs/common';
import { QuestionsController } from './questions.controller';
import { QuestionsService } from './questions.service';
import { Question, QuestionSchema } from './question.schema';
import { MongooseModule } from '@nestjs/mongoose';
import { UsersModule } from 'src/users/users.module';
import { Counter, CounterSchema } from 'src/counter.schema';



@Module({
  imports: [MongooseModule.forFeature([{ name: Question.name, schema: QuestionSchema},
          {name: Counter.name, schema: CounterSchema}]),
            UsersModule],
  controllers: [QuestionsController],
  providers: [QuestionsService], 
  exports: [MongooseModule]
})
export class QuestionsModule {}
