import 'package:flutter/material.dart';
import 'package:news_apps/features/home/presentation/view/widgets/news_list_veiw_builder.dart';

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return CustomScrollView(slivers: [
      NewsListVeiwBuilder(
        catorgy: query,
      ),
    ]);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text("Search Any News"));
  }
}
