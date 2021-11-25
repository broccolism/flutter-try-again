import 'package:get/get.dart';
import 'package:tiny_widgets/config/config.dart';

class SearchProvider extends GetConnect {
  Future<Response> searchOnGoogle(String keyword) => get(
        "https://www.googleapis.com/customsearch/v1?key=${GoogleApiConfig.API_KEY}&cx=${GoogleApiConfig.SEARCH_ENGINE_ID}&q=${keyword}",
      );
}
