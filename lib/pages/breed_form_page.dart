// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../models/breed.dart';
import '../services/database_service.dart';

class BreedFormPage extends StatefulWidget {
  const BreedFormPage({Key? key}) : super(key: key);

  @override
  _BreedFormPageState createState() => _BreedFormPageState();
}

class _BreedFormPageState extends State<BreedFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();

  Future<void> _onSave() async {
    final name = _nameController.text;
    final description = _descController.text;

    await _databaseService
        .insertBreed(Breed(name: name, description: description));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'title',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descController,
              maxLines: 7,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'description',
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: _onSave,
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
