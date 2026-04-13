import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch/core/connection/network_info.dart';
import 'package:clean_arch/core/database/api/dio_consumer.dart';
import 'package:clean_arch/core/database/cache/cache_helper.dart';
import 'package:clean_arch/core/params/user_params.dart';
import 'package:clean_arch/features/users/data/datasources/local/user_local_data_source.dart';
import 'package:clean_arch/features/users/data/datasources/remote/user_remote_data_source.dart';
import 'package:clean_arch/features/users/data/repositories/user_repository_impl.dart';
import 'package:clean_arch/features/users/domain/entities/user_entity.dart';
import 'package:clean_arch/features/users/domain/usecases/get_user.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> eitherFailureOrUser(int id) async {
    emit(GetUserLoading());
    final faliureOrUser = await GetUser(
      userRepository: UserRepositoryImpl(
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        remoteDataSourcer: UserRemoteDataSource(api: DioConsumer(dio: Dio())),
        localDataSource: UserLocalDataSource(cache: CacheHelper()),
      ),
    ).call(params: UserParams(id: id.toString()));
    faliureOrUser.fold(
      (faliur) => emit(GetUserFailure(errMessage: faliur.errMessage)),
      (user) => emit(GetUserSuccessfully(user: user)),
    );
  }
}
