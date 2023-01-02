import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class TestArcOneToOne extends StatefulWidget {
  static const routeName = '/test/ArcOneToOne';

  const TestArcOneToOne({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestArcOneToOneState();
  }
}

class _TestArcOneToOneState extends State<TestArcOneToOne> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        TestArcOneToOne.routeName,
        _bean['_title'],
        Visibility(
            visible: (_bean['bizId'] != null),
            replacement: const Center(child: CircularProgressIndicator()),
            child: SingleChildScrollView(
                child: Column(
                    children: [
                        Wrap(children: [
  SkyveForm(children: [
    BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('test', 'ArcOneToOne', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
