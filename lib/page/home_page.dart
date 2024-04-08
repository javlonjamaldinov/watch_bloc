import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_bloc/bloc/counter_bloc.dart';
import 'package:watch_bloc/bloc/counter_event.dart';
import 'package:watch_bloc/bloc/counter_state.dart';
import 'package:watch_bloc/page/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, });

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: 'count_hero_tag_home_page',
          child: Material(
            color: Colors.transparent,
            child: Text(
              'Count',
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
                    FloatingActionButton(
                      onPressed: () {
                        counterBloc.add(DecrementEvent());
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 20),
                    FloatingActionButton(
                      onPressed: () {
                        counterBloc.add(IncrementEvent());
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: counterBloc,
                child: SecondPage(counter: counterBloc.state.count),
              ),
            ),
          );
        },
        tooltip: 'Go to SecondPage',
        child: const Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
