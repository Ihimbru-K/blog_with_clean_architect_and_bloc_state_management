import 'package:bloggy/core/error/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> SignUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> LoginWithEmailPassword({
    required String email,
    required String password,
  });
}

// creating class that implements interface above
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  //dependency injection helps us to avoid dependency bw class and supabase and for testing
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<String> LoginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
      );
      if(response.user == null){
        throw ServerException('User is null');
      }
      return response.user!.id;

    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> SignUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
     final response =  await supabaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});
     if(response.user == null){
       throw ServerException('User is null');
     }
     return response.user!.id;
    }


    catch (e) {
      throw ServerException(e.toString());

    }
  }
}
