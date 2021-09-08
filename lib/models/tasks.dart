import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/shared/CubitTodo/states.dart';
import 'package:todo/shared/reusableComponents/reusableComponents.dart';
import 'package:todo/shared/CubitTodo/cubit.dart';

class tasksScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

   return BlocConsumer<AppCubit,AppStates>(
     listener: (BuildContext context, state)
     {

     },
     builder: (BuildContext context, Object? state)
     {
       var tasks=AppCubit.get(context).NewTasks;

       return TaskBuilder(
         tasks:tasks, context: context
       );
     },

   );
  }

}