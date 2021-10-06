import 'package:roveassist/app/core/values/assets.dart';

class PlaceModel {
  final String id;
  final String placeName;
  final String? coverImage;
  final String address;
  final double? rating;
  final int? totalRating;

  PlaceModel(
      {required this.id,
      this.coverImage,
      required this.placeName,
      required this.address,
      this.rating,
      this.totalRating});

  static List<PlaceModel> demoLists() {
    return <PlaceModel>[
      PlaceModel(
        id: '1',
        placeName: 'Cox\'s Bazar',
        coverImage: kAssetCover1,
        address: 'Chittagong, Bangladesh',
        rating: 4.9,
        totalRating: 12500,
      ),
      PlaceModel(
        id: '2',
        placeName: 'Cox\'s Bazar',
        coverImage: kAssetCover2,
        address: 'Chittagong, Bangladesh',
        rating: 4.9,
        totalRating: 12500,
      ),
      PlaceModel(
        id: '3',
        placeName: 'Cox\'s Bazar',
        coverImage: kAssetCover3,
        address: 'Chittagong, Bangladesh',
        rating: 4.9,
        totalRating: 12500,
      ),
      PlaceModel(
        id: '4',
        placeName: 'Cox\'s Bazar',
        coverImage: kAssetCover4,
        address: 'Chittagong, Bangladesh',
        rating: 4.9,
        totalRating: 12500,
      ),
    ];
  }
}
