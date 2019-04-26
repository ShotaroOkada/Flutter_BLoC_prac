import 'package:flutter/material.dart';
import 'package:flutter_bloc/BLoC/counterBLoC.dart';

void main() => runApp(App(bloc: CounterBloc()));

class App extends StatelessWidget {
  final CounterBloc bloc;

  const App({@required this.bloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: StreamBuilder<int>(
            stream: bloc.count,
            initialData: bloc.count.value,
            builder: (context, snap) => Text(
                  'count: ${snap.data}',
                  style: Theme.of(context).textTheme.title,
                ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => bloc.increment.add(null),
        ),
      ),
    );
  }
}