part of '../main.dart';

final injector = GetIt.instance;

Future<void> init({required SharedPreferences preferences}) async {
  injector
    //* Network
    ..registerLazySingleton<DioClient>(DioClient.new)

    //* Storage
    ..registerLazySingleton<SharedPreferencesService>(
          () => SharedPreferencesService(preferences),
    )

    //* Data Sources
    ..registerLazySingleton<LoanRemoteDataSource>(
      () => LoanRemoteDataSourceImpl(injector()),
    )
    ..registerLazySingleton<LoanLocalDataSource>(
      () => LoanLocalDataSourceImpl(injector()),
    )
    ..registerLazySingleton<ThemeLocalDataSource>(
        () => ThemeLocalDataSourceImpl(injector())
    )

    //* Repositories
    ..registerLazySingleton<LoanRepository>(
      () => LoanRepositoryImpl((injector()), injector()),
    )
    ..registerLazySingleton<ThemeRepository>(
        () => ThemeRepositoryImpl(injector())
    )

    //* UseCases
    ..registerLazySingleton<LoanUseCases>(() => LoanUseCases(injector()))

    //* Cubits
    ..registerLazySingleton<ThemeCubit>(() => ThemeCubit(injector()))
    ..registerLazySingleton<GetSavedLoanDetailCubit>(
        () => GetSavedLoanDetailCubit(injector())
    )
    ..registerLazySingleton<SendLoanDetailCubit>(
      () => SendLoanDetailCubit(injector()),
    );
}
