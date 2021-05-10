String xuLyHttp(String http) {
  var link = http.split(':');
  return 'https' + link[1];
}
