
class quiz {
  int id_quiz = 0;
  String nombre = "";
  int cant_preguntas = 0;
  DateTime fecha_ini;

  quiz(this.nombre, this.cant_preguntas, this.fecha_ini){
    this.fecha_ini = DateTime.now();
  }

  quiz.fromJson(Map<String, dynamic> json)
    : id_quiz =  json['id_quiz'],
      nombre = json['nombre'],
      cant_preguntas = json['cant_preguntas'],
      fecha_ini = json['fecha_ini'];

  String toJson() => '{"nombre": "' + this.nombre + '" , "cant_preguntas": ' + this.cant_preguntas.toString() + '}';
}