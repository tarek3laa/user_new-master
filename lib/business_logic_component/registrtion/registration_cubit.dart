import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../data/models/session.dart';
import '../../data/models/user.dart';
import '../../data/repository/registration_repositorys.dart';

part '../registrtion/registration_states.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  late final RegistrationRepository _registrationRepository;
  static final RegistrationCubit _instance = RegistrationCubit._();

  RegistrationCubit._() : super(InitialSession()) {
    _registrationRepository = RegistrationRepository();
  }

  factory RegistrationCubit() => _instance;

  void signUp(User user) => _registrationRepository.signUp(user).then((value) {
        if (value is Session)
          emit(SessionLoaded(value));
        else if (value is ErrorSession) emit(ErrorSessionState(value));
      });

  void sendCodeToUserPhone(String phone, countryCode) => _registrationRepository
      .sendCodeToUserPhone(phone, countryCode)
      .then((value) => (value) ? emit(CodeSent()) : emit(CodeSendingIssue()));

  void codeConfirmation(String phone, String countryKey, String code) =>
      _registrationRepository.confirmCode(phone, countryKey, code).then(
          (value) => (value == 200)
              ? emit(CodeConfirmed())
              : emit(CodeConfirmationIssue(value)));

  void signIn(User user) => _registrationRepository.signIn(user).then((value) {
        if (value is Session)
          emit(SessionLoaded(value));
        else if (value is ErrorSession) emit(ErrorSessionState(value));
      });
}
