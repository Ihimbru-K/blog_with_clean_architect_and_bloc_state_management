



//base class for other classes to inherit from
//abstract interfaces are used to define a set of methods that a class must implement
import '../../../../core/error/failure.dart';
import'package:fpdart/fpdart.dart';

abstract interface class AuthRepository{


  //Either from fpdart ( functional programming) allows us to specify what should be
  //The return data type if its a failure or a success
 Future< Either<Failure, String>> signUpWithEmailPassword({

    required String name,
    required String email,
    required String password
});

 Future< Either<Failure, String>> loginWithEmailPassword({
   required String email,
   required String password
 });




}