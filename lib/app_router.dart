
import 'package:ayah/data/quote_repo.dart';
import 'package:ayah/data/qute_web_service.dart';
import 'package:ayah/logic/quote/quote_cubit.dart';
import 'package:ayah/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late HomeRepository homeRepository;
  
  late QuoteCubit quoteCubit;


  AppRouter() {
    homeRepository = HomeRepository( QuoteWebService());
    quoteCubit = QuoteCubit(homeRepository);
  }

  Route? generateRoute(RouteSettings settings) {
   

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (BuildContext context) => quoteCubit,
                    ),
                   
                  ],
                  child: MyCustomWidget(),
                ));

    }
  }
}
