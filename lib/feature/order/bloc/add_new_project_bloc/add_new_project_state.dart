
class AddNewProjectState {}

final class AddNewProjectInitial extends AddNewProjectState {}
class AddNewProjectSuccessState extends AddNewProjectState{

  final int projectId;

  AddNewProjectSuccessState({required this.projectId});


}
  class AddNewProjectLoadingState extends AddNewProjectState{}
   class AddNewProjectErrorState extends AddNewProjectState{}
  