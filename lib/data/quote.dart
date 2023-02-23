class Quote{

  String? text, surah;
  int? number;

Quote({
  required this.text,
  required this.surah,
  required this.number,
});

Quote.fromJson(Map<dynamic, dynamic>map){
  if(map == null){
    return;
  }
  text=map['text'];
  surah=map['surah']['name'];
  number=map['number'];
}

  toJson(Quote ayah){
    return{
      'text': text,
      'surah': surah,
      'number': number,
    };
  }
}