import 'package:get_it/get_it.dart';

class ServiceLocator {
  ServiceLocator._internal();
  final _getIt = GetIt.instance;
  static final instance = ServiceLocator._internal();

  T call<T extends Object>() => _getIt<T>();

  void registerLazySingleton<T extends Object>(T Function() factoryFunc) =>
      _getIt.registerLazySingleton<T>(factoryFunc);
}
