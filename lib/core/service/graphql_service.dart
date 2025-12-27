import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';

class GraphQLService {
  late final GraphQLClient client;

  GraphQLService();

  /// Initialize HTTP-only GraphQL client
  Future<void> init({
    required String httpEndpoint, // Use the HTTP base URL here
  }) async {
    LoggerUtils.logInfo('Initializing HTTP GraphQL Service');

    final HttpLink httpLink = HttpLink(httpEndpoint);

    client = GraphQLClient(link: httpLink, cache: GraphQLCache());

    LoggerUtils.logInfo("HTTP GraphQL Service initialized successfully");
  }

  /// ===========================
  /// 🔵 QUERY
  /// ===========================
  Future<QueryResult> performQuery(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      LoggerUtils.logInfo('Executing GraphQL query');
      return await client.query(
        QueryOptions(
          document: gql(query),
          variables: variables ?? {},
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );
    } catch (e) {
      LoggerUtils.logError('GraphQL query error: $e');
      rethrow;
    }
  }

  /// ===========================
  /// 🟢 MUTATION
  /// ===========================
  Future<QueryResult> performMutation(
    String mutation, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      LoggerUtils.logInfo('Executing GraphQL mutation');
      return await client.mutate(
        MutationOptions(document: gql(mutation), variables: variables ?? {}),
      );
    } catch (e) {
      LoggerUtils.logError('GraphQL mutation error: $e');
      rethrow;
    }
  }
}
