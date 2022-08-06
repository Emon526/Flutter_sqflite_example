// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../common_widgets/breed_builder.dart';

import '../models/breed.dart';

import '../services/database_service.dart';
import 'breed_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseService _databaseService = DatabaseService();

  // Future<List<Dog>> _getDogs() async {
  //   return await _databaseService.dogs();
  // }

  Future<List<Breed>> _getBreeds() async {
    return await _databaseService.breeds();
  }

  // Future<void> _onDogDelete(Dog dog) async {
  //   await _databaseService.deleteDog(dog.id!);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqflite Database'),
        centerTitle: true,
      ),
      body: BreedBuilder(
        future: _getBreeds(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (_) => const BreedFormPage(),
                      fullscreenDialog: true,
                    ),
                  )
                  .then((_) => setState(() {}));
            },
            heroTag: 'addDog',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 12.0),
          // FloatingActionButton(
          //   onPressed: () {
          //     Navigator.of(context)
          //         .push(
          //           MaterialPageRoute(
          //             builder: (_) => DogFormPage(),
          //             fullscreenDialog: true,
          //           ),
          //         )
          //         .then((_) => setState(() {}));
          //   },
          //   heroTag: 'addDog',
          //   child: FaIcon(FontAwesomeIcons.paw),
          // ),
        ],
      ),
    );
  }
}
