import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_books/data/utils/constants.dart';
import 'package:e_books/presentation/di/app_module.dart';

mixin ApiService<T extends Object> {
  abstract String apiRoute;

  Future<List<T>> getAll({
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? params,
    int? id,
  }) async {
    final dio = Dio(
      BaseOptions(
        validateStatus: (status) => true,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${AppModule.getProfileHolder().user.token}"
        },
        queryParameters: params,
      ),
    );

    final response = await dio.get('${ApiConstUrl.baseUrl}$apiRoute');
    print(response);
    if (response.statusCode != HttpStatus.ok) {
      return [];
    }
    final jsonList = response.data['data'] as List<dynamic>;
    return jsonList.map((e) => fromJson(e)).toList();
  }

  Future<T> get({
    required T Function(Map<String, dynamic>) fromJson,
    int? id,
  }) async {
    final Dio dio = Dio(
      BaseOptions(
        validateStatus: (status) => true,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${AppModule.getProfileHolder().user.token}"
        },
      ),
    );

    final response =
        await dio.get('${ApiConstUrl.baseUrl}$apiRoute/${id ?? ''}]');

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Request return error code: ${response.statusCode}');
    }

    final jsonList = response.data['data'];
    print(jsonList);
    return jsonList.runtimeType is List<T>
        ? jsonList.map((e) => fromJson(e))
        : fromJson(jsonList);
  }

  Future<void> delete(int id) async {
    final dio = Dio(
      BaseOptions(
        validateStatus: (status) => true,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${AppModule.getProfileHolder().user.token}"
        },
      ),
    );
    final response = await dio.delete('${ApiConstUrl.baseUrl}$apiRoute/$id');
    if (response.statusCode != HttpStatus.noContent) {
      throw Exception(['Error =_-']);
    }
  }

  Future<T> post({
    required T Function(Map<String, dynamic>) fromJson,
    dynamic id,
    required Map<String, dynamic> data,
  }) async {
    print('data: ${data}');
    FormData formData = FormData.fromMap(data);
    final dio = Dio(
      BaseOptions(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${AppModule.getProfileHolder().user.token}"
        },
        validateStatus: (status) => true,
      ),
    );

    print('url: ${ApiConstUrl.baseUrl}$apiRoute${id == null ? '' : '/$id'}');
    try {
      final response = await dio.post(
        '${ApiConstUrl.baseUrl}$apiRoute${id == null ? '' : '/$id'}',
        data: formData,
      );
      print('response.statusCode: ${response.statusCode}');
      if (response.statusCode != HttpStatus.ok &&
          response.statusCode != HttpStatus.created) {
        print(response.statusCode);
        print(response.statusMessage);
        print(response.data);
        print(response.data['message']);
        //throw Exception(response.data['message']).getMessage;
        throw Exception(response.data['message']);
      }
      final json = response.data;
      print(json);

      return fromJson(json['data']);
    } catch (error) {
      print(error.toString());
      throw Exception(error);
    }
  }

  Future<Map<String, dynamic>> postMap({
    required Map<String, dynamic> data,
  }) async {
    print('data: ${data}');
    FormData formData = FormData.fromMap(data);
    final dio = Dio(
      BaseOptions(
        headers: {"Accept": "application/json"},
        validateStatus: (status) => true,
      ),
    );

    print('url: ${ApiConstUrl.baseUrl}$apiRoute');
    try {
      final response = await dio.post(
        '${ApiConstUrl.baseUrl}$apiRoute',
        data: formData,
      );
      print('response.statusCode: ${response.statusCode}');
      if (response.statusCode != HttpStatus.ok &&
          response.statusCode != HttpStatus.created) {
        print(response.statusCode);
        print(response.statusMessage);
        print(response.data);
        print(response.data['message']);
        //throw Exception(response.data['message']).getMessage;
        throw Exception(response.data['message']);
      }
      return response.data;
    } catch (error) {
      print(error.toString());
      throw Exception(error);
    }
  }

  Future<T> put({
    required T Function(Map<String, dynamic>) fromJson,
    dynamic id,
    required Map<String, dynamic> data,
  }) async {
    print('data: ${data}');
    data.addAll({
      '_method': 'PUT',
    });
    FormData formData = FormData.fromMap(data);
    final dio = Dio(
      BaseOptions(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${AppModule.getProfileHolder().user.token}"
        },
        validateStatus: (status) => true,
      ),
    );

    print('url: ${ApiConstUrl.baseUrl}$apiRoute${id == null ? '' : '/$id'}');
    try {
      final response = await dio.post(
        '${ApiConstUrl.baseUrl}$apiRoute${id == null ? '' : '/$id'}',
        data: formData,
      );
      print('response.statusCode: ${response.statusCode}');
      if (response.statusCode != HttpStatus.ok &&
          response.statusCode != HttpStatus.created) {
        throw Exception(['Error =_-']);
      }
      final json = response.data;
      print(json);

      return fromJson(json);
    } catch (error) {
      print(error.toString());
      throw Exception(error);
    }
  }
}
