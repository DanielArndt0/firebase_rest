import 'types/Precondition.dart';

class FirestoreConstants {
  static const String firestoreEndpoint = 'https://firestore.googleapis.com';
  // ignore: unused_field
  static const String _v1 = 'v1';
  // ignore: unused_field
  static const String _v1beta1 = 'v1beta1';
  // ignore: unused_field
  static const String _v1beta2 = 'v1beta2';

  static String _params({
    required String key,
    required List<String>? values,
  }) =>
      values != null
          ? values.map((e) => e.isNotEmpty ? '$key=$e' : '').join('&')
          : '';

  static String _baseEndpointWithoutParams({
    required String projectId,
    required String documentPath,
    required String databaseId,
    String? discoveryDocument = _v1beta1,
  }) =>
      '$firestoreEndpoint/'
      '$discoveryDocument/'
      'projects/$projectId/'
      'databases/$databaseId/'
      'documents/$documentPath';

  static String baseEndpoint({
    required String projectId,
    required String documentPath,
    required String databaseId,
    String? discoveryDocument = _v1beta1,
    List<String>? params,
  }) {
    params?.removeWhere((element) => element.isEmpty);
    return '${_baseEndpointWithoutParams(
      projectId: projectId,
      documentPath: documentPath,
      databaseId: databaseId,
    )}'
        '?${params != null ? params.join('&') : ''}';
  }

  static String createProjectEndpoint({
    required String projectId,
    required String documentPath,
    required String documentId,
    String? databaseId = '(default)',
  }) =>
      baseEndpoint(
        projectId: projectId,
        documentPath: documentPath,
        databaseId: databaseId!,
        params: ['documentId=$documentId'],
      );

  static String getEndpoint({
    required String projectId,
    required String documentPath,
    String? databaseId = '(default)',
    List<String>? fields,
    String? transaction,
    String? readTime,
  }) =>
      baseEndpoint(
        projectId: projectId,
        documentPath: documentPath,
        databaseId: databaseId!,
        params: [_params(key: 'mask.fieldPaths', values: fields)],
      );

  static String patchEndpoint({
    required String projectId,
    required String documentPath,
    String? databaseId = '(default)',
    List<String>? fields,
    Precondition? precondition,
  }) {
    String exists = '';
    String updateTime = '';
    if (precondition != null) {
      exists = precondition.exists != null
          ? 'currentDocument.exists=${precondition.exists}'
          : '';
      updateTime = precondition.updateTime != null
          ? 'currentDocument.updateTime=${precondition.updateTime}'
          : '';
    }
    return baseEndpoint(
      projectId: projectId,
      documentPath: documentPath,
      databaseId: databaseId!,
      params: [
        _params(key: 'mask.fieldPaths', values: fields),
        _params(key: 'updateMask.fieldPaths', values: fields),
        exists,
        updateTime,
      ],
    );
  }

  static String deleteEndpoint({
    required String projectId,
    required String documentPath,
    String? databaseId = '(default)',
    Precondition? precondition,
  }) {
    String exists = '';
    String updateTime = '';
    if (precondition != null) {
      exists = precondition.exists != null
          ? 'currentDocument.exists=${precondition.exists}'
          : '';
      updateTime = precondition.updateTime != null
          ? 'currentDocument.updateTime=${precondition.updateTime}'
          : '';
    }

    return baseEndpoint(
      projectId: projectId,
      documentPath: documentPath,
      databaseId: databaseId!,
      params: [
        exists,
        updateTime,
      ],
    );
  }

  //TODO
  // static String listEndpoint({
  //   required String projectId,
  //   required String documentPath,
  //   String? databaseId = '(default)',
  //   int? pageSize = 10,
  //   String? pageToken,
  //   String? orderBy,
  //   List<String>? fields,
  //   bool? showMissing = false,
  //   String? transaction,
  //   String? readTime,
  // }) {
  //   String currentDocument = '';
  //   return 'https://firestore.googleapis.com/v1beta1/projects/$projectId/databases/$databaseId/documents/$documentPath?$currentDocument';
  // }
}
