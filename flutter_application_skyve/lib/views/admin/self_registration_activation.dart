import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminSelfRegistrationActivation extends StatefulWidget {
  static const routeName = '/admin/SelfRegistrationActivation';

  const AdminSelfRegistrationActivation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminSelfRegistrationActivationState();
  }
}

class _AdminSelfRegistrationActivationState extends State<AdminSelfRegistrationActivation> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminSelfRegistrationActivation.routeName,
        _bean['_title'],
        Visibility(
            visible: (_bean['bizId'] != null),
            replacement: const Center(child: CircularProgressIndicator()),
            child: SingleChildScrollView(
                child: Column(
                    children: [
                        Wrap(children: [
  SkyveBorder(title: 'Account Activated Successfully', children: [
    SkyveForm(children: [
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          const Text('Blurb'),
        ),
      ]),
    ]),
  ]),
  SkyveBorder(title: 'Account Previously Activated', children: [
    SkyveForm(children: [
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          const Text('Blurb'),
        ),
      ]),
    ]),
  ]),
  SkyveBorder(title: 'Your activation code has expired', children: [
    SkyveForm(children: [
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          const Text('Blurb'),
        ),
      ]),
    ]),
  ]),
  SkyveBorder(title: 'Invalid Access', children: [
    SkyveForm(children: [
      BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
        BootstrapCol(sizes: 'col-12 col-md-8', child: 
          const Text('Blurb'),
        ),
      ]),
    ]),
  ]),
]),

                    ]))));
  }

  void _load(String? bizId) async {
    if (_bean['bizId'] == null) {
      final bean = await SkyveRestClient().edit('admin', 'SelfRegistrationActivation', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
