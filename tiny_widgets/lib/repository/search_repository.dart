import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tiny_widgets/provider/search_provider.dart';

abstract class AbstractSearchRepository {
  Future<void> searchOnGoogle();
}

class SearchRepository extends GetxService implements AbstractSearchRepository {
  final SearchProvider searchProvider;

  SearchRepository({required this.searchProvider});

  @override
  Future<void> searchOnGoogle() async {
    Response res = await searchProvider.searchOnGoogle();
    log(res.body.toString(), name: "@@@@@@@@ search on google");
  }
}
