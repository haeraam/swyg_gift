import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.name, this.isFocused = false}) : super(key: key);
  final String name;
  final bool isFocused;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: isFocused ? 115 : 90,
          height: isFocused ? 115 : 90,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Text(
          name,
          style: TextStyle(fontSize: isFocused ? 21 : 18),
        ),
      ],
    );
  }
}
