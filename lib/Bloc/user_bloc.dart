import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//3
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  UserBloc(): super(UserInitial()){
    on<UserLogin>((event,emit){
      emit(UserLoogerIn(event.userId,event.userName));
    });
  }
}