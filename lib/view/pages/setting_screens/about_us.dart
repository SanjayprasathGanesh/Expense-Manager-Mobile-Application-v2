import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFffb700),
      ),
      backgroundColor: const Color(0xFFffe5ec),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          width: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.7
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                  : ResponsiveBreakpoints.of(context).screenWidth,
          height: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenHeight * 0.9
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenHeight * 1.2
                  : ResponsiveBreakpoints.of(context).screenHeight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/sanjay.jpg'),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Author Name: Sanjay Prasath Ganesh',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Designation: App Developer',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Qualification: BE - Computer Science (2020-2024)',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Apps Developed:',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  _buildProjectTile(
                    context,
                    title: 'Flipkart Clone User Platform',
                    description:
                        'The user can search, buy, and add products to the cart and wishlist. Also, users can provide feedback and rate the Flipkart application.',
                  ),
                  const SizedBox(height: 8.0),
                  _buildDownloadButton(context),
                  const SizedBox(height: 8.0),
                  _buildProjectTile(
                    context,
                    title: 'Redbus Clone Application',
                    description:
                        'In the user panel, users can login/signup, search for buses, book seats, make payments, and cancel tickets. In the admin panel, admins can add buses, view revenue and expenses, and analyze user data.',
                  ),
                  const SizedBox(height: 8.0),
                  _buildDownloadButton(context),
                  const SizedBox(height: 16.0),
                  _buildIconWithLink(
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                    label: 'GitHub',
                    link: 'https://github.com/SanjayprasathGanesh',
                  ),
                  const SizedBox(height: 8.0),
                  _buildIconWithLink(
                    iconUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/LinkedIn_logo_initials.png/600px-LinkedIn_logo_initials.png',
                    label: 'LinkedIn',
                    link:
                        'https://www.linkedin.com/in/sanjay-prasath-b46b9925a/',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProjectTile(BuildContext context,
      {required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          description,
          style: const TextStyle(
            fontSize: 15.0,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildDownloadButton(BuildContext context) {
    return Center(
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.blue,
        onPressed: () {},
        child: const Text(
          'Download This App',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      return Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Could not launch the URL'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildIconWithLink(
      {required String iconUrl, required String label, required String link}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          iconUrl,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 8.0),
        TextButton(
          onPressed: () {
            _launchURL(link);
          },
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.blue,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }
}
