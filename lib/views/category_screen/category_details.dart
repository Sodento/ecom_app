import 'package:ecomm_app/consts/consts.dart';
import 'package:ecomm_app/controllers/product_controller.dart';
import 'package:ecomm_app/views/category_screen/item_details.dart';
import 'package:ecomm_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;

  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    controller.subcat.length,
                    (index) => "${controller.subcat[index]}".text
                        .size(12)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(120, 60)
                        .margin(EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),
            20.heightBox,
            //items container
            Expanded(
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP5,
                          width: 200,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        "Laptop 4GB/64"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        10.heightBox,
                        "\$600".text.color(redColor).fontFamily(bold).make(),
                        10.heightBox,
                      ],
                    )
                        .box
                        .white
                        .margin(const EdgeInsets.all(12))
                        .roundedSM
                        .outerShadowSm
                        .padding(const EdgeInsets.all(12))
                        .make()
                        .onTap(() {
                      Get.to(() => ItemDetails(title: "Dummy item"));
                    });
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
