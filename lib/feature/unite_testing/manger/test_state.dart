part of 'test_cubit.dart';

@immutable
abstract class TestState {}

class TestInitial extends TestState {}
class TestLoadingState extends TestState {}
class TestSuccessState extends TestState {}
class TestFailState extends TestState {}
