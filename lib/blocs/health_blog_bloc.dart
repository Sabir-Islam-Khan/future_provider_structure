import 'dart:async';
import '../models/health_blog_model.dart';
import '../services/health_blog_api_service.dart';

enum HealthBlogAction {fetch, delete}

class HealthBlogBloc {
  final _stateStreamController = StreamController<List<HealthBlog>>();
  StreamSink<List<HealthBlog>> get _postSink => _stateStreamController.sink;
  Stream<List<HealthBlog>> get postStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<HealthBlogAction>();
  StreamSink<HealthBlogAction> get eventSink => _eventStreamController.sink;
  Stream<HealthBlogAction> get _eventStream => _eventStreamController.stream;

  HealthBlogBloc() {
    _eventStream.listen((event) async {
      if (event == HealthBlogAction.fetch) {
        try{
          var post = await HealthBlogApiService().fetchHealthBlogList();
          _postSink.add(post);
        } on Exception catch(error) {
          _postSink.addError('Error adding posts to sink $error \n\n');
        }
      }
    });
  }
}