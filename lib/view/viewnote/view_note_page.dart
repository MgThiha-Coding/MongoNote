import 'package:classic/view/viewnote/edit_note_page.dart';
import 'package:classic/viewmodel/api_service.dart';
import 'package:flutter/material.dart';

class ViewNotePage extends StatefulWidget {
  const ViewNotePage({super.key});

  @override
  State<ViewNotePage> createState() => _ViewNotePageState();
}

class _ViewNotePageState extends State<ViewNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF13AA52),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 17,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Are you sure to delete?',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.green, fontSize: 14),
                          ),
                        ),
                        SizedBox(width: 15),
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context); // Close the dialog first
                            final success = await ApiService.deleteAll();
                            if (success) {
                              ScaffoldMessenger.of(
                                // ignore: use_build_context_synchronously
                                context,
                              ).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Deleted All Notes successfully!',
                                  ),
                                  backgroundColor: Colors.grey[600],
                                  duration: Duration(seconds: 1),
                                ),
                              );
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(
                                // ignore: use_build_context_synchronously
                                context,
                              ).showSnackBar(
                                SnackBar(
                                  content: Text('Failed to delete note.'),
                                  backgroundColor: Colors.red[300],
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Delete All',
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('Delete All', style: TextStyle(color: Colors.white)),
          ),
        ],
        title: Text(
          'YourNote',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),

      body: FutureBuilder(
        future: ApiService.getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final notes = snapshot.data;
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final res = notes[index];
                return Card(
                  child: ListTile(
                    minTileHeight: 100,

                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(res.title, style: TextStyle(color: Colors.blue)),
                        Text(
                          res.time,
                          style: TextStyle(fontSize: 10, color: Colors.green),
                        ),
                      ],
                    ),

                    subtitle: Text(res.content),

                    trailing: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.more_vert, size: 20),
                        items: [
                          DropdownMenuItem(
                            value: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.delete, size: 18, color: Colors.red),
                                Text('Delete', style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.edit, size: 18, color: Colors.green),
                                Text('Edit', style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          if (value == 1) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.grey[200],
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 17,
                                  ),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Are you sure to delete?',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.pop(
                                            context,
                                          ); // Close the dialog first
                                          final success =
                                              await ApiService.delete(res);
                                          if (success) {
                                            ScaffoldMessenger.of(
                                              // ignore: use_build_context_synchronously
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Note deleted successfully!',
                                                ),
                                                backgroundColor:
                                                    Colors.grey[600],
                                                duration: Duration(seconds: 1),
                                              ),
                                            );
                                            setState(() {});
                                          } else {
                                            ScaffoldMessenger.of(
                                              // ignore: use_build_context_synchronously
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Failed to delete note.',
                                                ),
                                                backgroundColor:
                                                    Colors.red[300],
                                              ),
                                            );
                                          }
                                        },
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else if (value == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        EditNotePage(note: notes[index]),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Empty'));
          }
        },
      ),
    );
  }
}
