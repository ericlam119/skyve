import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_tab.dart';
import 'package:flutter_application_skyve/widgets/skyve_tabpane.dart';
import 'package:flutter_application_skyve/widgets/skyve_toolbar.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminGroup extends StatefulWidget {
  static const routeName = '/admin/Group';

  const AdminGroup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminGroupState();
  }
}

class _AdminGroupState extends State<AdminGroup> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminGroup.routeName,
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
    SkyveTab(title: 'Group Details', children: [
      SkyveVBox(children: [
        SkyveVBox(children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Group Name')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Group Name'), initialValue: nvl(_bean['name'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Description')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Description'), initialValue: nvl(_bean['description'])),
              ),
            ]),
          ]),
          const Text('ListMembership'),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Users in Group', children: [
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
      final bean = await SkyveRestClient().edit('admin', 'Group', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
