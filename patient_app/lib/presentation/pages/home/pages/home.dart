import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/config/navigation/navigation.dart';
import 'package:patient_app/core/services/extension/dimen.dart';
import 'package:patient_app/presentation/component/components.dart';
import 'package:patient_app/presentation/component/constants/constant.dart';
import 'package:provider/provider.dart';

import '../../../component/custom_widgets/custom_loading_widget.dart';
import '../home.dart';
import '../view_model/doctors_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<DoctorsViewModel>(context, listen: false)
        .getHomeDoctors(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DoctorsViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
              text: "Health System Care",
              textStyle: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: ColorManager.white)),
          centerTitle: true,
       /*   actions: [
            Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: ColorManager.white),
                height: 2.h,
                child: IconButton(
                  onPressed: () {
                    NavigationService.push(context, Routes.reservationsPage);
                  },
                  icon: const Icon(
                    Icons.work_history,
                    color: ColorManager.greenColor,
                  ),
                  padding: const EdgeInsets.all(0.0),
                )),
          ],*/
          automaticallyImplyLeading: false),
      body: FutureBuilder(
          future: viewModel.getHomeDoctors(context: context),
          builder: (ctx, data) {
            if (data.connectionState == ConnectionState.waiting ||
                data.hasError) {
              return const Center(
                child: CustomLoadingWidget(),
              );
            } else {
              return Consumer<DoctorsViewModel>(
                builder: (_, listData, ch) {
                  if (listData.doctorsList == null) {
                    return const Center(
                        child: CustomText(text: "Some Thing went Wrong"));
                  } else if (listData.doctorsList!.isEmpty) {
                    return const CustomText(
                      text: "No Data Yet",
                    );
                  } else {
                    return GridView.builder(
                        /*shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),*/
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 165.w / 235.h,
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.w,
                          mainAxisSpacing: 0.h,
                        ),
                        itemCount: listData.doctorsList?.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return HomeGridWidget(
                              doctor: listData.doctorsList?[index]);
                        });
                  }
                },
              );
            }
          }),
    );
  }
}
