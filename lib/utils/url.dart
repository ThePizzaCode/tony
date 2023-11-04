class AppURL {
  static const String liveBaseURL = 'https://api.tonyapp.tech';
  static const String devBaseURL = 'http://localhost:4200';
  static const String version = 'v0';

  static String baseURL = '$liveBaseURL/$version';
}

const Map<String, String> basicHeader = <String, String>{
  'Content-Type': 'application/json',
};

Map<String, String> authHeader(String token) {
  return <String, String>{
    'Content-Type': 'application/json',
    'Authorization': token,
  };
}

String getProductImageURL(String productID, String token) {
  return '${AppURL.baseURL}/products/product/image?productID=$productID&token=$token';
}
