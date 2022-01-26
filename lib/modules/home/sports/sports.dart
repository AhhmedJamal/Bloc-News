import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/home_layout_cubit.dart';
import 'package:newsapp/shared/components/components.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = HomeLayoutCubit.get(context).sports;
        return builderItems(state, list, context);
      },
    );
  }
}
