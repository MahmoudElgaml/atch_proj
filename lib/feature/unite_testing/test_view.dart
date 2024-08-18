import 'package:atch_proj/feature/unite_testing/manger/test_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              TestCubit.get(context).test();

            },
            child: const Text("test"),
          ),
        ],
      ),
    );
  }
}
