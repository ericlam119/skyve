import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_spacer.dart';
import 'package:flutter_application_skyve/widgets/skyve_tab.dart';
import 'package:flutter_application_skyve/widgets/skyve_tabpane.dart';
import 'package:flutter_application_skyve/widgets/skyve_toolbar.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminConfiguration extends StatefulWidget {
  static const routeName = '/admin/Configuration';

  const AdminConfiguration({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminConfigurationState();
  }
}

class _AdminConfigurationState extends State<AdminConfiguration> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminConfiguration.routeName,
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
      const SkyveButton(name: 'Save', label: 'Save'),
    ])),
  ]),
  SkyveTabPane(children: [
    SkyveTab(title: 'General', children: [
      SkyveVBox(children: [
        SkyveVBox(children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const Text('Blurb'),
              ),
            ]),
          ]),
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
        SkyveVBox(children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const Text('Blurb'),
              ),
            ]),
          ]),
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
        SkyveBorder(title: 'Password Complexity', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Minimum Password Length')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('Spinner ${_bean["passwordMinLength"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Requires Lowercase')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["passwordRequireLowercase"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Requires Uppercase')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["passwordRequireUppercase"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Requires Numeric Characters')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["passwordRequireNumeric"]}'),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Requires Special Characters')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('CheckBox ${_bean["passwordRequireSpecial"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const Text('Blurb'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Password Expiry in Days')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Password Expiry in Days'), initialValue: nvl(_bean['passwordExpiryDays'])),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Account Lockout Threshold')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Account Lockout Threshold'), initialValue: nvl(_bean['passwordAccountLockoutThreshold'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Password History Retention')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Password History Retention'), initialValue: nvl(_bean['passwordHistoryRetention'])),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Account Lockout Duration')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Account Lockout Duration'), initialValue: nvl(_bean['passwordAccountLockoutDuration'])),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Test Email', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Email To')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Email To'), initialValue: nvl(_bean['emailTo'])),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('OR Contact Email')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["emailToContact"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Email Subject')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Email Subject'), initialValue: nvl(_bean['emailSubject'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Email')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('RichText ${_bean["emailContent"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const SkyveButton(name: 'SendMail', label: 'Send Mail'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Test Email', children: [
          SkyveVBox(children: [
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const Text('Blurb'),
                ),
              ]),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Password Reset', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Sender/From Email Address')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Sender/From Email Address'), initialValue: nvl(_bean['fromEmail'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Password Reset Email Subject')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Password Reset Email Subject'), initialValue: nvl(_bean['passwordResetEmailSubject'])),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Password Reset Email Body')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('HTML ${_bean["passwordResetEmailBody"]}'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Password Reset', children: [
          SkyveVBox(children: [
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const Text('Blurb'),
                ),
              ]),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Two Factor Authentication', children: [
          SkyveVBox(children: [
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Two Factor Type')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  Text('Combo ${_bean["twoFactorType"]}'),
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
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Two Factor Email Subject')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Two Factor Email Subject'), initialValue: nvl(_bean['twoFactorEmailSubject'])),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Two Factor Email Body')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  Text('HTML ${_bean["twoFactorEmailBody"]}'),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Two Factor Code Timeout (seconds)')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Two Factor Code Timeout (seconds)'), initialValue: nvl(_bean['twofactorPushCodeTimeOutSeconds'])),
                ),
              ]),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'User Self-Registration', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('null')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                const Text('Blurb'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('User Self Registration Group')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["userSelfRegistrationGroup"]}'),
              ),
            ]),
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Number of hours to keep self-registration activation codes enabled')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Number of hours to keep self-registration activation codes enabled'), initialValue: nvl(_bean['selfRegistrationActivationExpiryHours'])),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Anonymous Public User', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Anonymous Public User')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                Text('LookupDescription ${_bean["publicUser"]}'),
              ),
            ]),
          ]),
        ]),
        SkyveBorder(title: 'Available Disk Space Alarm', children: [
          SkyveForm(children: [
            BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Available disk space alarm level as a percentage of total disk space')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Available disk space alarm level as a percentage of total disk space'), initialValue: nvl(_bean['availableDiskSpaceAlarmLevelPercentage'])),
              ),
              BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Available disk space alarm level in MB')),
              BootstrapCol(sizes: 'col-12 col-md-8', child: 
                TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Available disk space alarm level in MB'), initialValue: nvl(_bean['availableDiskSpaceAlarmLevelMB'])),
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveTab(title: 'Startup Configuration', children: [
      SkyveVBox(children: [
        SkyveBorder(title: 'Environment Settings', children: [
          SkyveVBox(children: [
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Identifier')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Identifier'), initialValue: nvl(_bean['startup_environmentIdentifier'])),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Support Email Address')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Support Email Address'), initialValue: nvl(_bean['startup_environmentSupportEmail'])),
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
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Server URL'), initialValue: nvl(_bean['startup_mailServerUrl'])),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Server Port')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Server Port'), initialValue: nvl(_bean['startup_mailPort'])),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Username')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Username'), initialValue: nvl(_bean['startup_mailUsername'])),
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
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Default Sender'), initialValue: nvl(_bean['startup_mailSender'])),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Test Mode')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  Text('CheckBox ${_bean["startup_mailBogusSend"]}'),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Test Mail Recipient')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Test Mail Recipient'), initialValue: nvl(_bean['startup_mailTestRecipient'])),
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
                  Text('Combo ${_bean["startup_mapType"]}'),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Google Maps Key')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Google Maps Key'), initialValue: nvl(_bean['startup_apiGoogleMapsKey'])),
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
                  Text('Spinner ${_bean["startup_mapZoom"]}'),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Layers')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Layers'), initialValue: nvl(_bean['startup_mapLayer'])),
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
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Google Recaptcha Site Key'), initialValue: nvl(_bean['startup_apiGoogleRecaptchaKey'])),
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
                  Text('CheckBox ${_bean["startup_accountAllowUserSelfRegistration"]}'),
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
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Account SID'), initialValue: nvl(_bean['startup_apiTwilioSID'])),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Account Auth Token')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Account Auth Token'), initialValue: nvl(_bean['startup_apiTwilioAuthToken'])),
                ),
              ]),
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Send Number')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Default Send Number'), initialValue: nvl(_bean['startup_apiTwilioDefaultSendNumber'])),
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
      final bean = await SkyveRestClient().edit('admin', 'Configuration', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
