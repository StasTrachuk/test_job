import 'package:flutter/material.dart';
import 'package:test/model/component.dart';

class ComponentDescriptionGrid extends StatelessWidget {
  final List<Component> components;
  const ComponentDescriptionGrid({super.key, required this.components});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: components.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3,
      ),
      itemBuilder: (context, index) => _ComponentDescription(
        component: components[index],
      ),
    );
  }
}

class _ComponentDescription extends StatelessWidget {
  final Component component;

  const _ComponentDescription({required this.component});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 6),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: component.color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          "${component.description} ${component.percent!.round()} %",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
