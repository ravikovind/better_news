import 'package:better_news/logic/news_cubit.dart';
import 'package:better_news/ui/screen/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NewsCubit>(
            create: (context) => NewsCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Better News',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: "Poppins",
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                elevation: 0.0,
              )),
          home: const MyHomePage(),
        ));
  }
}


//! news_api url - https://script.google.com/macros/s/AKfycbyagLXxnJcmwl-2lkfnD3CweR2ox3U6Y3VJTEQZog0qLsCcm9qJ/exec