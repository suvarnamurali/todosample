import 'package:flutter/material.dart';
import 'package:untitled/repository/signup_repo.dart';
import 'package:untitled/screens/login.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(

          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('SIGN UP'),
                const SizedBox(height: 30,),

                // const TextField(
                //     decoration: InputDecoration(
                //       hintText: 'Name'
                //     ),
                //   ),

                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is mandatory';
                    }
                  },
                  decoration: InputDecoration(hintText: 'Name'),
                ),


                  
                  // const TextField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Email'
                  //   ),
                  // ),


                  TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is mandatory';
                    }
                  },
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                  
                  
                  // const TextField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Phone Number'
                  //   ),
                  // ),

                  TextFormField(
                  controller: _phonenumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is mandatory';
                    }
                  },
                  decoration: InputDecoration(hintText: 'Phone Number'),
                ),




                  // const TextField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Password'
                  //   ),
                  // ),
                  TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is mandatory';
                    }
                  },
                  decoration: InputDecoration(hintText: 'Password'),
                ),

                  ElevatedButton(
                    onPressed: () async {
                      print(_nameController.text);
                      print(_emailController.text);
                      print(_phonenumberController.text);
                      print(_passwordController.text);

                      if (_formKey.currentState!.validate()) {
                        await SignupRepo().createUser(
                            _nameController.text,
                            _emailController.text,
                            _phonenumberController.text,
                            _passwordController.text,
                            context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      }
                    },
                    child: Text('REGISTER')),

                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}