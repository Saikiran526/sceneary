import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/call_sheets/viewmodel/create_call_sheet_check_availability_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/custom_action_btn.dart';

class CreateCallSheetCheckAvailabilityScreen extends StatelessWidget {
  const CreateCallSheetCheckAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) =>
          CreateCallSheetCheckAvailabilityViewmodel(context: context),
      child: Consumer<CreateCallSheetCheckAvailabilityViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Create Call Sheet",
                style:  GoogleFonts.montserrat(
                  fontSize: 14,
                   fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildStepCircle(
                            number: 1,
                            color: Colors.black,
                            title: 'Basic Details',
                          ),

                          const SizedBox(width: 6),

                          SizedBox(width: width * 0.2, child: _buildLine()),
                          const SizedBox(width: 6),

                          buildStepCircle(
                            number: 2,
                            color: Colors.black,
                            title: 'Check Availability',
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: double.infinity, // full width
                      padding: const EdgeInsets.all(
                        16,
                      ), // padding inside container
                      decoration: BoxDecoration(
                        color: Colors.white, // background color
                        borderRadius: BorderRadius.circular(
                          26,
                        ), // rounded corners
                        border: Border.all(
                          color: const Color(0x33000000), // #00000033
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Step 2: Availability check & create",
                            style:     GoogleFonts.montserrat(
                               fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Review the team availability for the create call sheet",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0XFF4B4B4B),
                            ),
                          ),
                          const SizedBox(height: 16),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFD1D1D1),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Date",
                                              style:   GoogleFonts.inter(
                                                 fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "Friday, November 28,2025",
                                              style: GoogleFonts.inter(
                                                 fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.access_time_filled,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Call Time",
                                              style:     GoogleFonts.inter(
                                                 fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "8:30 AM",
                                              style:     GoogleFonts.inter(
                                                 fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Location",
                                              style:  GoogleFonts.inter(
                                                 fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "Hyderabad (Interior)",
                                              style:  GoogleFonts.inter(
                                           
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0x26000000),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Available members ",
                                          style:  GoogleFonts.inter(
                                             fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "1 / 2  ",
                                          style:   GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.red,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Available ",
                                          style:     GoogleFonts.inter(
                                             fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 10),

                                  Container(
                                    width: 204,
                                    height: 11,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD9D9D9),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Stack(
                                      children: [
                                        FractionallySizedBox(
                                          widthFactor: 0.5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Cast & Crew Availability",
                              style:  GoogleFonts.montserrat(
                                 fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.0,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "A",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "John Doe",
                                        style:  GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                        Text(
                                        "Lead Actor",
                                        style:  GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Color(0XFF888888),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 12),

                                Container(
                                  width: 86,
                                  height: 23,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF0FDF4),
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children:   [
                                      Icon(
                                        Icons.access_time_filled,
                                        size: 14,
                                        color: Color(0xFF0F8A41),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "Available",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xFF0F8A41),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                    
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey,
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "A",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:   [
                                          Text(
                                            "Arya strac",
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            "Lead Actress",
                                            style:  GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              color: Color(0XFF888888),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(width: 12),

                                    Container(
                                      width: 86,
                                      height: 23,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0XFFFEF2F2),
                                        borderRadius: BorderRadius.circular(26),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children:   [
                                          Icon(
                                            Icons.error_outline,
                                            size: 14,
                                            color: Color(0xFFC2060D),
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "Busy",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Color(0xFFC2060D),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,

                                    children: [
                                      Icon(
                                        Icons.access_time_outlined,
                                        size: 14,
                                        color: Color(0xFF6D6D6D),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "Unavailable: 2:00 PM - 6:00 PM",
                                        textAlign: TextAlign.center,
                                        style:  GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          height: 1.0,
                                          color: Color(0xFF6D6D6D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),

                    Row(
                      children: [
                        Expanded(
                          child: CustomActionButton(
                            label: "Back",
                            onTap: () {
                              Navigator.pop(context);
                            },
                            isFullWidth: true,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomActionButton(
                            label: "Create Call Sheet",
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            borderColor: Colors.black,
                            onTap: () {},
                            isFullWidth: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildStepCircle({
    required int number,
    required Color color,
    required String title,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color,
          child: Text(
            "$number",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 10,
            height: 1.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildLine() {
    return Container(
      height: 2,
      color: Colors.grey.shade400,
      margin: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
