
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:iyuque/common/common.dart';
import 'package:iyuque/components/base_dialog.dart';
import 'package:iyuque/components/blocs/bloc_provider.dart';
import 'package:iyuque/components/blocs/main_bloc.dart';
import 'package:iyuque/model/json_data.dart';
import 'package:iyuque/net/base_resp.dart';
import 'package:iyuque/net/dio_util.dart';
import 'package:iyuque/net/http_api.dart';
import 'package:iyuque/res/colors.dart';
import 'package:iyuque/res/styles.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:oktoast/oktoast.dart';
import 'package:ota_update/ota_update.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';

import 'navigator_util.dart';

class Utils {
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';


  static String getDatetimeSimple(String datetime) {
    String format = DateUtil.yearIsEqual(DateUtil.getDateTime(datetime, isUtc: false), DateTime.now())? DateFormats.mo_d_h_m: DateFormats.y_mo_d_h_m;
    return DateUtil.formatDateStr(datetime, isUtc: false, format: format);
  }


  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getPinyin(String str) {
    return PinyinHelper.getShortPinyin(str).substring(0, 1).toUpperCase();
  }

  static Color getCircleBg(String str) {
    String pinyin = getPinyin(str);
    return getCircleAvatarBg(pinyin);
  }

  static Color getCircleAvatarBg(String key) {
    return circleAvatarMap[key];
  }

  static Color getChipBgColor(String name) {
    String pinyin = PinyinHelper.getFirstWordPinyin(name);
    pinyin = pinyin.substring(0, 1).toUpperCase();
    return nameToColor(pinyin);
  }

  static Color nameToColor(String name) {
    // assert(name.length > 1);
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }

  static String getTimeLine(BuildContext context, int timeMillis) {
//    LogUtil.e("countryCode: " +
//        Localizations.localeOf(context).countryCode +
//        "   languageCode: " +
//        Localizations.localeOf(context).languageCode);
    return TimelineUtil.format(timeMillis,
        locale: Localizations.localeOf(context).languageCode,
        dayFormat: DayFormat.Common);
  }

  static DateTime getMonthStartDate() {
    DateTime dateTime = DateTime.now();
    int year = dateTime.year;
    int month = dateTime.month;

    return DateTime(year,month,1);
  }

  static DateTime getMonthEndDate() {
    DateTime dateTime = DateTime.now();
    int year = dateTime.year;
    int month = dateTime.month;
    int days = MONTH_DAY[month];

    return DateTime(year,month,days);
  }

  static double getTitleFontSize(String title) {
    if (ObjectUtil.isEmpty(title) || title.length < 10) {
      return 18.0;
    }
    int count = 0;
    List<String> list = title.split("");
    for (int i = 0, length = list.length; i < length; i++) {
      String ss = list[i];
      if (RegexUtil.isZh(ss)) {
        count++;
      }
    }

    return (count >= 10 || title.length > 16) ? 14.0 : 18.0;
  }

  /// 0
  /// -1
  /// 1
  static int getUpdateStatus(String version) {
    String locVersion = AppConfig.version;
    int remote = int.tryParse(version.replaceAll('.', ''));
    int loc = int.tryParse(locVersion.replaceAll('.', ''));
    if (remote <= loc) {
      return 0;
    } else {
      return (remote - loc >= 2) ? -1 : 1;
    }
  }


  // ??????????????????
  static Future checkVersion(BuildContext context, bool showDialog, bool showNoneTip) async {
    PackageInfo appInfo = await PackageInfo.fromPlatform();
    Map<String, dynamic> params = {'ver': appInfo.version, 'platform': Platform.operatingSystem, 'code': appInfo.packageName};
    Version _versionModel = Version.fromJson(params);

    var resp = await DioUtil().request(Method.get, Api.VERSION_CHECK, data: params);
    Map result = resp.data['data'];
    if( result!=null && result.isNotEmpty) {
      _versionModel = Version.fromJson(result);
      if(showDialog){
        Utils.showVersionDialog(context, _versionModel);
      }
    }else if(showNoneTip){
      showToast('?????????????????????');
    }

    return _versionModel;
  }

