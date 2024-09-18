import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CepSearchPage extends StatelessWidget {
  final cepEC = TextEditingController();
  CepSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 70),
              child: Text(
                'Buscador de CEP',
                style: TextStyle(
                  fontFamily: 'SofadiOne',
                  fontSize: 30,
                ),
              ),
            ),
            const Text(
              'Insira um cep do territorio Brasileiro para obter informações',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Digite o CEP',
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 10,
              ),
              child: const Text('Pesquisar'),
            ),
          ],
        ),
      ),
      // body: BlocBuilder<FindCepCubit, FindCepState>(
      //   builder: (context, state) {
      //     if (state is FindCepInitial) {
      //       return CepInitialStateWidget(state: state);
      //     }

      //     return SizedBox(
      //       child: Column(
      //         children: [
      //           Text('lalalalalalala'),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
