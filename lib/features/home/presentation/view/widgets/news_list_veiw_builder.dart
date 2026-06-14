import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';
import 'package:news_apps/services/generalnews.dart';
import 'package:news_apps/core/widgets/loading_circular.dart';
import 'package:news_apps/features/home/presentation/view/widgets/news_list_veiw.dart';

// class NewsListVeiwBuilder extends StatefulWidget {
//   const NewsListVeiwBuilder({super.key});

//   @override
//   State<NewsListVeiwBuilder> createState() => _NewsListVeiwBuilderState();
// }

// class _NewsListVeiwBuilderState extends State<NewsListVeiwBuilder> {
//   List<NewsModel> generalNewsList = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     getNews();
//   }

// مينفعش async تتحط في initState
//   Future<void> getNews() async {
//     generalNewsList = await Generalnews(Dio()).getGeneralNews();
//     setState(() {});
//     isLoading = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
// ? const SliverToBoxAdapter(
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : generalNewsList.isNotEmpty
//             ? NewsListVeiw(
//                 generalNewsList: generalNewsList,
//               )
//             : const SliverToBoxAdapter(
//                 child: Center(child: Text("oops this is error")));
//   }
// }

// هنستخدم future builder عشان نعمل اللوجيك الي فوق بطريقه اسهل
// request مينفعش يكون موجود في bulid methods

// تاني طريقه والاسهل من الي فوق

class NewsListVeiwBuilder extends StatefulWidget {
  const NewsListVeiwBuilder({super.key, required this.catorgy});

  final String catorgy;
  @override
  State<NewsListVeiwBuilder> createState() => _NewsListVeiwBuilderState();
}

class _NewsListVeiwBuilderState extends State<NewsListVeiwBuilder> {
  var futuredata;
  @override
  void initState() {
    futuredata = Newsservices(Dio()).getNews(catorgy: widget.catorgy);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
        // atribute future استخدامه يعمل trigger for requset and يحط ودنه مع requset
        // ف هحط requset in initstate methods عشان مينفعش اعمل trigger more than one in builder methods
        // اعمل متغير واحط فيه requset واستدعيه ف atribute future

        future: futuredata,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? NewsListVeiw(generalNewsList: snapshot.data!)
              : snapshot.hasError
                  ? const SliverToBoxAdapter(
                      child: Center(child: Text("oops this is error")))
                  : const SliverToBoxAdapter(
                      child: LoadingCircular(),
                    );
        });
  }
}
