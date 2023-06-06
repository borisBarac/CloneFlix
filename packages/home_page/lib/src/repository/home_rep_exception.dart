// ignore_for_file: public_member_api_docs

enum HomePageException implements Exception {
  couldNotGetData('Could not download the data'),
  domainException('Could not make the home page');

  const HomePageException(this.message);

  final String message;
}
