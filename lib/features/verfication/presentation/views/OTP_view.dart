import 'package:first_try/features/verfication/presentation/views/widgets/OTP_view_body.dart';
import 'package:flutter/material.dart';

class OtpView extends StatefulWidget {
  final String verificationId;

  OtpView({required this.verificationId});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpViewBody(verificationId: widget.verificationId),
    );
  }
}
