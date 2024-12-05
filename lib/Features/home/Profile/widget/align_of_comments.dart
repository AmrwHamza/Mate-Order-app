import 'package:flutter/material.dart';

class AlignOfComments extends StatelessWidget {
  String comment;
  AlignOfComments({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        comment,
        style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6)),
      ),
    );
  }
}
