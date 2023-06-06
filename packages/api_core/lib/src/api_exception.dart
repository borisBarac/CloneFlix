// ignore_for_file: public_member_api_docs

/// Custom API exception class
enum ApiException implements Exception {
  routeError('Could not make the API route'),
  serverError('Something went wrong on server'),
  dataError('We could not get this data'),
  connectivityError('Can not access network');

  const ApiException(this.message);

  final String message;
}
