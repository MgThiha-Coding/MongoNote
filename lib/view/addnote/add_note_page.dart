import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF13AA52), // MongoDB Green

        title: Text(
          'ClassicPad',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Title",
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Content",
                  labelText: "Content",
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        shape: CircleBorder(),
        onPressed: () {},
        child: Text('Save', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
