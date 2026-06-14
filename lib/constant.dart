import 'package:news_apps/core/utils/assets_manager.dart';
import 'package:news_apps/core/utils/text_manager.dart';
import 'package:news_apps/core/models/card_model.dart';

final List<CardModel> card = [
  const CardModel(
      image: AssetsManager.entertainment, nameImage: TextManager.business),
  const CardModel(image: AssetsManager.health, nameImage: TextManager.health),
  const CardModel(
      image: AssetsManager.entertainment, nameImage: TextManager.entertainment),
  const CardModel(image: AssetsManager.science, nameImage: TextManager.science),
  const CardModel(
      image: AssetsManager.entertainment, nameImage: TextManager.sport),
  const CardModel(
      image: AssetsManager.technology, nameImage: TextManager.technology),
  const CardModel(
      image: AssetsManager.entertainment, nameImage: TextManager.general),
];
