import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/order_widgets/view_order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin{

  late TabController _tabController;
  late bool _isLoggedIn;

  @override
  void initState(){
    super.initState();
    /* //Get.find<OrderController>().getOrderList();
    _isLoggedIn = Get.find<LoginController>().userLoggedIn();
    if(_isLoggedIn){
      _tabController = TabController(length:2, vsync: this);
      Get.find<OrderController>().getOrderList();
    } */
    _tabController = TabController(length:2, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('My Orders', 
          style: GoogleFonts.roboto(color:Theme.of(context).primaryColorLight)
        ),
        leading: Container(),
        titleSpacing: 0.0,
        elevation: 0,
        centerTitle: true
      ),
      body: /* _isLoggedIn ? */ Column(
        children: [
          SizedBox(
            width: Dimensions.screenWidth,
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: const Color(0xFFBDBDBD),
              indicatorColor: Theme.of(context).primaryColorLight,
              indicatorWeight: 4,
              tabs: [
                Tab(child: Text('Current',
                  style: GoogleFonts.roboto(color:Theme.of(context).primaryColorLight))),
                Tab(child: Text('Completed',
                  style: GoogleFonts.roboto(color:Theme.of(context).primaryColorLight))),
              ]
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                OrderView(isCurrent: true),
                OrderView(isCurrent: false),
              ]
            ),
          )
        ],
      ) /* : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(Dimensions.height15),
                child: Container(
                  width: Dimensions.height20*10,
                  height: Dimensions.height20*10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                        'assets/images/cart.png'
                      )
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dimensions.height10),
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoute.getLogin());
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.height50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius5),
                      color: Theme.of(context).primaryColor
                    ),
                    child: const Center(child: BigText(text: 'Sign In', color: Colors.white)),
                  ),
                ),
              ),
            ],
          )
      ) */
    );
  }
}