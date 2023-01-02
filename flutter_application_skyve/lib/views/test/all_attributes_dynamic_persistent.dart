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


class TestAllAttributesDynamicPersistent extends StatefulWidget {
  static const routeName = '/test/AllAttributesDynamicPersistent';

  const TestAllAttributesDynamicPersistent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestAllAttributesDynamicPersistentState();
  }
}

class _TestAllAttributesDynamicPersistentState extends State<TestAllAttributesDynamicPersistent> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        TestAllAttributesDynamicPersistent.routeName,
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
    SkyveTab(title: 'General', children: [
      SkyveVBox(children: [
        SkyveBorder(children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Aggregated Association')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["aggregatedAssociation"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Composed Association')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["composedAssociation"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Dynamic Aggregated Association')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["dynamicAggregatedAssociation"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Dynamic Composed Association')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["dynamicComposedAssociation"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Aggregated Association')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["dynamicEmbeddedAssociation_aggregatedAssociation"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Composed Association')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["dynamicEmbeddedAssociation_composedAssociation"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Dynamic Aggregated Association')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["dynamicEmbeddedAssociation_dynamicAggregatedAssociation"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Dynamic Composed Association')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["dynamicEmbeddedAssociation_dynamicComposedAssociation"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Boolean Flag')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["dynamicEmbeddedAssociation_booleanFlag"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Colour')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('ColourPicker ${_bean["dynamicEmbeddedAssociation_colour"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Date')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Date'), initialValue: nvl(_bean['dynamicEmbeddedAssociation_date'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Date Time')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Date Time'), initialValue: nvl(_bean['dynamicEmbeddedAssociation_dateTime'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Decimal 10')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Decimal 10'), initialValue: nvl(_bean['dynamicEmbeddedAssociation_decimal10'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Decimal 2')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Decimal 2'), initialValue: nvl(_bean['dynamicEmbeddedAssociation_decimal2'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Decimal 5')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Decimal 5'), initialValue: nvl(_bean['dynamicEmbeddedAssociation_decimal5'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Enum 3')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["dynamicEmbeddedAssociation_enum3"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('null')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveLabel('geometry'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Id')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Id'), initialValue: nvl(_bean['dynamicEmbeddedAssociation_id'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Integer')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Integer'), initialValue: nvl(_bean['dynamicEmbeddedAssociation_normalInteger'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Long Integer')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Long Integer'), initialValue: nvl(_bean['dynamicEmbeddedAssociation_longInteger'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Markup')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('RichText ${_bean["dynamicEmbeddedAssociation_markup"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Memo')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('TextArea ${_bean["dynamicEmbeddedAssociation_memo"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Text')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Text'), initialValue: nvl(_bean['dynamicEmbeddedAssociation_text'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Time')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Time'), initialValue: nvl(_bean['dynamicEmbeddedAssociation_time'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Timestamp')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Timestamp'), initialValue: nvl(_bean['dynamicEmbeddedAssociation_timestamp'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Boolean Flag')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["booleanFlag"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Colour')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('ColourPicker ${_bean["colour"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Date')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Date'), initialValue: nvl(_bean['date'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Date Time')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Date Time'), initialValue: nvl(_bean['dateTime'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Decimal 10')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Decimal 10'), initialValue: nvl(_bean['decimal10'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Decimal 2')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Decimal 2'), initialValue: nvl(_bean['decimal2'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Decimal 5')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Decimal 5'), initialValue: nvl(_bean['decimal5'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Enum 3')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["enum3"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Enum 3 Reference')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["enum3Reference"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('null')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveLabel('geometry'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Id')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Id'), initialValue: nvl(_bean['id'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Integer')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Integer'), initialValue: nvl(_bean['normalInteger'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Long Integer')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Long Integer'), initialValue: nvl(_bean['longInteger'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Markup')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('RichText ${_bean["markup"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Memo')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('TextArea ${_bean["memo"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Text')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Text'), initialValue: nvl(_bean['text'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Time')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Time'), initialValue: nvl(_bean['time'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Timestamp')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Timestamp'), initialValue: nvl(_bean['timestamp'])),
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Aggregated Collection', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['dynamicEmbeddedAssociation_aggregatedCollection'], children: [
        ]),
      ]),
    ]),
    SkyveTab(title: 'Aggregated Collection', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['aggregatedCollection'], children: [
        ]),
      ]),
    ]),
    SkyveTab(title: 'Composed Collection', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['composedCollection'], children: [
        ]),
      ]),
    ]),
    SkyveTab(title: 'Dynamic Aggregated Collection', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['dynamicAggregatedCollection'], children: [
        ]),
      ]),
    ]),
    SkyveTab(title: 'Dynamic Composed Collection', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['dynamicComposedCollection'], children: [
        ]),
      ]),
    ]),
    SkyveTab(title: 'Dynamic Child Collection', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['dynamicChildCollection'], children: [
        ]),
      ]),
    ]),
    SkyveTab(title: 'Inverse', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['inverseAggregatedAssociation'], children: [
        ]),
      ]),
    ]),
    SkyveTab(title: 'Inverse', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['dynamicInverseAggregatedAssociation'], children: [
        ]),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('test', 'AllAttributesDynamicPersistent', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
