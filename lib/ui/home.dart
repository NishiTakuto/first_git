import 'package:first_flutter_app/model/movie.dart';
import 'package:first_flutter_app/model/question.dart';
import 'package:first_flutter_app/ui/movie_ui/movie_ui.dart';
import 'package:first_flutter_app/util/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//----------------MovieListApp--------------------

class MovieListView extends StatelessWidget {
  
  final List<Movie> movieList = Movie.getMovies();

  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "スパイダーマン",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length, //index
          itemBuilder: (BuildContext context, int index) {
            return Stack(
                children: <Widget> [
                  Positioned(
                      child: movieCard(movieList[index], context)),
                  Positioned(
                    top: 10.0,
                      child: movieImage(movieList[index].images[0])),

                ]
            );        // return Card( //ctr+B
        //   elevation: 4.5, //影
        //   color: Colors.white,
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       child: Container(
        //         width: 200,
        //         height: 200,
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: NetworkImage(movieList[index].images[0]),
        //             fit: BoxFit.cover
        //           ),
        //           borderRadius: BorderRadius.circular((13.9))
        //         ),
        //         child: null
        //       ),
        //     ),
        //     trailing: Text("..."),
        //     title: Text(movieList[index].title),
        //     subtitle: Text("${movieList[0].title}"),
        //     onTap: () {
        //       Navigator.push(context, MaterialPageRoute(
        //           builder: (context) => MovieListViewDetails(movieName: movieList.elementAt(index).title,
        //             movie: movieList[index] ,)));
        //     },
        //
        //   ),
        // );
    }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,
              bottom: 8.0,
              left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(movie.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white,
                            ),),
                        Text("Rating: ${movie.imdbRating} / 10",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Flexible(// 長い文章で自動的に改行する
                        child: Text("Released: ${movie.released}",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Text(movie.runtime,
                        style: mainTextStyle()
                      ),
                      Text(movie.rated,
                        style: mainTextStyle()
                      ),
                    ]
                  )
                ],
              ),
            ),
          )
      )
      ),
      onTap: () => {
      Navigator.push(context, MaterialPageRoute(
                 builder: (context) => MovieListViewDetails(movieName: movie.title,
                   movie: movie ,)))
      },
    );
  }
  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 15.0,
      color: Colors.grey,
    );
  }
  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjEyOTYyMzUxNl5BMl5BanBnXkFtZTcwNTg0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg'),
          fit: BoxFit.cover,
            
        )
      ),
    );
  }
}

//new route (page or screen
class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key? key, required this.movieName, required this.movie}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images),
        ],
      ),
      // body: Center(
      //   child: Container(
      //     child: ElevatedButton(
      //       child: Text("Go back ${this.movie.director}"),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       }
      //     )
      //   ),
      // ),
    );
  }
}





// --------------QuizApp--------------------





class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}


class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("The D>S Declaration of Independense was adopted un 1776", true),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        //backgroundColor: Colors.blueGrey,
      ),
      //backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset("images/flag.png",
                  width: 250,
                  height: 180,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade400, style: BorderStyle.solid
                    ),
                  ),
                  height: 120.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(questionBank[_currentQuestionIndex].questionText, //style: TextStyle(
                        //fontSize: 16.9,
                        //color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  ElevatedButton(onPressed: () => _prevQuestion, child: Icon(Icons.arrow_back, color: Colors.white), style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900)),
                  ElevatedButton(onPressed: () => _checkAnswer(true, context), child: Text("TRUE", style: TextStyle(color: Colors.white)), style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900),),

                  ElevatedButton(onPressed: () => _checkAnswer(false, context), child: Text("FALSE", style: TextStyle(color: Colors.white)), style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900),),

                ],
              )
            ],
          )
        ),
      )
    );
  }

  _prevQuestion() {
    _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
  }

  _checkAnswer( bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //correct answer

      final snackbar = SnackBar(
        backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Correct!"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _updateQuestion();
    }else {
      final snackbar = SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 500),
          content: Text("Incorrect!"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint("Incorrect!");

      _updateQuestion();
    }
    
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }
}



// ----------------BillSplitterApp-----------------




