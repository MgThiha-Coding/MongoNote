import 'package:classic/model/model.dart';
import 'package:classic/viewmodel/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditNotePage extends StatefulWidget {
  final Model note;
  const EditNotePage({super.key, required this.note});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(now); // 2025-05-05 13:24:36
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF13AA52), //
        title: Text(
          'YourNote',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
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
                controller: titleController,
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
                controller: contentController,
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 7),
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
        backgroundColor: Colors.green,

        onPressed: () async {
          final title = titleController.text;
          final content = contentController.text;

          final result = Model(
            title: title,
            content: content,
            time: date,
            id: widget.note.id,
          );
          await ApiService.update(result);
          Navigator.pop(context, true);
          titleController.clear();
          contentController.clear();
          setState(() {});
        },
        child: Text('Save', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
