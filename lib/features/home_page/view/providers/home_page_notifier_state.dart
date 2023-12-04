import 'package:equatable/equatable.dart';

import 'package:qtec_task/features/home_page/domain/home_page_api_response.dart';

class PageNotifierState extends Equatable {
  final bool isLoading;
  final List<Result> results;
  PageNotifierState({
    required this.isLoading,
    required this.results,
  });
  @override
  List<Object> get props => [isLoading, results];

  factory PageNotifierState.init() => PageNotifierState(
        isLoading: false,
        results: [],
      );

  PageNotifierState copyWith({
    bool? isLoading,
    List<Result>? results,
  }) {
    return PageNotifierState(
      isLoading: isLoading ?? this.isLoading,
      results: results ?? this.results,
    );
  }
}
