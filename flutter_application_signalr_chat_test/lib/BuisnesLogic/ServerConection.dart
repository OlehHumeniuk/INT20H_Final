import 'package:flutter/material.dart';
import 'package:schedule_t/Entities/Device.dart';

import 'package:signalr_core/signalr_core.dart';
import 'dart:convert';


class ServerConection
{
    late HubConnection _hubConnection;
    HubConnection get hubConnection => _hubConnection;

  void initState() {
    _hubConnection = HubConnectionBuilder().withUrl("https://localhost:7170/programhub").build();
   
    _hubConnection.onclose( (error) => print("Connection Closed"));
    startConnection();
  }

  Future<void> startConnection() async {
    try {
      if (_hubConnection.state == HubConnectionState.disconnected) {
        await _hubConnection.start(); // Start the connection
        print('Hub Connection Started');

        // Спочатку встановіть обробник для події 'ReceiveUserInfo'
        _hubConnection.on('ReceiveComputingDeviceInfo', (List<dynamic>? parameters) {
          if (parameters != null && parameters.isNotEmpty) {
            final jsonInfo = parameters[0]; // Перетворюємо перший параметр у JSON-рядок
            print('Received user info: $jsonInfo');
            // Тут ви можете десеріалізувати JSON-рядок та використовувати дані
          }
        });

        print('Invoked ReceiveComputingDeviceInfo on server');
      } 
      else {
        print('Hub Connection is already in a connected or connecting state');
      }
    } catch (e) {
      print('Error starting connection: $e');
    }
  }

}