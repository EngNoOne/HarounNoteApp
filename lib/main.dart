import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proj21/Models/Note_model.dart';
import 'package:proj21/cubits/notes_cubit/notes_cubit.dart';
import 'package:proj21/simple_bloc_observer.dart';
import 'views/widgets/notes.dart';
void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocOberver();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>('notes_box');
  runApp(const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NotesCubitsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const notes(),
      ),
    );
  }
}
