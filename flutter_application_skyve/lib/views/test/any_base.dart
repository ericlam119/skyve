import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_toolbar.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class TestAnyBase extends StatefulWidget {
  static const routeName = '/test/AnyBase';

  const TestAnyBase({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestAnyBaseState();
  }
}

class _TestAnyBaseState extends State<TestAnyBase> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        TestAnyBase.routeName,
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
  SkyveBorder(children: [
    SkyveForm(children: [
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Text')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Text'), initialValue: nvl(_bean['text'])),
        ),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('test', 'AnyBase', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
