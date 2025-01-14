import 'package:ecommerce/core/di/service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final serviceLocator = GetIt.instance;
@injectableInit
Future<void> configrationDependencies() => serviceLocator.init();
