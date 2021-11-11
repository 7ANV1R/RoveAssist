import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:roveassist/app/data/models/travel_note_model.dart';
import 'package:roveassist/app/data/services/storage_service.dart';
import 'package:roveassist/app/data/services/user_auth_services.dart';
import 'package:http/http.dart' as http;

class TravelNoteController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  final UserAuthServices _userAuthServices = Get.find<UserAuthServices>();
  final String localhost = dotenv.env['BASE_URL'] ?? 'not found';
  @override
  void onInit() {
    getTravelNotes();
    super.onInit();
  }

  @override
  void onReady() {
    // getTravelNotes();
    super.onReady();
  }

  @override
  void onClose() {}

  RxList<TravelNoteModel> userNote = RxList<TravelNoteModel>();

  Future<dynamic> getTravelNotes() async {
    final String? token = _storageService.authToken;
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    final String idFromToken = decodedToken["user_id"].toString();
    final int idintFromToken = decodedToken["user_id"];

    String baseUrl = '$localhost/note/list/';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    http.Response response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );

    final List<TravelNoteModel> fetchedRestaurants = List<TravelNoteModel>.from(
      (json.decode(response.body) as List<dynamic>).where((element) => element['user'] == idintFromToken).map(
            (e) => TravelNoteModel.fromJson(e as Map<String, dynamic>),
          ),
    ).toList();
    userNote.value = fetchedRestaurants;

    fetchedRestaurants.forEach((element) {
      print(element.description);
    });
  }
}
