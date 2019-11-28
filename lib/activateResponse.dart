import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARclass extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARCore Flutter Plugin Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ARclassPage(title: 'ARCore Flutter Plugin Example'),    
    );
  }
}

class ARclassPage extends StatefulWidget {
  ARclassPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ARclassPageState createState() => _ARclassPageState();
}

class _ARclassPageState extends State<ARclassPage> {

  ArCoreController arCoreController;

  String respuesta  = "";

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => Navigator.pop(context, respuesta),
      child: new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableTapRecognizer: true,
        ),
      ),
    ),
    );
     
  }
  

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onNodeTap = (name) => onTapHandler(name);
    _addA(arCoreController);
    _addB(arCoreController);
    _addC(arCoreController);
    _addD(arCoreController);
  }

   void onTapHandler(String name) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(content: Text('Seleccionando respuesta: $name')),
    );
    respuesta = name;
  }

  Future _addA(ArCoreController controller) async {
    final ByteData textureBytes = await rootBundle.load('images/a.jpg');

    final material = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),
        textureBytes: textureBytes.buffer.asUint8List());
        
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.3,
    );
    final node = ArCoreNode(
      name: "a",
      shape: sphere,
      position: vector.Vector3(0, 1, -2),
    );
    controller.addArCoreNode(node);
  }

  Future _addB(ArCoreController controller) async {
    final ByteData textureBytes = await rootBundle.load('images/b.jpg');

    final material = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),
        textureBytes: textureBytes.buffer.asUint8List());
        
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.3,
    );
    final node = ArCoreNode(
      name: "b",
      shape: sphere,
      position: vector.Vector3(1, 1, -2),
    );
    controller.addArCoreNode(node);
  }

  Future _addC(ArCoreController controller) async {
    final ByteData textureBytes = await rootBundle.load('images/c.jpg');

    final material = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),
        textureBytes: textureBytes.buffer.asUint8List());
        
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.3,
    );
    final node = ArCoreNode(
      name: "c",
      shape: sphere,
      position: vector.Vector3(0, 0, -2),
    );
    controller.addArCoreNode(node);
  }

  Future _addD(ArCoreController controller) async {
    final ByteData textureBytes = await rootBundle.load('images/d.jpg');

    final material = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),
        textureBytes: textureBytes.buffer.asUint8List());
        
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.3,
    );
    final node = ArCoreNode(
      name: "d",
      shape: sphere,
      position: vector.Vector3(1, 0, -2),
    );
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
