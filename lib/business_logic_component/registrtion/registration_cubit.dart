import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../data/models/session.dart';
import '../../data/models/user.dart';
import '../../data/repository/registration_repositorys.dart';

part  '../registrtion/registration_states.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationRepository registrationRepository;

  RegistrationCubit(this.registrationRepository) : super(InitialSession());

  void signUp(User user) => registrationRepository
      .signUp(user)
      .then((value) => emit(SessionLoaded(value)));

  void sendCodeToUserPhone(String phone, countryCode) => registrationRepository
      .sendCodeToUserPhone(phone, countryCode)
      .then((value) => (value) ? emit(CodeSent()) : emit(CodeSendingIssue()));

  void codeConfirmation(String phone, String countryKey, String code) =>
      registrationRepository.confirmCode(phone, countryKey, code).then(
          (value) => (value == 200)
              ? emit(CodeConfirmed())
              : emit(CodeConfirmationIssue(value)));

  void signIn(User user) => registrationRepository
      .signIn(user)
      .then((value) => emit(SessionLoaded(value)));




}
