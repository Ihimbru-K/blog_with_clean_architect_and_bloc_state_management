import 'package:bloggy/core/error/failure.dart';
import 'package:bloggy/core/use_case/use_case.dart';
import 'package:bloggy/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

//created user signup parameters class  since use case takes 3 parameters

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository authRepository;

  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignUpParams, params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;


  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
