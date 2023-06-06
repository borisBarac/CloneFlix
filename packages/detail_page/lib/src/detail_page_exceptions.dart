// ignore_for_file: public_member_api_docs

enum DetailPageException implements Exception {
  couldNotMakeDetails('We could not find details for this item');

  const DetailPageException(this.message);

  final String message;
}
