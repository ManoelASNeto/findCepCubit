import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_cep_cubit/di.dart';
import 'package:via_cep_cubit/features/find_cep/presentation/cubit/find_cep_cubit.dart';
import 'features/find_cep/presentation/pages/cep_search_page.dart';
import 'di.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = di.sl<FindCepCubit>();
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => cubit,
        child: CepSearchPage(
          findCepCubit: cubit,
        ),
      ),
    );
  }
}
