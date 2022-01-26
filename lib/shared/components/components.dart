import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/layout/cubit/home_layout_cubit.dart';
import 'package:newsapp/shared/style/colors.dart';
import 'package:newsapp/shared/style/style_widget.dart';

//text app bar
Widget textTitleApp({
  required String text,
  Color? color,
  BuildContext? context,
}) =>
    Text(
      text,
      style: Theme.of(context!).textTheme.headline5,
    );

// data home
Widget getDatApi(articles, BuildContext context) => Container(
      padding: padding16,
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(borderRadius: circular16),
            child: FadeInImage.assetNetwork(
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              placeholderFit: BoxFit.cover,
              placeholder: 'assets/images/placeholder.gif',
              image: articles['urlToImage'] ??
                  'https://as2.ftcdn.net/v2/jpg/01/37/57/81/1000_F_137578103_ulK9MbD9IfKACx9RZe6Rx7PAyBA9aN2K.jpg',
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  articles['title'] ?? 'null',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Text(
                  articles['description'] ?? 'null',
                  style: Theme.of(context).textTheme.caption,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Row(
                  children: [
                    Text(
                      articles['name'] ?? 'Name Page',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Spacer(),
                    IconButton(
                      splashRadius: 25,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
//build Items
Widget builderItems(state, list, context) => ConditionalBuilder(
      condition: state is! HomeLayoutSportsLoading,
      builder: (_) => ListView.separated(
        itemCount: list.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => getDatApi(list[index], context),
        separatorBuilder: (_, index) => const Divider(
          thickness: 2,
          indent: 16,
        ),
      ),
      fallback: (_) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (_, i) => Container(
          padding: padding16,
          width: double.infinity,
          child: columShimmer(),
        ),
        separatorBuilder: (_, i) => const Divider(
          thickness: 2,
          indent: 16,
        ),
      ),
    );

//shimmer container
Widget shimmerContainer({
  required double width,
  required double height,
}) =>
    Container(
      width: width,
      height: height,
      color: kGrey.withOpacity(0.2),
    );

// column shimmer
Widget columShimmer() => Row(
      children: [
        shimmerContainer(
          width: 120,
          height: 120,
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            shimmerContainer(
              width: 160,
              height: 15,
            ),
            const SizedBox(height: 20),
            shimmerContainer(
              width: 140,
              height: 13,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 220,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  shimmerContainer(width: 60, height: 12),
                  Icon(
                    Icons.more_horiz_outlined,
                    color: kGrey.withOpacity(0.3),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
