import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/repositories/challenges/challenges_repository.dart';
import 'package:bloc_app/data/repositories/concepts/concepts_repository.dart';
import 'package:bloc_app/data/services/interceptors/json_interceptor.dart';
import 'package:bloc_app/data/services/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  _registerDependencies();

  runApp(await builder());
}

void _registerDependencies() {
  final dio = Dio()..interceptors.add(JsonInterceptor());
  final restClient = RestClient(dio);
  GetIt.I.registerSingleton<ConceptsRepository>(
    ConceptsRepository(restClient: restClient),
  );
  GetIt.I.registerSingleton<ChallengesRepository>(
    ChallengesRepository(restClient: restClient),
  );
  GetIt.I.registerSingleton<BaseCacheManager>(
    DefaultCacheManager(),
  );
}
