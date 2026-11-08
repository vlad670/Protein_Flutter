import 'package:dio/dio.dart';
import 'package:protein/features/protein/data/dto/uniprot_entry_dto.dart';
import 'package:protein/features/protein/data/dto/uniprot_search_page_dto.dart';

final class ProteinApi {
  const ProteinApi(this._dio);

  final Dio _dio;

  Future<UniProtSearchPageDto> searchProteins({required String query}) async {
    final json = await _getJson(
      '/uniprotkb/search',
      queryParameters: {
        'query': query,
        'size': 20,
        },
    );
    return UniProtSearchPageDto.fromJson(json);
  }

  Future<UniProtEntryDto> getProtein(String accession) async =>
      UniProtEntryDto.fromJson(await _getJson('/uniprotkb/$accession'));

  Future<Map<String, dynamic>> _getJson(
    String path, {
    Map<String, Object>? queryParameters,
  }) async {
    final params = <String, Object>{
      'format': 'json',
      if (queryParameters != null) ...queryParameters,
    };
    final response = await _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: params,
    );
    return response.data ?? (throw const FormatException('Пустой ответ'));
  }
}
