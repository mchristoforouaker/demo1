import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

// Test to see if CI/CD works
// Another test
// Another test 2
// Another test 3
// Another test 4
// Another test 5
@Controller('info')
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('text')
  getHello(): string {
//    return this.appService.getJSONHello();
    return this.appService.getHello();
  }

  @Get('json')
  getHelloJSON(): string {
    return this.appService.getJSONHello();
//    return this.appService.getHello();
  }
}
