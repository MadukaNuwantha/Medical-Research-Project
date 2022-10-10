import 'package:diabe_trek/providers/dfu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WoundHistory extends StatelessWidget {
  const WoundHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final dTUProvider = Provider.of<DFUProvider>(context, listen: false);
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wound History'),
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
