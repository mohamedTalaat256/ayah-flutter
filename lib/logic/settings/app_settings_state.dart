part of 'app_settings_bloc.dart';


@immutable
abstract class ThemeState {}


class SettingsStateInitial extends Equatable {
  
  final int color;
  const SettingsStateInitial({required this.color,});
 
  @override
  List<Object?> get props => [color];
}


class ThemeChangeState extends ThemeState{}
