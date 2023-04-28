
import 'package:vinhcine/src/features/authentication/domain/data/remote/dtos/register_response.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register_mapper.dart';

class RegisterMapper {
  static RegisterModel mapToModel(RegisterResponse response) {
    return response.toModel();
  }
}
