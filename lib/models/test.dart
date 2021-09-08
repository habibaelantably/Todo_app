


import 'package:flutter/material.dart';
import 'package:todo/models/FirstScreenChallenge.dart';
import 'package:todo/shared/reusableComponents/reusableComponents.dart';

class test extends StatelessWidget
{
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var usernameController=TextEditingController();
  var Phonecontroller=TextEditingController();
  var confirmPasswordcontrolller=TextEditingController();
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     backgroundColor: Colors.white,
     appBar: AppBar(
       backgroundColor: Colors.white,
       leading: IconButton(icon: Icon(Icons.arrow_back),color:Colors.black ,onPressed: () {
         NavigateTo(context, loginScreen());
       },),
       elevation: 0.0,
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           Container(
             color: Colors.white,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [

                 Text('Let`s Get Started!',
                   style: TextStyle(
                       fontSize: 30.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.black

                   ),
                 ),
                 Text(
                   'creat an account to Q Allure get all features',
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
             height: 540,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   deafultChallengeFormField
                     (
                       controller: usernameController,
                       type: TextInputType.name,
                       prefix: Icons.person_outline_rounded,
                       HintText: 'user name'
                   ),
                   SizedBox(height:15.0),
                   deafultChallengeFormField
                     (
                       controller: emailController,
                       type: TextInputType.emailAddress,
                       prefix: Icons.email,
                       HintText: 'email address'
                   ),
                   SizedBox(height:15.0),
                   deafultChallengeFormField
                     (
                       controller: Phonecontroller,
                       type: TextInputType.phone,
                       prefix: Icons.phone_android_sharp,
                       HintText: 'Phone'
                   ),
                   SizedBox(height:15.0),
                   deafultChallengeFormField
                     (
                       controller: passwordController,
                       type: TextInputType.visiblePassword,
                       prefix: Icons.lock_open,
                       HintText: 'Password'
                   ),
                   SizedBox(height:15.0),
                   deafultChallengeFormField
                     (
                       controller: confirmPasswordcontrolller,
                       type: TextInputType.visiblePassword,
                       prefix: Icons.lock_open,
                       HintText: 'Confirm Password'
                   ),
                   // Spacer(),
                   SizedBox(height:25.0),
                   SizedBox(
                     height: 50,
                     width:200,
                     child: MaterialButton(
                       onPressed: (){},
                       child: Text('creat'.toUpperCase(),
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

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('Already have an account?',
                         style: TextStyle(
                           color: Colors.black,
                         ),
                       ),
                       TextButton(onPressed: (){},
                           child:Text('login here',
                             style: TextStyle(
                                 fontWeight: FontWeight.bold
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
     )
   );
  }

}