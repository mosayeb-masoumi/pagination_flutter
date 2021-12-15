
import 'package:flutter/material.dart';
import 'package:pagination/dynamic/pagination_dynamic.dart';
import 'package:pagination/static/pagination_static.dart';

/***********************  how to post
 *
 * https://www.codegrepper.com/code-examples/javascript/dio+post+request+flutter
 *
Map<String, String> body = {
  'name': 'doodle',
  'color': 'blue',
  'homeTeam': json.encode(
    {'team': 'Team A'},
  ),
  'awayTeam': json.encode(
    {'team': 'Team B'},
  ),
};

Response r = await post(
url,
body: body,
);
*****************************/

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: [
              RaisedButton(
                  child: Text("static list pagination"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaginationStatic()),
                    );
                  }),
              SizedBox(height: 10,),

              RaisedButton(
                  child: Text("dynamic list pagination"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaginationDynamic()),
                    );
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
