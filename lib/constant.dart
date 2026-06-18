import 'package:news_hub/core/models/card_model.dart';
import 'package:news_hub/core/utils/assets_manager.dart';
import 'package:news_hub/core/utils/text_manager.dart';

final List<CardModel> card = [
  const CardModel(
      image: AssetsManager.business, nameImage: TextManager.business),
  const CardModel(image: AssetsManager.health, nameImage: TextManager.health),
  const CardModel(
      image: AssetsManager.entertainment, nameImage: TextManager.entertainment),
  const CardModel(image: AssetsManager.science, nameImage: TextManager.science),
  const CardModel(image: AssetsManager.sports, nameImage: TextManager.sport),
  const CardModel(
      image: AssetsManager.technology, nameImage: TextManager.technology),
  const CardModel(image: AssetsManager.general, nameImage: TextManager.general),
];
