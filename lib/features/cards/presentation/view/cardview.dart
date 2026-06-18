import 'package:flutter/material.dart';
import 'package:news_hub/core/utils/route_manager.dart';
import 'package:news_hub/features/home/presentation/view/widgets/news_list_veiw_builder.dart';

class Cardview extends StatelessWidget {
  const Cardview({super.key, required this.catogery});
  final String catogery;
  static const String id = RouteManager.cardview;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: [
          NewsListVeiwBuilder(
            catogery: catogery,
          ),
        ]),
      ),
    );
  }
}
