import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/repository/search_repository.dart';

class SearchController extends GetxController {
  final SearchRepository searchRepo;
  SearchController({required this.searchRepo});

  late final TextEditingController _inputController = TextEditingController();
  final RxList<GoogleSearch> _curResults = <GoogleSearch>[].obs;

  TextEditingController get keywordController => _inputController;
  List<GoogleSearch> get curResults => _curResults;
  static SearchController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    log("onInit called", name: "search controller");
  }

  @override
  void onReady() {
    super.onReady();
    log("onReady called", name: "search controller");
  }

  @override
  void onClose() {
    log("onClose called", name: "search controller");
    _inputController.dispose();
    super.onClose();
  }

  void clearTextField() {
    _inputController.clear();
  }

  Future<void> searchOnGoogle(String keyword) async {
    _curResults.value = await searchRepo.searchOnGoogle(keyword);
  }
}
