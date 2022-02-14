import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:product/ICON_DLL_PALING_ATAS/Bantuan_&_Lainnya.dart';
import 'package:product/ICON_DLL_PALING_ATAS/Icon_dll.dart';
import 'package:product/ICON_DLL_PALING_ATAS/Layanan_Carinih.dart';
import 'package:product/ICON_DLL_PALING_ATAS/Penawaran_lainnya.dart';
import 'package:product/ICON_DLL_PALING_ATAS/Penawaran_menarik.dart';
import 'package:product/ICON_DLL_PALING_ATAS/Produk_Carinih.dart';
import 'package:product/Auth/Logout/logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

class DetailProdukHome extends StatefulWidget {
  String gambar;
  String harga;
  String description;
  String hashtag;
  String highlight;
  String name;
  String minimumorder;
  String storename;
  String dataid;
// Get Key Data
  DetailProdukHome(
      {Key key,
      this.gambar,
      this.harga,
      this.description,
      this.hashtag,
      this.highlight,
      this.name,
      this.minimumorder,
      this.storename,
      this.dataid})
      : super(key: key);
  @override
  _DetailProdukHomeState createState() => _DetailProdukHomeState();
}

class _DetailProdukHomeState extends State<DetailProdukHome>
    with TickerProviderStateMixin {
//

  // final String myUrl = "https://carinih.ws/api/product/condition/7";
  List kondisidata;
  String datakondisi;
  //
  getData() async {
    final prefs1 = await SharedPreferences.getInstance();
    datakondisi = prefs1.getString('kondisi');
    var response = await http.get(
        Uri.parse(Uri.encodeFull('https://carinih.ws/api/product/condition/7')),
        headers: {"Accept": "application/json"});
    if (kDebugMode) {
      print(response.body);
    }
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      kondisidata = converDataToJson['data'];
    });
    return "Success";
  }

  //
  List datastock;
  String stock;
  //
  getDatastock() async {
    final prefs = await SharedPreferences.getInstance();
    stock = prefs.getString('kondisi');
    var response = await http.get(
        Uri.parse(
            Uri.encodeFull('https://carinih.ws/api/product/stock/$stock')),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      datastock = converDataToJson['data'];
    });
    return "Success";
  }

//
  addData() {
    // var random = randomAlphaNumeric(32).toLowerCase();
    // String myUrl = "http://45.13.132.61:3000/reseller/signup";
    String myUrl = "https://carinih.ws/api/product_wishlist/add";
    http.post(Uri.parse(Uri.encodeFull(myUrl)), headers: {
      'Accept': 'application/json',
      // "imei": "123456"
    }, body: {
      'account_id'
      // "email": email.text,
      // "password": katasandi.text,
    }).then((response) async {
      var jsonObj = json.decode(response.body);

      print(jsonObj);
    });
  }

//
  String pengenalid;
  String productid;
  String mitraid;
  addCart() async {
    final prefs = await SharedPreferences.getInstance();
    pengenalid = prefs.getString('customer');
    //
    final prefs2 = await SharedPreferences.getInstance();
    productid = prefs2.getString('kondisi');
    //
    final prefs3 = await SharedPreferences.getInstance();
    mitraid = prefs3.getString('mitraid');
    // var random = randomAlphaNumeric(32).toLowerCase();
    // String myUrl = "http://45.13.132.61:3000/reseller/signup";
    // String myUrl = "https://carinih.ws/api/cart/addtocart";
    http.post(
        Uri.parse(Uri.encodeFull('https://carinih.ws/api/cart/addtocart')),
        headers: {
          'Accept': 'application/json',
          // "imei": "123456"
        },
        body: {
          'customer_id': '$pengenalid',
          'mitra_id': '$mitraid',
          'mitra_store_address_id': '0',
          'product_id': '$productid',
          // "email": email.text,
          // "password": katasandi.text,
        }).then((response) async {
      var jsonObj = json.decode(response.body);

      print(jsonObj);
    });
  }

  //
  List datamitraname;

  //
  String mitraidname;
  getDataMitra() async {
    final prefs1 = await SharedPreferences.getInstance();
    mitraidname = prefs1.getString('mitraid');
    var response = await http.get(
        Uri.parse(Uri.encodeFull(
            'https://carinih.ws/api/mitra/store_address/$mitraidname')),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      datamitraname = converDataToJson['data'];
    });
    return "Success";
  }

  //
  List datacart;
  String customer1;
  getDataCart() async {
    final prefs = await SharedPreferences.getInstance();
    customer1 = prefs.getString('customer');
    var response = await http.get(
        Uri.parse(Uri.encodeFull('https://carinih.ws/api/cart/$customer1')),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      datacart = converDataToJson['data'];
    });
    return "Success";
  }

