import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_datagrid.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_hbox.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_spacer.dart';
import 'package:flutter_application_skyve/widgets/skyve_toolbar.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminReportTemplate extends StatefulWidget {
  static const routeName = '/admin/ReportTemplate';

  const AdminReportTemplate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminReportTemplateState();
  }
}

class _AdminReportTemplateState extends State<AdminReportTemplate> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminReportTemplate.routeName,
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
      const Text('Download'),
      const Text('Download'),
      const SkyveButton(name: 'null', label: 'Copy Report'),
      const Text('Download'),
      const Text('Download'),
    ])),
  ]),
  SkyveHBox(children: [
    SkyveBorder(title: 'Report Details', children: [
      SkyveForm(children: [
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Name')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Name'), initialValue: nvl(_bean['name'])),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Description')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('TextArea ${_bean["description"]}'),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Report Type')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('Radio ${_bean["reportType"]}'),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Include Only/Subreport')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('CheckBox ${_bean["includeFragment"]}'),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Module Name')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('Combo ${_bean["moduleName"]}'),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Document Name')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('Combo ${_bean["documentName"]}'),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Report Name')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Report Name'), initialValue: nvl(_bean['reportName'])),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Mode')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('Combo ${_bean["mode"]}'),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Enabled')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('CheckBox ${_bean["enabled"]}'),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Output Format')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('Radio ${_bean["outputFormat"]}'),
          ),
        ]),
      ]),
    ]),
    SkyveBorder(title: 'Report Template', children: [
      SkyveForm(children: [
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('TextArea ${_bean["template"]}'),
          ),
        ]),
      ]),
    ]),
  ]),
  SkyveDataGrid(rows: _bean['datasets'], children: [
  ]),
  SkyveDataGrid(rows: _bean['parameters'], children: [
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('admin', 'ReportTemplate', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
