import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  counterAction(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc counterBloc) =>
              Text('Counter Bloc -> ${counterBloc.state.trnsactionCount}'),
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(ResetCounter()),
            icon: Icon(FontAwesomeIcons.arrowRotateLeft),
          ),
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBloc) =>
              Text('contador -> ${counterBloc.state.counter}'),
        ),
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
