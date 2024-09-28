import 'package:flutter/material.dart';
import 'package:flutter_application_1/addentryscreen.dart';

void main() {
  runApp(JudgingApp());
}

class Entry {
  String entryNumber;
  String name;
  String vehicleClass;
  Map<String, int> scores;

  Entry(this.entryNumber, this.name, this.vehicleClass, this.scores);

  int totalScore() {
    int total = 0;
    scores.forEach((category, score) {
      total += score;
    });
    return total;
  }
}

class JudgingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Judging App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EntryListScreen(),
    );
  }
}

class EntryListScreen extends StatefulWidget {
  @override 
  _EntryListScreenState createState() => _EntryListScreenState();
}

class _EntryListScreenState extends State<EntryListScreen> {
  final List<Entry> entries = [
    Entry("Entry 1", "Dodge Challenger", "A", {"Engine": 8, "Paint": 7, "Interior": 9}),
    Entry("Entry 2", "Ford F-150", "B", {"Engine": 9, "Paint": 8, "Interior": 7}),
    Entry("Entry 3", "Chevy Corvette", "C", {"Engine": 7, "Paint": 6, "Interior": 8}),
  ];
  int _nextEntryNumber = 4;

  void _addNewEntry(Entry entry) {
    setState(() {
      entries.add(entry);
      _nextEntryNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Judging Results'),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return EntryCard(entries[index], index + 1);
        },
      ),
      floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
           onPressed: () {
              Navigator.push( 
                context,
                MaterialPageRoute(builder: (context) => AddEntryScreen(onAddEntry: _addNewEntry, nextEntryNumber: _nextEntryNumber,))
            );
            })
            
    );
  }
}

class EntryCard extends StatelessWidget {
  final Entry entry;
  final int entryNumber;

  EntryCard(this.entry, this.entryNumber);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [ 
            CircleAvatar( 
              child: Text(entryNumber.toString(),
              style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
            SizedBox(height: 25, width: 25,), 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...entry.scores.entries.map((score) {
              return Text("${score.key}: ${score.value}");
            }).toList(),
            Divider(),
            Text(
              "Total Score: ${entry.totalScore()}",
              style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
