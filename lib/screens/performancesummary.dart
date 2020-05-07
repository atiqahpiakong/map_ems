import 'package:flutter/material.dart';
import 'package:emsproject/model/employees.dart';
import 'package:emsproject/model/assessment.dart';
import 'package:emsproject/screens/rateperformance.dart';


class SummaryScreen extends StatefulWidget {
  final Employees _evaluator;
  final List _data;

  SummaryScreen(this._evaluator, this._data);

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  void _navigate(index) async {
    final returnData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(
          Assessment.copy(widget._data[index]),
        ),
      ),
    );

    if (returnData != null) {
      setState(() => widget._data[index] = returnData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            const Text(
              'Employee Performance',
              style: TextStyle(fontSize: 20),
            ),
            Text('Evaluated by Manager',
              // widget._evaluator.fullName,
             style: const TextStyle(fontSize: 15),
             textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: ListView.separated(
        
        itemCount: widget._data.length,
        itemBuilder: (context, index) => ListTile(
          // leading: CircleAvatar(
          //   backgroundImage: AssetImage('asset/profile.png'),
          //   backgroundColor: Color(0xff3DBC93), 
          //   radius: 30,),
          title: Text(widget._data[index].member.fullName),
          subtitle: Text(widget._data[index].member.jobType),
          
          trailing: CircleAvatar(
            child: Text(
              widget._data[index].percent.round().toString(),
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor:
                widget._data[index].percent < 50 ? Colors.red: Colors.green,
          ),
          onTap: () => _navigate(index),
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
      
    );
  }
}
