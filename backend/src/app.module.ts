import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { QuestionsModule } from './questions/questions.module';
import { MongooseModule } from '@nestjs/mongoose';
import { AuthModule } from './auth/auth.module';
import { DB_URI } from './constants';
import { NotesModule } from './notes/notes.module';

@Module({
  imports: [MongooseModule.forRoot(DB_URI), UsersModule, QuestionsModule, AuthModule, NotesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
