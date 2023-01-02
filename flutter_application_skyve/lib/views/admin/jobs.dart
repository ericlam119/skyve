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


class AdminJobs extends StatefulWidget {
  static const routeName = '/admin/Jobs';

  const AdminJobs({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminJobsState();
  }
}

class _AdminJobsState extends State<AdminJobs> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminJobs.routeName,
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
      const SkyveButton(name: 'null', label: 'Refresh'),
      const SkyveButton(name: 'null', label: 'Delete Completed Jobs'),
    ])),
  ]),
  SkyveTabPane(children: [
    SkyveTab(title: 'Actual', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['runningJobs'], children: [
        ]),
        const Text('ListGrid'),
      ]),
    ]),
    SkyveTab(title: 'Schedule', children: [
      SkyveVBox(children: [
        const Text('ListGrid'),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('admin', 'Jobs', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
