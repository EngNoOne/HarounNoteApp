import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton({super.key, this.onTap,  this.isLoading=false});
final void Function()?onTap;

final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: Color(0xff62FCD7), borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: isLoading ? CircularProgressIndicator(
            color: Colors.black,
          ) : Text(
            'Save',
            style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18),
          ),
        ),
      ),
    );
  }
}