class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  
  Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0)
              ),
              child : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Per Person", style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17.0,
                      color: _purple,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}", style: TextStyle(
                        fontSize: 34.9,
                        fontWeight: FontWeight.bold,
                        color: _purple,
                      )),
                    ),
                  ]
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top :20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money)
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      }catch(exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Split", style: TextStyle(
                        color: Colors.grey.shade700
                      ),),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(_personCounter > 1) {
                                  _personCounter--;
                                }else {
                                  //do nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _purple.withOpacity(0.1)
                              ),
                              child: Center(
                                child: Text(
                                  "-", style: TextStyle(
                                  color: _purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                                ),
                              ),
                            ),
                          ),
                          Text("$_personCounter", style: TextStyle(
                            color: _purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: _purple.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(7.0)
                              ),
                              child: Center(
                                child: Text("+", style: TextStyle(
                                  color: _purple,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  //Tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Tip", style: TextStyle(
                          color: Colors.grey.shade700
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("\$ ${ (calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}", style: TextStyle(
                          color: _purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),),
                      ),
                    ],
                  ),
                  //Slider
                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage%", style: TextStyle(
                        color: _purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),),

                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: _purple,
                          divisions: 10, //optional
                          inactiveColor: Colors.grey,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue){
                        setState(() {
                          _tipPercentage = newValue.round();
                        });
                      })
                    ],
                  )
                ]
              )
            )
          ]


        )
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy ,int tipPercentage) {
    var totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) / splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
    double totalTip = 0.0;

    if(billAmount < 0 || billAmount.toString().isEmpty || billAmount == null ) {

    }else {
      totalTip = (billAmount * tipPercentage) / 100;
    }

    return totalTip;
  }
}


// ---------------BizCardApp---------------


class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BizCard"),
          centerTitle: false,
        ),
        body: Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[_getCard(), _getAvatar()],
            )));
  }

  Container _getCard() {
    return Container(
        width: 350,
        height: 200,
        margin: EdgeInsets.all(50.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(14.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Paulo Dichone",
                style: TextStyle(
                    fontSize: 20.9,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            Text("buildappswithpaulo.com"),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(Icons.person_outline),
              Text("T: @buidappswithme")
            ])
          ],
        ));
  }

  Container _getAvatar() {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(color: Colors.redAccent, width: 1.2),
            image: DecorationImage(
                image: NetworkImage("https://picsum.photos/300/300"),
                fit: BoxFit.cover)));
  }
}

class ScaffoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint("Tapped button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold"),
          centerTitle: true,
          backgroundColor: Colors.amberAccent.shade700,
          actions: <Widget>[
            IconButton(
                onPressed: () => debugPrint("Email Tapped!"),
                icon: Icon(Icons.email)),
            IconButton(onPressed: _tapButton, icon: Icon(Icons.access_alarms))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightGreen,
            child: Icon(Icons.call_missed),
            onPressed: () => debugPrint("Hello")),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "First"),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Second"),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), label: "Third")
          ],
          onTap: (int index) => debugPrint("Tapped item : $index"),
        ),
        backgroundColor: Colors.pink.shade100,
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomButton()
                /*InkWell(
                child: Text("Tap me!",
                  style: TextStyle(fontSize: 23.4),),

                onTap: () => debugPrint("tapped..."),

              )*/
              ],
            )));
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hello Again!"),
          backgroundColor: Colors.amberAccent.shade700,
        );

        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(8.0)),
          child: Text("Button")),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //reformat Ctr + Shift + Alt + l
    return Material(
      color: Colors.deepOrange,
      child: Center(
          child: Text("Hello Flutter",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23.4,
                  fontStyle: FontStyle.italic))),
    );
/*    return Center(
      child: Text("Hello Flutter!",
        textDirection: TextDirection.ltr,)
    );*/
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {

  int _index = 0;
  List quotes = [
    "1","2","3","4","5"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Container(
                          width: 350,
                          height: 200,
                          margin: EdgeInsets.all(30.0),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular((14.5))
                          ),
                          child: Center(child: Text(quotes[_index % quotes.length],
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontStyle: FontStyle.italic,
                            fontSize: 16.5,
                          ),
                          ))),
                    ),
                  ),
                  Divider(thickness: 1.3,),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: TextButton.icon(
                        onPressed: _showQuote(),
                        icon: Icon(Icons.wb_sunny),
                        label: Text("Inspire me!", style: TextStyle(
                        fontSize: 18.8,
                        color: Colors.greenAccent
                        ),),
                        style: TextButton.styleFrom(
                          primary: Colors.greenAccent.shade700
                        ),


                    )
                  ),
                  Spacer()
                ]
            )
        )
    );
  }

  _showQuote() {
    setState(() {
      _index += 1;
    });
    //return _index;

  }
}
