import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/provider/search_provider.dart';

abstract class AbstractSearchRepository {
  Future<List<GoogleSearch>> searchOnGoogle(String keyword);
}

class SearchRepository extends GetxService implements AbstractSearchRepository {
  final SearchProvider searchProvider;

  SearchRepository({required this.searchProvider});

  @override
  Future<List<GoogleSearch>> searchOnGoogle(String keyword) async {
    if (keyword.isEmpty) {
      return [];
    }

    Response res = await searchProvider.searchOnGoogle(keyword);
    Map<String, dynamic> responseBody = Map.from(res.body);
    List<GoogleSearch> searchItems =
        List.from(responseBody['items']).map((item) {
      return GoogleSearch.fromMap(item);
    }).toList();

    return searchItems;
  }
}
