import 'package:covidapp/ui/Home_pages/page_faqs.dart';
import 'package:flutter/material.dart';

class PageMapa extends StatelessWidget {
  void faqsPress(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => PageFaqs(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: ElevatedButton(
                        onPressed: () => faqsPress(context),
                        child: Center(
                          child: Text("Preguntas frecuentes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    'Casos totales',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 20,
                      child: VerticalDivider(color: Colors.grey, thickness: 2)),
                ),
                Expanded(
                    flex: 4,
                    child: Text(
                      'Fallecidos',
                      textAlign: TextAlign.center,
                    )),
              ])
        ],
      ),
    );
  }
}
