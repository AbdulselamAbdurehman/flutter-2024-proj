import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { IsEmail } from 'class-validator';
import { HydratedDocument } from 'mongoose';


export type NoteDocument = HydratedDocument<Note>;

@Schema()
export class Note {
    
  @Prop()
  noteText: string;

  @IsEmail()
  @Prop({unique: true})
  owner: string;

}
    


export const NoteSchema = SchemaFactory.createForClass(Note);