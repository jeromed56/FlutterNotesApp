import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/provider/note_provider.dart';
import 'package:flutter_notes_app/screen/notes_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(create : (context)=>NoteProvider(),child: MyNotesApp()));
}


class MyNotesApp extends StatelessWidget {
  const MyNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      home: NotesScreen(),
    );
  }
}


