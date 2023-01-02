import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_hbox.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_spacer.dart';
import 'package:flutter_application_skyve/widgets/skyve_tab.dart';
import 'package:flutter_application_skyve/widgets/skyve_tabpane.dart';
import 'package:flutter_application_skyve/widgets/skyve_toolbar.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminReportDesign extends StatefulWidget {
  static const routeName = '/admin/ReportDesign';

  const AdminReportDesign({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminReportDesignState();
  }
}

class _AdminReportDesignState extends State<AdminReportDesign> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminReportDesign.routeName,
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
      const SkyveButton(name: 'null', label: 'Generate Default'),
      const Text('Download'),
    ])),
  ]),
  SkyveTabPane(children: [
    SkyveTab(title: 'General', children: [
      SkyveVBox(children: [
        SkyveHBox(children: [
          SkyveVBox(children: [
            SkyveBorder(title: 'Report Definition', children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Report Name')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Report Name'), initialValue: nvl(_bean['name'])),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Module')),
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
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Query')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Combo ${_bean["queryName"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Menu Item')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Combo ${_bean["menuItem"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Output Path')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Output Path'), initialValue: nvl(_bean['repositoryPath'])),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Save to Document Package')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["saveToDocumentPackage"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Type')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Combo ${_bean["reportType"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Mode')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Combo ${_bean["mode"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Definition Source')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Combo ${_bean["definitionSource"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Dynamic Flow')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["dynamicFlow"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Transform horizontal containers to vertical')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["verticalise"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Split Type')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Combo ${_bean["bandSplitType"]}'),
                  ),
                ]),
              ]),
            ]),
            SkyveBorder(title: 'Subreport Definition', children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Field')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Field'), initialValue: nvl(_bean['field'])),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Collection Type')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Combo ${_bean["collectionType"]}'),
                  ),
                ]),
              ]),
            ]),
          ]),
          SkyveVBox(children: [
            SkyveBorder(title: 'Report Setup', children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Font Name')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Font Name'), initialValue: nvl(_bean['defaultFontName'])),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Font Size (Detail)')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Font Size (Detail)'), initialValue: nvl(_bean['defaultFontSize'])),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    const SkyveSpacer(),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    const SkyveSpacer(),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Font Size (Title)')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Font Size (Title)'), initialValue: nvl(_bean['titleFontSize'])),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Render Labels as TextFields')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["renderLabelAsTextFields"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Label Alignment')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Combo ${_bean["labelAlignmentOverride"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Bold Labels')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["boldLabels"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Line Colour')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('ColourPicker ${_bean["defaultLineColour"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Line Pen Stroke Thickness')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Default Line Pen Stroke Thickness'), initialValue: nvl(_bean['defaultLineWidth'])),
                  ),
                ]),
              ]),
            ]),
            SkyveBorder(title: 'Page Setup', children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Orientation')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Combo ${_bean["orientation"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Element Height')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Default Element Height'), initialValue: nvl(_bean['defaultElementHeight'])),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Width')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Width'), initialValue: nvl(_bean['width'])),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Height')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Height'), initialValue: nvl(_bean['height'])),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Left Margin')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Left Margin'), initialValue: nvl(_bean['leftMargin'])),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Right Margin')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Right Margin'), initialValue: nvl(_bean['rightMargin'])),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Top Margin')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Top Margin'), initialValue: nvl(_bean['topMargin'])),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Bottom Margin')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Bottom Margin'), initialValue: nvl(_bean['bottomMargin'])),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Column Width')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Column Width'), initialValue: nvl(_bean['columnWidth'])),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Include Page Numbers')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["includePageNumbers"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Pixel to TWIP')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Pixel to TWIP'), initialValue: nvl(_bean['pixelToTwip'])),
                  ),
                ]),
              ]),
            ]),
            SkyveBorder(title: 'Section Override', children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Border Top')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["sectionBorderTop"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Border Left')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["sectionBorderLeft"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Border Right')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["sectionBorderRight"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Border Bottom')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["sectionBorderBottom"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Title Border Top')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["sectionTitleBorderTop"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Title Border Left')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["sectionTitleBorderLeft"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Title Border Right')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["sectionTitleBorderRight"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Title Border Bottom')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["sectionTitleBorderBottom"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Title Foreground')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('ColourPicker ${_bean["sectionTitleForeground"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Title Background')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('ColourPicker ${_bean["sectionTitleBackground"]}'),
                  ),
                ]),
              ]),
            ]),
            SkyveBorder(title: 'Cell Setup', children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Border')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["defaultBorder"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Border Top')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["defaultBorderTop"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Border Left')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["defaultBorderLeft"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Border Bottom')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["defaultBorderBottom"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Border Right')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["defaultBorderRight"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Cell Top Padding')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Cell Top Padding'), initialValue: nvl(_bean['defaultCellTopPadding'])),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Cell Left Padding')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Cell Left Padding'), initialValue: nvl(_bean['defaultCellLeftPadding'])),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Cell Bottom Padding')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Cell Bottom Padding'), initialValue: nvl(_bean['defaultCellBottomPadding'])),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Cell Right Padding')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Cell Right Padding'), initialValue: nvl(_bean['defaultCellRightPadding'])),
                  ),
                ]),
              ]),
            ]),
            SkyveBorder(title: 'Checkboxes', children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Checkbox Display Expression')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Checkbox Display Expression'), initialValue: nvl(_bean['checkBoxDisplayExpression'])),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Checkbox Font Name')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Checkbox Font Name'), initialValue: nvl(_bean['checkBoxFontName'])),
                  ),
                ]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'JRXML', children: [
      SkyveVBox(children: [
        SkyveForm(children: [
          BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
            BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Jrxml File Destination')),
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              Text('TextArea ${_bean["jrxml"]}'),
            ),
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
      final bean = await SkyveRestClient().edit('admin', 'ReportDesign', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
