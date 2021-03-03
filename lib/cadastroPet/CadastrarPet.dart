import 'package:flutter/material.dart';

class CadPet extends StatefulWidget {
  @override
  _CadPetState createState() => _CadPetState();
}

class _CadPetState extends State<CadPet> {
  final formkey = GlobalKey();

  @override
  void initState() {
    grop = 0;
    gropDoe = null;
    super.initState();
  }

  //Saber o sexo do animal
  int grop;
  setsexo(int val) {
    setState(() {
      grop = val;
    });
  }
  //Fim do comando

  //Saber se o Animal tem Doença
  bool gropDoe;
  setDoenca(bool result) {
    setState(() {
      gropDoe = result;
    });
  }

  bool exibirDoenca = false;
  //Fim do comando

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do Pet"),
        centerTitle: true,
        backgroundColor: grop == 2 ? Colors.pinkAccent : Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                        "https://image.shutterstock.com/image-vector/round-horse-logo-abstract-body-600w-1812916297.jpg",
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                      label: Text("Camera"),
                      backgroundColor:
                          grop == 2 ? Colors.pinkAccent : Colors.blue,
                      icon: Icon(Icons.camera_alt_outlined),
                      heroTag: "tb1",
                      onPressed: () {},
                    ),
                    Divider(
                      indent: 10,
                    ),
                    FloatingActionButton.extended(
                      label: Text("Galeria"),
                      backgroundColor:
                          grop == 2 ? Colors.pinkAccent : Colors.blue,
                      icon: Icon(Icons.photo),
                      heroTag: "tb2",
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sexo: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text("Masculino"),
                      Radio(
                        value: 1,
                        groupValue: grop,
                        activeColor: Colors.blue,
                        onChanged: (val) {
                          setsexo(val);
                        },
                      ),
                      Text("Feminino"),
                      Radio(
                        value: 2,
                        groupValue: grop,
                        activeColor: Colors.pinkAccent,
                        onChanged: (val) {
                          setsexo(val);
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 15),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 180,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: "Nome",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                      Divider(indent: 8),
                      Container(
                        width: MediaQuery.of(context).size.width - 265,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Idade",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 5),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 225,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: "Especie",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                      Divider(indent: 8),
                      Container(
                        width: MediaQuery.of(context).size.width - 225,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Raça",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Doença",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sim"),
                    Radio(
                      value: true,
                      groupValue: gropDoe,
                      onChanged: (result) {
                        setDoenca(result);
                        setState(() {
                          exibirDoenca = result;
                        });
                      },
                    ),
                    Text("Não"),
                    Radio(
                      value: false,
                      groupValue: gropDoe,
                      onChanged: (result) {
                        setDoenca(result);
                        setState(() {
                          exibirDoenca = result;
                        });
                      },
                    )
                  ],
                ),
                Visibility(
                  visible: exibirDoenca,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10, left: 15, right: 15, top: 10),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 180,
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    labelText: "Qual?",
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                              ),
                            ),
                            Divider(indent: 7),
                            Container(
                              width: MediaQuery.of(context).size.width - 250,
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    labelText: "Remedio?",
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10, left: 15, right: 15, top: 10),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 180,
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    labelText: "Qual?",
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                              ),
                            ),
                            Divider(indent: 7),
                            Container(
                              width: MediaQuery.of(context).size.width - 250,
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    labelText: "Remedio?",
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Observações",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 70,
                    height: 170,
                    //color: Colors.red,
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 50, 20, 50),
                      ),
                    ),
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
