/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> forKey = GlobalKey<FormState>();

  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();

  bool emailEnable = false;
  bool passEnable = false;
  bool ishowPass = true;
  final emailfocus = FocusNode();
  final passwordfocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        // appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 80),
          child: Form(
            key: forKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
    Widgets.CustomText(data: 'Inloggen',color: Colors.black, fontSize: 25),
    //Text('Inloggen',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
    SizedBox(height: 3,),
    Widgets.CustomText(data: 'Log in met uw inloggegevens',fontSize: 13,fontWeight: FontWeight.w300,color: Colors.black,),
    //  Text('Log in met uw inloggegevens',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300),),
    SizedBox(height: 30,),
    Widgets.CustomText(data: 'Gebruikersnaam',fontSize: 13,color: emailEnable == true ?Colors.amber :Colors.black),
    //Text('Gebruikersnaam',style: TextStyle(fontSize: 13,color: emailEnable == true ?Colors.amber :Colors.black),),
    SizedBox(height: 3,),

                Container(
                  decoration: emailEnable == true ? BoxDecoration() :
                  BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),blurRadius:4
                        )
                      ]
                  ) ,
                  child: TextFormField(
                    validator: (value) {
                      const email =  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      final regExp = RegExp(email);
                      if(value!.isEmpty || value == null){
                        return 'Please enter email';
                      }else if(!regExp.hasMatch(value)){
                        return 'please enter valid mail';
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    focusNode: emailfocus,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailCon,
                    onTap: () {
                      setState(() {
                        emailEnable = true;
                        passEnable = false;
                      });

                    },
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      filled: true,
                      fillColor: Colors.white,
                      border:
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                    ),),
                ),
                SizedBox(height: 18,),

                Widgets.CustomText(data: 'Wachtwoord',fontSize: 13,color: passEnable == true ?Colors.amber :Colors.black),
                SizedBox(height: 3,),
                Container(
                  decoration: passEnable == true ? BoxDecoration() : BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),blurRadius:4
                        )
                      ]) ,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordCon,
                    focusNode: passwordfocus,
                    validator: (value) {
                      RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if(value!.isEmpty || value == null){
                        return 'Please enter password';
                      } else if (value.length < 8) {
                        return "Password must be atleast 8 characters long";
                      }
                      else if(!regex.hasMatch(value)){
                        return 'please enter valid password';
                      }
                      return null;
                    },
                    onTap: () {
                      setState(() {
                        emailEnable = false;
                        passEnable = true;
                      });
                    },
                    obscureText: ishowPass,
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(ishowPass ? CupertinoIcons.eye_slash : Icons.remove_red_eye_outlined ),
                        onPressed: () {
                          setState(() {
                            ishowPass = !ishowPass;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border:
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color:Colors.amber),
                      ),
                    ),),
                ),
                const SizedBox(height: 40,),
                ElevatedButton(
                    style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.amber),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 22))
                    ),
                    onPressed: () async {
                      if (forKey.currentState!.validate()) {
                      //  bloc.add(SubmitEvent(email: emailCon.text, password: passwordCon.text));
                      }
                      //   forKey.currentState?.validate();
                      // //  if (forKey.currentState?.validate()){
                      //     bloc.add(SubmitEvent(email: emailCon.text, password: passwordCon.text));
                      //  }
                      // Repository().sendData(emailCon.text, passwordCon.text);
                    }, child: const Text('Inloggen',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),))

              ],
            ),
          ),
        )
      //Text('Inloggen',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),

    );
  }
}*/
