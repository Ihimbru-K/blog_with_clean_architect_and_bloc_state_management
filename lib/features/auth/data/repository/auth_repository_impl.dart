//Implementation of interface defined in domain layer
import 'package:bloggy/core/error/exceptions.dart';
import 'package:bloggy/core/error/failure.dart';
import 'package:bloggy/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:bloggy/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';


//calls signup function from from the auth_remote data source
class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      {required String name, required String email, required String password}) async {
    //when we call remote data source method it throws a server exception so it must be handled
    //with this try catch block otherwise it will produce a runtime error
    try {
      final userId = await remoteDataSource.SignUpWithEmailPassword(
        name: name, email: email, password: password,);

   return right(userId);  //from the fpdart package to return that an operation successfully happened


      // it gives the e the type of serverexception so we can access the message value from the e
    } on ServerException catch (e) {

      return left(Failure(e.message));
    }
  }

}