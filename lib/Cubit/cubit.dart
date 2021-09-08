 import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(IntialCounterState());

  static CounterCubit get(context)=>BlocProvider.of(context);

  int counter=1;

  void minus(){
    counter--;
    emit(minusCounterstate(counter));
  }

  void plus(){
    counter++;
    emit(plusCounterstate(counter));
  }

}