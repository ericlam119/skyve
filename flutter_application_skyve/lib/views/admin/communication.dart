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


class AdminCommunication extends StatefulWidget {
  static const routeName = '/admin/Communication';

  const AdminCommunication({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminCommunicationState();
  }
}

class _AdminCommunicationState extends State<AdminCommunication> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminCommunication.routeName,
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
    SkyveForm(children: [
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          const Text('Blurb'),
        ),
      ]),
    ]),
  ]),
  SkyveTabPane(children: [
    SkyveTab(title: 'Contents', children: [
      SkyveVBox(children: [
        SkyveBorder(children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Description')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Description'), initialValue: nvl(_bean['description'])),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Used for System communications')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["systemUse"]}'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Email', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Format')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["formatType"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('From (expression)')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'From (expression)'), initialValue: nvl(_bean['sendFrom'])),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('BCC Me')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["monitorBcc"]}'),
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
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('To')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'To'), initialValue: nvl(_bean['sendTo'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('CC To')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'CC To'), initialValue: nvl(_bean['ccTo'])),
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
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Subject (expression)')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Subject (expression)'), initialValue: nvl(_bean['subject'])),
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
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Body (expression)')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('HTML ${_bean["body"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Communication Template')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["template"]}'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Options', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Include Calendar Item')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["includeCalendar"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'AddUnsubscribeLink', label: 'Add Unsubscribe Link'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'AddImage', label: 'Add Uploaded Image'),
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Attachments', children: [
      SkyveVBox(children: [
        SkyveBorder(title: 'Attachments', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Attachment 1')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('ContentLink ${_bean["attachment1"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Attachment File Name')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Attachment File Name'), initialValue: nvl(_bean['attachmentFileName1'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Attachment 2')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('ContentLink ${_bean["attachment2"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Attachment File Name')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Attachment File Name'), initialValue: nvl(_bean['attachmentFileName2'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Attachment 3')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('ContentLink ${_bean["attachment3"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Attachment File Name')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Attachment File Name'), initialValue: nvl(_bean['attachmentFileName3'])),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Calendar', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Title (expression)')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Title (expression)'), initialValue: nvl(_bean['calendarTitleExpression'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Start Time')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Start Time'), initialValue: nvl(_bean['calendarStartTime'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('End Time')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'End Time'), initialValue: nvl(_bean['calendarEndTime'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Description (expression)')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Description (expression)'), initialValue: nvl(_bean['calendarDescriptionExpression'])),
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Manage', children: [
      SkyveVBox(children: [
        SkyveBorder(title: 'Configuration', children: [
          SkyveForm(children: [
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
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Tag')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Combo ${_bean["tag"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'GetCount', label: 'Get Count'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveSpacer(),
              ),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'TestSend', label: 'Test Send to yourself'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Results', children: [
          SkyveHBox(children: [
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Results')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  Text('TextArea ${_bean["results"]}'),
                ),
              ]),
            ]),
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Untag successful documents')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  Text('CheckBox ${_bean["unTagSuccessful"]}'),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Notify when job is complete')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  Text('CheckBox ${_bean["notification"]}'),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveButton(name: 'GetResults', label: 'Run Result Check Job'),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveButton(name: 'CreateFiles', label: 'Generate File Batch'),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveButton(name: 'SendNow', label: 'Send Now'),
                ),
              ]),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Batches', children: [
          SkyveVBox(children: [
            const Text('ListGrid'),
            SkyveHBox(children: [
              const SkyveButton(name: 'ZipBatch', label: 'Download Zip'),
              const SkyveButton(name: 'DeleteBatch', label: 'Delete'),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Subscriptions', children: [
      SkyveVBox(children: [
        const Text('ListGrid'),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('admin', 'Communication', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
