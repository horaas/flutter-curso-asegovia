import 'package:dio/dio.dart';

// const accessToken = 'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJja3gzdGVoNmMxdjBpMnVxM251ejcwdXhpIn0.KvaIQqpWzyGy2Nt3C4QUgg';
const accessToken = '5b3ce3597851110001cf6248fcdd86772bd247ccaf6f9fe190b0965c';

class TrafficInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    options.queryParameters.addAll({
      'api_key': accessToken
    });

    super.onRequest(options, handler);
  }


}