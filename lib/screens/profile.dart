// import 'package:flutter/material.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("profile"),
//       ),

//     );
//   }
// }


// // import 'dart:io';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:untitled/screens/login.dart';


// // class ProfileScreen extends StatelessWidget {
// //   ProfileScreen({super.key});
// //   final users = FirebaseFirestore.instance.collection('users');
// //   final auth = FirebaseAuth.instance;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color.fromARGB(255, 67, 62, 62),
// //       body: SafeArea(
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(vertical: 20),
// //           child: SingleChildScrollView(
// //             child: StreamBuilder(
// //               stream: FirebaseFirestore.instance
// //                   .collection('users')
// //                   .doc(auth.currentUser!.uid)
// //                   .snapshots(),
// //               builder: (context, snapshot) {
// //                 if (snapshot.hasData) {
// //                   final userData = snapshot.data!;
// //                   // print(userData['email'].toString());
// //                   // print(userData);
// //                   return Column(
// //                     children: [
// //                       ListTile(
// //                         leading: IconButton(
// //                             onPressed: () => Navigator.pop(context),
// //                             icon: const Icon(
// //                               Icons.arrow_back,
// //                               color: Colors.white,
// //                             )),
// //                         trailing: const Icon(
// //                           Icons.settings,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                       CircleAvatar(
// //                         backgroundColor: Colors.white,
// //                         radius: 50,
// //                         child: (userData['profileImage'] == '')
// //                             ? Text(
// //                                 userData['userName'][0]
// //                                     .toString()
// //                                     .toUpperCase(),
// //                                 style: const TextStyle(
// //                                     fontSize: 50, fontWeight: FontWeight.bold),
// //                               )
// //                             : ClipOval(
// //                               child: Image.network(
// //                                   userData['profileImage'].toString(),
// //                                   fit: BoxFit.cover,
// //                                   width: 100,height: 100,
// //                                 ),
// //                             ),

