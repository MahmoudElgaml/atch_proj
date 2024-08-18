import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdvertiserInfoPage extends StatelessWidget {
  const AdvertiserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .3,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .53,
                    child: const DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            tabs: [
                              Tab(
                                child: Text("lol"),
                              ),
                              Tab(
                                child: Text("lol2"),
                              ),
                            ],
                          ),
                          Flexible(
                            child: TabBarView(children: [
                              Center(
                                child: Text("lol"),
                              ),
                              Center(
                                child: Text("lol2"),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
