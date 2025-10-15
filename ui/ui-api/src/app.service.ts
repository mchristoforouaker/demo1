import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World!';
  }

  // This works but of course this is an API, so this would make sense. Let's do JSON.
  getHTMLHello(): string {
    return "<h1 style='color: blue;'>Hello World!</h1>";
  }

  getJSONHello(): string {
    return `{
      "port": "3000",
      "ip": "127.00.12.3"
    }`;
  }
}
