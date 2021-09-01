
//模拟网络请求数据
import 'package:iyuque/model/models.dart';

class HttpUtils {
  Future<SplashModel> getSplash() {
    return Future.delayed(new Duration(milliseconds: 300), () {
      return new SplashModel(
        title: '行创云',
        content: '行创云',
        url: 'https://xingcyun.com',
        imgUrl:
            'http://xingcyun.com/assets/image/0.jpg',
      );
    });
  }

  Future<ComModel> getRecItem() async {
    return Future.delayed(new Duration(milliseconds: 300), () {
      return null;
    });
  }

  Future<List<ComModel>> getRecList() async {
    return Future.delayed(new Duration(milliseconds: 300), () {
      return new List();
    });
  }
}
