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
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminUserDashboard extends StatefulWidget {
  static const routeName = '/admin/UserDashboard';

  const AdminUserDashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminUserDashboardState();
  }
}

class _AdminUserDashboardState extends State<AdminUserDashboard> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminUserDashboard.routeName,
        _bean['_title'],
        Visibility(
            visible: (_bean['bizId'] != null),
            replacement: const Center(child: CircularProgressIndicator()),
            child: SingleChildScrollView(
                child: Column(
                    children: [
                        Wrap(children: [
  SkyveVBox(children: [
    SkyveHBox(children: [
      SkyveBorder(title: 'Favourites - click to ...', children: [
        SkyveVBox(children: [
          const Text('ListRepeater'),
        ]),
      ]),
      SkyveBorder(title: 'My Details', children: [
        SkyveForm(children: [
          BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
            BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('User Name')),
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'User Name'), initialValue: nvl(_bean['currentUser_userName'])),
            ),
          ]),
          BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
            BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Name')),
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Name'), initialValue: nvl(_bean['currentUser_contact_name'])),
            ),
          ]),
          BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
            BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Email')),
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Email'), initialValue: nvl(_bean['currentUser_contact_email1'])),
            ),
          ]),
          BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
            BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Mobile')),
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Mobile'), initialValue: nvl(_bean['currentUser_contact_mobile'])),
            ),
          ]),
          BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              const SkyveSpacer(),
            ),
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              const SkyveButton(name: 'UpdateMyDetails', label: 'Save'),
            ),
          ]),
        ]),
      ]),
    ]),
  ]),
  SkyveBorder(title: 'My Activity', children: [
    SkyveHBox(children: [
      const SkyveLabel('chart'),
      const SkyveLabel('chart'),
    ]),
  ]),
  SkyveBorder(title: 'My Jobs', children: [
    SkyveVBox(children: [
      const Text('ListGrid'),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('admin', 'UserDashboard', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
