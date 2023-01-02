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
import 'package:flutter_application_skyve/widgets/skyve_tab.dart';
import 'package:flutter_application_skyve/widgets/skyve_tabpane.dart';
import 'package:flutter_application_skyve/widgets/skyve_toolbar.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminDataMaintenance extends StatefulWidget {
  static const routeName = '/admin/DataMaintenance';

  const AdminDataMaintenance({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminDataMaintenanceState();
  }
}

class _AdminDataMaintenanceState extends State<AdminDataMaintenance> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminDataMaintenance.routeName,
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
    SkyveTab(title: 'Import/Export', children: [
      SkyveVBox(children: [
        SkyveBorder(title: 'Bizport', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Module.Document')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["modDocName"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveSpacer(),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'DataMaintenanceExportAction', label: 'Export Data'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveSpacer(),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'DataMaintenanceImportAction', label: 'Import Data'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Quick Import/Export', children: [
          SkyveVBox(children: [
            const Text('ListGrid'),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Backup/Restore', children: [
      SkyveVBox(children: [
        SkyveBorder(title: 'Job', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Daily Backup Retention')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Spinner ${_bean["dailyBackupRetention"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Weekly Backup Retention')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Spinner ${_bean["weeklyBackupRetention"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Monthly Backup Retention')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Spinner ${_bean["monthlyBackupRetention"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Yearly Backup Retention')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Spinner ${_bean["yearlyBackupRetention"]}'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Backups', children: [
          SkyveVBox(children: [
            const Text('ListGrid'),
            SkyveHBox(children: [
              SkyveBorder(title: 'Restore', children: [
                SkyveForm(children: [
                  BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                    BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Content Option')),
                    BootstrapCol(sizes: 'col-12 col-md-8', child: 
                      Text('Radio ${_bean["contentRestoreOption"]}'),
                    ),
                  ]),
                  BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                    BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Indexing Option')),
                    BootstrapCol(sizes: 'col-12 col-md-8', child: 
                      Text('Radio ${_bean["restoreIndexingOption"]}'),
                    ),
                  ]),
                  BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                    BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Pre-Process')),
                    BootstrapCol(sizes: 'col-12 col-md-8', child: 
                      Text('Combo ${_bean["restorePreProcess"]}'),
                    ),
                    BootstrapCol(sizes: 'col-12 col-md-8', child: 
                      const SkyveButton(name: 'Restore', label: 'Restore'),
                    ),
                  ]),
                  BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                    BootstrapCol(sizes: 'col-12 col-md-8', child: 
                      const SkyveSpacer(),
                    ),
                    BootstrapCol(sizes: 'col-12 col-md-8', child: 
                      const Text('Blurb'),
                    ),
                  ]),
                ]),
              ]),
              SkyveVBox(children: [
                const SkyveButton(name: 'Backup', label: 'Backup'),
                const SkyveButton(name: 'DownloadBackup', label: 'Download Backup'),
                const SkyveButton(name: 'UploadBackup', label: 'Upload Backup'),
                const SkyveButton(name: 'DeleteBackup', label: 'Delete'),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Data', children: [
      SkyveVBox(children: [
        SkyveBorder(title: 'Truncate', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Schema Name')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Schema Name'), initialValue: nvl(_bean['schemaName'])),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Inject bootstrap user')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["injectBootstrapUser"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Confirm password')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const Text('Password'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'Truncate', label: 'Truncate'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'DDL', children: [
          SkyveVBox(children: [
            SkyveBorder(title: 'Script', children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    const Text('Blurb'),
                  ),
                ]),
              ]),
            ]),
            SkyveHBox(children: [
              const SkyveButton(name: 'Create', label: 'Script Create DB'),
              const SkyveButton(name: 'Drop', label: 'Script Drop DB'),
              const SkyveButton(name: 'Sync', label: 'Script Synchronise DB'),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Content', children: [
      SkyveVBox(children: [
        const Text('ListGrid'),
        SkyveBorder(title: 'Selected Content', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const Text('Blurb'),
              ),
            ]),
          ]),
        ]),
        SkyveHBox(children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveSpacer(),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'CollectContentGarbage', label: 'Collect Content Garbage'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'CheckContent', label: 'Check Content'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'MigrateContentFiles', label: 'Migrate Content Files'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'MigrateContent', label: 'Migrate Content'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'ReindexData', label: 'Reindex Data'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'ReindexContent', label: 'Reindex Content'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'Reindex', label: 'Reindex'),
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Manage Audits', children: [
      SkyveVBox(children: [
        SkyveBorder(title: 'Filter', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Module')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["auditModuleName"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Document')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["auditDocumentName"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Operation')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["auditOperation"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('From')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'From'), initialValue: nvl(_bean['auditTimestampStart'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('To')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'To'), initialValue: nvl(_bean['auditTimestampEnd'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('User')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["auditUser"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Found')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Found'), initialValue: nvl(_bean['auditMatchCount'])),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'CheckAuditMatches', label: 'Check Affected'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Truncate', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveSpacer(),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'TruncateAuditLog', label: 'Truncate Log (Job)'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveSpacer(),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const Text('Blurb'),
              ),
            ]),
          ]),
        ]),
        const Text('ListGrid'),
      ]),
    ]),
    SkyveTab(title: 'Data Refresh', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['refreshDocuments'], children: [
          Text('CheckBox ${_bean["include"]}'),
        ]),
        SkyveBorder(title: 'Document Data Refresh', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Option')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["refreshOption"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Cache Evict')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["evictOption"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Flag Failed ')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["flagFailed"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'RefreshDocumentTuples', label: 'Refresh Persisted Document Data'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveSpacer(),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Notify me on completion')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["notification"]}'),
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('admin', 'DataMaintenance', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
