String toHost(String url) {
  // return dateFormat.format(toDateTime(timestamp));

  final uri = Uri.parse(url ?? '');
  return uri.host;
}
