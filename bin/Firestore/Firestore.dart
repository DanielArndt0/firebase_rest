import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'FirestoreConstants.dart';
import 'types/FirestoreTypes.dart';
import 'types/Document.dart';
import 'types/Precondition.dart';

// TODO:
//
// createDocument - OK
// get - OK
// patch - OK
// delete - OK
// list
// listCollectionIds
//
// TODO:
// rollback
// runQuery
// partitionQuery
//
// TODO:
// batchGet
// batchWrite
// beginTransaction
// commit

class Firestore {
  final String projectId;

  Firestore({
    required this.projectId,
  });

  bool _validateStatusCode(Http.Response response) =>
      response.statusCode / 100 == 2;

  Future<Http.Response> createDocument({
    required String documentPath,
    required String documentId,
    Map<String, FirestoreType>? fields,
  }) async {
    final response = await Http.post(
      Uri.parse(
        FirestoreConstants.createProjectEndpoint(
          projectId: projectId,
          documentPath: documentPath,
          documentId: documentId,
        ),
      ),
      body: jsonEncode({'fields': fields}),
      headers: {
        'Content-type': 'application/json',
      },
    );
    if (_validateStatusCode(response)) {
      return response;
    }
    return Future.error(Exception(response.body));
  }

  Future<Document> getDocument({
    required String documentPath,
    List<String>? fields,
  }) async {
    final response = await Http.get(
      Uri.parse(
        FirestoreConstants.getEndpoint(
          projectId: projectId,
          documentPath: documentPath,
          fields: fields,
        ),
      ),
      headers: {
        'Content-type': 'application/json',
      },
    );
    if (_validateStatusCode(response)) {
      return Document.fromJson(jsonDecode(response.body));
    }
    return Future.error(Exception(response.body));
  }

  Future<Document> patchDocument({
    required String projectId,
    required String documentPath,
    String? databaseId = '(default)',
    Map<String, FirestoreType>? fields,
    Precondition? precondition,
  }) async {
    final response = await Http.patch(
      Uri.parse(
        FirestoreConstants.patchEndpoint(
          projectId: projectId,
          documentPath: documentPath,
          databaseId: databaseId,
          fields: fields?.keys.toList(),
          precondition: precondition,
        ),
      ),
      body: jsonEncode({'fields': fields}),
      headers: {
        'Content-type': 'application/json',
      },
    );
    if (_validateStatusCode(response)) {
      return Document.fromJson(jsonDecode(response.body));
    }
    return Future.error(Exception(response.body));
  }

  Future<Http.Response> deleteDocument({
    required String projectId,
    required String documentPath,
    String? databaseId = '(default)',
    Precondition? precondition,
  }) async {
    final response = await Http.delete(
      Uri.parse(
        FirestoreConstants.deleteEndpoint(
          projectId: projectId,
          documentPath: documentPath,
          databaseId: databaseId,
          precondition: precondition,
        ),
      ),
    );
    if (_validateStatusCode(response)) {
      return response;
    }
    return Future.error(Exception(response.body));
  }
}
