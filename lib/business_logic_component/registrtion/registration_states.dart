part of '../registrtion/registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class InitialSession extends RegistrationState {}
class SessionLoaded extends RegistrationState {
  final Session session;
  SessionLoaded(this.session);
}
class CodeSent extends RegistrationState {}
class Error extends RegistrationState {}
class CodeSendingIssue extends Error {}
class CodeConfirmationIssue extends Error {
  final int statuesCode;
  CodeConfirmationIssue(this.statuesCode);
}
class CodeConfirmed extends RegistrationState {}
class PhoneConfirmed extends RegistrationState {}
