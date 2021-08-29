import 'package:flutter/material.dart';
import 'package:studyxp_mobile/model/alunoModel.dart';
import 'package:studyxp_mobile/services/snackbarService.dart';

class MyHomePageAluno extends StatefulWidget {
  final Aluno aluno;
  MyHomePageAluno({Key? key, required this.aluno}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageAluno> {
  @override
  Widget build(BuildContext context) {
    MensagemDeAlertaOK(
      titulo: 'Bem Vindo, ' + widget.aluno.nome,
      descricao: '',
    );

    return Scaffold(
      body: Card(
        child: Text(widget.aluno.nome),
      ),
    );
  }
}
