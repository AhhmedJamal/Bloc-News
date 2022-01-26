import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/home_layout_cubit.dart';
import 'package:newsapp/shared/style/themes.dart';
import 'package:newsapp/shared/local/storage.dart';
import 'package:newsapp/shared/network/dio.dart';

import 'layout/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NewsApiServices.init();
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isDark = SharedPref.getBool(key: 'Dark');
    return BlocProvider(
      create: (context) => HomeLayoutCubit()
        ..getBusiness()
        ..getHealth()
        ..getSeiences()
        ..getSports()
        ..changeAppMode(
          fromShared: isDark,
        ),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BLOC NEWS',
            theme: Themes.lightMode,
            darkTheme: Themes.darkMode,
            themeMode: cubit.isChecked ? ThemeMode.dark : ThemeMode.light,
            home: const HomeLayOut(),
          );
        },
      ),
    );
  }
}
