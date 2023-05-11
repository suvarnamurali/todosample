// import 'package:flutter/material.dart';
// import 'package:untitled/screens/todo_list.dart';

// import 'dialog_box.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final _controller= TextEditingController();
//   List toDoList = [["Go Shopping",false],["Learn Coding",false]];

//   void SaveNewTask(){
//     setState(() {
//       toDoList.add([_controller.text,false]);
//       _controller.clear();
//     });
//     Navigator.of(context).pop();
//   }
//   void edittheTask(int index){
//   setState(() {
//    toDoList[index][0]= _controller.text; 
//    _controller.clear();

//   });
     
   
//    Navigator.of(context).pop();
//   }

//   void editTask(int index){
//    showDialog(context: context, builder: (context){
//         return DialogBox(
//           controller: _controller,
//           onSave: ()=>edittheTask(index),
//           onCancel: ()=>Navigator.of(context).pop(),
//         );
//       }); 

//   }

  

//   void createNewTask(){
//       showDialog(context: context, builder: (context){
//         return DialogBox(
//           controller: _controller,
//           onSave: SaveNewTask,
//           onCancel: ()=>Navigator.of(context).pop(),
//         );
//       });
//   }


//   void deleteTask(int index){
     
//     setState(() {
//        toDoList.removeAt(index);
//     });

//   }


//   void checkBoxChanged(bool? value,int index){
//   setState(() {
//     toDoList[index][1]=!toDoList[index][1];
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title:const Center(child: Text("To do"),
//     ),),
//     floatingActionButton: FloatingActionButton(
//     onPressed: createNewTask,
//     child:const Icon(Icons.add)
//     ),
//     body:Container(
//     child:ListView.builder(
//       itemCount: toDoList.length,
//       itemBuilder: ((context, index) {
//         return ToDoList(taskName: toDoList[index][0], taskCompleted: toDoList[index][1], onChanged: (value)=>checkBoxChanged(value,index),deleteFunction: (context)=>deleteTask(index),editFunction: (context)=>editTask(index));
//       }),

//     )
//     ),);

//   }

// }


