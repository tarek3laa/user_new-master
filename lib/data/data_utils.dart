import 'models/services/problem_type.dart';

Future<List<ProblemType>> getProblemTypes(problemType, context) async {
  var problems = List<Map<String, dynamic>>.from(problemType);
  List<ProblemType> problemTypes = [];
  for (var problem in problems) {
    var id = problem['problemType']['id'];

    ProblemType _problemType = await context.getProblemTypeById(id);
    _problemType.addLateFeature(problem);
    problemTypes.add(_problemType);
  }
  return problemTypes;
}
