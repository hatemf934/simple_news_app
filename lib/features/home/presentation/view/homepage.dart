import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/route_manager.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/features/home/presentation/view/widgets/card_list_veiw.dart';
import 'package:news_apps/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:news_apps/features/home/presentation/view/widgets/news_list_veiw_builder.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  static const String id = RouteManager.homeview;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: HeightManager.h10)),
          SliverToBoxAdapter(child: CardListVeiw()),
          NewsListVeiwBuilder(
            catogery: 'generals',
          ),
        ],
      ),
    );
  }
}
