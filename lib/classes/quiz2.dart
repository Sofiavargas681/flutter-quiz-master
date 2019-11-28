
class quiz2 {
  int id_quiz = 0;
  String nombre = "";
  int cant_preguntas = 0;
  DateTime fecha_ini;

  quiz2({this.id_quiz, this.nombre, this.cant_preguntas, this.fecha_ini});

  factory quiz2.fromJson(Map<String, dynamic> json) {
    return quiz2(
      id_quiz: json['id_quiz'],
      nombre: json['nombre'],
      cant_preguntas: json['cant_preguntas'],
      fecha_ini: json['fecha_ini'],
    );
  }
}