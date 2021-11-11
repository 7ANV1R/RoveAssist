import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../data/models/travel_note_model.dart';
import '../../../data/services/storage_service.dart';
import '../../../widgets/snakbar/general_snakbar.dart';
import 'widgets/add_travel_plan.dart';

class TravelNoteController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
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
  int id = 0;

  Future<dynamic> getTravelNotes() async {
    final String? token = _storageService.authToken;
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    final String idFromToken = decodedToken["user_id"].toString();
    final int idintFromToken = decodedToken["user_id"];
    id = idintFromToken;

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
    userNote.value = fetchedRestaurants.reversed.toList();
  }

  Future<void> onTapAddNote() async {
    Get.to(() => AddTravelPlan());
  }

  TextEditingController travelPlanTextController = TextEditingController();
  TextEditingController travelPlanTitleController = TextEditingController();

  Future<void> onTapAddNewNote(String title, String desc) async {
    try {
      String baseUrl = '$localhost/note/list/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.post(Uri.parse(baseUrl),
          headers: headers,
          body: json.encode(
            {"title": title, "description": desc, "user": id},
          ));
      getTravelNotes();
    } catch (e) {
      print(e.toString());
    }
    Get.back();
    await showGeneralSnakbar(
      message: 'Plan Added',
      backgroundColor: Colors.green,
      icon: Icon(
        Icons.edit_attributes_rounded,
        color: Colors.white,
      ),
    );
  }

  Future<void> onUpdateandSavePlan(String? newtitle, String newcontent, String planID) async {
    // _databaseService.updatePlan(newtitle, newcontent, _authService.user?.email ?? user!.email, planID);
    // Get.back();
    // await showGeneralSnakbar(
    //   message: 'Plan Updated',
    //   backgroundColor: Colors.green,
    //   icon: Icon(
    //     Icons.edit_attributes_rounded,
    //     color: Colors.white,
    //   ),
    // );
    // _detailsPlan.value = true;
    // _updatePlan.value = false;
  }

  Future<void> onDeleteNote(String noteId) async {
    try {
      String baseUrl = '$localhost/note/list/$noteId/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.delete(
        Uri.parse(baseUrl),
      );
      if (response.body.isNotEmpty) {
        final encoded = json.decode(response.body);
        print(encoded);
      }
      getTravelNotes();
      Get.back();
      await showGeneralSnakbar(
        message: 'Plan Deleted',
        backgroundColor: Colors.red,
        icon: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  final RxList<TravelNoteModel> travelPlanList = RxList<TravelNoteModel>();

  List<TravelNoteModel> get travelPlans => travelPlanList;

  // Future<void> onTapAddNavigation() async {
  //   Get.to(() => AddTravelPlan());
  // }

  // String formattedDateTime() {
  //   // var dateTimeFromStamp = DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
  //   // return DateFormat('hh:mm a').format(dateTimeFromStamp);
  //   // // return DateFormat('hh:mm a dd MMMM, yyyy').format(dateTimeFromStamp);
  // }

  //For details page:
  final RxBool _detailsPlan = RxBool(true);
  bool get detailsPlan => _detailsPlan.value;

  //For update page :
  final RxBool _updatePlan = RxBool(false);
  bool get updatePlan => _updatePlan.value;

  void onUpdate() {
    _detailsPlan.value = false;
    _updatePlan.value = true;
  }

  void onGetBackFromUpdate() {
    _detailsPlan.value = true;
    _updatePlan.value = false;
  }
}
