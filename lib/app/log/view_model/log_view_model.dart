import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/app/home/model/log_model.dart';
import 'package:task/base_view_model.dart';
import 'package:task/enums/screen_state.dart';
import 'package:task/locator.dart';
import 'package:task/services/api_service.dart';
import 'package:task/services/navigation_service.dart';

class LogViewModel extends BaseViewModel {
  var apiServices = locator<ApiService>();
  var navigation = locator<NavigationService>();

  List<LogModel> logList = [];
  DateFormat dateFormat = DateFormat('yyyy/mm/dd  hh:mm a');

  getUserLog() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('history')
        .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    List<QueryDocumentSnapshot> data = querySnapshot.docs;
    for (var i in data) {
      logList.add(LogModel.fromJson(i.data()));
    }
    setState(ViewState.Idle);
  }
}
