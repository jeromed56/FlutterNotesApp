import 'package:flutter/material.dart';
import 'package:flutter_notes_app/screen/edit_note_screen.dart';
import 'package:provider/provider.dart';

import '../provider/note_provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NoteProvider>().notes;

    return Scaffold(
      appBar: AppBar(title: Text('Notes App', style: TextStyle(fontSize: 15))),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, i) {
          final note = notes[i];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content, maxLines: 1),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditNoteScreen(note: note,)),
                ),
            trailing: IconButton(
              onPressed: () => context.read<NoteProvider>().deleteNote(note.id),
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=>EditNoteScreen())
          );
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
