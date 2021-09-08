import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Cubit/cubit.dart';
import 'package:todo/Cubit/states.dart';



class CounterScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CounterCubit() ,
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state)
        {
          //if(state is IntialCounterState) print('Intial State');
          if(state is plusCounterstate) print('plus State ${state.counter}');
          if(state is minusCounterstate) print('minus State${state.counter}');
        },
        builder: (context, state)
        {
          return Scaffold(
          appBar: AppBar(
            title: Text(
                'counter'),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: ()
                {
                  CounterCubit.get(context).minus();

                },
                    child: Text(
                      'minus',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0
                      ),
                    )),
                Text('${CounterCubit.get(context).counter}',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextButton(onPressed: ()
                {
                  CounterCubit.get(context).plus();

                },
                    child: Text(
                      'plus',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0
                      ),
                    )),

              ],
            ),
          ),
        );
          },
      ),
    );
  }
}