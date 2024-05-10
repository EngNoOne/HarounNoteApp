import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:proj21/Models/Note_model.dart';
import 'package:proj21/cubits/Add_Note_Cubit/Add_note_cubit.dart';

import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class AddNote extends StatefulWidget {
  const AddNote({
    super.key,
  });

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomText(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomText(
            onSaved: (value) {
              subtitle = value;
            },
            hint: 'Content',
            maxline: 5,
          ),
          SizedBox(
            height: 32,
          ),
          ColorListView(),
          const SizedBox(
            height: 32,
          ),

          BlocBuilder<NotesCubit, AddNoteState>(
            builder: (context, state) {
              return customButton(
                isLoading: state is AddNotesLoading ? true : false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currendate =DateTime.now();
                    var formatdate =DateFormat('dd-mm-yyyy').format(currendate);
                    var noteModel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formatdate,
                        color: Colors.blue.value);

                    BlocProvider.of<NotesCubit>(context).addNotes(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
