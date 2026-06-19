import 'package:flutter/material.dart';
import 'package:news_hub/core/utils/route_manager.dart';
import 'package:news_hub/features/home/presentation/view/widgets/custom_floating_action_botton.dart';
import 'package:news_hub/features/home/presentation/view/widgets/news_list_veiw_builder.dart';

class Cardview extends StatefulWidget {
  const Cardview({super.key, required this.catogery});
  final String catogery;
  static const String id = RouteManager.cardview;

  @override
  State<Cardview> createState() => _CardviewState();
}

class _CardviewState extends State<Cardview> {
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
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(controller: scrollController, slivers: [
            NewsListVeiwBuilder(
              catogery: widget.catogery,
            ),
          ]),
          floatingActionButton: CustomFloatingActionBotton(
              scrollController: scrollController, showButton: showButton)),
    );
  }

  void handleScroll() {
    if (scrollController.offset > 200) {
      setState(() => showButton = true);
    } else if (scrollController.offset <= 200) {
      setState(() => showButton = false);
    }
  }
}
