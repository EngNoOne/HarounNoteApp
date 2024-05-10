import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:proj21/Models/Note_model.dart';

part 'notes_state.dart';

class NotesCubitsCubit extends Cubit<NoteState> {
  NotesCubitsCubit() : super(NotesInitial());
List<NoteModel>?notes;
  fetchallnotes() async {
    
      var notesBox = Hive.box<NoteModel>('notes_box');
      
      notes =notesBox.values.toList(); 
      emit(NotesSuccess());   
  }
}
