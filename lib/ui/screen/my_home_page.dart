import 'package:better_news/logic/news_cubit.dart';
import 'package:better_news/ui/screen/news_page.dart';
import 'package:better_news/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    BlocProvider.of<NewsCubit>(context).getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Better News'),
        ),
        body: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is NewsLoading) {
              return const Loading(
                eventName: "Fetching News...",
              );
            }
            if (state is NewsLoaded) {
              final news = state.news;
              return ListView.builder(
                itemCount: news.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(news[index].title!),
                    subtitle: Text(news[index].content!),
                    trailing: Image.network(news[index].photoUrl!),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => NewsPage(
                            news: news[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
            return const Center(
              child: Text("No News Avialable"),
            );
          },
        ));
  }
}
