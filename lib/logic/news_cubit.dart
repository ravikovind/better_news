import 'package:better_news/data/models/news.dart';
import 'package:better_news/data/services/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> getNews() async {
    emit(NewsLoading());
    try {
      final Map<String, dynamic> _apiResponse = await APIService.getNews();
      if (_apiResponse['status'] == true) {
        final List<News> _news = _apiResponse['data'] as List<News>;
        emit(NewsLoaded(news: _news));
      } else {
        emit(NewsError(error: _apiResponse['message']));
      }
    } catch (e) {
      emit(NewsError(error: e.toString()));
    }
  }
}
