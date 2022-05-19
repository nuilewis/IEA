import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firebase.dart';


//Replace These Values With Yours
class FirebaseHelper  {
  static fb.Database initDatabase() {
    try {
      if (fb.apps.isEmpty) {
        fb.initializeApp(
            apiKey: "AIzaSyCnshMj47HBy0u7_LuS56pl9HbyyV8u6m8",
            authDomain: "water-monitory-jjtronic.firebaseapp.com",
            databaseURL: "https://water-monitory-jjtronic-default-rtdb.firebaseio.com",
            projectId: "water-monitory-jjtronic",
            storageBucket: "water-monitory-jjtronic.appspot.com",
            messagingSenderId: "312993905854",
            appId: "1:312993905854:web:46ec979e5a8d4cbf56f2ef"
        );
      }
    } on fb.FirebaseJsNotLoadedException catch (e) {
      print(e);
    }
    return fb.database();
  }
}

class fire{
  static fb.Database database = FirebaseHelper.initDatabase();
}

Future<List> getList(fb.DatabaseReference AdsRef) async {
  List list = [""];
  await AdsRef.once('value').then((value) => {
    list = result(value.snapshot, list)
  });
  return list;
}

List result(DataSnapshot dp,List list){
  list.clear();
  dp.forEach((v) {
    list.add(v);
  });
  return list;
}
