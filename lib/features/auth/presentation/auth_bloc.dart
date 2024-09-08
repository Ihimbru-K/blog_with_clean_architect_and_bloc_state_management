// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/use_cases/user_signup.dart';

part 'auth_event.dart';

part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp; //bloc depends on use cases
  AuthBloc({required UserSignUp userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit)  async {
    final res = await _userSignUp(UserSignUpParams(email: event.email, password: event.password, name: event.name,));

    res.fold((l) => emit(AuthFailure(l.msg)), (uid)=> emit(AuthSuccess(uid)));
    });

    // catch auth signup event is caught then a function that calls the signup process begins
  }
}
