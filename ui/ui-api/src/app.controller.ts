import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

// Test to see if CI/CD works
// Another test
// Another test 2
// Another test 3
// Another test 4
@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
}
