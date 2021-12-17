import 'package:foodmix/services/auth_service.dart';
import 'package:foodmix/services/network_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerSingleton<NetworkService>(NetworkService());
  locator.registerSingleton<AuthService>(AuthService());
  AuthService viewModel = locator<AuthService>();
  await viewModel.checkUser();
}