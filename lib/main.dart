import 'package:ayah/app_router.dart';
import 'package:ayah/logic/settings/app_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppSettingsBloc()..add(GetCurrentSettingsEvent()),
        child: BlocBuilder<AppSettingsBloc, SettingsStateInitial>(
            builder: (ctx, state) {
          return MaterialApp(
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Color(state.color),
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
            title: 'ayah',
          );
        }));
  }
}
