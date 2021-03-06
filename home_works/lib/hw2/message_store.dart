import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import 'api_client.dart';
import 'message.dart';

part 'message_store.g.dart';

class MessageStore = _MessageStore with _$MessageStore;

abstract class _MessageStore with Store {
  @observable
  ObservableList<Message> messages = ObservableList.of([]);

  @action
  void getNewMessages() {
    RestClient restClient = RestClient(Dio());
    restClient.getMessages().then((List<Message> messages) {
        this.messages = ObservableList.of(messages);
    }).catchError((error) {
      print(error.toString());
    });
  }
}