import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:navigation/config/app_routes.dart';
import 'package:navigation/config/application.dart';
import 'package:search/ui/search_screen.dart';
import 'observers/app_bloc_observer.dart';
import 'package:search/bloc/search_bloc.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  runApp(LastFmApp());
}

class LastFmApp extends StatefulWidget {
  LastFmApp() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  _LastFmAppState createState() => _LastFmAppState();
}

class _LastFmAppState extends State<LastFmApp> {

  @override
  Widget build(BuildContext buildContext) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
      ),
    );
  }

}
