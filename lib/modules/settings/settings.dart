import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/home_layout_cubit.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/style/colors.dart';
import 'package:newsapp/shared/style/style_widget.dart';
import 'package:switcher_button/switcher_button.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cuibt = HomeLayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 1,
            title: textTitleApp(
              text: 'Settings',
              context: context,
            ),
          ),
          body: Container(
            padding: padding24 * 1.5,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 100,
                  color: cuibt.isChecked ? kWhite : kBlack,
                  image: const AssetImage('assets/images/settings.png'),
                ),
                const SizedBox(height: 100),
                Row(
                  children: [
                    const Text(
                      'Language',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    DropdownButton(
                      items: cuibt.itemsLanguage.map((String? itemsName) {
                        return DropdownMenuItem(
                          child: Text(
                            itemsName!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          value: itemsName,
                        );
                      }).toList(),
                      onChanged: (String? newValue) =>
                          cuibt.funValueLanguage(newValue!),
                      value: cuibt.dropValueLanguage,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text(
                      'Country News',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Row(
                            children: [
                              Flag.fromCode(
                                FlagsCode.EG,
                                width: 30,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Egypt',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          value: 'eg',
                        ),
                        DropdownMenuItem(
                          child: Row(
                            children: [
                              Flag.fromCode(
                                FlagsCode.RU,
                                width: 30,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Russin',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          value: 'rs',
                        ),
                        DropdownMenuItem(
                          child: Row(
                            children: [
                              Flag.fromCode(
                                FlagsCode.US,
                                width: 30,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'America',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          value: 'us',
                        ),
                      ],
                      onChanged: (String? newValue) =>
                          cuibt.funValueNews(newValue!),
                      value: cuibt.dropValueNews,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Icon(
                      cuibt.isChecked ? Icons.dark_mode : Icons.light_mode,
                      size: 40,
                    ),
                    const Spacer(),
                    SwitcherButton(
                      size: 70,
                      value: cuibt.isChecked,
                      onChange: (v) {
                        cuibt.changeAppMode();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
