import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_datagrid.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_spacer.dart';
import 'package:flutter_application_skyve/widgets/skyve_toolbar.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminImportExport extends StatefulWidget {
  static const routeName = '/admin/ImportExport';

  const AdminImportExport({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminImportExportState();
  }
}

class _AdminImportExportState extends State<AdminImportExport> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminImportExport.routeName,
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
  SkyveVBox(children: [
    SkyveBorder(title: 'Select Mode', children: [
      SkyveVBox(children: [
        SkyveForm(children: [
          BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
            BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Mode')),
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              Text('Radio ${_bean["mode"]}'),
            ),
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              const SkyveButton(name: 'GetImportTemplate', label: 'Get Template for Import'),
            ),
          ]),
        ]),
      ]),
    ]),
    SkyveBorder(title: 'Configure Options', children: [
      SkyveVBox(children: [
        SkyveVBox(children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveSpacer(),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const Text('Blurb'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Module Name')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["moduleName"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Document')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["documentName"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Column Headers')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["fileContainsHeaders"]}'),
              ),
            ]),
          ]),
          SkyveVBox(children: [
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveSpacer(),
                ),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveButton(name: 'UploadSimpleImportDataFile', label: 'Upload file'),
                ),
              ]),
            ]),
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveSpacer(),
                ),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const Text('Blurb'),
                ),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveButton(name: 'ClearImport', label: 'Clear File'),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Loading strategy')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  Text('Combo ${_bean["loadType"]}'),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Detailed logging')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  Text('CheckBox ${_bean["detailedLogging"]}'),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveSpacer(),
                ),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveButton(name: 'RunImport', label: 'Import data from file'),
                ),
              ]),
            ]),
          ]),
        ]),
        SkyveVBox(children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveSpacer(),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'ResetColumns', label: 'Reset columns'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveSpacer(),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'RunExport', label: 'Download Data'),
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
  ]),
  SkyveVBox(children: [
    SkyveBorder(title: 'Configure Import Columns', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['importExportColumns'], children: [
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Column Title'), initialValue: nvl(_bean['columnName'])),
          Text('Combo ${_bean["bindingName"]}'),
        ]),
        SkyveDataGrid(rows: _bean['importExportColumns'], children: [
        ]),
      ]),
    ]),
    SkyveBorder(title: 'Configure Export Columns', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['importExportColumns'], children: [
        ]),
        SkyveDataGrid(rows: _bean['importExportColumns'], children: [
        ]),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('admin', 'ImportExport', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
