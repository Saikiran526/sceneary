import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/edit_profile/edit_profile_viewmodel.dart';
import 'package:sceneary/presentation/edit_profile/utils.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(title: "Profile"),
      body: ChangeNotifierProvider(
        create: (_) => EditProfileViewmodel(),
        child: Consumer<EditProfileViewmodel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 64,
                                backgroundColor: Color(0xffD9D9D9),
                              ),
                              Positioned(
                                bottom: 4,
                                right: 13,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.edit,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          'Profile Picture',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    customTextFieldWithHeading(
                      size: size,
                      heading: 'Full Name',
                      hintText: 'Saikiran L',
                      controller: viewModel.nameController,
                      readOnly: false,
                    ),
                    SizedBox(height: height * 0.02),
                    // customTextFieldWithHeading(size: size,
                    //     heading: 'Email ID',
                    //     hintText: 'saikiran@gmail.com',
                    //     controller: viewModel.emailController,
                    //     suffix: SizedBox(height:25,width:25,child: editContainer()),
                    //     readOnly: true
                    // ),
                    // SizedBox(height: height*0.02),
                    // customTextFieldWithHeading(size: size,
                    //     heading: 'Mobile Number',
                    //     hintText: '9876543210',
                    //     controller: viewModel.mobileNumController,
                    //     suffix: SizedBox(height:25,width:25,child: editContainer()),
                    //     readOnly: true
                    // ),
                    customTextFieldWithHeading(
                      size: size,
                      heading: 'Email ID',
                      hintText: 'saikiran@gmail.com',
                      controller: viewModel.emailController,
                      suffix: SizedBox(
                        height: 25,
                        width: 25,
                        child: editContainer(context, viewModel, 'email'),
                      ),
                      readOnly: true,
                    ),

                    SizedBox(height: height * 0.02),

                    customTextFieldWithHeading(
                      size: size,
                      heading: 'Mobile Number',
                      hintText: '9876543210',
                      controller: viewModel.mobileNumController,
                      suffix: SizedBox(
                        height: 25,
                        width: 25,
                        child: editContainer(context, viewModel, 'mobile'),
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: height * 0.02),
                    customTextFieldWithHeading(
                      size: size,
                      heading: 'Portfolio Video Link',
                      hintText: 'https/xxxxxxxxxxxxxxxxxxxxxxxxx',
                      controller: viewModel.portfolioLinkController,
                      readOnly: false,
                    ),
                    SizedBox(height: height * 0.02),
                    customTextFieldWithHeading(
                      size: size,
                      heading: 'Location',
                      hintText: 'Hyderabad,Telangana,India',
                      controller: viewModel.locationController,
                      readOnly: false,
                    ),
                    SizedBox(height: height * 0.02),
                    customTextFieldWithHeading(
                      size: size,
                      heading: 'Bio',
                      hintText: 'I an leading actor in Tollywood',
                      controller: viewModel.bioController,
                      readOnly: false,
                      maxLines: 3,
                    ),
                    SizedBox(height: height * 0.02),
                    localCustomDropdown(
                      heading: 'Craft',
                      hintText: 'Select craft',
                      value: viewModel.selectedCraft,
                      items: ["Actor", "Director", "Producer", "staff"],
                      onChanged: (value) {
                        viewModel.setSelectedCraft = value!;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    localCustomDropdown(
                      heading: 'Subcraft',
                      hintText: 'Select subcraft',
                      value: viewModel.selectedSubCraft,
                      items: ["Hero", "Heroin", "Stunt boy", "none"],
                      onChanged: (value) {
                        viewModel.setSelectedSubCraft = value!;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    localCustomDropdown(
                      heading: 'Experience level',
                      hintText: 'Select experience level',
                      value: viewModel.selectedExperience,
                      items: ["Expert", "Medium", "Beginner"],
                      onChanged: (value) {
                        viewModel.setSelectedExperience = value!;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    customTextFieldWithHeading(
                      size: size,
                      heading: 'Instagram',
                      hintText: '_saikiran__sai_',
                      controller: viewModel.nameController,
                      readOnly: false,
                    ),
                    SizedBox(height: height * 0.02),
                    customTextFieldWithHeading(
                      size: size,
                      heading: 'You tube',
                      hintText: 'SaikiranChannel',
                      controller: viewModel.nameController,
                      readOnly: false,
                    ),
                    SizedBox(height: height * 0.02),
                    primaryButton(text: 'Save', onPressed: () {}),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
