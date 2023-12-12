import 'package:flutter/material.dart';

import 'bank_name_list_alert.dart';
import 'emoney_name_list_alert.dart';

class TabInfo {
  TabInfo(this.label, this.widget);

  String label;
  Widget widget;
}

// ignore: must_be_immutable
class DepositListAlert extends StatelessWidget {
  DepositListAlert({super.key});

  List<TabInfo> tabs = [
    TabInfo('銀行口座管理', BankNameListAlert()),
    TabInfo('電子マネー管理', EmoneyNameListAlert()),
  ];

  int selectedIndex = 0;

  ///
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.transparent,
            //-------------------------//これを消すと「←」が出てくる（消さない）
            leading: const Icon(Icons.check_box_outline_blank, color: Colors.transparent),
            //-------------------------//これを消すと「←」が出てくる（消さない）

            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.blueAccent,
              tabs: tabs.map((TabInfo tab) => Tab(text: tab.label)).toList(),
            ),
          ),
        ),
        body: TabBarView(children: tabs.map((tab) => tab.widget).toList()),
      ),
    );
  }
}
