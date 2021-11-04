
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:todo/Other%20small%20apps/test.dart';
import 'package:todo/shared/reusableComponents/reusableComponents.dart';

class loginScreen extends StatelessWidget
{
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                    Image(
                      image: AssetImage('assets/Images/welcomeBack.png'),
                    ),
                  ),
                  Text('welcome back!',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black

                    ),
                  ),
                  Text(
                    'login to your existance acoount in Q Allure',
                    style: TextStyle(
                        color: Colors.grey[500],
                      fontSize: 16.0
                    ),
                  ),
                ],
              ),
            ),
           SizedBox(height: 10.0),
           Container(
             color: Colors.grey[100],
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   deafultChallengeFormField
                     (
                       controller: emailController,
                       type: TextInputType.emailAddress,
                       prefix: Icons.person_outline_rounded,
                       HintText: 'email address'
                   ),
                   SizedBox(height:10.0),
                   deafultChallengeFormField
                     (
                       controller: passwordController,
                       type: TextInputType.visiblePassword,
                       prefix: Icons.lock_open,
                       HintText: 'Password'
                   ),
                   // Spacer(),
                   SizedBox(height:10.0),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text(
                         'Forgot Password?',
                         style: TextStyle(
                             fontSize: 15.0,
                             fontWeight: FontWeight.bold,
                             color: Colors.black
                         ),

                       ),
                     ],
                   ),
                   SizedBox(height: 10.0,),
                   SizedBox(
                     height: 50,
                     width:200,
                     child: MaterialButton(
                         onPressed: (){},
                       child: Text('Login'.toUpperCase(),
                       style: TextStyle(
                         color: Colors.white
                       ),
                       ),
                       color: Colors.indigo[900],
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(40.0))),


                         ),
                   ),
                   SizedBox(height:15.0),
                   Text('or connect using'),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SignInButtonBuilder(
                           text: 'facebook',
                           icon: Icons.facebook_sharp,
                           onPressed: () {},
                           width: 150,
                           height: 50,
                           fontSize: 20.0,
                           backgroundColor: Colors.blue[900]!,
                           shape:RoundedRectangleBorder(
                               borderRadius: BorderRadius.all(
                                   Radius.circular(10.0))),
                         ),

                         SizedBox(width: 10.0,),
                         /*SignInButtonBuilder(
                           text: 'Google',
                           onPressed: () {},
                           width: 150,
                           height: 50,
                           fontSize: 15.0,
                           backgroundColor: Colors.red[900]!,
                           shape:RoundedRectangleBorder(
                               borderRadius: BorderRadius.all(
                                   Radius.circular(10.0))),
                         ),*/
                         Container(
                           width:155,
                           height:50,
                             decoration: BoxDecoration(
                             color: Colors.red[900],
                           borderRadius: BorderRadius.circular(15.0),
                         ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                               Container(
                                   child:
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Image.network(
                                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                                     fit:BoxFit.cover
                               ),
                                   ),
                               ),
                               SizedBox(
                                 width: 5.0,
                               ),
                               Text('Google',
                                 style: TextStyle(
                                   fontSize: 20.0,
                                   color: Colors.white
                                 ),
                               )
                             ],
                           ),
                         )
                       ],
                     ),
                   ),
                   SizedBox(height: 5.0,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('Dont`t have an account',
                         style: TextStyle(
                           color: Colors.black,
                         ),
                       ),
                       TextButton(onPressed: (){
                         NavigateTo(context, test());

                       },
                           child:Text('Sign Up',
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                               color: Colors.blue[700]
                             ),
                           )
                       )
                     ],
                   )
                 ],

               ),
             ),
           )
          ],
        ),
      ),
    );
  }

}