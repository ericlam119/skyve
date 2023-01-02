import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_datagrid.dart';
import 'package:flutter_application_skyve/widgets/skyve_hbox.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminSystemDashboard extends StatefulWidget {
  static const routeName = '/admin/SystemDashboard';

  const AdminSystemDashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminSystemDashboardState();
  }
}

class _AdminSystemDashboardState extends State<AdminSystemDashboard> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminSystemDashboard.routeName,
        _bean['_title'],
        Visibility(
            visible: (_bean['bizId'] != null),
            replacement: const Center(child: CircularProgressIndicator()),
            child: SingleChildScrollView(
                child: Column(
                    children: [
                        Wrap(children: [
  SkyveHBox(children: [
    SkyveBorder(title: 'System Activity', children: [
      SkyveVBox(children: [
        const SkyveLabel('chart'),
      ]),
    ]),
    SkyveBorder(title: 'System Status', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['status'], children: [
          const Text('Blurb'),
        ]),
      ]),
    ]),
  ]),
  SkyveBorder(title: 'Activity Breakdown', children: [
    SkyveHBox(children: [
      const SkyveLabel('chart'),
      const SkyveLabel('chart'),
    ]),
  ]),
  SkyveBorder(title: 'System Jobs', children: [
    SkyveVBox(children: [
      const Text('ListGrid'),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('admin', 'SystemDashboard', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
