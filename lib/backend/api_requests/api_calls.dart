import 'api_manager.dart';

Future<dynamic> testCall({
  String name = 'Kevin',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Test ',
    apiUrl: 'https://makerfox.api.stdlib.com/versus@dev/',
    callType: ApiCallType.GET,
    headers: {},
    params: {
      'name': name,
    },
    returnResponse: true,
  );
}
