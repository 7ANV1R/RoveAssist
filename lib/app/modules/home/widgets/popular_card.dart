import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      //width: 100,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
    );
  }
}
