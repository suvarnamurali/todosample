// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:motion_toast/motion_toast.dart';
// import 'package:uuid/uuid.dart';

// class ModalTextField extends StatelessWidget {
//   ModalTextField(
//       {super.key,
//       required this.buttonType,
//       required this.buttonName,
//       this.name,
//       this.description,
//       this.todoid,});
//   late TextEditingController todoNameController =
//       TextEditingController(text: name);
//   late TextEditingController todoDescriptionController =
//       TextEditingController(text: description);

//   bool buttonType;
//   String buttonName;
//   String? name, description;
//   String? todoid;
//   final todoRef = FirebaseFirestore.instance.collection('todo_data');

//   // final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Padding(
//         padding: MediaQuery.of(context).viewInsets,
//         child: Container(
//           height: MediaQuery.of(context).size.height / 3,
//           margin: const EdgeInsets.all(20),
//           color: Colors.white,
//           child: Column(
//             children: [
//               Text(
//                 (buttonType) ? 'Add todo' : 'Edit todo',
//                 style: const TextStyle(fontSize: 22, color: Colors.black),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(10),
//               ),
//               TextField(
//                 controller: todoNameController,
//                 decoration: const InputDecoration(
//                   filled: true,
//                   fillColor: Color.fromARGB(255, 217, 212, 212),
//                   enabledBorder: InputBorder.none,
//                   border: InputBorder.none,
//                   hintText: 'Enter todo here',
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(10),
//               ),
//               TextField(
//                 controller: todoDescriptionController,
//                 decoration: const InputDecoration(
//                   filled: true,
//                   fillColor: Color.fromARGB(255, 217, 212, 212),
//                   enabledBorder: InputBorder.none,
//                   border: InputBorder.none,
//                   hintText: 'Enter todo description.....',
//                 ),
//               ),
//               const Padding(padding: EdgeInsets.all(15)),
//               MaterialButton(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 textColor: Colors.white,
//                 color: Colors.blue,
//                 child: Text(buttonType ? 'Add' : 'Edit'),
//                 onPressed: () {
//                   if (buttonType) {
//                     createTodo(
//                       todoName: todoNameController.text,
//                       description: todoDescriptionController.text,
//                     );
//                     Navigator.pop(context);
//                     MotionToast(
//                       icon: Icons.done,
//                       primaryColor: Colors.green,
//                       description: const Text(' successfully saved'),
//                     ).show(context);
//                   } else {
//                     updateTodo(
//                       todoName: todoNameController.text,
//                       description: todoDescriptionController.text,
//                     );
//                     Navigator.pop(context);
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> createTodo({
//     required String todoName,
//     required String description,
//   }) async {
//     final auth = FirebaseAuth.instance;
//     final userid = auth.currentUser!.uid;
//     const uuid = Uuid();
//     final todoId = uuid.v4();

//     final datetime = DateTime.now();
//     final time = '${datetime.hour}:${datetime.minute}pm';
//     try {
//       await todoRef.doc(todoId).set({
//         'todoName': todoName,
//         'description': description,
//         'userid': userid,
//         'todoid': todoId,
//         'date': time,
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> updateTodo({
//     required String todoName,
//     required String description,
//   }) async {
//     try {
//       await todoRef.doc(todoid).update({
//         'todoName': todoName,
//         'description': description,
//       });
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
