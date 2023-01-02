import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_datagrid.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class TestArcOneToMany extends StatefulWidget {
  static const routeName = '/test/ArcOneToMany';

  const TestArcOneToMany({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestArcOneToManyState();
  }
}

class _TestArcOneToManyState extends State<TestArcOneToMany> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        TestArcOneToMany.routeName,
        _bean['_title'],
        Visibility(
            visible: (_bean['bizId'] != null),
            replacement: const Center(child: CircularProgressIndicator()),
            child: SingleChildScrollView(
                child: Column(
                    children: [
                        Wrap(children: [
  SkyveDataGrid(rows: _bean['arcs'], children: [
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('test', 'ArcOneToMany', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
