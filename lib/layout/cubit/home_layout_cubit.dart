import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/shared/local/storage.dart';
import 'package:newsapp/shared/network/dio.dart';
part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  // bottom nav bar app
  int currntIndex = 0;
  void indexBottom(index) {
    currntIndex = index;
    emit(HomeLayoutBottomBar());
  }

  // get business
  List<dynamic> business = [];
  void getBusiness() {
    emit(HomeLayoutBusinessLoading());
    NewsApiServices.getData(path: 'v2/top-headlines', query: {
      'country': dropValueNews,
      'category': 'business',
      'apiKey': 'cd41a6a027a2461db8479c2f140bba20',
    }).then((value) {
      business = value.data['articles'];

      emit(HomeLayoutBusinessSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(HomeLayoutBusinessError(error));
    });
  }

  // get business
  List<dynamic> health = [];
  void getHealth() {
    emit(HomeLayoutHealthLoading());
    NewsApiServices.getData(path: 'v2/top-headlines', query: {
      'country': dropValueNews,
      'category': 'health',
      'apiKey': 'cd41a6a027a2461db8479c2f140bba20',
    }).then((value) {
      health = value.data['articles'];

      emit(HomeLayoutHealthSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(HomeLayoutHealthError(error));
    });
  }

  // get business
  List<dynamic> seiences = [];
  void getSeiences() {
    emit(HomeLayoutSeiencesLoading());
    NewsApiServices.getData(path: 'v2/top-headlines', query: {
      'country': dropValueNews,
      'category': 'science',
      'apiKey': 'cd41a6a027a2461db8479c2f140bba20',
    }).then((value) {
      seiences = value.data['articles'];

      emit(HomeLayoutSeiencesSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(HomeLayoutSeiencesError(error));
    });
  }

// get sports
  List<dynamic> sports = [];
  void getSports() {
    emit(HomeLayoutSportsLoading());
    NewsApiServices.getData(path: 'v2/top-headlines', query: {
      'country': dropValueNews,
      'category': 'sports',
      'apiKey': 'cd41a6a027a2461db8479c2f140bba20',
    }).then((value) {
      sports = value.data['articles'];
      emit(HomeLayoutSportsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(HomeLayoutSportsError(error));
    });
  }

  /// screen setting app
  // value language
  var itemsLanguage = [
    'Arabic',
    'Russin',
    'English',
  ];

  String? dropValueLanguage = SharedPref.getString(key: 'Language');
  void funValueLanguage(String newValue) {
    dropValueLanguage = newValue;
    SharedPref.setString(
      key: 'Language',
      value: dropValueLanguage!,
    );
    emit(HomeLayoutSettingsLanguage());
  }

  // value news
  String? dropValueNews = SharedPref.getString(key: 'country');
  void funValueNews(String newValue) {
    dropValueNews = newValue;
    print(dropValueNews);
    SharedPref.setString(
      key: 'country',
      value: dropValueNews!,
    ).then((value) {
      emit(HomeLayoutSettingsNews());
    });
  }

  // change Mode
  bool isChecked = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isChecked = fromShared;
    } else {
      isChecked = !isChecked;
    }
    SharedPref.setBool(
      key: 'Dark',
      value: isChecked,
    ).then((value) {
      emit(HomeLayoutSettingsChangeMode());
    });
  }
}
