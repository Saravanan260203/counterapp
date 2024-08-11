import 'package:counterapp/bloc/counter_bloc.dart';
import 'package:counterapp/cubit/counter_cubit.dart';
import 'package:counterapp/cubit/counter_cubit.dart';
import 'package:counterapp/inc_dec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var normalstate = 0;
  void normalIncrement() {
    setState(() {
      normalstate += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Normal State : ',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  '$normalstate',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Cubit State : ',
                  style: TextStyle(fontSize: 30),
                ),
                BlocBuilder<CounterCubit, int>(
                  builder: (context, state) {
                    return Text(
                      '$state',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Bloc State : ',
                  style: TextStyle(fontSize: 30),
                ),
                BlocBuilder<CounterBloc, int>(
                  builder: (context, state) {
                    return Text(
                      '$state',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    normalIncrement();
                  },
                  child: const Text('Normal State Increment'),
                ),
                const SizedBox(width: 16), // Add spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    counterCubit.increment();
                  },
                  child: const Text('Cubit State Increment'),
                ),
                const SizedBox(width: 16), // Add spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(Incremented());
                  },
                  child: const Text('Bloc State Increment'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
            child: const Icon(Icons.navigate_next_sharp),
          ),
        ],
      ),
    );
  }
}
