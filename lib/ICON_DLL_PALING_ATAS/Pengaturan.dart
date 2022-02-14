import 'package:flutter/material.dart';

class Pengaturan extends StatefulWidget {
  @override
  _PengaturanState createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text('Pengaturan'),
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   height: 30,
                //   width: 45,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage('gambar/images/cari_donasi.png'),
                //           fit: BoxFit.cover)),
                // ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Data Umum'),
                        SizedBox(height: 3,),
                        Row(
                          children: [
                            Text('Data diri,',style: TextStyle(color:Colors.grey,fontSize: 12)),
                            SizedBox(width: 4,),
                             Text('Email,',style: TextStyle(color:Colors.grey,fontSize: 12)),
                             SizedBox(width: 4,),
                              Text('dan',style: TextStyle(color:Colors.grey,fontSize: 12)),
                              SizedBox(width: 4,),
                               Text('Nomor Telepon',style: TextStyle(color:Colors.grey,fontSize: 12)),
                          ],
                        ),
                         Container(
                           margin: EdgeInsets.only(top:10,right:10),
                           height: 1,
                           color: Colors.grey[300],
                         )
                         ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
           Padding(
            padding: const EdgeInsets.only(top:10.0,left:10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 36,top:10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Keamanan'),
                        SizedBox(height: 3,),
                        Text('Ubah Kata Sandi',style: TextStyle(color:Colors.grey,fontSize: 12)),
                         Container(
                           margin: EdgeInsets.only(top:10,right:10),
                           height: 1,
                           color: Colors.grey[300],
                         )
                         ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.only(top:10.0,left:10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:35,top:10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Daftar ALamat'),
                        SizedBox(height: 3,),
                        Text('Alamat Penerimaan Pesanan',style: TextStyle(color:Colors.grey,fontSize: 12)),
                         Container(
                           margin: EdgeInsets.only(top:10,right:10),
                           height: 1,
                           color: Colors.grey[300],
                         )
                         ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
            //
          Padding(
            padding: const EdgeInsets.only(top:10.0,left:10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:35,top:10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Keuangan'),
                        SizedBox(height: 3,),
                        Text('Akun Bank',style: TextStyle(color:Colors.grey,fontSize: 12)),
                         Container(
                           margin: EdgeInsets.only(top:10,right:10),
                           height: 1,
                           color: Colors.grey[300],
                         )
                         ],
                    ),
                  ),
                ),
              ],
            ),
          ),
            //
          Padding(
            padding: const EdgeInsets.only(top:10.0,left:10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:35,top:10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lokasi'),
                        SizedBox(height: 3,),
                        Text('Mendeteksi lokasi secara otomatis',style: TextStyle(color:Colors.grey,fontSize: 12)),
                         Container(
                           margin: EdgeInsets.only(top:10,right:10),
                           height: 1,
                           color: Colors.grey[300],
                         )
                         ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//tumis kates, gulai tahu udang, tauco ikan
