import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  PlayScreenState createState() => PlayScreenState();
}

class PlayScreenState extends State<PlayScreen> {
  // Variable List

  // BUILD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('playScreenScaffold'), // Add a unique key here
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'PLAY GAME',
          style: TextStyle(
            fontFamily: 'Nuffle',
            fontSize: 24.0,
          )
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imgs/temp-opaque20.png"), 
            fit: BoxFit.contain,
          ),
        ),
        child: const Column(
          children: [
            Text('This is an empty screen!'),
          ]
        ),
      )
    );
  }
}