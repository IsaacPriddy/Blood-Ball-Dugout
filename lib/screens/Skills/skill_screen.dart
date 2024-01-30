import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key});

  @override
  SkillScreenState createState() => SkillScreenState();
}

class SkillScreenState extends State<SkillScreen> {
  // Variable List
  List _items = [];
  List<bool> _isDescriptionVisible = []; // To allow the descriptions to be hidden unless desired
  final Set<String> _selectedCategories = {}; // Keep track of selected categories
  List<bool> isSelected = List.generate(6, (index) => false); // for toggleButtons, which there are 6 of

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('skillScreenScaffold'), // Add a unique key here
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SKILLS LIBRARY',
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
        child: Column(
          children: [
            rowOfToggleButtons(),
            Expanded(child:skillListBuilder())
          ]
        ),
      )
    );
  }

  @override
  void initState() {
    // This is used to initalize the listBuilder
    super.initState();
    readJson();
  }

  // SKILLS LIST WIDGETS
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/skills_data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["skills"];
      _isDescriptionVisible = List.generate(_items.length, (index) => false);
    });
  }

  Widget skillListBuilder() {
    // Not sure how efficient this sort will be overall, but it runs
    _items.sort((a, b) => a["name"].compareTo(b["name"]));

    return _items.isEmpty
      ? const Center(child: Text('No skills available'))
      : ListView.builder(
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            // Check if the skill's category is in the selected categories
            if (_selectedCategories.isEmpty ||
                _selectedCategories.contains(_items[index]["category"])) {
              return Card(
                margin: const EdgeInsets.all(6),
                child: ListTile(
                  title: Text(_items[index]["name"],
                      style: const TextStyle(fontFamily: 'Nuffle')),
                  trailing: Text(_items[index]["category"]),
                  subtitle: _isDescriptionVisible[index]
                      ? Text(_items[index]["description"])
                      : null,
                  onTap: () {
                    setState(() {
                      _isDescriptionVisible[index] =
                          !_isDescriptionVisible[index];
                    });
                  },
                ),
              );
            } else {
              // If the category is not selected, return an empty container so that it doens't error
              // Edge case catcher
              return Container();
            }
          },
        );
  }

  // SORTING BUTTONS WIDGETS
  /* 
    TODO: Maybe make a filter button on the appbar with a popout
      to make it more clear what each sorting bit is instead of letters
      that are easily confused 
  */
  Widget rowOfToggleButtons() {
    return Container( 
      color: Colors.amber.shade100.withOpacity(0.5),
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: Colors.white,
        color: Colors.black,
        fillColor: Colors.blue.shade500,
        children: [
          buttonSettings('General'),
          buttonSettings('Agility'),
          buttonSettings('Passing'),
          buttonSettings('Strength'),
          buttonSettings('Mutation'),
          buttonSettings('Extraordinary'),
        ], 
        onPressed: (int index) {
          setState(() {
            isSelected[index] = !isSelected[index];
            updateSelectedCategories(isSelected);
          });
        },
      )
    );
  }
  
  void updateSelectedCategories(List<bool> isSelected) {
    _selectedCategories.clear();

    for (int i = 0; i < isSelected.length; i++) {
      if (isSelected[i]) {
        // Add the corresponding category based on the button index
        switch (i) {
          case 0:
            _selectedCategories.add('General');
            break;
          case 1:
            _selectedCategories.add('Agility');
            break;
          case 2:
            _selectedCategories.add('Passing');
            break;
          case 3:
            _selectedCategories.add('Strength');
            break;
          case 4:
            _selectedCategories.add('Mutation');
            break;
          case 5:
            _selectedCategories.add('Extraordinary');
            break;
        }
      }
    }
  }

  Widget buttonSettings(String character) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Text(
        character, 
        style: const TextStyle(fontWeight: FontWeight.bold),
      )
    );
  }
}