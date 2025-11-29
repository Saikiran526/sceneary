import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/create_project/utils.dart';
import 'create_project_viewmodel.dart';

class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    // final width= MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => CreateProjectViewmodel(),
      child: Consumer<CreateProjectViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Create New Project"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Fill the details to create a new project"),
                    const SizedBox(height: 8),
                    customTextField(
                      label: "Project Title",
                      hint: "Enter here",
                      controller: viewModel.titleController,
                    ),
                    SizedBox(height: height*0.01,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Production Banner",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xff000000).withAlpha(20),
                                    )
                                  ),
                                  child:Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                                    child: Text(
                                      '+ Add new',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff4F4F4F),
                                      ),
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 4),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            hintText: 'Enter here...',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF5D5D5D),
                            ),
                            contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0x33000000),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0x33000000),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0x33000000),
                                width: 1,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: const Color(0x33000000).withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    customTextField(
                      label: "Project Type",
                      hint: "Select",
                      controller: viewModel.titleController,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: customTextField(
                            label: "Director",
                            hint: "Enter here",
                            controller: viewModel.titleController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: customTextField(
                            label: "Producer Name",
                            hint: "Enter here",
                            controller: viewModel.titleController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: customTextField(
                            label: "Start Date",
                            hint: "Pick a date",
                            controller: viewModel.startDateController,
                            suffix: SvgPicture.asset(AssetsPath.calendarImg),
                            onTap: () {
                              viewModel.pickStartDate(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: customTextField(
                            label: "End Date",
                            hint: "Pick a date",
                            controller: viewModel.endDateController,
                            onTap: () {
                              viewModel.pickEndDate(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    customTextField(
                      label: "Estimated Budget",
                      hint: "e.g. 200000000",
                      controller: viewModel.titleController,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: customTextField(
                            label: "Genre",
                            hint: "e.g. drama",
                            controller: viewModel.titleController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: customTextField(
                            label: "Language",
                            hint: "e.g. Telugu Hindi",
                            controller: viewModel.titleController,
                          ),
                        ),
                      ],
                    ),
                    customTextField(
                      label: "Description/Synopsis",
                      hint: "Enter here..",
                      maxLines: 3,
                      controller: viewModel.titleController,
                    ),
                    uploadWidget(
                      width: double.infinity,
                      height: 140,
                      label: "Project Poster",
                      icon: Icons.upload_outlined,
                      title: "Click to upload",
                      subtitle: "PDF, JPG, upto 5MB",
                      onTap: () {
                        print("Upload tapped!");
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: customTextField(
                            label: "Project Crew List",
                            hint: "Role.",
                            controller: viewModel.titleController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 3,
                          child: customTextField(
                            hint: "Name, Mobile Number",
                            controller: viewModel.titleController,
                          ),
                        ),
                        const SizedBox(width: 10),

                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: responsiveButton(
                              text: "Add",
                              onTap: () => print("Submit Clicked"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    responsiveButton(
                      text: "Create Project",
                      onTap: () => print("Submit Clicked"),
                    ),
                    SizedBox(height: 10),
                    responsiveButton(
                      text: "Save as Draft",
                      bgColor: Colors.white,
                      textColor: Colors.black,
                      onTap: () => print("Submit Clicked"),
                      borderColor: Colors.grey,
                      borderWidth: 1,
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
