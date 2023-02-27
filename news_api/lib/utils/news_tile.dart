import 'package:flutter/material.dart';
import 'package:news_api/models/news_model.dart';
import 'package:news_api/pages/description.dart';
import 'package:page_transition/page_transition.dart';

class NewsTile extends StatelessWidget {
  final Article article;
  const NewsTile({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

          Navigator.push(
            context,
            PageTransition(child:Description(article: article,), type: PageTransitionType.rightToLeft,settings: RouteSettings(
              arguments: article
            ),
            duration: const Duration(milliseconds: 300)
            ),

          );

        });

      },
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.blueGrey],
                begin: Alignment.bottomLeft)),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            SizedBox(
                height: 100,
                width: size.width * 0.30,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      article.urlToImage ?? "",
                      filterQuality: FilterQuality.low,
                      loadingBuilder: (_, Widget child, event) {
                        if (event == null) {
                          return child;
                        }
                        return Center(
                          child: LinearProgressIndicator(
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.cyan),
                              value: event.expectedTotalBytes != null
                                  ? event.cumulativeBytesLoaded /
                                      event.expectedTotalBytes!
                                  : null),

                        );
                      },
                      fit: BoxFit.fill,
                      errorBuilder: (_, __, ___) {
                        return const Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.black,
                            size: 32.0,
                          ),
                        );
                      },
                    ))),
            SizedBox(
              width: size.width * 0.02,
            ),
            SizedBox(
              height: 100,
              width: size.width * 0.65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: Text(
                    article.title,
                    maxLines: 2,
                    style:  TextStyle(
                      color: Colors.grey.shade300,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'PlayfairDisplay'),
                  )),
                  Flexible(
                      child: Text(
                    article.description,
                    maxLines: 3,
                    style: TextStyle(fontSize: 15,color: Colors.grey.shade300,),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
