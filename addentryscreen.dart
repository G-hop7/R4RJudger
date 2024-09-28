import 'package:flutter/material.dart';
import 'main.dart';

class AddEntryScreen extends StatefulWidget {
  final Function(Entry) onAddEntry;
  final int nextEntryNumber;

  AddEntryScreen({required this.onAddEntry, required this.nextEntryNumber});

  @override 
  _AddEntryScreenState createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _entrynumberController = TextEditingController();
  final _vehicleclassController = TextEditingController();
  final _vehiclenameController = TextEditingController();
  final _enginescoreController = TextEditingController();
  final _paintscoreController = TextEditingController();
  final _interiorscoreController = TextEditingController();
  final _entrantnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _entrynumberController.text = "Entry ${widget.nextEntryNumber}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Entry'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _entrantnameController,
                decoration: InputDecoration(labelText: 'Entrant Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an entry name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _vehiclenameController,
                decoration: InputDecoration(labelText: 'Year, Make, Model'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an vehicle year, make, model.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _vehicleclassController,
                decoration: InputDecoration(labelText: 'Entry Class'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an entry class';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _enginescoreController,
                decoration: InputDecoration(labelText: 'Engine Score'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Engine score';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _paintscoreController,
                decoration: InputDecoration(labelText: 'Paint Score'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an Paint score';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _interiorscoreController,
                decoration: InputDecoration(labelText: 'Interior Score'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an interior score';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newEntry = Entry(
                      _entrynumberController.text,
                      _vehiclenameController.text,
                      _vehicleclassController.text,
                      {
                        'Engine': int.parse(_enginescoreController.text),
                        'Paint': int.parse(_paintscoreController.text),
                        'Interior': int.parse(_interiorscoreController.text),
                      },
                    );
                    widget.onAddEntry(newEntry);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Entry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}