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


class AdminReportParameter extends StatefulWidget {
  static const routeName = '/admin/ReportParameter';

  const AdminReportParameter({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminReportParameterState();
  }
}

class _AdminReportParameterState extends State<AdminReportParameter> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminReportParameter.routeName,
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
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Parameter Name')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Parameter Name'), initialValue: nvl(_bean['name'])),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Description')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Description'), initialValue: nvl(_bean['description'])),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Parameter Type')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          Text('Radio ${_bean["type"]}'),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Required')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          Text('CheckBox ${_bean["required"]}'),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Value')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Default Value'), initialValue: nvl(_bean['textDefaultValue'])),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Value')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          Text('Spinner ${_bean["numericalDefaultValue"]}'),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Value')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Default Value'), initialValue: nvl(_bean['dateDefaultValue'])),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Test Value')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Test Value'), initialValue: nvl(_bean['textTestValue'])),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Test Value')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          Text('Spinner ${_bean["numericalTestValue"]}'),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Test Value')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Test Value'), initialValue: nvl(_bean['dateTestValue'])),
        ),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('admin', 'ReportParameter', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