//
  AnimationController _ColorAnimationController;
  AnimationController _TextAnimationController;
  Animation _colorTween, _iconColorTween, _iconColorTween1;
  Animation<Offset> _transTween;

  @override
  void initState() {
    getDataMitra();
    getData();
    getDatastock();
    Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        isLoading = true;
      });
    });
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_ColorAnimationController);
    _iconColorTween = ColorTween(begin: Colors.white, end: Colors.grey[100])
        .animate(_ColorAnimationController);
    _iconColorTween1 = ColorTween(begin: Colors.white, end: Colors.grey)
        .animate(_ColorAnimationController);
    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_TextAnimationController);
    // getJsonData();
    // getData();
    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 350);

      _TextAnimationController.animateTo(
          (scrollInfo.metrics.pixels - 350) / 50);
      return true;
    }
  }

  bool isLoading = false;
  bool tampil = false;
  bool selanjutnya = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Scaffold(
            body: NotificationListener<ScrollNotification>(
              onNotification: _scrollListener,
              child: Stack(
                children: [
                  SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: ScreenUtil().setHeight(75.h),
                        color: Colors.deepPurple[400],
                      ),
                      Container(
                        child: isLoading
                            ? Container(
                                width: double.infinity,
                                height: ScreenUtil().setHeight(300.h),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage('${widget.gambar}',
                                            scale: 100),
                                        fit: BoxFit.contain)),
                              )
                            : Container(
                                width: double.infinity,
                                height: ScreenUtil().setHeight(300.h),
                                child: Shimmer.fromColors(
                                  child: Card(
                                    color: Colors.grey,
                                  ),
                                  baseColor: Colors.grey[100],
                                  highlightColor: Colors.grey[400],
                                  direction: ShimmerDirection.ltr,
                                ),
                              ),
                      ),
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(15.w),
                            right: ScreenUtil().setWidth(15.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isLoading
                                ? Text(
                                    'Rp. ${widget.harga}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Comfortaa',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w900),
                                  )
                                : Container(
                                    height: 30.h,
                                    width: 90.w,
                                    child: Shimmer.fromColors(
                                      child: Card(
                                        color: Colors.grey,
                                      ),
                                      baseColor: Colors.grey[100],
                                      highlightColor: Colors.grey[400],
                                      direction: ShimmerDirection.ltr,
                                    )),
                            //
                            Container(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      addCart();
                                      getDataCart();
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 110.w,
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple[400],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '+',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            'Ke Keranjang',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Comfortaa',
                                                fontSize: 12.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Container(
                                      height: 20.h,
                                      width: 30.w,
                                      child: Image.asset(
                                        'gambar/images/love_icon.png',
                                        color: Colors.yellow[800],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(18.w),
                          top: ScreenUtil().setHeight(10.h),
                        ),
                        child: Row(
                          children: [
                            Container(
                                height: 20.h,
                                width: 30.w,
                                child: Image.asset('gambar/images/diskon.png')),
                            Text(
                              '10%',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: 'Comfortaa',
                                  color: Colors.deepPurple[400],
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(width: 3.w),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp ',
                                      decimalDigits: 0)
                                  .format(double.parse('90000')),
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Comfortaa',
                                fontSize: 10.sp,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2.85,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                                height: 20.h,
                                width: 25.w,
                                child: Image.asset('gambar/images/driver.png')),
                            SizedBox(width: 6.w),
                            Text(
                              'Gratis Ongkir',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: 'Comfortaa',
                                  color: Colors.deepPurple[400],
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      //
                      SizedBox(
                        height: 15,
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(15.w),
                            right: ScreenUtil().setWidth(15.w)),
                        child: Container(
                            child: Text(
                          widget.name,
                          style: TextStyle(
                              color: Colors.deepPurple[400],
                              fontFamily: 'Comfortaa',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w900),
                        )),
                      ),
                      //
                      SizedBox(
                        height: 15.h,
                      ),
                      isLoading
                          ? Padding(
                              padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(15.w),
                                right: ScreenUtil().setWidth(15.w),
                              ),
                              child: Text(
                                '${widget.highlight}',
                                style: TextStyle(fontFamily: 'Comfortaa'),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(15.w),
                                right: ScreenUtil().setWidth(15.w),
                              ),
                              child: Container(
                                height: 150.h,
                                width: double.infinity,
                                child: Shimmer.fromColors(
                                  child: Card(
                                    color: Colors.grey,
                                  ),
                                  baseColor: Colors.grey[100],
                                  highlightColor: Colors.grey[400],
                                  direction: ShimmerDirection.ltr,
                                ),
                              ),
                            ),
                      //
                      SizedBox(
                        height: 10.h,
                      ),
                      //
                      isLoading
                          ? Padding(
                              padding: EdgeInsets.only(
                                bottom: ScreenUtil().setHeight(10.h),
                                left: ScreenUtil().setWidth(15.w),
                                right: ScreenUtil().setWidth(15.w),
                              ),
                              child: Text(
                                '${widget.hashtag}',
                                style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    color: Colors.blue),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(
                                bottom: ScreenUtil().setHeight(10.h),
                                left: ScreenUtil().setWidth(15.w),
                                right: ScreenUtil().setWidth(15.w),
                              ),
                              child: Container(
                                height: 40.h,
                                width: 250.w,
                                child: Shimmer.fromColors(
                                  child: Card(
                                    color: Colors.grey,
                                  ),
                                  baseColor: Colors.grey[100],
                                  highlightColor: Colors.grey[400],
                                  direction: ShimmerDirection.ltr,
                                ),
                              ),
                            ),
                      //
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(25.w),
                          top: ScreenUtil().setWidth(8.h),
                        ),
                        child: Row(
                          children: [
                            //
                            Column(
                              children: [
                                Text('4.5',
                                    style: TextStyle(
                                        fontFamily: 'Comfortaa',
                                        color: Colors.deepPurple[400],
                                        fontWeight: FontWeight.w900)),
                                SizedBox(height: 5.h),
                                Text(
                                  'Penilaian',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            //
                            SizedBox(
                              width: 10.w,
                            ),
                            //
                            Container(
                              height: 40.h,
                              width: 3.w,
                              color: Colors.yellow[800],
                            ),
                            //
                            SizedBox(
                              width: 10.w,
                            ),
                            //
                            Column(
                              children: [
                                Text('250',
                                    style: TextStyle(
                                        fontFamily: 'Comfortaa',
                                        color: Colors.deepPurple[400],
                                        fontWeight: FontWeight.w900)),
                                SizedBox(height: 5.h),
                                Text(
                                  'Terjual',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            //
                            SizedBox(
                              width: 10.w,
                            ),
                            //
                            Container(
                              height: 40.h,
                              width: 3.w,
                              color: Colors.yellow[800],
                            ),
                            //
                            SizedBox(
                              width: 10.w,
                            ),
                            //
                            Column(
                              children: [
                                Text('120',
                                    style: TextStyle(
                                        fontFamily: 'Comfortaa',
                                        color: Colors.deepPurple[400],
                                        fontWeight: FontWeight.w900)),
                                SizedBox(height: 5.h),
                                Text(
                                  'Sisa Stok',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //
                      SizedBox(height: 10.h),
                      Container(
                        height: 30.h,
                        color: Colors.grey[300],
                      ),
                      //
                      SizedBox(height: 0.h),
                      //
                      isLoading
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(15.w),
                                  right: ScreenUtil().setWidth(15.w)),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: datamitraname == null
                                      ? 0
                                      : datamitraname.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('DIjual Oleh',
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 15.sp)),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                              datamitraname[index]
                                                  ['store_name'],
                                              style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                color: Colors.deepPurple[400],
                                                fontWeight: FontWeight.w900,
                                              )),
                                        ),
                                      ],
                                    );
                                  }),
                            )
                          : Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(15.w),
                                  right: ScreenUtil().setWidth(15.w)),
                              child: Container(
                                height: 40.h,
                                width: 250.w,
                                child: Shimmer.fromColors(
                                  child: Card(
                                    color: Colors.grey,
                                  ),
                                  baseColor: Colors.grey[100],
                                  highlightColor: Colors.grey[400],
                                  direction: ShimmerDirection.ltr,
                                ),
                              ),
                            ),
                      //
                      SizedBox(
                        height: 5.h,
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(15.w),
                            right: ScreenUtil().setWidth(15.w)),
                        child: Container(
                            width: 80.w,
                            child: Image(
                                image: AssetImage(
                                    'gambar/images/rating_icon.png'))),
                      ),
                      //
                      SizedBox(
                        height: 5.h,
                      ),
                      //
                      Stack(
                        overflow: Overflow.visible,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(15.w),
                                  right: ScreenUtil().setWidth(15.w)),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Kota',
                                      style: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 15.sp)),
                                  SizedBox(width: 3.w),
                                  Text('Jakarta',
                                      style: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          color: Colors.deepPurple[400],
                                          fontWeight: FontWeight.w900,
                                          fontSize: 15.sp)),
                                  SizedBox(width: 3.w),
                                  Text('Selatan',
                                      style: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          color: Colors.deepPurple[400],
                                          fontWeight: FontWeight.w900,
                                          fontSize: 15.sp)),
                                ],
                              )),
                          //
                          Positioned(
                            left: 186.w,
                            bottom: 3.h,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.yellow[800],
                                      borderRadius: BorderRadius.circular(12)),
                                  height: 28.h,
                                  width: 75.w,
                                  child: Center(
                                      child: Text('Chat Penjual',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp,
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w900))),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.yellow[800],
                                      borderRadius: BorderRadius.circular(12)),
                                  height: 28.h,
                                  width: 75.w,
                                  child: Center(
                                      child: Text('+ Follow',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp,
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w900))),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      //
                      SizedBox(height: 25.h),
                      Container(
                        height: 30.h,
                        color: Colors.grey[300],
                      ),
                      //
                      SizedBox(
                        height: 8.h,
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(5.w),
                        ),
                        child: Row(
                          children: [
                            Container(
                                height: 60.h,
                                width: 60.w,
                                child: Image.asset(
                                    'gambar/images/lihat_promo.png')),
                            Text(
                              'Lihat Promo Lainnya',
                              style: TextStyle(
                                  color: Colors.deepPurple[400],
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        height: 30.h,
                        color: Colors.grey[300],
                      ),
                      //
                      SizedBox(
                        height: 10.h,
                      ),
                      //
                      Padding(
                        padding:
                            EdgeInsets.only(left: ScreenUtil().setWidth(15.w)),
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                'Deskripsi',
                                style: TextStyle(
                                    color: Colors.deepPurple[400],
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15.sp),
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                'Produk',
                                style: TextStyle(
                                    color: Colors.yellow[800],
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //
                      SizedBox(
                        height: 8.h,
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(15.w),
                            right: ScreenUtil().setWidth(15.w)),
                        child: Container(
                          child: Text(
                            '${widget.description}'.split('.')[0],
                            style: TextStyle(
                                fontFamily: 'Comfortaa', color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(15.w),
                            right: ScreenUtil().setWidth(15.w)),
                        child: Container(
                          child: Text(
                            '${widget.description}'.split('.')[3],
                            style: TextStyle(
                                fontFamily: 'Comfortaa', color: Colors.grey),
                          ),
                        ),
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(15.w),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Baca Selengkapnya',
                              style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  color: Colors.deepPurple[400],
                                  fontSize: 12.sp),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tampil = !tampil;
                                  });
                                },
                                child: Icon(Icons.arrow_drop_down)),
                          ],
                        ),
                      ),
                      tampil
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(15.w),
                                  right: ScreenUtil().setWidth(15.w)),
                              child: Container(
                                child: Text('${widget.description}',
                                    style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                    )),
                              ),
                            )
                          : SizedBox(),
                      //
                      SizedBox(height: 10.h),
                      //
                      Container(
                        height: 30.h,
                        color: Colors.grey[300],
                      ),
                      //
                      SizedBox(
                        height: 10.h,
                      ),
                      //
                      Stack(
                        overflow: Overflow.visible,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(15.w), top: 5.h),
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Informasi',
                                    style: TextStyle(
                                        color: Colors.deepPurple[400],
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15.sp),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    'Produk',
                                    style: TextStyle(
                                        color: Colors.yellow[800],
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //
                          Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  datastock == null ? 0 : datastock.length,
                              itemBuilder: (context, i) {
                                return Container(
                                  // margin:EdgeInsets.only(),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Stock',
                                          style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 12.sp),
                                        ),
                                        '${datastock[i]['value']}' == null
                                            ? Text(
                                                'Tidak ada',
                                                style: TextStyle(
                                                    fontFamily: 'Comfortaa',
                                                    fontSize: 12.sp),
                                              )
                                            : Text(
                                                '${datastock[i]['value']}',
                                                style: TextStyle(
                                                    fontFamily: 'Comfortaa',
                                                    fontSize: 12.sp),
                                              )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          //
                          Container(
                            margin: EdgeInsets.only(top: 20.h),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  datastock == null ? 0 : datastock.length,
                              itemBuilder: (context, i) {
                                return Container(
                                  // margin:EdgeInsets.only(),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Merek',
                                          style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 12.sp),
                                        ),
                                        Text(
                                          'Baru',
                                          style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 12.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          //
                          Container(
                            margin: EdgeInsets.only(top: 40.h),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  datastock == null ? 0 : datastock.length,
                              itemBuilder: (context, i) {
                                return Container(
                                  // margin:EdgeInsets.only(),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Berat',
                                          style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 12.sp),
                                        ),
                                        Text(
                                          '300 Gram',
                                          style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 12.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          //
                          Container(
                            margin: EdgeInsets.only(top: 65),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  kondisidata == null ? 0 : kondisidata.length,
                              itemBuilder: (context, i) {
                                return Container(
                                  // margin:EdgeInsets.only(),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Kondisi',
                                          style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 12.sp),
                                        ),
                                        '${kondisidata[i]['name']}' == null
                                            ? Text(
                                                'Tidak ada',
                                                style: TextStyle(
                                                    fontFamily: 'Comfortaa',
                                                    fontSize: 12.sp),
                                              )
                                            : Text(
                                                '${kondisidata[i]['name']}',
                                                style: TextStyle(
                                                    fontFamily: 'Comfortaa',
                                                    fontSize: 12.sp),
                                              )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          //
                          Container(
                            margin: EdgeInsets.only(top: 78.h),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  datastock == null ? 0 : datastock.length,
                              itemBuilder: (context, i) {
                                return Container(
                                  // margin:EdgeInsets.only(),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Asuransi',
                                          style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 12.sp),
                                        ),
                                        Text(
                                          'Ya',
                                          style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 12.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          //
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 150.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pemesanan Minimum',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa', fontSize: 12.sp),
                                ),
                                Text(
                                  '${widget.minimumorder} Buah',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa', fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                          //
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 168.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Kategori',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa', fontSize: 12.sp),
                                ),
                                Text(
                                  'Perlengkapan Kesehatan',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontSize: 12.sp,
                                      color: Colors.deepPurple[400]),
                                ),
                              ],
                            ),
                          ),
                          //
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 187.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Etalse',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa', fontSize: 12.sp),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 160.w),
                                    child: Text(
                                      '${widget.name}',
                                      style: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          fontSize: 12.sp,
                                          color: Colors.deepPurple[400]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child:
                                Divider(thickness: 2, color: Colors.grey[350]),
                          )
                          //    ListView.builder(
                          // shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          // itemCount: datamerek == null ? 0 : datamerek.length,
                          // itemBuilder: (context, i) {
                          //   return Container(
                          //     // margin:EdgeInsets.only(),
                          //     child: ListTile(
                          //         title: Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             Text('Merek',style: TextStyle(
                          //     fontFamily: 'Comfortaa', fontSize: 12.sp),),
                          //             '${data[i]['value']}'==null?Text('${data[i]['value']}',style: TextStyle(
                          //     fontFamily: 'Comfortaa', fontSize: 12.sp),):Text('Tidak ada',style: TextStyle(
                          //     fontFamily: 'Comfortaa', fontSize: 12.sp),)
                          //           ],
                          //         ),

                          //         ),
                          //   );
                          // },
                          //   ),
                        ],
                      ),
                      //
                      SizedBox(
                        height: 10.h,
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(15.w),
                            right: ScreenUtil().setWidth(15.w)),
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Stack(

                            //   children: [

                            //   ],
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Stok',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     ),
                            //     Text(
                            //       '120',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     )
                            //   ],
                            // ),
                            // //
                            // SizedBox(
                            //   height: 13.h,
                            // ),
                            // //
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Merek',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     ),
                            //     Text(
                            //       'CARInih',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     ),
                            //   ],
                            // ),
                            // //
                            // SizedBox(
                            //   height: 13.h,
                            // ),
                            // //
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Berat',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     ),
                            //     Text(
                            //       '300 Gram',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     ),
                            //   ],
                            // ),
                            // //
                            // // SizedBox(
                            // //   height: 13.h,
                            // // ),
                            // //
                            // // Row(
                            // //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // //   children: [
                            //     // Text(
                            //     //   'Kondisi',
                            //     //   style: TextStyle(
                            //     //       fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     // ),
                            //     ListView.builder(
                            //       shrinkWrap: true,
                            //       physics: NeverScrollableScrollPhysics(),
                            //       itemCount: data == null ? 0 : data.length,
                            //       itemBuilder: (context, i) {
                            //         return Container(
                            //           // margin:EdgeInsets.only(),
                            //           child: ListTile(
                            //               title: Row(
                            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            //                 children: [
                            //                   Text('Kondisi',style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),),
                            //                   Text(data[i]['name'],style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),),
                            //                 ],
                            //               ),

                            //               ),
                            //         );
                            //       },
                            //     ),
                            // //   ],
                            // // ),
                            // // //
                            // SizedBox(
                            //   height: 13.h,
                            // ),
                            // //
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Asuransi',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     ),
                            //     Text(
                            //       'Ya',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     ),
                            //   ],
                            // ),
                            // //
                            // SizedBox(
                            //   height: 13.h,
                            // ),
                            // //
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Pemesanan Minimum',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     ),
                            //     Text(
                            //       '${widget.minimumorder} Buah',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     ),
                            //   ],
                            // ),
                            // //
                            // SizedBox(
                            //   height: 13.h,
                            // ),
                            // //
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Kategori',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     ),
                            //     Text(
                            //       'Perlengkapan Kesehatan',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa',
                            //           fontSize: 12.sp,
                            //           color: Colors.deepPurple[400]),
                            //     ),
                            //   ],
                            // ),
                            // //
                            // SizedBox(
                            //   height: 13.h,
                            // ),
                            // //
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Etalse',
                            //       style: TextStyle(
                            //           fontFamily: 'Comfortaa', fontSize: 12.sp),
                            //     ),
                            //     Expanded(
                            //       child: Container(
                            //         margin: EdgeInsets.only(left: 150.w),
                            //         child: Text(
                            //           '${widget.name}',
                            //           style: TextStyle(
                            //               fontFamily: 'Comfortaa',
                            //               fontSize: 12.sp,
                            //               color: Colors.deepPurple[400]),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        )),
                      ),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                    ],
                  )),
                  Stack(
                    children: [
                      //
                      AnimatedOpacity(
                        opacity: selanjutnya ? 1.0 : 0.0,
                        duration: Duration(seconds: 1),
                        child: selanjutnya
                            ? Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    margin: EdgeInsets.only(left: 12),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        child: Container(
                                          // color: Colors.red,
                                          margin: EdgeInsets.only(top: 70),
                                          child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconDLL(),
                                              PenawaranMenarik(),
                                              PenawaranLainnya(),
                                              ProdukCarinih(),
                                              LayananCARInih(),
                                              BantuanLainnya(),
                                              Logout()
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.deepPurple[400],
                                    margin: EdgeInsets.only(),
                                    padding: EdgeInsets.only(
                                      left:
                                          MediaQuery.of(context).padding.left /
                                              15,
                                      right:
                                          MediaQuery.of(context).padding.right /
                                              10,
                                      top: MediaQuery.of(context).padding.top,
                                      // bottom: 5.h,
                                    ),
                                    height: MediaQuery.of(context).size.height /
                                            14 +
                                        MediaQuery.of(context).padding.top,
                                  )
                                ],
                              )
                            : SizedBox(),
                      ),
                      //
                      AnimatedBuilder(
                        animation: _ColorAnimationController,
                        builder: (context, child) => Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                    color: _colorTween.value,
                                    margin: EdgeInsets.only(),
                                    padding: EdgeInsets.only(
                                      left:
                                          MediaQuery.of(context).padding.left /
                                              15,
                                      right:
                                          MediaQuery.of(context).padding.right /
                                              10,
                                      top: MediaQuery.of(context).padding.top,
                                      // bottom: 5.h,
                                    ),
                                    height: MediaQuery.of(context).size.height /
                                            14 +
                                        MediaQuery.of(context).padding.top,
                                    // unutk searcbar na
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: _iconColorTween.value,
                                            ),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                16,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.8,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  hintText: 'Cari masker medis',
                                                  border: InputBorder.none,
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Comfortaa'),
                                              ),
                                            )),
                                        Row(
                                          children: [
                                            Container(
                                                height: 20,
                                                width: 25,
                                                child: Image.asset(
                                                  'gambar/images/love_icon.png',
                                                  color: _iconColorTween1.value,
                                                  fit: BoxFit.contain,
                                                )),
                                            //
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            //
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selanjutnya = !selanjutnya;
                                                });
                                              },
                                              child: Container(
                                                  height: 20,
                                                  width: 25,
                                                  child: Image.asset(
                                                    'gambar/images/dll_icon.png',
                                                    color:
                                                        _iconColorTween1.value,
                                                    fit: BoxFit.contain,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ],
                                    )),
                                Container(
                                  height: 35,
                                  color: Colors.white24,
                                )
                              ],
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
        ),
      ),
    );
  }
}

class DataMitra extends StatelessWidget {
  final String myUrl = "https://carinih.ws/api/mitra/";
  List data;

  //
  Future<String> getDataMitra() async {
    var response = await http.get(Uri.parse(Uri.encodeFull(myUrl)),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    var converDataToJson = json.decode(response.body);
    data = converDataToJson['data'];
    return "Success";
  }

  @override
  void initState() {
    getDataMitra();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int i) {
        return Text('${data[i]['store_name']}');
      },
    );
  }
}
