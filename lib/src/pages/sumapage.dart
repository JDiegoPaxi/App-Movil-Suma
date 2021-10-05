



import 'package:flutter/material.dart';


class SumaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SumaPageState();
  }
}

class _SumaPageState extends State<SumaPage> {
  int num1=0;
  int num2=0;
  int resultado=0;
  
  TextEditingController tnum1=TextEditingController(text: '0');
  TextEditingController tnum2=TextEditingController(text: '0');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SUMA'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Container(
             padding: EdgeInsets.symmetric(horizontal: 25),
             child: TextField(
               
               controller: tnum1,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 40,color: Colors.white),
                keyboardType: TextInputType.number,
                
                onChanged: (valor){
                  print(valor);
                  _validarValores(valor,tnum1);
                  num1=int.parse(tnum1.text);
                  _suma();
                },
              ),
           ),
          
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            child: Icon(Icons.add,color: Colors.white,size: 40,)
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: tnum2,
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 40,color: Colors.white),
              onChanged: (valor){
                    print(valor);
                    _validarValores(valor,tnum2);
                    num2=int.parse(tnum2.text);
                    _suma();
                  },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(color: Colors.white,thickness: 4,)
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerRight,
            child: Text('$resultado',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white
            ),
            ),
          )
        ],
      )

          //
          ),
      backgroundColor: Colors.green[800],
    );
  }
  _suma(){
    
    setState(() {
      resultado=num1+num2;
    });
  }
  _validarValores(String valor,TextEditingController t){
    int n=valor.length;
                  switch (n) {
                    case 0: {
                      
                    setState(() {
                      t.text='0';
                      t.selection=TextSelection.collapsed(offset: t.text.length);             
                    });
                    }                     
                      break;
                    case 2:{
                      if(valor[0]=='0'){
                        t.text=valor.substring(1);
                        t.selection=TextSelection.collapsed(offset: t.text.length);
                      }
                    } break;
                    default:
                  }
  }
}
