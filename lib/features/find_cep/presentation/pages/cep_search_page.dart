import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_cep_cubit/features/find_cep/presentation/cubit/find_cep_cubit.dart';

class CepSearchPage extends StatelessWidget {
  final cepEC = TextEditingController();
  final FindCepCubit findCepCubit;
  final _formKey = GlobalKey<FormState>();
  CepSearchPage({super.key, required this.findCepCubit});

  String? validateCEP(String? cep) {
    if (cep == null || cep.isEmpty || cep.length < 8) {
      return 'Digite um CEP válido';
    }

    String pattern = r'^\d{5}-?\d{3}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(cep)) {
      return 'CEP inválido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://img.freepik.com/vetores-gratis/ilustracao-da-pesquisa-mundial_53876-5870.jpg?t=st=1726623795~exp=1726627395~hmac=7da819674ee7310dc1611cee1796a6c89e535129fb8f209c159c8bd984e64637&w=740'),
              fit: BoxFit.cover,
              opacity: 0.4,
            ),
          ),
          child: Form(
            key: _formKey,
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
                  'Insira um cep do território Brasileiro para obter informações',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: validateCEP,
                    controller: cepEC,
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      findCepCubit.getCep(cepEC.text);
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                  ),
                  child: const Text('Pesquisar'),
                ),
                const Spacer(),
                SizedBox(
                  height: 200,
                  child: BlocBuilder<FindCepCubit, FindCepState>(builder: (context, state) {
                    if (state is FindCepLoaded) {
                      return Column(
                        children: [
                          Text('O Cep pesquisado foi ${state.findCepEntity.cep ?? 'Não encontrado'}'),
                          Text('Logradouro: ${state.findCepEntity.logradouro}'),
                          Text('Bairro: ${state.findCepEntity.bairro}'),
                          Text('Localidade: ${state.findCepEntity.localidade}'),
                        ],
                      );
                    }
                    return const SizedBox();
                  }),
                )
              ],
            ),
          ),
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
