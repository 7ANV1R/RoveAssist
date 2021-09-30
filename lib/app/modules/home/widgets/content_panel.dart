import 'package:flutter/material.dart';

class ContentPanel extends StatelessWidget {
  final ScrollController scrollController;
  const ContentPanel({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      controller: scrollController,
      children: [],
    );
  }
}
