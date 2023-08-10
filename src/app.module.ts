import { Module } from '@nestjs/common';
import { PostGraphileController } from './app.controller';
import { AppService } from './app.service';
import { WebsocketGate } from './websocket.gateway';
import { APP_GUARD } from '@nestjs/core';
import { ThrottlerGuard, ThrottlerModule } from '@nestjs/throttler';

@Module({
  imports: [
    ThrottlerModule.forRoot({
      ttl: 60,
      limit: 5,
    }),
  ],
  controllers: [PostGraphileController],
  providers: [
    AppService,
    WebsocketGate,
    {
      provide: APP_GUARD,
      useClass: ThrottlerGuard,
    },
  ],
})
export class AppModule {}
