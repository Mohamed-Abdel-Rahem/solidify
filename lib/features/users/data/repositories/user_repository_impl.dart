import 'package:clean_arch/core/connection/network_info.dart';
import 'package:clean_arch/core/errors/expentions.dart';
import 'package:clean_arch/core/errors/failure.dart';
import 'package:clean_arch/core/params/user_params.dart';
import 'package:clean_arch/features/users/data/datasources/local/user_local_data_source.dart';
import 'package:clean_arch/features/users/data/datasources/remote/user_remote_data_source.dart';
import 'package:clean_arch/features/users/domain/entities/user_entity.dart';
import 'package:clean_arch/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  //! Properties
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSourcer;
  final UserLocalDataSource localDataSource;
  //! Constructor
  UserRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSourcer,
    required this.localDataSource,
  });
  //! Methods
  @override
  //! هنا لو تاخد بالك انو مستني اينتيتي واحنا بنرجع مودل بس علشان احنا مخلين
  //! المودل يأكستند من الاينتيتي فاهو هريجع كل الداتا وهيباصي للينتيتي الي محتاجه بس
  Future<Either<Failure, UserEntity>> getUser({
    required UserParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remoteDataSourcer.getUser(params);
        localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await localDataSource.getLastUser();
        return Right(localUser!);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
