import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class GiftVoucher extends StatelessWidget {
  const GiftVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cards",
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
          child: ListView(
            children: const [
              GiftVoucherCard(
                cardColor: Colors.blue,
                promoCode: 'APPL30OFF',
                title: 'Apple',
                subTitle: 'Get 30% off on selected Apple products',
              ),
              SizedBox(height: 16.0),
              GiftVoucherCard(
                cardColor: Colors.green,
                promoCode: 'JUSTDOIT20',
                title: 'Nike',
                subTitle:
                    'Use code JUSTDOIT20 for an extra 20% off on Nike items.',
              ),
              SizedBox(height: 16.0),
              GiftVoucherCard(
                cardColor: Colors.orange,
                promoCode: 'AMAZONSALE25',
                title: 'Amazon',
                subTitle:
                    'Enjoy a 25% discount on your next purchase with code AMAZONSALE25.',
              ),
              SizedBox(height: 16.0),
              GiftVoucherCard(
                cardColor: Colors.blueGrey,
                promoCode: 'COFFEELOVE5',
                title: 'StarBucks',
                subTitle:
                    'Use code COFFEELOVE5 for ₹500 off on your Starbucks order.',
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}

class GiftVoucherCard extends StatefulWidget {
  final Color cardColor;
  final String promoCode;
  final String title;
  final String subTitle;

  const GiftVoucherCard(
      {super.key,
      required this.cardColor,
      required this.promoCode,
      required this.title,
      required this.subTitle});

  @override
  _GiftVoucherCardState createState() => _GiftVoucherCardState();
}

class _GiftVoucherCardState extends State<GiftVoucherCard> {
  bool isCopied = false;

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.promoCode));
    setState(() {
      isCopied = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.cardColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.subTitle,
              style: const TextStyle(
                fontSize: 14.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Promo Code: ${widget.promoCode}',
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16.0),
            MaterialButton(
              color: Colors.transparent,
              onPressed: isCopied ? null : copyToClipboard,
              child: Text(isCopied ? 'Copied!' : 'Copy Promo Code'),
            ),
          ],
        ),
      ),
    );
  }
}
