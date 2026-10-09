import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:loan_calculator/src/core/network/dio_client.dart';
import 'package:loan_calculator/src/core/storage/shared_preferences_service.dart';
import 'package:loan_calculator/src/core/theme/app_theme.dart';
import 'package:loan_calculator/src/core/theme/cubit/theme_cubit.dart';
import 'package:loan_calculator/src/data/datasources/export_datasources.dart';
import 'package:loan_calculator/src/data/datasources/local/loan/loan_local_data_source.dart';
import 'package:loan_calculator/src/data/datasources/local/loan/loan_local_data_source_impl.dart';
import 'package:loan_calculator/src/data/datasources/local/theme/theme_local_data_source.dart';
import 'package:loan_calculator/src/data/datasources/local/theme/theme_local_data_source_impl.dart';
import 'package:loan_calculator/src/data/repositories/export_repositories_impls.dart';
import 'package:loan_calculator/src/data/repositories/theme/theme_repository_impl.dart';
import 'package:loan_calculator/src/domain/repositories/loan/loan_repository.dart';
import 'package:loan_calculator/src/domain/repositories/theme/theme_repository.dart';
import 'package:loan_calculator/src/domain/use_cases/loan/loan_use_cases.dart';
import 'package:loan_calculator/src/presentation/cubit/loan/get_saved_loan_detail/get_saved_loan_detail_cubit.dart';
import 'package:loan_calculator/src/presentation/cubit/loan/send_loan_detail/send_loan_detail_cubit.dart';
import 'package:loan_calculator/src/presentation/view/calculator_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part './src/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  await init(preferences: preferences);

  final directory = await getApplicationDocumentsDirectory();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => injector<ThemeCubit>()),
        BlocProvider<GetSavedLoanDetailCubit>(
          create: (context) =>
              injector<GetSavedLoanDetailCubit>()..getSavedLoanDetail(),
        ),
        BlocProvider<SendLoanDetailCubit>(
          create: (context) => injector<SendLoanDetailCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                themeMode: themeState.themeMode,
                theme: AppTheme.lightTheme,
                home: CalculatorView(),
                darkTheme: AppTheme.darkTheme,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
