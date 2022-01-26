import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:newsapp/layout/cubit/home_layout_cubit.dart';
import 'package:newsapp/modules/home/home_screen.dart';
import 'package:newsapp/modules/ontifications/notifications.dart';
import 'package:newsapp/modules/settings/settings.dart';
import 'package:newsapp/shared/style/colors.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        return Scaffold(
          bottomNavigationBar: SnakeNavigationBar.color(
            elevation: 20,
            currentIndex: cubit.currntIndex,
            onTap: (index) {
              cubit.indexBottom(index);
            },
            selectedItemColor: kWhite,
            snakeViewColor: kRed,
            snakeShape: SnakeShape.circle,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'tickets',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'person',
              ),
            ],
          ),
          body: screens[cubit.currntIndex],
        );
      },
    );
  }
}

List<Widget> screens = const [
  Home(),
  Notifications(),
  Settings(),
];
