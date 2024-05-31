import { Controller, Get, Redirect, Res } from "@nestjs/common";
import { Response } from "express"; // Import Response from express
import { AppService } from "./app.service";

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Redirect('/home')
  redirectToHome() {
    console.log('root route is redirecting to home route')
    // This method is just a placeholder for the redirection
  }

  @Get('/home')
  getHello(@Res() response: Response): void {    
    console.log('home route')
    response.sendFile('home.html', { root: "../frontend" });
  }
}
