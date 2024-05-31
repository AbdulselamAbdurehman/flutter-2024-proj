import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { AppModule } from './app.module';
import { ValidationPipe } from "@nestjs/common";
import * as cookieParser from "cookie-parser";
import { join } from 'path';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  app.use(cookieParser());
  app.useGlobalPipes(new ValidationPipe({ forbidUnknownValues: false }));

  app.useStaticAssets(join(__dirname, '..','..', 'frontend'));
  
  app.enableCors();
  await app.listen(3000);
}
bootstrap();