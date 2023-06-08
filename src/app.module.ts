import { Module } from '@nestjs/common';
import { PostGraphileController } from './app.controller';
import { AppService } from './app.service';
import { WebsocketGate } from './websocket.gateway';

@Module({
  imports: [],
  controllers: [PostGraphileController],
  providers: [AppService, WebsocketGate],
})
export class AppModule {}
