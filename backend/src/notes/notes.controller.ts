import { Body, Controller, Delete, Get, Patch, Post, UseGuards, ValidationPipe } from '@nestjs/common';
import { AuthGuard } from 'src/auth/auth.guard';
import { NotesService } from './notes.service';
import { UserEmail } from 'src/auth/decorators/user-email.decorator';
import { Note } from './note.schema';

@Controller('notes')
export class NotesController {
    constructor(private readonly notesService: NotesService){}

    @UseGuards(AuthGuard)
    @Post('')
    async createNote(@UserEmail() email: string , @Body(ValidationPipe) newNote: {noteText: string}): Promise<Note | null>{        
        return this.notesService.createNote(email, newNote.noteText);
    }

    @UseGuards(AuthGuard)
    @Get('')
    async getNote(@UserEmail() email: string): Promise<Note | null>{
        return await this.notesService.getNote(email);
    }
    
    @UseGuards(AuthGuard)
    @Patch('')
    async updateNote(@UserEmail() email: string, @Body(ValidationPipe) newNote: {noteText: string}): Promise<Note | null>{
        return await this.notesService.updateNote(email, newNote.noteText);
    }

    @UseGuards(AuthGuard)
    @Delete('')
    async deleteNote(@UserEmail() email: string): Promise<Note | null>{
        return await this.notesService.deleteNote(email); 
    }
    

}
