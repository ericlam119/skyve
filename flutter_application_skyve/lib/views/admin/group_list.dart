import 'package:flutter_application_skyve/util/skyve_rest_client.dart';
import 'package:flutter_application_skyve/views/admin/group.dart';
import 'package:flutter_application_skyve/widgets/skyve_view.dart';
import 'package:flutter/material.dart';

class AdminGroupList extends StatefulWidget {
  static const routeName = '/admin/GroupList';

  const AdminGroupList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminGroupListState();
  }
}

class _AdminGroupListState extends State<AdminGroupList> {
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
        AdminGroupList.routeName,
        'All Groups',
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
                                title: Text(nvl(_rows[index]['name'])),
                                subtitle: Text("Test"),
                                trailing: const Icon(Icons.chevron_right),
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      AdminGroup.routeName,
                                      arguments: _rows[index]['bizId']);
                                })));
                  }),
              Positioned(
                bottom: 40.0,
                right: 40.0,
                child: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.pushNamed(context, AdminGroup.routeName);
                    }),
              )
            ])));
  }

  void _load() async {
    final rows = await SkyveRestClient().query('admin', 'Group', 0, 75);
    setState(() {
      _rows = rows;
      _loaded = true;
    });
  }
}
