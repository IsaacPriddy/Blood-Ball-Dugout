import 'package:flutter/material.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  TeamsScreenState createState() => TeamsScreenState();
}

class TeamsScreenState extends State<TeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('skillScreenScaffold'), // Add a unique key here
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TEAMS',
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
        child: const Center(
          child: Text('This is an empty screen!'),
        ),
      )
    );
  }
}