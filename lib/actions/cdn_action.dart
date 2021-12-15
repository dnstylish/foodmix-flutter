class CDNAction {

  String cdn(String url) {
    return RegExp('^(http|https)').hasMatch(url) ? url : 'http://localhost:4000$url';
  }
}