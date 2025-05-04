
ClassicPad 

A simple Flutter application for managing notes with CRUD operations (Create, Read, Update, Delete) using MongoDB Atlas. The project is organized using the Model-View-ViewModel (MVVM) pattern with a Repository layer.

Project Structure 

lib/
├── model/
│   └── model.dart           # Data model for notes
├── view/
│   └── viewnote/            
│       ├── view_note_page.dart   # Main note listing & UI
│       └── edit_note_page.dart   # Edit note UI
├── viewmodel/
│   └── api_service.dart     # MongoDB connection and data handling
├── repository/
│   └── constant.dart        # MongoDB URL and collection
└── main.dart                # Entry point

## 🛠 Features

- ➕ **Create Note** – Add a new note with title and content
- 📄 **Read Notes** – View all saved notes in a scrollable list
- ✏️ **Update Note** – Edit and update existing notes
- 🗑️ **Delete Note** – Remove individual notes with confirmation
- ❌ **Delete All Notes** – One-click delete for all notes
- 🔄 **Manual Refresh** – Refresh the note list using a FloatingActionButton
- 🧱 **MVVM Structure** – Clean separation using Model, View, ViewModel, and Repository layers
- ☁️ **MongoDB Atlas Integration** – Uses `mongo_dart` to connect with a remote MongoDB cluster
