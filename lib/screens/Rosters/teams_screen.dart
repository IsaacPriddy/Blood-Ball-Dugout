import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  TeamsScreenState createState() => TeamsScreenState();
}

class TeamsScreenState extends State<TeamsScreen> {
  // Variable List
  List _items = [];

  @override
  void initState() {
    // This is used to initalize the listBuilder
    super.initState();
    readJson();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('teamScreenScaffold'), // Add a unique key here
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TEAMS'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imgs/temp-opaque20.png"), 
            fit: BoxFit.contain,
          ),
        ),
        child: listBuilder(),
      )
    );
  }

  // LIST BUILDING WIDGETS
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/teams.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["teams"];
      // _items = (data['teams'] as List).map((team) => RosterDetails.fromJson(team)).toList();
    });
  }

  Widget listBuilder() {
    // Not sure how efficient this sort will be overall, but it runs
    _items.sort((a, b) { 
      // First compare tier
      int tierComparison = a["tier"].compareTo(b["tier"]);
      // Second compare name
      return tierComparison == 0 ? a["name"].compareTo(b["name"]) : tierComparison;
    });

    return _items.isEmpty
      ? const Center(child: Text('No teams available'))
      : ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(6),
            child: ListTile(
              title: Text(_items[index]["name"],
                  style: const TextStyle(fontFamily: 'Nuffle')),
              trailing: Text(_items[index]["tier"]),
              onTap: () {
                Navigator.pushNamed(context, 'RosterScreen', arguments: _items[index]["rosterPath"]);
              }, // onTap
            ),
          );
        },
      );
  }
}