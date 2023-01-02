import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_application_skyve/widgets/skyve_border.dart';
import 'package:flutter_application_skyve/widgets/skyve_button.dart';
import 'package:flutter_application_skyve/widgets/skyve_form.dart';
import 'package:flutter_application_skyve/widgets/skyve_hbox.dart';
import 'package:flutter_application_skyve/widgets/skyve_label.dart';
import 'package:flutter_application_skyve/widgets/skyve_toolbar.dart';
import 'package:flutter_application_skyve/widgets/skyve_vbox.dart';


class AdminJobSchedule extends StatefulWidget {
  static const routeName = '/admin/JobSchedule';

  const AdminJobSchedule({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminJobScheduleState();
  }
}

class _AdminJobScheduleState extends State<AdminJobSchedule> {
  Map<String, dynamic> _bean = {'_title': 'Loading'};

  @override
  Widget build(BuildContext context) {
    final bizId = ModalRoute.of(context)!.settings.arguments as String?;
    _load(bizId);
    return SkyveView.responsiveView(
        context,
        AdminJobSchedule.routeName,
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
      const SkyveButton(name: 'Cancel', label: 'Cancel'),
      const SkyveButton(name: 'Delete', label: 'Delete'),
      const SkyveButton(name: 'null', label: 'Schedule Job for Now'),
    ])),
  ]),
  SkyveVBox(children: [
    SkyveBorder(title: 'Job Details', children: [
      SkyveForm(children: [
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Job To Run')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('Combo ${_bean["jobName"]}'),
          ),
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Run As')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            Text('LookupDescription ${_bean["runAs"]}'),
          ),
        ]),
      ]),
    ]),
    SkyveBorder(title: 'When To Execute', children: [
      SkyveVBox(children: [
        SkyveForm(children: [
          BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
            BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Disabled')),
            BootstrapCol(sizes: 'col-12 col-md-8', child: 
              Text('CheckBox ${_bean["disabled"]}'),
            ),
          ]),
        ]),
        SkyveHBox(children: [
          SkyveBorder(title: 'Minutes', children: [
            SkyveVBox(children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Radio ${_bean["allMinutes"]}'),
                  ),
                ]),
              ]),
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('00')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute0"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('12')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute12"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('24')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute24"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('36')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute36"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('48')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute48"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('01')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute1"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('13')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute13"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('25')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute25"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('37')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute37"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('49')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute49"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('02')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute2"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('14')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute14"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('26')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute26"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('38')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute38"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('50')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute50"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('03')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute3"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('15')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute15"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('27')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute27"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('39')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute39"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('51')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute51"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('04')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute4"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('16')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute16"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('28')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute28"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('40')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute40"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('52')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute52"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('05')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute5"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('17')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute17"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('29')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute29"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('41')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute41"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('53')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute53"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('06')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute6"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('18')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute18"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('30')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute30"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('42')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute42"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('54')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute54"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('07')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute7"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('19')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute19"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('31')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute31"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('43')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute43"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('55')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute55"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('08')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute8"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('20')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute20"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('32')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute32"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('44')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute44"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('56')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute56"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('09')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute9"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('21')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute21"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('33')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute33"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('45')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute45"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('57')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute57"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('10')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute10"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('22')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute22"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('34')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute34"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('46')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute46"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('58')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute58"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('11')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute11"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('23')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute23"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('35')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute35"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('47')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute47"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('59')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["minute59"]}'),
                  ),
                ]),
              ]),
            ]),
          ]),
          SkyveBorder(title: 'Hours', children: [
            SkyveVBox(children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Radio ${_bean["allHours"]}'),
                  ),
                ]),
              ]),
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('00')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour0"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('12')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour12"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('01')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour1"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('13')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour13"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('02')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour2"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('14')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour14"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('03')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour3"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('15')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour15"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('04')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour4"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('16')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour16"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('05')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour5"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('17')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour17"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('06')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour6"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('18')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour18"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('07')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour7"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('19')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour19"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('08')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour8"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('20')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour20"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('09')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour9"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('21')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour21"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('10')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour10"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('22')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour22"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('11')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour11"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('23')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["hour23"]}'),
                  ),
                ]),
              ]),
            ]),
          ]),
          SkyveBorder(title: 'Days', children: [
            SkyveVBox(children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Radio ${_bean["allDays"]}'),
                  ),
                ]),
              ]),
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('01')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day1"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('11')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day11"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('21')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day21"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('31')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day31"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('02')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day2"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('12')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day12"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('22')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day22"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('03')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day3"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('13')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day13"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('23')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day23"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('04')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day4"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('14')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day14"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('24')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day24"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('05')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day5"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('15')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day15"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('25')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day25"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('06')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day6"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('16')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day16"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('26')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day26"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('07')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day7"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('17')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day17"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('27')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day27"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('08')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day8"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('18')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day18"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('28')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day28"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('09')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day9"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('19')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day19"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('29')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day29"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('10')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day10"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('20')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day20"]}'),
                  ),
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('30')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["day30"]}'),
                  ),
                ]),
              ]),
            ]),
          ]),
          SkyveBorder(title: 'Months', children: [
            SkyveVBox(children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Radio ${_bean["allMonths"]}'),
                  ),
                ]),
              ]),
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Jan')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month1"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Feb')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month2"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Mar')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month3"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Apr')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month4"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('May')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month5"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Jun')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month6"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Jul')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month7"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Aug')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month8"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Sep')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month9"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Oct')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month10"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Nov')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month11"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Dec')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["month12"]}'),
                  ),
                ]),
              ]),
            ]),
          ]),
          SkyveBorder(title: 'Weekdays', children: [
            SkyveVBox(children: [
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('Radio ${_bean["allWeekdays"]}'),
                  ),
                ]),
              ]),
              SkyveForm(children: [
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Sun')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["weekday1"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Mon')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["weekday2"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Tue')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["weekday3"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Wed')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["weekday4"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Thu')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["weekday5"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Fri')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["weekday6"]}'),
                  ),
                ]),
                BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
                  BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Sat')),
                  BootstrapCol(sizes: 'col-12 col-md-8', child: 
                    Text('CheckBox ${_bean["weekday7"]}'),
                  ),
                ]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]),
    SkyveBorder(title: 'Date Range To Execute', children: [
      SkyveForm(children: [
        BootstrapRow(decoration: BoxDecoration(border: Border.all(color: Colors.transparent, width: 10.0)), children: [
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('Start Time')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Start Time'), initialValue: nvl(_bean['startTime'])),
          ),
          BootstrapCol(sizes: 'col-12 col-md-4', invisibleForSizes: 'xs sm', child: const SkyveLabel('End Time')),
          BootstrapCol(sizes: 'col-12 col-md-8', child: 
            TextFormField(decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'End Time'), initialValue: nvl(_bean['endTime'])),
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
      final bean = await SkyveRestClient().edit('admin', 'JobSchedule', bizId);
      setState(() {
        _bean = bean;
      });
    }
  }
}