  // ????????????????????????
  static Future showVersionDialog(BuildContext context, Version version) async {
    List<Widget> updates = List();
    if(version.remark.isNotEmpty){
      var str = version.remark.replaceAll('???', ';');
      for(String update in str.split(';')){
        if(update.isNotEmpty){
          updates.add(Row(
            children: <Widget>[
              Text(update.trim(), textAlign: TextAlign.start,)
            ],
          ));
        }
      }
    }

    showDialog(
      context: context,
      builder: (_) => BaseDialog(
        title: '?????????${version.ver}',
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          height: 120,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: updates,
            ),
          ),
        ),
        onPressed: ()async{
          if(Platform.isAndroid){
            //?????????????????????
            Navigator.pop(context);
            tryOtaUpdate(version);
          }else{
            NavigatorUtil.launchInBrowser(version.url, title: version.ver);
          }

        },
        onCancel: (){
          Navigator.of(context).pop();
        },
      ),
    );
  }

  static Future<void> tryOtaUpdate(Version version) async {
    try {
      OtaUpdate()
          .execute(version.url, destinationFilename: 'wl_flutter_${version.ver}.apk')
          .listen(
            (OtaEvent event) {
          if(event.status == OtaStatus.DOWNLOADING){
            showToast('??????????????? ${event.value}%');
          }else if(event.status == OtaStatus.INSTALLING){
            showToast('?????????...');
          }
        },
      );
    } catch (e) {
      print('??????OTA?????????????????????: $e');
    }
  }

  /// ????????????
  static void showInModalBottomSheet(BuildContext context, String value){
    showToast(value);
  }

  /// ????????????????????????Text???????????????????????????null????????????????????????????????????
  static String textData(value){
    if(value == null){
      return '--';
    } else if(value is num){
      return value != null ? value.toString() : '0';
    } else if(value is String) {
      return value;
    }
    return value.toString();
  }

  static String encode64(String text){
    return base64.encode(utf8.encode(text));
  }

  static String decode64(String text){
    return utf8.decode(base64.decode(text));
  }

  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static void requestLogout(BuildContext context, {Widget page, String pageName}) {
    showDialog(
      context: context,
      builder: (_) => BaseDialog(
        title: '??????',
        child: const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: const Text("??????????????????????????????", style: TextStyles.textSize16),
        ),
        onPressed: (){
          SpUtil.clear();

          final MainBloc bloc = BlocProvider.of<MainBloc>(context);
          bloc.clear();

          Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => route == null);
        },
      ),
    );

  }

  static int getLoadStatus(bool hasError, Object data) {
    if (hasError) return LoadStatus.fail;
    if (data == null) {
      return LoadStatus.loading;
    } else if ((data is List && data.isEmpty)
        ||(data is Map && data.isEmpty)
        ||(data is MyPage && data.rows.isEmpty)) {
      return LoadStatus.empty;
    }else {
      return LoadStatus.success;
    }
  }

  static void delData(BuildContext _context, String url, int id, {Future<void> callback(BaseResp value)}){
    showDialog(
      context: _context,
      builder: (BuildContext context) => BaseDialog(
        title: '??????',
        child: const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: const Text("????????????????????????", style: TextStyles.textSize16),
        ),
        onPressed: (){
          Map<String, dynamic> formData = {'id': id, 'deleteBy':SpUtil.getInt(Constant.keyUserId)};
          DioUtil().request(Method.post, url, data: formData).then((resp) async {
            /// ???callback???????????????callback?????????????????????????????????
            if(callback != null){
              /// ????????????
              Navigator.pop(context);
              callback(resp);
              return ;
            }

            Map<String, dynamic> map = Map<String, dynamic>.from({'refresh':true, 'info':'???????????????'});
            Navigator.pop(context);
            Navigator.pop(_context, map);
          }).catchError((e){
            if(e != null && Utils.isShowErrorMsg(e.response))
              showToast('????????????????????????.');
          });
        },
      ),
    );
  }

  static bool isShowErrorMsg(Response e){
    /// ?????????????????????toast??????
    if(e != null && e is Response && (e.statusCode == 409 || e.statusCode == 401))
      return false;
    return true;
  }

  /// ?????????????????????????????????
  static DateTime last = new DateTime.now();
  static Function throttle(Function func, { Duration wait = const Duration(seconds: 3)}){

    void f(){
      DateTime now = new DateTime.now();
      if(now.subtract(wait).isAfter(last)){
        last = now;
        func();
      }
    }
    return f;
  }

  static String getRandomString(int length){
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
