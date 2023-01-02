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


class KitchensinkKitchenSink extends StatefulWidget {
  static const routeName = '/kitchensink/KitchenSink';

  const KitchensinkKitchenSink({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _KitchensinkKitchenSinkState();
  }
}

class _KitchensinkKitchenSinkState extends State<KitchensinkKitchenSink> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        KitchensinkKitchenSink.routeName,
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
    SkyveTab(title: 'Widgets', children: [
      SkyveVBox(children: [
        SkyveBorder(children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const Text('Blurb'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveLabel('A Label'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveLabel('resource link'),
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
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Combo')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["combo"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Radio')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Radio ${_bean["radio"]}'),
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
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Spinner')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Spinner ${_bean["spinner"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Slider')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveLabel('slider'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Long Integer')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Long Integer'), initialValue: nvl(_bean['longInteger'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('HTML')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('HTML ${_bean["html"]}'),
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
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Lookup Description')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["lookupDescription"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Timestamp')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Timestamp'), initialValue: nvl(_bean['timestamp'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Content Link')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('ContentLink ${_bean["contentLink"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Content Image')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('ContentImage ${_bean["contentImage"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Content Signature')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('ContentSignature ${_bean["contentSignature"]}'),
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Data Grids', children: [
      SkyveVBox(children: [
        SkyveDataGrid(rows: _bean['containerGrid'], children: [
          const Text('Blurb'),
          const SkyveLabel(' '),
          const Text('StaticImage'),
        ]),
        SkyveDataGrid(rows: _bean['inlineGrid'], children: [
          Text('Combo ${_bean["constantEnum"]}'),
          Text('Combo ${_bean["constantDomain"]}'),
          Text('Combo ${_bean["variantDomain"]}'),
          Text('Combo ${_bean["dynamicDomain"]}'),
          Text('CheckBox ${_bean["booleanFlag"]}'),
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Date'), initialValue: nvl(_bean['date'])),
        ]),
        SkyveDataGrid(rows: _bean['orderedGrid'], children: [
        ]),
        SkyveDataGrid(rows: _bean['dataRepeater'], children: [
          Text('TextArea ${_bean["blurb"]}'),
        ]),
      ]),
    ]),
    SkyveTab(title: 'List/Check Membership', children: [
      SkyveVBox(children: [
        const Text('Blurb'),
        const Text('Blurb'),
      ]),
    ]),
    SkyveTab(title: 'Charts', children: [
      SkyveVBox(children: [
        const Text('Blurb'),
      ]),
    ]),
    SkyveTab(title: 'Comparison', children: [
      SkyveVBox(children: [
        const Text('Blurb'),
      ]),
    ]),
    SkyveTab(title: 'ListGrid', children: [
      SkyveVBox(children: [
        const Text('Blurb'),
      ]),
    ]),
    SkyveTab(title: 'Map', children: [
      SkyveVBox(children: [
        const Text('Blurb'),
      ]),
    ]),
    SkyveTab(title: 'Tree Grid', children: [
      SkyveVBox(children: [
        const Text('Blurb'),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('kitchensink', 'KitchenSink', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
