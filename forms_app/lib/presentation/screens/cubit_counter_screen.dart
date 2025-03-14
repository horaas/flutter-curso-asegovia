import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CounterCubitView(),
    );
  }
}

class _CounterCubitView extends StatelessWidget {
  const _CounterCubitView();

  counterAction(BuildContext context, [int value = 1]) {
    final counterCubit = context.read<CounterCubit>().increaseBy;

    counterCubit(value);
  }  


  @override
  Widget build(BuildContext context) {
    final trnsactionCount = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(title: Text('Counter cubit'), actions: [
            IconButton(onPressed: () => context.read<CounterCubit>().reset(), icon: Icon(FontAwesomeIcons.arrowRotateLeft))
           ],),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
          print('el counter cambio');
          return Text('contador -> ${state.counter}');
        },),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            onPressed: () => counterAction(context, 1),
    
            child: Text('+1'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () => counterAction(context, 2),
    
            child: Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 3,
            onPressed: () => counterAction(context, 3),
            child: Text('+3'),
          ),
        ],
      ),
    );
  }
}
