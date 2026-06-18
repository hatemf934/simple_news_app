import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/route_manager.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/features/home/presentation/view/widgets/card_list_veiw.dart';
import 'package:news_apps/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:news_apps/features/home/presentation/view/widgets/custom_floating_action_botton.dart';
import 'package:news_apps/features/home/presentation/view/widgets/news_list_veiw_builder.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  static const String id = RouteManager.homeview;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScrollController scrollController = ScrollController();
  bool showButton = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      handleScroll();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: const [
            SliverToBoxAdapter(child: SizedBox(height: HeightManager.h10)),
            SliverToBoxAdapter(child: CardListVeiw()),
            NewsListVeiwBuilder(catogery: 'generals'),
          ],
        ),
        floatingActionButton: CustomFloatingActionBotton(
            scrollController: scrollController, showButton: showButton));
  }

  void handleScroll() {
    if (scrollController.offset > 200) {
      setState(() => showButton = true);
    } else if (scrollController.offset <= 200) {
      setState(() => showButton = false);
    }
  }
}
