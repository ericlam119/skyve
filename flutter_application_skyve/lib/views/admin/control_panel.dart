import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_datagrid.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_tab.dart';
import 'package:flutter_application_skyve/widgets/skyve_tabpane.dart';
import 'package:flutter_application_skyve/widgets/skyve_toolbar.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminControlPanel extends StatefulWidget {
  static const routeName = '/admin/ControlPanel';

  const AdminControlPanel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminControlPanelState();
  }
}

class _AdminControlPanelState extends State<AdminControlPanel> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminControlPanel.routeName,
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
      const SkyveButton(name: 'null', label: 'Evict All Cached Metadata'),
    ])),
  ]),
  SkyveTabPane(children: [
    SkyveTab(title: 'Design', children: [
      SkyveVBox(children: [
        SkyveBorder(title: 'Generate Test Data', children: [
          SkyveVBox(children: [
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Module Name')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  Text('Combo ${_bean["testModuleName"]}'),
                ),
              ]),
            ]),
            const Text('ListMembership'),
            SkyveVBox(children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Number To Generate')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Number To Generate'), initialValue: nvl(_bean['testNumberToGenerate'])),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    const SkyveButton(name: 'GenerateTestData', label: 'Generate Test Data'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Tag Generated Data?')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["testTagGeneratedData"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Tag Name')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Tag Name'), initialValue: nvl(_bean['testTagName'])),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    const SkyveButton(name: 'DeleteTestData', label: 'Delete Test Data'),
                  ),
                ]),
              ]),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Swap Customer', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Customer Name To Swap To')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["customerNameToSwapTo"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'SwapCustomer', label: 'Swap Customer'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Query', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('BizQL')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('TextArea ${_bean["query"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'ExecuteQuery', label: 'Execute'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Caches', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Cache')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["selectedCache"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'EvictSelectedCache', label: 'Evict Cache'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'StopOrStartSelectedCache', label: 'Stop/Start Cache'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'CacheStats', label: 'All Cache Stats'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Sessions', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveLabel('Count:'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const Text('Blurb'),
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'SAIL', children: [
      SkyveVBox(children: [
        SkyveBorder(title: 'User', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Sign In Customer')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Sign In Customer'), initialValue: nvl(_bean['sailLoginCustomer'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('User')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["sailUser"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Sign In Password')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const Text('Password'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Base URL')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Base URL'), initialValue: nvl(_bean['sailBaseUrl'])),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Generate', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Module Name')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["sailModuleName"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('UX/UI')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["sailUxUi"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('User Agent Type')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["sailUserAgentType"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Test Strategy')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Radio ${_bean["sailTestStrategy"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'GenerateMenuSAIL', label: 'Menu SAIL'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'GenerateModuleSAIL', label: 'Module SAIL'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Execute', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Component Builder')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Component Builder'), initialValue: nvl(_bean['sailComponentBuilder'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Layout Builder')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Layout Builder'), initialValue: nvl(_bean['sailLayoutBuilder'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('SAIL')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('TextArea ${_bean["sail"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Executor')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["sailExecutor"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'ExecuteSAIL', label: 'Generate Test'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'DownloadSAIL', label: 'Download'),
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Results', children: [
      SkyveVBox(children: [
        SkyveForm(children: [
          BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              const SkyveButton(name: 'DownloadResults', label: 'Download Results'),
            ),
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              const Text('Blurb'),
            ),
          ]),
        ]),
        SkyveForm(children: [
          BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              const Text('Blurb'),
            ),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Instrumentation', children: [
      SkyveVBox(children: [
        SkyveBorder(title: 'Web', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('HTTP')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["httpTrace"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Command')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["commandTrace"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Faces')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["facesTrace"]}'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Data', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Query')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["queryTrace"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Content')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["contentTrace"]}'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Behaviour', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('XML')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["xmlTrace"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Security')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["securityTrace"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Bizlet')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["bizletTrace"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Dirty')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["dirtyTrace"]}'),
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'User Remember-Me Tokens', children: [
      SkyveVBox(children: [
        const Text('ListGrid'),
      ]),
    ]),
    SkyveTab(title: 'Startup Configuration', children: [
      SkyveVBox(children: [
        SkyveVBox(children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'ApplyStartupConfiguration', label: 'admin.controlPanel.acitons.applyStartupConfiguration.actionName'),
              ),
            ]),
          ]),
          SkyveDataGrid(rows: _bean['startupProperties'], children: [
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'text 500 2'), initialValue: nvl(_bean['text5002'])),
          ]),
          SkyveBorder(title: 'Add API Key', children: [
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('API Key Name')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'API Key Name'), initialValue: nvl(_bean['newProperty_text5001'])),
                ),
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Key Value')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Key Value'), initialValue: nvl(_bean['newProperty_text5002'])),
                ),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveButton(name: 'AddAPIKey', label: 'OK to apply configuration? There is no undo.'),
                ),
              ]),
            ]),
          ]),
          SkyveBorder(title: 'Add API Key', children: [
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const Text('Blurb'),
                ),
              ]),
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
      final bean = await SkyveRestClient().edit('admin', 'ControlPanel', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
