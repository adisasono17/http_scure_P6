import 'package:flutter/material.dart';
import '../repositories/post_repository.dart';
import '../repositories/post_repository_impl.dart';
import '../repositories/user_repository.dart';
import '../repositories/user_repository_impl.dart';
import '../services/api_service.dart';

class DependencyInjector extends InheritedWidget {
  static final ApiService _apiServiceInstance = ApiService();

  final ApiService apiService;
  final UserRepository userRepository;
  final PostRepository postRepository;

  DependencyInjector({
    super.key,
    required super.child,
    ApiService? apiService,
    UserRepository? userRepository,
    PostRepository? postRepository,
  })  : apiService = apiService ?? _apiServiceInstance,
        userRepository = userRepository ??
            UserRepositoryImpl(apiService: apiService ?? _apiServiceInstance),
        postRepository = postRepository ??
            PostRepositoryImpl(apiService: apiService ?? _apiServiceInstance);

  static DependencyInjector of(BuildContext context) {
    final DependencyInjector? result =
        context.dependOnInheritedWidgetOfExactType<DependencyInjector>();
    assert(result != null, 'No DependencyInjector found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DependencyInjector oldWidget) => false;
}