import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const UserEmail = createParamDecorator(
  (data: unknown, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();
    const email =  request['user']?.sub;
    console.log("from UserEmail decorator: " + email);
    return email;
  },
);
