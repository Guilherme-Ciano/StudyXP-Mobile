import 'package:flutter/material.dart';
import 'package:studyxp_mobile/design/design.dart';
import 'package:studyxp_mobile/model/alunoModel.dart';
import 'package:studyxp_mobile/view/config/telaConfig.dart';
import 'package:studyxp_mobile/view/home/tarefasConcluidas.dart';
import 'package:studyxp_mobile/view/home/tarefasPendentes.dart';
import 'package:studyxp_mobile/view/sweetLoad/splashLoad.dart';

class MyHomePageAluno extends StatefulWidget {
  final Aluno aluno;
  MyHomePageAluno({Key? key, required this.aluno}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageAluno> {
  int _selectedIndex = 0;

  refresh() {
    setState(() {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SplashLoad(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int alunoID = widget.aluno.id;
    final int alunoLVL = widget.aluno.level;

    final List<Widget> _pags = [
      TarefasPendentes(
        alunoID: alunoID,
        alunoLevel: alunoLVL,
        notifyParent: refresh,
      ),
      TarefasConcluidas(),
      TelaPrincipalConfig(),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                ),
                trailing: Text('Nível: ' + widget.aluno.level.toString()),
                subtitle: Text(widget.aluno.grade.toString() + '° Ano'),
                title: Text(
                  widget.aluno.nome,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                dense: true,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 136,
                child: _pags[_selectedIndex],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Pendentes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_outlined),
            label: 'Concluídas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Perfil',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ControleDeCor.Tema,
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
