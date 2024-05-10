import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj21/cubits/Add_Note_Cubit/Add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isactive, required this.color});
  final bool isactive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isactive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentindex = 0;

  List<Color> colors = [
    Color(0xff5BC0EB),
    Color(0xffFDE74C),
    Color(0xff9BC53D),
    Color(0xffe55934),
    Color(0xfffa7921),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentindex = index;
                BlocProvider.of<NotesCubit>(context).color=colors[index];
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isactive: currentindex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
