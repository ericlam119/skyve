import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_tab.dart';
import 'package:flutter_application_skyve/widgets/skyve_tabpane.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminUserList extends StatefulWidget {
  static const routeName = '/admin/UserList';

  const AdminUserList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminUserListState();
  }
}

class _AdminUserListState extends State<AdminUserList> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminUserList.routeName,
        _bean['_title'],
        Visibility(
            visible: (_bean['bizId'] != null),
            replacement: const Center(child: CircularProgressIndicator()),
            child: SingleChildScrollView(
                child: Column(
                    children: [
                        Wrap(children: [
  SkyveTabPane(children: [
    SkyveTab(title: 'Users', children: [
      SkyveVBox(children: [
        const Text('ListGrid'),
      ]),
    ]),
    SkyveTab(title: 'Invite Users', children: [
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
        SkyveBorder(title: 'User Invitations', children: [
          SkyveVBox(children: [
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const Text('Blurb'),
                ),
              ]),
            ]),
            SkyveVBox(children: [
              const Text('ListMembership'),
            ]),
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const Text('Blurb'),
                ),
              ]),
            ]),
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  Text('TextArea ${_bean["userInvitiationEmailList"]}'),
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
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Default Module Name')),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  Text('Combo ${_bean["defaultModuleName"]}'),
                ),
              ]),
            ]),
            SkyveForm(children: [
              BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveButton(name: 'InviteUsers', label: 'Create and Invite Users'),
                ),
                BootstrapCol(sizes: 'col-12 col-md-8', child: 
                  const SkyveButton(name: 'CreateUsers', label: 'Create Users (no invitation)'),
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
      final bean = await SkyveRestClient().edit('admin', 'UserList', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
