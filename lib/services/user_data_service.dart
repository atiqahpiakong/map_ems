import 'package:firebase_auth/firebase_auth.dart';

import './rest_service.dart';
import '../model/user_model.dart';

// LeaveDataService is a wrapper class implmenting calls for CRUD operations on Leave endpoints.
//  The class is implemented using the Singleton design pattern.

// TODO: Modify this class accordingly. You want to add all CRUD operations that your app uses.
// Example: get the list of leave, get a Leave for given id, update the like / dislike
//     You may want to refer the past project flutter_todo_rest, you can clone from github:
//         $ git clone https://github.com/jumail-utm/flutter_todo_rest.git

class UserDataService {
  //------- Here is how we implement 'Singleton pattern' in Dart --------

  static final UserDataService _instance = UserDataService._constructor();
  factory UserDataService() {
    return _instance;
  }

  UserDataService._constructor();
  final rest = RestService();
  //---------------------------- end of singleton implementation

  // Tho REST calls below, 1) to get all leave and 2). to delete a Leave
  //  are given for examples to guide you writing the other REST calls.

  Future<List<User>> getAllUser() async {
    final listJson = await rest.get('user');

    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
  }

    Future<List<User>> getMyProfile() async {
   String uid = (await FirebaseAuth.instance.currentUser()).uid;

    final listJson = await rest.get('user/$uid/myprofile');
    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
  }

  // You may not need this REST call in your app. It is only for example here.
  Future<User> deleteUser({String id}) async {
    final json = await rest.delete('user/$id');
    return User.fromJson(json);
  }

  // You may not need this REST call in your app. It is only for example here.
  Future<User> createUser({User user}) async {
    final json = await rest.post('user', data: user);
    return User.fromJson(json);
  }

  // TODO: You may need to provide the REST calls for the followings:
  //        Get a Leave for a given id
  //        Update a Leave for a given id
  //        Vote a Leave for like or dislike
  //        Like or dislike a Leave
  
  Future<User> updateUser({String id, String phone, String email, String address}) async {
    final json = await rest.patch('user/$id', data:{'phone': phone, 'email':email, 'address': address});
    return User.fromJson(json);
  }

  // Future<Leave> updateDislike({String id}) async {
  //    final json = await rest.patch('leave/$id/dislike', data:{});
  //   return Leave.fromJson(json);
  // }


} // class Leave
