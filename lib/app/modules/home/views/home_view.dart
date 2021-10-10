import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/home_controller.dart';
import '../widgets/content_panel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    final controller = Get.put(HomeController());
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SlidingUpPanel(
        parallaxEnabled: true,
        parallaxOffset: 0.1,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18.0)),
        minHeight: screenSize.height * 0.3,
        maxHeight: screenSize.height * 0.85,
        panelBuilder: (controller) => ContentPanel(
          scrollController: controller,
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            GoogleMap(
              onMapCreated: controller.onMapCreated,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(23.874745, 90.320942),
                zoom: 13,
              ),
            ),
            Positioned(
              top: screenSize.height * 0.1,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: _themeData.primaryColor.withOpacity(0.25),
                        blurRadius: 15,
                        offset: Offset(0, 2), //position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    controller: controller.searchController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      contentPadding: EdgeInsets.all(16.0),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.menu_open_outlined),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.6,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: Size.zero,
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                ),
                onPressed: controller.onTapExplore,
                icon: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: _themeData.primaryColor.withOpacity(0.30),
                            blurRadius: 16,
                            offset: Offset(0, 2), //position of shadow
                          ),
                        ],
                        color: _themeData.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Icon(
                      Icons.near_me_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
                label: Text(
                  'Explore Nearby',
                  style: _textTheme.bodyText2!.copyWith(color: _themeData.secondaryHeaderColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MapColorStyle {
  static String mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#e64c4c"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#db3939"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#db3939"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d25151"
      }
    ]
  },
  {
    "featureType": "administrative.neighborhood",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#db3939"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d54444"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d54444"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d25151"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e8b0b0"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#db5c5c"
      }
    ]
  }
]
  ''';
}
