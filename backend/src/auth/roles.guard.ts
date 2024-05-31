import { Injectable, CanActivate, ExecutionContext } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { ROLES_KEY } from './decorators/roles.decorator';

@Injectable()
export class RolesGuard implements CanActivate {
  constructor(private reflector: Reflector) {}

  canActivate(context: ExecutionContext): boolean {
    const requiredRoles = this.reflector.getAllAndOverride<string[]>(ROLES_KEY, [
      context.getHandler(),
      context.getClass(),
    ]);
    console.log("from role.guard.ts");
    if (!requiredRoles) {
      console.log("No required Roles.");
      return true;//no roles required. Access Granted.
    }

    const { user } = context.switchToHttp().getRequest();
    console.log(`Required Roles: ${requiredRoles}`);
    console.log(`User Roles: ${user.role}`);
    return requiredRoles.includes(user.role);
  }
}
