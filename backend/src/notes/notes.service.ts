import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { Note } from './note.schema';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';

@Injectable()
export class NotesService {
    constructor(@InjectModel(Note.name) private NoteModel: Model<Note | null>) {}

    async createNote(owner: string, noteText: string): Promise<Note | null>{
        if (await this.NoteModel.findOne({owner})){
            throw new HttpException("Note Already Exists", HttpStatus.CONFLICT)
          }
      
            const note = new this.NoteModel({noteText, owner});
            return note.save();
    }
    
    async getNote(owner: string): Promise<Note | null>{
            const note = await this.NoteModel.findOne({owner: owner}).exec();
            if (note) 
                return note;
            throw new HttpException("Not Found", HttpStatus.NOT_FOUND)

    }

    async updateNote(ownerEmail: string, noteText: string): Promise<Note | null>{
        try {
            const newNote = (await this.NoteModel.findOneAndUpdate({owner: ownerEmail}, {noteText}, {new: true})).save();
            return newNote;
        } catch {
            throw new HttpException("Not Found", HttpStatus.NOT_FOUND);
        }


    }

    async deleteNote(ownerEmail: string): Promise<Note | null>{
            const note = await this.NoteModel.findOneAndDelete({owner: ownerEmail});
            if (note) return note;
            throw new HttpException("Not Found", HttpStatus.NOT_FOUND);

    }



}
