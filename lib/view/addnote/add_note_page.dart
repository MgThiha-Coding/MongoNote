import 'package:classic/model/model.dart';
import 'package:classic/view/viewnote/view_note_page.dart';
import 'package:classic/viewmodel/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(now); // 2025-05-05 13:24:36
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF13AA52)),
              accountName: Text('MongoNote'),
              accountEmail: Text('CRUD Operation'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'MN',
                  style: TextStyle(fontSize: 24, color: Color(0xFF13AA52)),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.note, color: Colors.green),
              title: Text('My Notes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewNotePage()),
                );
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF13AA52), // MongoDB Green

        title: Text(
          'MongoNote',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Title",
                  labelText: "Title",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: contentController,
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

        onPressed: () async {
          final title = titleController.text;
          final content = contentController.text;
          var id = M.ObjectId();
          final result = Model(
            title: title,
            content: content,
            time: date,
            id: id,
          );
          await ApiService.save(result);
          if (title.isNotEmpty || content.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewNotePage()),
            );
          }
          titleController.clear();
          contentController.clear();
          setState(() {});
        },
        child: Text('Save', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
