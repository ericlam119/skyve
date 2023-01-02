import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_datagrid.dart';
import 'package:flutter_application_skyve/widgets/skyve_tab.dart';
import 'package:flutter_application_skyve/widgets/skyve_tabpane.dart';
import 'package:flutter_application_skyve/widgets/skyve_toolbar.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class TestInverseManyToManyPersistent extends StatefulWidget {
  static const routeName = '/test/InverseManyToManyPersistent';

  const TestInverseManyToManyPersistent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestInverseManyToManyPersistentState();
  }
}

class _TestInverseManyToManyPersistentState extends State<TestInverseManyToManyPersistent> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        TestInverseManyToManyPersistent.routeName,
        _bean['_title'],
        Visibility(
            visible: (_bean['bizId'] != null),
            replacement: const Center(child: CircularProgressIndicator()),
            child: SingleChildScrollView(
                child: Column(
                    children: [
                        Wrap(children: [
  SkyveToolbar(children: [
    Container(padding: const EdgeInsets.symmetric(horizontal: 10.0), child: Wrap(alignment: WrapAlignment.center, spacing: 8.0, children: [
      const SkyveButton(name: 'OK', label: 'OK'),
      const SkyveButton(name: 'Save', label: 'Save'),
      const SkyveButton(name: 'Delete', label: 'Delete'),
      const SkyveButton(name: 'ZoomOut', label: 'Zoom Out'),
      const SkyveButton(name: 'Cancel', label: 'Cancel'),
      const SkyveButton(name: 'Remove', label: 'Remove'),
    ])),
  ]),
  SkyveTabPane(children: [
    SkyveTab(title: 'Aggregated Collection', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['aggCollection'], children: [
        ]),
      ]),
    ]),
    SkyveTab(title: 'Inverse', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['invAggCollection'], children: [
        ]),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('test', 'InverseManyToManyPersistent', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
