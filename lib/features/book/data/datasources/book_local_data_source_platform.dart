// Export the appropriate data source based on platform
export 'book_local_data_source_stub.dart'
    if (dart.library.html) 'book_local_data_source_web.dart'
    if (dart.library.io) 'book_local_data_source.dart';
