import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/proportional_cubit.dart';
import 'package:test/proportional_widget/proportional_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => ProportionalCubit(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(' max 10 elements'),
          const SizedBox(height: 10),
          const ProportionalWidget(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    context.read<ProportionalCubit>().addComponent(),
                child: const Text('Add component'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () =>
                    context.read<ProportionalCubit>().removeComponent(),
                child: const Text('Delete components'),
              ),
            ],
          ),
          const SizedBox(height: 300),
        ],
      ),
    );
  }
}
