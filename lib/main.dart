import 'package:flutter/material.dart';

void main() {

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Interest Calculator App',
        home: SIForm(),
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            accentColor: Colors.green
        ),

      )
  );
}

class SIForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {

  var _grades = ['Select Your Grade','A', 'AB', 'B','BC','C','CD','D','E','F'];
  var _courseLoad = ['Select Course Load','1', '2', '3','4','5','6','7','8'];
  final double  _minimumPadding = 5.0;

  var _currentItemSelected = '';
  var _selectedCreditLoad = '';

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _grades[0];
    _selectedCreditLoad = _courseLoad[0];
  }
  // void initState(){
  //   super.initState();
  //   _selectedCreditLoad = _courseLoad[0];
  // }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController       = TextEditingController();
  TextEditingController termController      = TextEditingController();

  var displayResult = '';

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
//			resizeToAvoidBottomPadding: false,
    backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('GPA CALCULATOR'),
      ),

      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[

            getImageAsset(),

            Padding(
                padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: principalController,
                  decoration: InputDecoration(
                      labelText: 'Course Name',
                      hintText: 'Course Name e.g. MTH111',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                )),



            Padding(
                padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[


                    // Container(width: _minimumPadding * 5,),

                    Expanded(child: DropdownButton<String>(
                      items: _grades.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),

                      value: _currentItemSelected,

                      onChanged: (String newValueSelected) {
                        // Your code to execute, when a menu item is selected from dropdown
                        _onDropDownItemSelected(newValueSelected);
                      },

                    )),



                  ],
                )),
            Padding(
                padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[


                    // Container(width: _minimumPadding * 5,),

                    Expanded(child: DropdownButton<String>(
                      items: _courseLoad.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),

                      value: _selectedCreditLoad,

                      onChanged: (String newValueSelecteds) {
                        // Your code to execute, when a menu item is selected from dropdown
                        _onDropDownItemSelecteds(newValueSelecteds);
                      },

                    )),



                  ],
                )),

            Padding(
                padding: EdgeInsets.only(bottom: _minimumPadding, top: _minimumPadding),
                child: Row(children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text('ADD COURSE', textScaleFactor: 1.5, style: TextStyle(color: Colors.white,),),

                      onPressed: () {
                        setState(() {
                        });
                      },
                    ),
                  ),



                ],)),

            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(this.displayResult, style: textStyle,),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );

  }

  Widget getImageAsset() {

    AssetImage assetImage = AssetImage('images/students-removebg-preview.png');
    Image image = Image(image: assetImage, width: 500.0, height: 150.0,);

    return Container(child: image, margin: EdgeInsets.all(_minimumPadding * 10),);
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
  void _onDropDownItemSelecteds(String newValueSelecteds) {
    setState(() {
      this._selectedCreditLoad = newValueSelecteds;
    });
  }



}
