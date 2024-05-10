import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj21/Models/Note_model.dart';
import 'package:proj21/cubits/notes_cubit/notes_cubit.dart';
import 'package:proj21/views/widgets/Custom_appBar.dart';
import 'package:proj21/views/widgets/custom_text.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubitsCubit>(context).fetchallnotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(
            height: 50,
          ),
          CustomText(
            onChanged: (value) {
              title = (value);
            },
            hint: widget.note.title,
          ),
          SizedBox(
            height: 16,
          ),
          CustomText(
            onChanged: (value) {
              content = (value);
            },
            hint: widget.note.subtitle,
            maxline: 5,
          ),
        ],
      ),
    );
  }
}
