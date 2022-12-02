import 'package:flutter/material.dart';

class HomeGerente extends StatefulWidget {
  const HomeGerente({Key? key}) : super(key: key);

  @override
  State<HomeGerente> createState() => _HomeGerenteState();
}

class _HomeGerenteState extends State<HomeGerente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.45,
                  color: Colors.deepOrange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 150, 64),
                                shape: BoxShape.circle),
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.04),
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              size: MediaQuery.of(context).size.width * 0.1,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.logout,
                                size: MediaQuery.of(context).size.width * 0.076,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Center(
                              child: Text(
                            'Olá, gerente',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total Vendas do Dia',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  'R\$ 621,10',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.orangeAccent),
                                )
                              ]),
                          Icon(
                            Icons.library_books_rounded,
                            color: Colors.black38,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
