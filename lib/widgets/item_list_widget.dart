import 'package:flutter/material.dart';
import 'package:swyg/theme/color.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({super.key, required this.title, required this.owner});
  final String title;
  final String owner;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 124,
          height: 124,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), border: Border.all(color: blackB5C)),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 61,
                      height: 61,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
                    ),
                    Container(
                      width: 61,
                      height: 61,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(15))),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 61,
                      height: 61,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15))),
                    ),
                    Container(
                      width: 61,
                      height: 61,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(
          owner,
          style: const TextStyle(
            color: blackB3C,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: const [
            Icon(
              Icons.favorite,
              size: 12,
              color: blackB5C,
            ),
            SizedBox(width: 3),
            Text(
              '25',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
