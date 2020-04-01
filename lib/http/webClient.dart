import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'interceptors/loggingInterceptor.dart';

final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

class WebClient {

}