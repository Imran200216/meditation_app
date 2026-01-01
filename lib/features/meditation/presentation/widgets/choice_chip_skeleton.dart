import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChoiceChipSkeleton extends StatelessWidget {
  final bool isSelected;

  const ChoiceChipSkeleton({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 80, // approximate width
          height: 32, // approximate height
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(50), // StadiumBorder shape
            border: Border.all(color: Colors.grey.shade400, width: 1),
          ),
        )
        .animate(target: isSelected ? 1 : 0)
        .scale(
          begin: const Offset(1, 1),
          end: const Offset(1.05, 1.05),
          duration: 200.ms,
        );
  }
}
