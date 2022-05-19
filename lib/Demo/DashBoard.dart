import 'package:firebase/firebase.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_db_web_unofficial/DatabaseSnapshot.dart';
// import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/material.dart';

import '../FirebaseCustom.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// class DashBoard extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<DashBoard> {
//   String ValueOfA = "GetValue";
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("DashBoard"),
//         centerTitle: true,
//       ),
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: RaisedButton(
//                 child: Text(
//                   'SetValues',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 color: Colors.blue,
//                 onPressed: () {
//                   SetValue();
//                 },
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: RaisedButton(
//                 child: Text(
//                   'Update Value',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 color: Colors.blue,
//                 onPressed: () {
//                   UpdateValue();
//                 },
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: RaisedButton(
//                 child: Text(
//                   ValueOfA,
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 color: Colors.blue,
//                 onPressed: () {
//                   setState(() {
//                     RealtimeUpdate();
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void SetValue() {
//     FirebaseDatabase.instance.reference().child("test").child("a").set("Hey");

//     //To set a Single Value
//     FirebaseDatabase.instance.ref().child("test").child("b").set("Guys");

//     //To set Multiple Values
//     FirebaseDatabase.instance.ref().child("test").child("c").set({
//       "1": "This will be",
//       "2": "Your New",
//       "3": "Journey to Web Devlopment"
//     });
//   }

//   void UpdateValue() {
//     //to update any node
//     FirebaseDatabase.instance
//         .ref()
//         .child("test")
//         .child("b")
//         .update({"1": "Hello,", "2": "World!"});
//   }

//   // ignore: non_constant_identifier_names
//   //Future<String> GetValueA() async {
//     //this will return a Snapshot
//     final ref = FirebaseDatabase.instance.ref();
//     final snapshot = await ref.child("test").child("a").get();
//   }

//   Future<List> GetSnapshotList() async {
//     //to get List of all Snapshot
//     final ref = FirebaseDatabase.instance.ref();
//     DatabaseReference DataRef = fire.database.ref("test").child("c");
//     List Data = await getList(DataRef);
//     print(Data.toString());
//     return Data;
//   }

//   // void RealtimeUpdate() {
//   //   DatabaseReference DataRef = fire.database.ref("test").child("a");

//   //   DataRef.onValue.listen((event) {
//   //     String a = event.snapshot.val();
//   //     setState(() {
//   //       ValueOfA = "A = $a";
//   //     });
//   //   });
//   // }


