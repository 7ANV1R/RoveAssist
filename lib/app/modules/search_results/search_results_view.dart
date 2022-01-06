import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'search_results_controller.dart';

class SearchResultsView extends GetView<SearchResultsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchResultsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SearchResultsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
