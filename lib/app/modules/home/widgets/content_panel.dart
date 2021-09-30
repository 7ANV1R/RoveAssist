import 'package:flutter/material.dart';

class ContentPanel extends StatelessWidget {
  final ScrollController scrollController;
  const ContentPanel({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      controller: scrollController,
      children: [
        Center(
          child: Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
