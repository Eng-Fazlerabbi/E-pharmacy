import 'package:epharmacy/models/ip_info.dart';
import 'package:http/http.dart';


class IPInfo {
  static Future<IpInfoModel?> ipInfo() async {
    var headersIP = {'User-Agent': 'PostmanRuntime/7.26.10'};

    var requestIP = Request('GET', Uri.parse('https://api.ipify.org/'));

    requestIP.headers.addAll(headersIP);

    StreamedResponse responseIP = await requestIP.send();

    if (responseIP.statusCode == 200) {
      String ip = await responseIP.stream.bytesToString();
      print('IP: ' + ip);

      var headers = {
        'Content-Type': 'application/json',
        'User-Agent': 'PostmanRuntime/7.26.10',
      };

      String url = 'https://ipapi.co/$ip/json/';

      var request = Request('GET', Uri.parse(url));

      request.headers.addAll(headers);

      StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String body = await response.stream.bytesToString();

        IpInfoModel data = IpInfoMethod.ipInfoModelFromJson(body);

        print(body);
        return data;
      } else {
        print(response.reasonPhrase);
        return null;
      }
    } else {
      print(responseIP.reasonPhrase);
      return null;
    }
  }
}
