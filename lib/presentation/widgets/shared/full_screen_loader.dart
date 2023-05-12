import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      "Cargando Peliculas",
      "Callando a los niños del cine",
      "Haciendo Palomitas",
      "Apagando Luces",
      "Ya casi...",
      "Esto está tardando más de lo esperado ;c",
      "Ya mejor reinicia la app o cómprate un celular mejor :D"
    ];
    return Stream.periodic(const Duration(milliseconds: 1500), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Por Favor Espere"),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Cargando");

              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
