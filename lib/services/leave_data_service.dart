import 'package:firebase_auth/firebase_auth.dart';

import './rest_service.dart';
import '../model/leave_model.dart';

class LeaveDataService {

  static final LeaveDataService _instance = LeaveDataService._constructor();
  factory LeaveDataService() {
    return _instance;
  }

  LeaveDataService._constructor();
  final rest = RestService();


  Future<List<Leave>> getAllLeave() async {
    final listJson = await rest.get('leave');

    return (listJson as List)
        .map((itemJson) => Leave.fromJson(itemJson))
        .toList();
  }

  Future<List<Leave>> getMyLeave() async {
    String uid = (await FirebaseAuth.instance.currentUser()).uid;

    final listJson = await rest.get('leave/$uid/myleave');
    return (listJson as List)
        .map((itemJson) => Leave.fromJson(itemJson))
        .toList();
  }

  
  Future deleteLeave({String id}) async {
    await rest.delete('leave/$id');
  }

  
  Future<Leave> createLeave({Leave leave}) async {
    final json = await rest.post('leave', data: leave);
    return Leave.fromJson(json);
  }

  Future<Leave> updateLeave({String id, String status}) async {
    final json = await rest.patch('leave/$id', data: {'status': status});
    return Leave.fromJson(json);
  }


} // class Leave
