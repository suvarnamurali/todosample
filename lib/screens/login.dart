import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/home.dart';
import 'package:untitled/screens/signup.dart';



class LoginPage extends StatelessWidget {
   LoginPage({super.key});

final TextEditingController _emailController = TextEditingController();
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
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('LOGIN'),
                SizedBox(height: 30,),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'This field is mandatory';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Email'
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'This field is mandatory';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Password'
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {
                      
                    }, child: Text('Forgot password')),
                  ],
                ),
                ElevatedButton(onPressed: () async {
                   try {
                    final _auth = FirebaseAuth.instance;
                    final userRef =await _auth.signInWithEmailAndPassword(
                      email: _emailController.text, password: _passwordController.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                  }catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Invalid Email or Password')));
                  }
                }, child: Text('LOGIN')),
                SizedBox(height: 20,),
                Text('Or'),
                SizedBox(height: 20,),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
                }, child: Text('Sign Up'))
              ],
            ),
          ),
        ),
      ),

    );
  }
}