import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj21/Models/Note_model.dart';
import 'package:proj21/cubits/notes_cubit/notes_cubit.dart';

import 'custom_new_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitsCubit, NoteState>(
      builder: (context, state) {
        List<NoteModel>notes=BlocProvider.of<NotesCubitsCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.symmetric(vertical: 4),
                  child: NotesItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
