import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/style/colors.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: textTitleApp(
          text: 'Notifications',
          color: kBlack,
          context: context,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/images/jump.json',
              width: 150,
            ),
            Text(
              'NOT FOUND !',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
