import 'package:flutter/material.dart';

class IniciarNovoPedido extends StatelessWidget {
  const IniciarNovoPedido({Key? key, this.clique}) : super(key: key);

  final VoidCallback? clique;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 75),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Bem-Vindo(a) à',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(146, 114, 114, 114),
              fontFamily: 'NunitoSans-Regular',
            ),
          ),
          Container(
            width: 300,
            height: 300,
            padding: const EdgeInsets.all(
              10,
            ),
            margin: const EdgeInsets.all(
              10,
            ),
            child: Image.asset(
              "assets/logo.png",
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.redAccent,
                Colors.orangeAccent,
              ]),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  33,
                ),
              ),
            ),
            width: 320,
            height: 60,
            child: Center(
              child: TextButton(
                onPressed: clique,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12, left: 10, right: 10, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.new_label_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'Novo Pedido',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Herborn'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
