import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_spacer.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminReportManager extends StatefulWidget {
  static const routeName = '/admin/ReportManager';

  const AdminReportManager({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminReportManagerState();
  }
}

class _AdminReportManagerState extends State<AdminReportManager> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminReportManager.routeName,
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
      BootstrapCol(sizes: 'col-12 col-md-8', child: 
        const Text('Blurb'),
      ),
    ]),
  ]),
  SkyveBorder(title: 'Import', children: [
    SkyveForm(children: [
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Import action')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          Text('Radio ${_bean["importActionType"]}'),
        ),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          const SkyveButton(name: 'ImportReportSpecifications', label: 'Import Report Specifications'),
        ),
      ]),
    ]),
  ]),
  SkyveBorder(title: 'Export', children: [
    SkyveVBox(children: [
      SkyveForm(children: [
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            const SkyveSpacer(),
          ),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            const SkyveButton(name: 'ExportReportSpecifications', label: 'Export Report Specifications'),
          ),
        ]),
      ]),
      const Text('ListMembership'),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('admin', 'ReportManager', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
