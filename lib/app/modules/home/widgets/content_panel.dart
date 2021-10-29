import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/modules/explore/place/widgets/place_card.dart';

import '../../../core/theme/ui_helpers.dart';
import '../controllers/home_controller.dart';
import 'cardOne.dart';
import 'popular_card.dart';

class ContentPanel extends GetView<HomeController> {
  final ScrollController scrollController;
  const ContentPanel({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    return MediaQuery.removeViewPadding(
      context: context,
      removeTop: true,
      child: Stack(
        children: [
          ListView(
            controller: scrollController,
            children: [
              kVerticalSpaceXL,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Recommended',
                      style: _textTheme.headline6!
                          .copyWith(fontWeight: FontWeight.bold, color: _themeData.primaryColor),
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.4, // height of card inside main listview
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.recplaceData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Color(0xFFFAFBFB),
                          height: screenSize.height * 0.35,
                          width: screenSize.height * 0.28,
                          child: CardOne(
                            place: controller.recplaceData[index],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Popular Place',
                      style: _textTheme.headline6!
                          .copyWith(fontWeight: FontWeight.bold, color: _themeData.primaryColor),
                    ),
                  ),
                  kVerticalSpaceL,
                  Obx(() => Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.recplaceData.length.isLowerThan(4)
                              ? controller.recplaceData.length
                              : 5,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PlaceCard(
                              place: controller.recplaceData[index],
                            );
                          },
                          separatorBuilder: (context, index) => kVerticalSpaceL,
                        ),
                      )),
                ],
              ),
            ],
          ),
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 5,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return CustomScrollView(
    //   controller: scrollController,
    //   slivers: <Widget>[
    //     // SliverAppBar(
    //     //   //pinned: true,
    //     //   floating: false,
    //     //   expandedHeight: 120.0,
    //     //   flexibleSpace: FlexibleSpaceBar(
    //     //     title: Text('Basic Slivers'),
    //     //   ),
    //     // ),
    //     SliverFixedExtentList(
    //       itemExtent: 50,
    //       delegate: SliverChildListDelegate([
    //         Container(color: Colors.red),
    //         Container(color: Colors.green),
    //         Container(color: Colors.blue),
    //       ]),
    //     ),
    //     SliverList(
    //       delegate: SliverChildBuilderDelegate(
    //         (context, index) {
    //           return Container(
    //             height: 50,
    //             alignment: Alignment.center,
    //             color: Colors.orange[100 * (index % 9)],
    //             child: Text('orange $index'),
    //           );
    //         },
    //         childCount: 9,
    //       ),
    //     ),
    //     SliverGrid(
    //       delegate: SliverChildBuilderDelegate(
    //         (context, index) {
    //           return Container(
    //             alignment: Alignment.center,
    //             color: Colors.teal[100 * (index % 9)],
    //             child: Text('grid item $index'),
    //           );
    //         },
    //         childCount: 30,
    //       ),
    //       // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //       //   maxCrossAxisExtent: 200.0,
    //       //   mainAxisSpacing: 10.0,
    //       //   crossAxisSpacing: 10.0,
    //       //   childAspectRatio: 4.0,
    //       // ),
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 3,
    //         mainAxisSpacing: 15,
    //         crossAxisSpacing: 15,
    //         childAspectRatio: 2.0,
    //       ),
    //     ),
    //     SliverToBoxAdapter(
    //       child: Container(
    //         color: Colors.yellow,
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text('Grid Header', style: TextStyle(fontSize: 24)),
    //       ),
    //     ),
    //     SliverGrid.count(
    //       crossAxisCount: 3,
    //       mainAxisSpacing: 10.0,
    //       crossAxisSpacing: 10.0,
    //       childAspectRatio: 4.0,
    //       children: <Widget>[
    //         Container(color: Colors.red),
    //         Container(color: Colors.green),
    //         Container(color: Colors.blue),
    //         Container(color: Colors.red),
    //         Container(color: Colors.green),
    //         Container(color: Colors.blue),
    //       ],
    //     ),
    //     SliverGrid.extent(
    //       maxCrossAxisExtent: 200,
    //       mainAxisSpacing: 10.0,
    //       crossAxisSpacing: 10.0,
    //       childAspectRatio: 4.0,
    //       children: <Widget>[
    //         Container(color: Colors.pink),
    //         Container(color: Colors.indigo),
    //         Container(color: Colors.orange),
    //         Container(color: Colors.pink),
    //         Container(color: Colors.indigo),
    //         Container(color: Colors.orange),
    //       ],
    //     ),
    //   ],
    // );
  }
}
