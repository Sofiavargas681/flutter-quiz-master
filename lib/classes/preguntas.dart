class preguntas {
  String pregunta = "";

  preguntas(_pregunta){
    this.pregunta = _pregunta;
  }

  preguntas.fromJson(Map<String, dynamic> json)
    : pregunta =  json['pregunta'];

  String toJson() => '{"pregunta": "' + this.pregunta + '}';
}