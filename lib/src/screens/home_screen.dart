import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BLOOD BOWL COMPANION APP',
          style: TextStyle(
            fontFamily: 'Nuffle',
            fontSize: 24.0,
          )
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          image: DecorationImage(
            image: const AssetImage("assets/imgs/temp_logo.png"), 
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
              Colors.grey.withOpacity(0.5),
              BlendMode.dstATop
            )
          ),
        ),
        child: const Center(
          child: Text(
            'This is my screen content',
            style: TextStyle(
              color: Colors.black, 
              fontSize: 24.0, 
              fontFamily: 'Nuffle'
            ),
          ),
        ),
      ),
    );
  }

/*
  Widget listEntryBP(String text, String goto) {
    return Container(
      padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.amber.shade50, width: 0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          title: Text(text),
          onTap: () {
            Navigator.pushNamed(
              context,
              goto,
            );
          },
        ),
      ),
    );
  }
*/

/*
  Widget homeScreenLayout() {
    return ListView(
      children: [
        listEntryBP("Play Game", 'game_screen'),
        listEntryBP("Skills", 'skill_screen'),
        // listEntryBP("Teams", 'testingGoto'), // Update with an actual route name
        // listEntryBP("Errata", 'testingGoto'), // Update with an actual route name
      ],
    );
  }
*/
}