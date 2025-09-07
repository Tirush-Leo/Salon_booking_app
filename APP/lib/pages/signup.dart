import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_string/random_string.dart';
import 'package:salonapp01/pages/home.dart';
import 'package:salonapp01/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:salonapp01/services/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/shared_pref.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
String? name, mail, password;



  TextEditingController namecontroller =  new TextEditingController();
  TextEditingController emailcontroller =  new TextEditingController();
  TextEditingController passwordcontroller =  new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration()async{
    if(password!=null && name!=null && mail!=null){
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail!, password: password!);
        String id = randomAlphaNumeric(10);
        await SharePreferenceHelper().saveUserName(namecontroller.text);
        await SharePreferenceHelper().saveUserEmail(emailcontroller.text);
        await SharePreferenceHelper().saveUserImage('https://drive.google.com/file/d/1pzkThsH9JnsEYsJ-Fv3XobHzrIxi5JRj/view?usp=sharing');
        await SharePreferenceHelper().saveUserId(id);
        Map<String, dynamic> userInfoMap = {
          "Name": namecontroller.text,
          "Email": emailcontroller.text,
          "Id": id,
          "Image": "https://drive.google.com/file/d/1pzkThsH9JnsEYsJ-Fv3XobHzrIxi5JRj/view?usp=sharing"
        };
        await DatabaseMethods().addUserDetails(userInfoMap, id);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered Successfully", style: TextStyle(fontSize: 20.0),)));
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
      } on FirebaseAuthException catch(e){
        if(e.code=="weak-password"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password provided is too weak ", style: TextStyle(fontSize: 20.0),)));
        }else if(e.code=="email-already-in-use"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account already exists ", style: TextStyle(fontSize: 20.0),)));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Stack(children: [
        Container(
          padding: EdgeInsets.only(top: 60.0, left: 30.0),
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFB91635), Color(0xFF621d3c), Color(0xFF311937)])),
          child: Text("Create Your\nAccount", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
        ),
        Container(
          padding: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0, bottom: 30.0),
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Form(
            child: Column(
              key: _formkey,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: TextStyle(color: Color(0xFFB91635), fontSize: 25.0, fontWeight: FontWeight.w500),),
                TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return "Please Enter Name";
                    }
                    return null;
                  },
                  controller: namecontroller,
                  decoration: InputDecoration(hintText: "Name", prefixIcon: Icon(Icons.person_outline)),
                ),
                SizedBox(height: 40.0,),
                Text("Gmail", style: TextStyle(color: Color(0xFFB91635), fontSize: 25.0, fontWeight: FontWeight.w500),),
                TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return "Please Enter Gmail";
                    }
                    return null;
                  },
                  controller: emailcontroller,
                  decoration: InputDecoration(hintText: "Gmail", prefixIcon: Icon(Icons.mail_outline)),
                ),
                SizedBox(height: 40.0,),
                Text("Password", style: TextStyle(color: Color(0xFFB91635), fontSize: 25.0, fontWeight: FontWeight.w500),),
                TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return "Please Enter Password";
                    }
                    return null;
                  },
                  controller: passwordcontroller,
                  decoration: InputDecoration(hintText: "Password", prefixIcon: Icon(Icons.password_outlined)),obscureText: true,
                ),
                SizedBox(height: 60.0,),
                GestureDetector(
                  onTap: (){
                    // if (_formkey.currentState!.validate()) {
                    //   setState(() {
                    //     mail = emailcontroller.text;
                    //     name = namecontroller.text;
                    //     password = passwordcontroller.text;
                    //   });
                    //
                    // }
                    mail = emailcontroller.text;
                    name = namecontroller.text;
                    password = passwordcontroller.text;

                    registration();
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> Home() ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFB91635), Color(0xFF621d3c), Color(0xFF311937)]), borderRadius: BorderRadius.circular(30)),
                    child: Center(child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.bold),)),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Already have an account?", style: TextStyle(color: Color(0xFF311937), fontSize: 18.0, fontWeight: FontWeight.w500),),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login() ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Sign in", style: TextStyle(color: Color(0xFF621d3c), fontSize: 25.0, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],),
          ),
        ),

      ],),),
    );
  }
}
