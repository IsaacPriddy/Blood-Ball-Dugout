import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // These are here so that the size dynamically changes with the size of the phone
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BLOOD BOWL COMPANION APP',
          style: TextStyle(
            fontFamily: 'Nuffle',
            fontSize: 24.0,
          )
        ),
      ),
      body: Container(
        // Decoration for background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imgs/temp-opaque20.png"), 
            fit: BoxFit.contain,
          ),
        ),
        // Child for the actual content of Container
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              navigationButton('Play Game', 'PlayScreen', screenHeight, screenWidth),
              SizedBox(height: screenHeight * 0.0234), // Add vertical spacing, height was 16
              navigationButton('Skills', 'SkillScreen', screenHeight, screenWidth),
              SizedBox(height: screenHeight * 0.0234), // Add vertical spacing, height was 16
              navigationButton('Teams', 'TeamsScreen', screenHeight, screenWidth),
            ],
          )
        ),
      ),
      bottomNavigationBar: Container(
        // Just here to add blue to the screen and styling
        color: Colors.blue.shade500,
        height: screenHeight * 0.0878, // was 60.0
      ),
    );
  }

  Widget navigationButton(String name, String location, double h, double w) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, location);
      },
      style: ElevatedButton.styleFrom(
        // General settings of the buttons
        fixedSize: Size(h * 0.293, w * 0.122), // was 200, 50
        padding: EdgeInsets.all(w*0.0234), // was 16
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.amber.shade50, width: 0.5),
          borderRadius: BorderRadius.circular(10)
        ),
        // Text settings for the buttons
        foregroundColor: Colors.black, 
        backgroundColor: Colors.amber.shade100,
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'Nuffle'
        ),
      ),
      child: Text(name),
    );
  }
}