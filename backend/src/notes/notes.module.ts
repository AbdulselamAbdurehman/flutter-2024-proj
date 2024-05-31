import { Module } from '@nestjs/common';
import { NotesController } from './notes.controller';
import { NotesService } from './notes.service';
import { MongooseModule } from '@nestjs/mongoose';
import { Note, NoteSchema } from './note.schema';

@Module({
  imports: [MongooseModule.forFeature([{ name: Note.name, schema: NoteSchema}]),],
  controllers: [NotesController],
  providers: [NotesService]
})
export class NotesModule {}
