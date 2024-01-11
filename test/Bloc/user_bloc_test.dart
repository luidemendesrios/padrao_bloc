import 'package:flutter_test/flutter_test.dart';
import 'package:padrao_bloc/Bloc/user_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {

  group('UserBloc', () {
    blocTest<UserBloc, UserState>(
      'emite UserLoogerIn ao receber UserLogin',
      build: () => UserBloc(), //A função que cria uma instância do Bloc.
      act: (bloc) => bloc.add(const UserLogin('1', 'Nicolas')), //A função que envia um evento para o Bloc.
      expect: () => [const UserLoogerIn('1', 'Nicolas')],//A função que espera um resultado específico.
    );

    blocTest<UserBloc, UserState>(
      'emite UserLoogerIn com valores aleatórios ao receber UserLogin',
      build: () => UserBloc(),
      act: (bloc) => bloc.add(const UserLogin('2', 'Pedro')),
      expect: () => [isA<UserLoogerIn>()],
    );
  });

}