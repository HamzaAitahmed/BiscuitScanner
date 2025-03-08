import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  Future<void> _launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Text(
              "What does this app do?",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(children: [
                      TextSpan(
                          text:
                              "With the use of a Convolutional Neural Network (CNN), this app can intelligently classify the image you input and gives you the name of buscuits")
                      //add teachable machine link
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => _launchInBrowser(
                        "https://github.ma/HamzaAitAhmed"),
                    child: Text(
                      "Need Help?",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(child: Container()),

            //button for rate and review with icon

            ElevatedButton.icon(
              onPressed: () {
                Share.share(
                    "");
              },
              icon: const Icon(Icons.share),
              label: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("Share the app"),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton.icon(
              onPressed: () {
                //add rate and review link
                _launchInBrowser(
                    "");
              },
              icon: const Icon(Icons.star),
              label: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("Rate and Review"),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Card(
              child: ListTile(
                title: Text(
                  "",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: const Text("v2.0.0"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
