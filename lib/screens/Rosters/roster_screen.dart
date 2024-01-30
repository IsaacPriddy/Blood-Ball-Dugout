import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RosterScreen extends StatefulWidget {
  const RosterScreen({super.key});

  @override
  RosterScreenState createState() => RosterScreenState();
}

class RosterScreenState extends State<RosterScreen> {
  // Variable List
  late String rosterPath = '';
  late String teamName = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the arguments here
    rosterPath = ModalRoute.of(context)!.settings.arguments as String;
    _loadRosterData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('rosterScreenScaffold'), // Add a unique key here
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          teamName,
          style: const TextStyle(
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
        child: Center(
          child: Column(
            children: [
              const Text("Stuff goes here"),
              Text("Roster Path: $rosterPath"),
              Text("The Team name is: $teamName")
            ]
          )
        ),
      )
    );
  }

  Future<void> _loadRosterData() async {
    try {
      final String rosterDataString = await rootBundle.loadString(rosterPath);
      final dynamic decodedData = json.decode(rosterDataString);

      if (decodedData is Map) {
        final Map<String, dynamic> teamData = decodedData['team'];

        // Print the contents of teamData
        debugPrint('Team data: $teamData');

        teamName = teamData['team_name'] ?? 'Unknown Team';
      } else {
        debugPrint('Unexpected data type: $decodedData');
      }
      } catch (error) {
        // Handle the error, e.g., show an error message
        debugPrint('Error loading roster data: $error');
      }

      // Ensure that the setState is called only when the widget is mounted
      if (mounted) {
        setState(() {
          // Update the UI after loading data
        });
    }
  }
}