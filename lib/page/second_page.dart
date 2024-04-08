import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_bloc/bloc/counter_bloc.dart';
import 'package:watch_bloc/bloc/counter_event.dart';
import 'package:watch_bloc/bloc/counter_state.dart';

class SecondPage extends StatelessWidget {
  final int counter;

  const SecondPage({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: 'count_hero_tag_second_page',
          child: Material(
            color: Colors.transparent,
            child: Text(
              'Second Page',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Count: ${state.count}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        counterBloc.add(IncrementEvent());
                      },
                      child: const Icon(Icons
                          .add), 
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        counterBloc.add(DecrementEvent());
                      },
                      child: const Icon(Icons
                          .remove), 
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to HomePage'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
