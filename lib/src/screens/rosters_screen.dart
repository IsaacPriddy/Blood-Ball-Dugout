import 'package:flutter/material.dart';

class RostersScreen extends StatelessWidget {
  const RostersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empty Screen'),
      ),
      body: const Center(
        child: Text('This is an empty screen!'),
      ),
    );
  }
}