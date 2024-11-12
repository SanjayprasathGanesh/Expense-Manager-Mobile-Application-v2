import 'package:auto_route/auto_route.dart';
import 'package:expense_manager/auto_route/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class ContactSubmitted extends StatefulWidget {
  const ContactSubmitted({super.key});

  @override
  State<ContactSubmitted> createState() => _ContactSubmittedState();
}

class _ContactSubmittedState extends State<ContactSubmitted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffe5ec),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          width: ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveBreakpoints.of(context).screenWidth * 0.6
              : ResponsiveBreakpoints.of(context).isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth * 0.9
                  : ResponsiveBreakpoints.of(context).screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      'https://media.istockphoto.com/id/1319184864/vector/thank-you-vector-lettering-on-tropical-leaves-background-isolated.jpg?s=612x612&w=0&k=20&c=aqyiCtLdkUON3Gs0tR6PJ2R3tfD5ZERD9uS6Q8FYifE='),
                  fit: BoxFit.fill,
                )),
              ),
              Container(
                margin: const EdgeInsets.all(25.0),
                child: const Text(
                  'Your Contact Form has been Submitted Successfully, our Executive will Reach You Soon',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    context.router.popAndPush(const Settings());
                  },
                  child: const Text(
                    'Back to Settings',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 15.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
