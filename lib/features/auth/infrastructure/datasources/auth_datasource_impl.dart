
import 'package:dio/dio.dart';
import 'package:teslo_shop_mobile/config/config.dart';
import 'package:teslo_shop_mobile/features/auth/infrastructure/infrastructure.dart';

import '../../domain/domain.dart';

class AuthDataSourceImpl extends AuthDataSource {

  final dio  = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl
    )
  );

  @override
  Future<User> checkAuthStatus(String token) async {

    try {
      final response = await dio.get('/auth/check-status', 
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          }
        ) 
      ); 

      final user = UserMapper.userJsonEntity(response.data);
      return user;
    } on DioException catch (e){
      if( e.response?.statusCode == 401 ) { 
        throw CustomError(message: 'Token incorrecto');
       }
      if ( e.type == DioExceptionType.connectionTimeout ) throw CustomError(message: 'Revisar conexion a internet');
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> login(String email, String password) async {

    try {
      final response = await dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      final user = UserMapper.userJsonEntity( response.data);
      return user;

    } on DioException catch (e){
      if( e.response?.statusCode == 401 ) { 
        throw CustomError(message: e.response?.data["message "] ?? 'Credenciales incorrectas');
       }
      if ( e.type == DioExceptionType.connectionTimeout ) throw CustomError(message: 'Revisar conexion a internet');
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    // TODO: implement register
    throw UnimplementedError();
  }
}