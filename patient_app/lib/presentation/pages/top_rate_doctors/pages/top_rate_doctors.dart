import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/config/navigation/navigation.dart';
import 'package:patient_app/core/services/extension/dimen.dart';
import 'package:patient_app/presentation/component/components.dart';
import 'package:patient_app/presentation/component/constants/constant.dart';
import 'package:provider/provider.dart';

import '../../../component/custom_widgets/custom_loading_widget.dart';
import '../top_rate_doctor.dart';
import '../view_model/top_rate_doctors_view_model.dart';

class TopRateDoctorsPage extends StatefulWidget {
  const TopRateDoctorsPage({Key? key}) : super(key: key);

  @override
  State<TopRateDoctorsPage> createState() => _TopRateDoctorsPageState();
}

class _TopRateDoctorsPageState extends State<TopRateDoctorsPage> {
  @override
  void initState() {
    Provider.of<TopRateDoctorsViewModel>(context, listen: false)
        .getTopDoctors(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TopRateDoctorsViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
              text: "Top Rate Doctors",
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
          future: viewModel.getTopDoctors(context: context),
          builder: (ctx, data) {
            if (data.connectionState == ConnectionState.waiting ||
                data.hasError) {
              return const Center(
                child: CustomLoadingWidget(),
              );
            } else {
              return Consumer<TopRateDoctorsViewModel>(
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
                          return TopRateDoctorsGridWidget(
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
