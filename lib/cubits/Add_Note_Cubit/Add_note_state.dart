part of 'Add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

 class AddNotesInitial extends AddNoteState {}

  class AddNotesLoading extends AddNoteState {}

 class AddNotesSuccess extends AddNoteState {}

 class AddNotesFailure extends AddNoteState {
    final String errorMessage;
    AddNotesFailure(this.errorMessage);
 }

