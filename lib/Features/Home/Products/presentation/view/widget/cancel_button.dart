import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(1, 1),
            )
          ]),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.cancel_outlined),
        color: Colors.white,
      ),
    );
  }
}
