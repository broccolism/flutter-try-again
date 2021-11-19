import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/view/widget/autocomplete_search/autocomplete_result.dart';
import 'package:tiny_widgets/view/widget/autocomplete_search/search_bar.dart';

class AutoCompleteSearch extends StatelessWidget {
  const AutoCompleteSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SearchBar(),
          AutoCompleteResult(),
        ],
      ),
    );
  }
}
