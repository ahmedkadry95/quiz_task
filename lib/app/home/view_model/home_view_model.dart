import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/base_view_model.dart';
import 'package:task/locator.dart';
import 'package:task/routs/routs_names.dart';
import 'package:task/services/navigation_service.dart';

class HomeViewModel extends BaseViewModel {
  var navigation = locator<NavigationService>();

  signOut() async {
    await FirebaseAuth.instance.signOut();
    navigation.navigateToAndClearStack(RouteName.splash);
  }
}
