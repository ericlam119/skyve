import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_spacer.dart';
import 'package:flutter_application_skyve/widgets/skyve_toolbar.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminStartup extends StatefulWidget {
  static const routeName = '/admin/Startup';

  const AdminStartup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminStartupState();
  }
}

class _AdminStartupState extends State<AdminStartup> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminStartup.routeName,
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
      const SkyveButton(name: 'null', label: 'Dismiss'),
      const SkyveButton(name: 'null', label: 'Save Changes'),
    ])),
  ]),
  SkyveBorder(title: 'Environment Settings', children: [
    SkyveVBox(children: [
      SkyveForm(children: [
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Identifier')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Identifier'), initialValue: nvl(_bean['environmentIdentifier'])),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Support Email Address')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Support Email Address'), initialValue: nvl(_bean['environmentSupportEmail'])),
          ),
        ]),
      ]),
    ]),
  ]),
  SkyveBorder(title: 'Mail Settings', children: [
    SkyveVBox(children: [
      SkyveForm(children: [
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Server URL')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Server URL'), initialValue: nvl(_bean['mailServerUrl'])),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Server Port')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Server Port'), initialValue: nvl(_bean['mailPort'])),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Username')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Username'), initialValue: nvl(_bean['mailUsername'])),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Password')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            const Text('Password'),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Sender')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Default Sender'), initialValue: nvl(_bean['mailSender'])),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Test Mode')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('CheckBox ${_bean["mailBogusSend"]}'),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Test Mail Recipient')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Test Mail Recipient'), initialValue: nvl(_bean['mailTestRecipient'])),
          ),
        ]),
      ]),
    ]),
  ]),
  SkyveBorder(title: 'Map Settings', children: [
    SkyveVBox(children: [
      SkyveForm(children: [
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Type')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('Combo ${_bean["mapType"]}'),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Google Maps Key')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Google Maps Key'), initialValue: nvl(_bean['apiGoogleMapsKey'])),
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
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Zoom')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('Spinner ${_bean["mapZoom"]}'),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Layers')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Layers'), initialValue: nvl(_bean['mapLayer'])),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('null')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            const SkyveLabel('geometryMap'),
          ),
        ]),
      ]),
    ]),
  ]),
  SkyveBorder(title: 'Security Settings', children: [
    SkyveVBox(children: [
      SkyveForm(children: [
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Google Recaptcha Site Key')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Google Recaptcha Site Key'), initialValue: nvl(_bean['apiGoogleRecaptchaKey'])),
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
  ]),
  SkyveBorder(title: 'Account Settings', children: [
    SkyveVBox(children: [
      SkyveForm(children: [
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Allow User Self Registration')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('CheckBox ${_bean["accountAllowUserSelfRegistration"]}'),
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
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            const SkyveSpacer(),
          ),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            const Text('Blurb'),
          ),
        ]),
      ]),
    ]),
  ]),
  SkyveBorder(title: 'SMS Settings', children: [
    SkyveVBox(children: [
      SkyveForm(children: [
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Account SID')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Account SID'), initialValue: nvl(_bean['apiTwilioSID'])),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Account Auth Token')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Account Auth Token'), initialValue: nvl(_bean['apiTwilioAuthToken'])),
          ),
        ]),
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Send Number')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Default Send Number'), initialValue: nvl(_bean['apiTwilioDefaultSendNumber'])),
          ),
        ]),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('admin', 'Startup', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
