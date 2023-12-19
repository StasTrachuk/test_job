import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/proportional_cubit.dart';
import 'package:test/bloc/proportional_state.dart';
import 'package:test/proportional_widget/component_description_grid.dart';
import 'package:test/proportional_widget/percent_animated_bar.dart';

class ProportionalWidget extends StatelessWidget {
  const ProportionalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(15),
        ),
        child: BlocBuilder<ProportionalCubit, ProportionalState>(
          builder: (context, state) {
            return switch (state) {
              ProportionalInitial() => const SizedBox(),
              ProportionalLoading() => const Center(
                  child: Text('Loading'),
                ),
              ProportionalLoaded(:final components) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ComponentDescriptionGrid(
                      components: components,
                    ),
                    const SizedBox(height: 10),
                    PercentAnimatedBar(components),
                  ],
                ),
              ProportionalError(:final error) => Center(
                  child: Text(error),
                ),
            };
          },
        ),
      ),
    );
  }
}
