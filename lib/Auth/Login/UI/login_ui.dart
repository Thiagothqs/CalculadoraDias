import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'login_interactor.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  LoginUI(this.loginInteractor);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  TextEditingController _controller = TextEditingController();
  String? escolhaSoma;
  DateTime dataAtual = DateTime.now().toLocal();
  DateTime dataResultado = DateTime.now().toLocal();
  bool soma = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Spacer(flex: 3),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 24),
                //   child: Text(
                //     getString(Strings.ENTER_YOUR)! +
                //         '\n' +
                //         getString(Strings.PHONE_NUMBER)!,
                //     style: theme.textTheme.headline4!.copyWith(fontSize: 35)
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                //   child: Text(
                //     getString(Strings.WILL_SEND_CODE)!,
                //     style: theme.textTheme.bodyText2!
                //         .copyWith(color: theme.hintColor, fontSize: 12),
                //   ),
                // ),
                // Spacer(),
                // TextButton(onPressed: () async {
                  
                // }, child: Text("30 celular")),
                // TextButton(onPressed: () async {
                  
                // }, child: Text("20 computador")),
                Switch(
                  value: soma,
                  onChanged: (valor){
                    setState(() {
                      soma = valor;
                    });
                    realizaSoma(_controller.text);
                  }
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.datetime,
                    onFieldSubmitted: (valor) {
                      setState(() {
                        realizaSoma(valor);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: DropdownButtonFormField<String>(
                    value: escolhaSoma,
                    hint: Text(
                      '- Selecione -',
                      style: TextStyle(color: Colors.black26, fontSize: 15),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: "h",
                        child: Text("Horas"),
                      ),
                      DropdownMenuItem(
                        value: "d",
                        child: Text("Dias"),
                      ),
                      DropdownMenuItem(
                        value: "m",
                        child: Text("Mês"),
                      ),
                      DropdownMenuItem(
                        value: "a",
                        child: Text("Ano")
                      )
                    ],
                    onChanged: (item) {
                      setState(() {
                        escolhaSoma = item;
                        realizaSoma(_controller.text);
                      });
                    },
                  ),
                ),
                // Spacer(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${DateFormat("dd/MM/yyyy HH:mm").format(dataResultado)} - ${diaSemana()}"),
                  ],
                )
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     TextButton(onPressed: () async {
                //       var client = http.Client();
                //       try {
                //         var response = await client.get(
                //           Uri.parse('https://rewards.bing.com/api/getuserinfo?type=1&X-Requested-With=XMLHttpRequest&_=1693073832402'),
                //           headers: {
                //             "Content-Type": "application/json",
                //             "Accept": "application/json"
                //           });
                //         print(response.body);
                //         // var decodedResponse = json.decode(utf8.decode(response.bodyBytes)) as Map;
                //         // var uri = Uri.parse(decodedResponse['uri'] as String);
                //         // print(await client.get(uri));
                //       } finally {
                //         client.close();
                //       }
                //     }, child: Text("Rewards Teste Get")),
                //   ],
                // ),
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.7,
                //   color: theme.backgroundColor,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       Spacer(),
                //       // CustomButton(
                //       //   onTap: () => widget.loginInteractor
                //       //       .loginWithMobile(isoCode, _numberController.text),
                //       // ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  void realizaSoma(String valor){
    int valorInt = int.parse(valor);
    if(escolhaSoma == "h"){
      dataResultado = dataAtual.add(Duration(hours: soma ? valorInt : -valorInt));
    }
    else if(escolhaSoma == "d"){
      dataResultado = dataAtual.add(Duration(days: soma ? valorInt : -valorInt));
    }
    else if(escolhaSoma == "m"){
      dataResultado = dataAtual.add(Duration(days: soma ? valorInt * 30 : -(valorInt * 30)));
    }
    else if (escolhaSoma == "a"){
      dataResultado = dataAtual.add(Duration(days: soma ? valorInt * 365 : -(valorInt * 365)));
    } // DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(json['dataHora'], true)
  }

  String diaSemana(){
    if(dataResultado.weekday == DateTime.sunday){
      return "Domingo";
    }
    else if(dataResultado.weekday == DateTime.monday){
      return "Segunda";
    }
    else if(dataResultado.weekday == DateTime.tuesday){
      return "Terça";
    }
    else if(dataResultado.weekday == DateTime.wednesday){
      return "Quarta";
    }
    else if(dataResultado.weekday == DateTime.thursday){
      return "Quinta";
    }
    else if(dataResultado.weekday == DateTime.friday){
      return "Sexta";
    }
    else if(dataResultado.weekday == DateTime.saturday){
      return "Sábado";
    }
    return "";
  }
}
