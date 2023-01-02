import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/views/admin/user_login_record.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';

class AdminqLoginHistoryList extends StatefulWidget {
  static const routeName = '/admin/qLoginHistoryList';

  const AdminqLoginHistoryList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminqLoginHistoryListState();
  }
}

class _AdminqLoginHistoryListState extends State<AdminqLoginHistoryList> {
  bool _loaded = false;
  List<dynamic> _rows = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    const delete = SizedBox(
      width: 45.0,
      height: 70.0,
      child:
          Center(child: Icon(Icons.delete, color: Colors.white, size: 40.0)));

    return SkyveView.responsiveView(
        context,
        AdminqLoginHistoryList.routeName,
        'Login History',
        Visibility(
            visible: _loaded,
            replacement: const Center(child: CircularProgressIndicator()),
            child: Stack(children: [
              ListView.builder(
                  itemCount: _rows.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        key: Key(_rows[index]['bizId']),
                        background: Container(
                            color: Colors.red,
                            child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: const [delete, delete])),
                        onDismissed: (direction) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: SizedBox(
                                      height: 50.0,
                                      child: Center(child: Text('Deleted')))));
                        },
                        child: Card(
                            child: ListTile(
                                title: Text(nvl(_rows[index]['userName'])),
                                subtitle: Text("Test"),
                                trailing: const Icon(Icons.chevron_right),
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      AdminUserLoginRecord.routeName,
                                      arguments: _rows[index]['bizId']);
                                })));
                  }),
              Positioned(
                bottom: 40.0,
                right: 40.0,
                child: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.pushNamed(context, AdminUserLoginRecord.routeName);
                    }),
              )
            ])));
  }

  void _load() async {
    final rows = await SkyveRestClient().query('admin', 'qLoginHistory', 0, 75);
    setState(() {
      _rows = rows;
      _loaded = true;
    });
  }
}
