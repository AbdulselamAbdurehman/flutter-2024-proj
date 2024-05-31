import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';

@Schema()
export class Counter {

  @Prop({default: 0})
  value: number;
}

export const CounterSchema = SchemaFactory.createForClass(Counter);