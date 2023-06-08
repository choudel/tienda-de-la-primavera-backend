/* eslint-disable prettier/prettier */
import { OnModuleInit } from '@nestjs/common';
import {
  SubscribeMessage,
  WebSocketGateway,
  WebSocketServer,
  WsResponse,
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';

@WebSocketGateway({ cors: '*:*' })
export class WebsocketGate implements OnModuleInit {
  @WebSocketServer() server: Server;

  onModuleInit() {
    this.server.on('connection', (socket) => {
      console.log(socket.id);
      console.log('connected');
    });
  }

  @SubscribeMessage('join')
  handleJoin(client: Socket, room: string): WsResponse<string> {
    client.join(room);
    return { event: 'joined', data: `Joined room ${room}` };
  }

  @SubscribeMessage('offer')
  handleOffer(client: Socket, payload: any): void {
    const { room, offer } = payload;
    client.to(room).emit('offer', offer);
  }

  @SubscribeMessage('answer')
  handleAnswer(client: Socket, payload: any): void {
    const { room, answer } = payload;
    client.to(room).emit('answer', answer);
  }

  @SubscribeMessage('candidate')
  handleCandidate(client: Socket, payload: any): void {
    const { room, candidate } = payload;
    client.to(room).emit('candidate', candidate);
  }
}