import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apps/core/utils/route_manager.dart';
import 'package:news_apps/cubits/theme_cubit/theme-cubit.dart';
import 'package:news_apps/widgets/card_list_veiw.dart';
import 'package:news_apps/widgets/custom_search.dart';
import 'package:news_apps/widgets/news_list_veiw_builder.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  static const String id = RouteManager.homeview;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
              onPressed: () {
                BlocProvider.of<ThemeCubit>(context).themechange();
              },
              icon: const Icon(Icons.dark_mode))
        ],
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "News",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            Text(
              "Could",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: CardListVeiw()),
          NewsListVeiwBuilder(
            catorgy: 'generals',
          ),
        ],
      ),
    );
  }
}
