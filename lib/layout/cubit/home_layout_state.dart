part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {}

class HomeLayoutInitial extends HomeLayoutState {}

// home layout
class HomeLayoutBottomBar extends HomeLayoutState {}

// settings
class HomeLayoutSettingsLanguage extends HomeLayoutState {}

class HomeLayoutSettingsNews extends HomeLayoutState {}

class HomeLayoutSettingsChangeMode extends HomeLayoutState {}

// get business
class HomeLayoutBusinessSuccess extends HomeLayoutState {}

class HomeLayoutBusinessLoading extends HomeLayoutState {}

class HomeLayoutBusinessError extends HomeLayoutState {
  final String error;
  HomeLayoutBusinessError(this.error);
}

// get health
class HomeLayoutHealthSuccess extends HomeLayoutState {}

class HomeLayoutHealthLoading extends HomeLayoutState {}

class HomeLayoutHealthError extends HomeLayoutState {
  final String error;
  HomeLayoutHealthError(this.error);
}

// get seiences
class HomeLayoutSeiencesSuccess extends HomeLayoutState {}

class HomeLayoutSeiencesLoading extends HomeLayoutState {}

class HomeLayoutSeiencesError extends HomeLayoutState {
  final String error;
  HomeLayoutSeiencesError(this.error);
}
// get sports
class HomeLayoutSportsSuccess extends HomeLayoutState {}

class HomeLayoutSportsLoading extends HomeLayoutState {}

class HomeLayoutSportsError extends HomeLayoutState {
  final String error;
  HomeLayoutSportsError(this.error);
}
