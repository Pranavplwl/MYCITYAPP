import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;

  const MyTab({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 60,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.indigo, borderRadius: BorderRadius.circular(12)),
        child: Image.asset(
          iconPath,
          color: const Color.fromARGB(255, 247, 246, 246),
        ),
      ),
    );
  }
}
