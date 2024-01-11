import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:padrao_bloc/Bloc/user_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplicando o conceito do Bloc'),
        ),
        body: SizedBox.expand(
          child: BlocProvider(
            create: (context) => UserBloc(),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserInitial) {
                  return  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Usuário não logado'),
                      ElevatedButton(
                          onPressed: () => context.read<UserBloc>().add(
                           const UserLogin('1', 'Nicolas'),
                          )
                          , child: const Text('Mudar valor')),
                    ],
                  );
                }
                if (state is UserLoogerIn) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Id Usuario: ${state.userId}'),
                      const SizedBox(height: 16,),

                      Text('Nome: ${state.userName}'),
                      const SizedBox(height: 32,),

                      ElevatedButton(
                          onPressed: () {
                            var nrg = Random();
                            context.read<UserBloc>().add(
                            UserLogin(
                              nrg.nextInt(100).toString(),
                               'Pedro'
                               ),
                            );
                          },child: const Text('Mudar valor')
                          ),   
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
