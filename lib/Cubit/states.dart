abstract class CounterStates {}

class IntialCounterState extends CounterStates{}

class minusCounterstate extends CounterStates
{
  late final int  counter;

  minusCounterstate(this.counter);
}

class plusCounterstate extends CounterStates
{
  late final int counter;

  plusCounterstate(this.counter);

}