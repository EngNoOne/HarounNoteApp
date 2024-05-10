
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj21/cubits/notes_cubit/notes_cubit.dart';

import 'notes_listView.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState(){
    BlocProvider.of<NotesCubitsCubit>(context).fetchallnotes();
    super.initState();
  }
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
         AppBarcus(),
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}

class AppBarcus extends StatelessWidget {
  const AppBarcus({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding:  EdgeInsets.only(left: 135),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notes',
            style: TextStyle(fontSize: 28,),
          ),
      
        ],
      ),
    );
  }
}