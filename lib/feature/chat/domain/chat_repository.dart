import 'package:dartz/dartz.dart';
import 'package:flutter_ai_analyzer_app/core/common/models/error_state.dart';
import 'package:flutter_ai_analyzer_app/feature/chat/data/ds/chat_remote_data_source.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../data/model/chat_model.dart';

class ChatRepository {
  ChatRepository(this._remoteDS);
  final ChatRemoteDataSource _remoteDS;

  Future<Either<ErrorState, ChatModel>> chatWithAI(String prompt, ChatModel model, List<Content> history) async {
    final result = await _remoteDS.chatWithAI(prompt, model, history);
    return result.fold(Left.new, Right.new);
  }
}