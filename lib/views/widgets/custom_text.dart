import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.hint, this.maxline = 1, this.onSaved, this.onChanged});

  final String hint;
  final int maxline;
  final void Function (String?)? onSaved;
  final  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged ,
      onSaved: onSaved ,
      validator: (value) {
        if(value?.isEmpty ?? true){ //if null then true
          return 'Field is required';
        }else{
          return null;
        }
      },
      cursorColor: const Color(0xff62FCD7),
      maxLines: maxline,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xff62FCD7),
        ),
        border: buildborder(),
        enabledBorder: buildborder(),
        focusedBorder: buildborder(
          const Color(0xff62FCD7),
        ),
      ),
    );
  }

  OutlineInputBorder buildborder([Color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        16,
      ),
      borderSide: BorderSide(
        color: Color ?? Colors.white,
      ),
    );
  }
}
