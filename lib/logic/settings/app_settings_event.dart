part of 'app_settings_bloc.dart';

abstract class AppSettingsEvent extends Equatable {
   List<Object?> get props => [];
  const AppSettingsEvent();
}

class GetCurrentSettingsEvent extends AppSettingsEvent {}




class colorChanged extends AppSettingsEvent {
  final int color;

  colorChanged({required this.color});
  @override
  List<Object?> get props => [color];
}



