import { Model } from 'mongoose';
import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Question } from './question.schema';
import { CreateQuestionDto } from './create-question.dto';
import { UpdateQuestionDto } from './update-question.dto';
import { Counter } from 'src/counter.schema';
import { QUESTION_SIZE } from 'src/constants';

@Injectable()
export class QuestionsService {
  constructor(@InjectModel(Question.name) private QuestionModel: Model<Question>,
              @InjectModel(Counter.name) private CounterModel: Model<Counter>) {}

  async createQuestion(createQuestionDto: CreateQuestionDto): Promise<Question> {

    try{
      const question = new this.QuestionModel(createQuestionDto);
      const counter = await this.CounterModel.findOneAndUpdate(
        {},
        { $inc: { value: 1 } },
        { upsert: true, new: true },
      );
      console.log(createQuestionDto.description);
      question.questionNumber = counter.value;

      return question.save();
    } catch(error){
      throw new BadRequestException("Invalid question data and email");
    }
  
}

            
      
  async findSome(): Promise<Question[]> {
    try {
      const randomQuestions: Question[] = await this.QuestionModel.aggregate([
          { $sample: { size: QUESTION_SIZE } }
      ]);

      return randomQuestions;
  } catch {
    return await this.QuestionModel.find().exec();

  }
}

  async updateQuestion(questionNumber: number, question: UpdateQuestionDto): Promise<Question> {
    try{
      const updatedQuestion = await this.QuestionModel.findOneAndUpdate(
          { questionNumber},
          { $set: question },
          { new: true }
        ).exec();
        console.log(updatedQuestion);
        return updatedQuestion;
    } catch(error){
      throw new BadRequestException("Invalid data");
    }
  }
  
  async deleteQuestion(questionNumber: number): Promise<Question>{
    try{
      const removedQuestion = await this.QuestionModel.findOneAndDelete({questionNumber}).exec();
      return removedQuestion;
    } catch(error){
      throw new NotFoundException("Question not found");
    }
  } 
}
