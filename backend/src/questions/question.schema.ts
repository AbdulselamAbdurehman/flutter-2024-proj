import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';


export type QuestionDocument = HydratedDocument<Question>;

@Schema()
export class Question {
  @Prop()
  description: string;

  @Prop()
  answer: number;

  @Prop()
  explanation: string;

  @Prop({unique: true})
  questionNumber: number;
  
  @Prop()
  options: [string];

}
    


export const QuestionSchema = SchemaFactory.createForClass(Question);