// //                         // ignore: prefer_const_literals_to_create_immutables
// //                         // child: Stack(
// //                         //   children: [
// //                         //   const Align(
// //                         //       alignment: Alignment.bottomRight,
// //                         //       child: Icon(Icons.edit, color: Colors.white))
// //                         // ]),
// //                       ),
// //                       TextButton(
// //                           onPressed: getImage,
// //                           child: const Text('Upload Photo')),
// //                       Text(
// //                         // 'saabu',
// //                         userData['userName'].toString(),
// //                         style: const TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 15,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       const SizedBox(
// //                         height: 10,
// //                       ),
// //                       Text(
// //                         // 'iui',
// //                         userData['email'].toString(),
// //                         style: const TextStyle(color: Colors.white38),
// //                       ),
// //                       const SizedBox(
// //                         height: 10,
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(
// //                             left: 60, right: 60, bottom: 60),
// //                         child: ElevatedButton(
// //                           onPressed: () {},
// //                           style: ElevatedButton.styleFrom(
// //                             primary: const Color(0xfff4c209),
// //                             shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(18)),
// //                           ),
// //                           child: const Text(
// //                             "Upgrade to PRO",
// //                             style: TextStyle(
// //                               fontSize: 15,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.black45,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       const Divider(
// //                         color: Colors.white,
// //                       ),
// //                       Column(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(15),

// //                             //1
// //                             child: Card(
// //                               shadowColor: Colors.green,
// //                               elevation: 10,
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(30)),
// //                               color: const Color(0xff363636),
// //                               child: Column(
// //                                 children: [
// //                                   ListTile(
// //                                     leading: const Icon(
// //                                       Icons.privacy_tip_outlined,
// //                                       color: Colors.white,
// //                                     ),
// //                                     textColor: Colors.white,
// //                                     title: const Text("privacy"),
// //                                     trailing: IconButton(
// //                                         onPressed: () {},
// //                                         icon: const Icon(
// //                                           Icons.navigate_next,
// //                                           color: Colors.white,
// //                                         )),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                           // Padding(
// //                           //   padding: const EdgeInsets.all(15),
// //                           //   //2
// //                           //   child: Card(
// //                           //     shadowColor: Colors.green,
// //                           //     elevation: 10,
// //                           //     shape: RoundedRectangleBorder(
// //                           //         borderRadius: BorderRadius.circular(30)),
// //                           //     color: const Color(0xff363636),
// //                           //     child: Column(
// //                           //       children: [
// //                           //         ListTile(
// //                           //           leading: const Icon(
// //                           //             Icons.history_rounded,
// //                           //             color: Colors.white,
// //                           //           ),
// //                           //           textColor: Colors.white,
// //                           //           title: const Text("purchase history"),
// //                           //           trailing: IconButton(
// //                           //               onPressed: () {},
// //                           //               icon: const Icon(
// //                           //                 Icons.navigate_next,
// //                           //                 color: Colors.white,
// //                           //               )),
// //                           //         ),
// //                           //       ],
// //                           //     ),
// //                           //   ),
// //                           // ),
// //                           Padding(
// //                             padding: const EdgeInsets.all(15),
// //                             //3
// //                             child: Card(
// //                               shadowColor: Colors.green,
// //                               elevation: 10,
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(30)),
// //                               color: const Color(0xff363636),
// //                               child: Column(
// //                                 children: [
// //                                   ListTile(
// //                                     leading: const Icon(
// //                                       Icons.help_outline,
// //                                       color: Colors.white,
// //                                     ),
// //                                     textColor: Colors.white,
// //                                     title: const Text("Help & Support"),
// //                                     trailing: IconButton(
// //                                         onPressed: () {},
// //                                         icon: const Icon(
// //                                           Icons.navigate_next,
// //                                           color: Colors.white,
// //                                         )),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                           Padding(
// //                             padding: const EdgeInsets.all(15),
// //                             //4
// //                             child: Card(
// //                               shadowColor: Colors.green,
// //                               elevation: 10,
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(30)),
// //                               color: const Color(0xff363636),
// //                               child: Column(
// //                                 children: [
// //                                   ListTile(
// //                                     leading: const Icon(
// //                                       Icons.settings,
// //                                       color: Colors.white,
// //                                     ),
// //                                     textColor: Colors.white,
// //                                     title: const Text("Setting"),
// //                                     trailing: IconButton(
// //                                         onPressed: () {},
// //                                         icon: const Icon(
// //                                           Icons.navigate_next,
// //                                           color: Colors.white,
// //                                         )),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                           Padding(
// //                             padding: const EdgeInsets.all(15),
// //                             //5
// //                             child: Card(
// //                               shadowColor: Colors.green,
// //                               elevation: 10,
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(30)),
// //                               color: const Color(0xff363636),
// //                               child: Column(
// //                                 children: [
// //                                   ListTile(
// //                                     leading: const Icon(
// //                                       Icons.person_add_alt_1,
// //                                       color: Colors.white,
// //                                     ),
// //                                     textColor: Colors.white,
// //                                     title: const Text("Invite a friend"),
// //                                     trailing: IconButton(
// //                                         onPressed: () {},
// //                                         icon: const Icon(
// //                                           Icons.navigate_next,
// //                                           color: Colors.white,
// //                                         )),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                           Padding(
// //                             padding: const EdgeInsets.all(15),
// //                             //6
// //                             child: Card(
// //                               shadowColor: Colors.green,
// //                               elevation: 10,
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(30)),
// //                               color: const Color(0xff363636),
// //                               child: Column(
// //                                 children: [
// //                                   ListTile(
// //                                     leading: const Icon(
// //                                       Icons.logout_rounded,
// //                                       color: Colors.white,
// //                                     ),
// //                                     textColor: Colors.white,
// //                                     title: const Text("Logout"),
// //                                     trailing: IconButton(
// //                                         onPressed: () {
// //                                           Navigator.push(
// //                                               context,
// //                                               MaterialPageRoute(
// //                                                   builder: (context) =>
// //                                                        LoginPage()));
// //                                         },
// //                                         icon: const Icon(
// //                                           Icons.navigate_next,
// //                                           color: Colors.white,
// //                                         )),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   );
// //                 } else {
// //                   return const Center(child: CircularProgressIndicator());
// //                 }
// //               },
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> getImage() async {
// //     final _imagePicker = ImagePicker();
// //     try {
// //       final image = await _imagePicker.pickImage(source: ImageSource.gallery);
// //       await updateProfile(image!);
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   Future<void> updateProfile(XFile image) async {
// //     final reference = FirebaseStorage.instance
// //         .ref()
// //         .child('profile_images')
// //         .child(image.name);
// //     final file = File(image.path);
// //     await reference.putFile(file);
// //     final imageLink = await reference.getDownloadURL();
// //     await users.doc(auth.currentUser!.uid).update({
// //       'profileImage': imageLink
// //     });
    
// //      print(imageLink);

// //   }
// // }


