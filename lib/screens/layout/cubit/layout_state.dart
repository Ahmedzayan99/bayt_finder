part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class AppChangeBottomNavBarState extends LayoutState {}

class TableLoadingState extends LayoutState {}

class TableSuccessState extends LayoutState {}

class TableErrorState extends LayoutState {}

class SendFormLoadingState extends LayoutState {}

class SendFormSuccessState extends LayoutState {}

class SendFormErrorState extends LayoutState {}

class IssueDropdwonLoadingState extends LayoutState {}

class IssueDropdwonSuccessState extends LayoutState {}

class IssueDropdwonErrorState extends LayoutState {}

class SelectDropDownTypePeerState extends LayoutState {}

class ClearDataState extends LayoutState {}
class GetSettingLoadingState extends LayoutState {}
class GetSettingErrorState extends LayoutState {}
class GetSettingSuccessState extends LayoutState {}
