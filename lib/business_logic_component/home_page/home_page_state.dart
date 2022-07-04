part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class MainServicesLoaded extends HomePageState {
  final List<MainService> mainServices;

  MainServicesLoaded(this.mainServices);
}

class SubServicesLoaded extends HomePageState {
  final List<SubService> subServices;

  SubServicesLoaded(this.subServices);
}

class ProblemTypeLoaded extends HomePageState {
  final List<ProblemType> problemTypes;

  ProblemTypeLoaded(this.problemTypes);
}

class QuestionLoaded extends HomePageState {
  final List<Question> question;

  QuestionLoaded(this.question);
}

class OrderCreated extends HomePageState {
  final Order order;

  OrderCreated(this.order);
}

class DownPaymentSubmitted extends HomePageState {
  final Order order;

  DownPaymentSubmitted(this.order);
}

class SliderLoaded extends HomePageState {
  final List<Slider> sliders;

  SliderLoaded(this.sliders);
}

class FormAnswerSubmitted extends HomePageState {}

class FormAnswerIssue extends HomePageState {}

class OrdersLoaded extends HomePageState {
  final List<Order> orders;

  OrdersLoaded(this.orders);
}

class RateSubmitted extends HomePageState {
  final Order order;

  RateSubmitted(this.order);
}

class PrivacyLoaded extends HomePageState {
  final Privacy privacy;

  PrivacyLoaded(this.privacy);
}

class ImageUploaded extends HomePageState {
  final String link;

  ImageUploaded(this.link);
}
