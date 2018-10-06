import 'package:flutter/material.dart';
import 'package:newsapp_flutter/api_services.dart';
import 'package:newsapp_flutter/NewsModel.dart';
class LayoutScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text("News App"),
        elevation:3.0,
      ),
      body:FutureBuilder(
        future: getNewsList(),
          builder:(context,snapshot){
       if(snapshot.hasData){
         return ListView.builder(
             itemCount:snapshot.data.length,
             itemBuilder:(context,index)=>NewsCard(
               article: snapshot.data[index],
             ));
       }
       else{
         return Center(child: CircularProgressIndicator());
       }
      }),
    );
  }

}

class NewsCard extends StatelessWidget {
  final Article article;
  const NewsCard({@required this.article});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 3.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            getImage(),
            SizedBox(width: 15.0,),
            getInfo(),
          ],
        ),
      ),
    );
  }

  getImage() {
    return CircleAvatar(
      backgroundColor: Colors.red,
      backgroundImage: NetworkImage(article.urlToImage),
    );
  }
  getInfo(){
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(article.title,
          maxLines: 1,
          style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),),
          Text(article.description,
          style:TextStyle(fontWeight: FontWeight.w300,fontSize: 15.0),),
        ],
      ),
    );
  }
}
