

import 'package:teslo_shop_mobile/features/auth/infrastructure/infrastructure.dart';
import '../../domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {

// Se importan el datasource
         
  final AuthDataSource  dataSource;

  AuthRepositoryImpl({
    AuthDataSource ? dataSource
  })  : dataSource  = dataSource ?? AuthDataSourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return  dataSource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    return  dataSource.register(email, password, fullName);
  }
}