import 'package:flutter/material.dart';

import 'components/components.dart';

class NextDaysScreen extends StatefulWidget {
  const NextDaysScreen({super.key});

  @override
  State<NextDaysScreen> createState() => _NextDaysScreenState();
}

class _NextDaysScreenState extends State<NextDaysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Column(
        children: [
          Graphic(),
        ],
      ),
    );
  }
}
