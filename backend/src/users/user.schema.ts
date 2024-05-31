import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';

export type UserDocument = HydratedDocument<User>;

@Schema()
export class User {
  @Prop({unique: true})
  username: string;

  @Prop()
  note: string;

  @Prop({unique: true})
  email: string;

  @Prop()
  password: string;
  
  @Prop()
  role: "INSTRUCTOR" | "STUDENT";
}
    
export const UserSchema = SchemaFactory.createForClass(User);