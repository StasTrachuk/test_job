import 'package:flutter/material.dart';
import 'package:test/model/component.dart';

class PercentAnimatedBar extends StatelessWidget {
  final List<Component> components;

  const PercentAnimatedBar(this.components, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: List.generate(
          components.length,
          (index) {
            final width = (MediaQuery.sizeOf(context).width - 40) *
                components[index].percent! /
                100;
            return _AnimatedComponent(
              width: width,
              color: components[index].color!,
            );
          },
        ),
      ),
    );
  }
}

class _AnimatedComponent extends StatefulWidget {
  final double width;
  final Color color;

  const _AnimatedComponent({
    required this.width,
    required this.color,
  });

  @override
  State<_AnimatedComponent> createState() => _AnimatedComponentState();
}

class _AnimatedComponentState extends State<_AnimatedComponent>
    with SingleTickerProviderStateMixin {
  late Animation<double> _tween;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _tween = Tween(begin: 0.0, end: widget.width).animate(_controller);
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant _AnimatedComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tween = Tween(
      begin: oldWidget.width,
      end: widget.width,
    ).animate(_controller);

    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _tween,
      builder: (context, index) => Container(
        color: widget.color,
        width: _tween.value,
      ),
    );
  }
}
