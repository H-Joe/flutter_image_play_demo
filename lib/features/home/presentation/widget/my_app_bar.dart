import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 78, left: 29),
      child: Text(
        'Hyperbound Flutter Demo',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
