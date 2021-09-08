import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/shared/CubitTodo/cubit.dart';
import 'package:todo/shared/CubitTodo/states.dart';
import 'package:todo/shared/reusableComponents/reusableComponents.dart';

class doneScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state)
      {

      },
      builder: (BuildContext context, Object? state)
      {
        var tasks=AppCubit.get(context).DoneTasks;
        return TaskBuilder(
            tasks:tasks, context: context
        );
      },

    );
  }


}