import 'dart:math' as math;

import 'package:flutter/material.dart';

class CatLoadingCard extends StatefulWidget {
  const CatLoadingCard({Key? key}) : super(key: key);

  @override
  State<CatLoadingCard> createState() => _CatLoadingCardState();
}

class _CatLoadingCardState extends State<CatLoadingCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 400,
        width: 300,
        child: Center(
          child: AnimatedBuilder(
            animation: controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: controller.value * 2 * math.pi,
                child: child,
              );
            },
            child: const Icon(Icons.pets, size: 100, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
