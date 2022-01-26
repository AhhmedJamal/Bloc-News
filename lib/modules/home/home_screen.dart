import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/modules/home/business/business.dart';
import 'package:newsapp/modules/home/health/health.dart';
import 'package:newsapp/modules/home/sciences/sciences.dart';
import 'package:newsapp/modules/home/sports/sports.dart';
import 'package:newsapp/shared/style/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> textTabBar = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          'Sportes',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Text(
          'Health',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Text(
          'Sciences',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Text(
          'Business',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    ];
    List<Widget> screens = const [
      Sports(),
      Health(),
      Sciences(),
      Business(),
    ];

    var keyScaffold = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const Drawer(),
        key: keyScaffold,
        appBar: AppBar(
          leading: IconButton(
            splashRadius: 25,
            onPressed: () {
              keyScaffold.currentState!.openDrawer();
            },
            icon: const FaIcon(
              FontAwesomeIcons.stream,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'BLOC ',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                TextSpan(
                  text: 'NEWS',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: kRed,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              splashRadius: 25,
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.search,
              ),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: textTabBar,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: kRed,
            labelColor: kBlack,
            indicatorWeight: 4,
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: screens,
        ),
      ),
    );
  }
}
