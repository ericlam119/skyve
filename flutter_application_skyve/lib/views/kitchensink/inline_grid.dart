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


class KitchensinkInlineGrid extends StatefulWidget {
  static const routeName = '/kitchensink/InlineGrid';

  const KitchensinkInlineGrid({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _KitchensinkInlineGridState();
  }
}

class _KitchensinkInlineGridState extends State<KitchensinkInlineGrid> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        KitchensinkInlineGrid.routeName,
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
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('ConstantEnum')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          Text('Combo ${_bean["constantEnum"]}'),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('ConstantDomain')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          Text('Combo ${_bean["constantDomain"]}'),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('VariantDomain')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          Text('Combo ${_bean["variantDomain"]}'),
        ),
      ]),
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('DynamicDomain')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          Text('Combo ${_bean["dynamicDomain"]}'),
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
        BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Decimal 5')),
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Decimal 5'), initialValue: nvl(_bean['decimal5'])),
        ),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('kitchensink', 'InlineGrid', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
