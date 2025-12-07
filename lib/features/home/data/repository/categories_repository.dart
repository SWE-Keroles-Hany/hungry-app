import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/home/domain/entities/categories_entity.dart';

abstract class CategoriesRepository {
  Future<Either<AppException, CategoriesEntity>> getAllCategories();
}
