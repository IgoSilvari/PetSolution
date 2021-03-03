import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:flutter/services.dart';

class CadastUser extends StatefulWidget {
  @override
  _CadastUserState createState() => _CadastUserState();
}

class _CadastUserState extends State<CadastUser> {
  var formkeyUser = GlobalKey();

  final nomeFocus = FocusNode();
  final cpfFocus = FocusNode();
  final telefoneFocus = FocusNode();
  final enderecoFocus = FocusNode();
  final cidadeFocus = FocusNode();
  final numeroFocus = FocusNode();
  final ufFocus = FocusNode();
  final dataNasc = FocusNode();
  var nome, telefone, cpf, endereco, cidade, numero, uf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Proprietário"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkeyUser,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton.extended(
                      icon: Icon(Icons.camera_alt_outlined),
                      label: Text("Câmera"),
                      onPressed: () {},
                    ),
                    Divider(indent: 10),
                    FloatingActionButton.extended(
                      icon: Icon(Icons.photo),
                      label: Text("Galeria"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 25, bottom: 15, left: 15, right: 17),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  focusNode: nomeFocus,
                  onFieldSubmitted: (term) {
                    nomeFocus.unfocus();
                    FocusScope.of(context).requestFocus(cpfFocus);
                  },
                  decoration: InputDecoration(
                    labelText: "Nome",
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onSaved: (valueNome) => nome = (valueNome),
                  validator: (valueNome) {
                    if (valueNome.trim().isEmpty) {
                      return "Digite seu nome";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 185,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        focusNode: cpfFocus,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (term) {
                          cpfFocus.unfocus();
                          FocusScope.of(context).requestFocus(dataNasc);
                        },
                        decoration: InputDecoration(
                          labelText: "CPF",
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onSaved: (valueCpf) => cpf = (valueCpf),
                        validator: (valueCpf) {
                          if (valueCpf.trim().isEmpty ||
                              CPF.isValid(valueCpf)) {
                            return "Digite um CPF valido";
                          } else {
                            print("CPF não é valido");
                          }
                          return null;
                        },
                      ),
                    ),
                    Divider(
                      indent: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 250,
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        focusNode: dataNasc,
                        onFieldSubmitted: (term) {
                          dataNasc.unfocus();
                          FocusScope.of(context).requestFocus(telefoneFocus);
                        },
                        decoration: InputDecoration(
                          labelText: "DataNasc",
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15, left: 15, right: 18),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => telefone = (value),
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return "Digite um Telefone";
                    }
                    return null;
                  },
                  focusNode: telefoneFocus,
                  onFieldSubmitted: (term) {
                    telefoneFocus.unfocus();
                    FocusScope.of(context).requestFocus(enderecoFocus);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    labelText: "Telefone",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(11),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 140,
                      child: TextFormField(
                        keyboardType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Endereço",
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onSaved: (value) => endereco = (value),
                        focusNode: enderecoFocus,
                        onFieldSubmitted: (term) {
                          enderecoFocus.unfocus();
                          FocusScope.of(context).requestFocus(numeroFocus);
                        },
                      ),
                    ),
                    Divider(indent: 10),
                    Container(
                      width: MediaQuery.of(context).size.width - 297,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "N°",
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onSaved: (value) => numero = (value),
                        focusNode: numeroFocus,
                        onFieldSubmitted: (term) {
                          numeroFocus.unfocus();
                          FocusScope.of(context).requestFocus(cidadeFocus);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 140,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Cidade",
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onSaved: (value) => endereco = (value),
                        focusNode: cidadeFocus,
                        onFieldSubmitted: (term) {
                          cidadeFocus.unfocus();
                          FocusScope.of(context).requestFocus(ufFocus);
                        },
                      ),
                    ),
                    Divider(indent: 10),
                    Container(
                      width: MediaQuery.of(context).size.width - 297,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Uf",
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onSaved: (value) => numero = (value),
                        validator: (arg) {
                          if (arg.length >= 3) {
                            return 'Ex: Ce';
                          } else {
                            return null;
                          }
                        },
                        focusNode: ufFocus,
                        onFieldSubmitted: (term) {
                          ufFocus.unfocus();
                          FocusScope.of(context).requestFocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
