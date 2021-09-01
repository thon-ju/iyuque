import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/blocs/application_bloc.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:oktoast/oktoast.dart';

class SyncDataPage extends StatefulWidget {
  const SyncDataPage({this.model, this.editable});
  final Doc model;
  final bool editable;

  @override
  SyncDataPageState createState() => SyncDataPageState();
}

class SyncDataPageState extends State<SyncDataPage> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);

    return Scaffold(
      appBar: MeAppBar(
        title: const Text('数据同步'),
      ),
      body: SafeArea(
        child: Gaps.empty,
      ),
      bottomNavigationBar: Expanded(
        child: ElevatedButton(
          child: Text('同步'),
          onPressed: () {
            bloc.sendAppEvent(EventConfig.event_sync_begin);
            showToast('后台自动同步');
          },

        ),
      ),
    );
  }
}
