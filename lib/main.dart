import 'dart:io';

import 'package:flutter/material.dart';
import 'package:personal_expenses_application/widgets/chart.dart';
import 'package:personal_expenses_application/widgets/new_transaction.dart';

import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main(List<String> args) {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand",
        accentColor: Colors.lime.shade800,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        errorColor: Colors.red.shade900,
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage("Personal Expenses"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String appTitle;
  MyHomePage(this.appTitle);
  // String? titleInput;
  // String? amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  bool _chartShow = false;

  List<Transaction> get _recentTransactions {
    return (_userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(
        days: 7,
      )));
    })).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
      id: UniqueKey().toString(),
      title: txTitle,
      amount: txAmount,
      date: txDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(Transaction tx) {
    setState(() {
      _userTransactions.remove(tx);
    });
  }

  void _startAddNewTransation(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _showChar(bool value) {
    setState(() {
      _chartShow = value;
    });
  }

  List<Widget> _showPortraitContent(
    MediaQueryData mediaQuery,
    AppBar myAppBar,
  ) {
    return [
      Container(
        height: (mediaQuery.size.height -
                myAppBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.3,
        child: Chart(_recentTransactions),
      ),
      Container(
        height: (mediaQuery.size.height -
                myAppBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: TransactionList(_userTransactions, _deleteTransaction),
      ),
    ];
  }

  List<Widget> _showLandscapeContent(
    MediaQueryData mediaQuery,
    AppBar myAppBar,
  ) {
    return [
      _chartShow
          ? Container(
              height: (mediaQuery.size.height -
                      myAppBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.6,
              child: Chart(_recentTransactions),
            )
          : Container(
              height: (mediaQuery.size.height -
                      myAppBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.8,
              child: TransactionList(_userTransactions, _deleteTransaction),
            )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    final AppBar myAppBar = AppBar(
      title: Text(widget.appTitle),
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransation(context),
          icon: Icon(Icons.add),
        ),
      ],
    );

    return Scaffold(
      appBar: myAppBar,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Container(
                height: (mediaQuery.size.height -
                        myAppBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.2,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    children: <Widget>[
                      Text("Show chart: "),
                      Switch(
                        value: _chartShow,
                        onChanged: (value) => _showChar(value),
                      ),
                    ],
                  ),
                ),
              ),
            if (isLandscape) ..._showLandscapeContent(mediaQuery, myAppBar),
            if (!isLandscape) ..._showPortraitContent(mediaQuery, myAppBar),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _startAddNewTransation(context);
              },
            ),
    );
  }
}
