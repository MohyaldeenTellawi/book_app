


 import 'package:bookapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type> {
  Future<Either<Failure,Type>> call ();
 }