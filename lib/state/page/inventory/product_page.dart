import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/item/item_service.dart';
import 'package:flutter_smartbawangv2/db_local/item_model.dart';
import 'package:flutter_smartbawangv2/shared/rupiah_convert.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:intl/intl.dart';

class InventoryProductPage extends StatefulWidget {
  final Item item;
  final VoidCallback onRefresh;

  const InventoryProductPage(
      {super.key, required this.item, required this.onRefresh});
  @override
  State<InventoryProductPage> createState() => _InventoryProductPageState();
}

class _InventoryProductPageState extends State<InventoryProductPage> {
  @override
  Widget build(BuildContext context) {
    ItemService itemService = ItemService();
    String idBarang = widget.item.id.toString();
    String harga = formatRupiah(widget.item.price);
    String tanggalPanen =
        DateFormat('d MMM yyyy').format(widget.item.tanggalPanen);
    String jumlahSupply = widget.item.quantity.toString();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Info Produk",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.07,
            letterSpacing: -0.34,
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: 144,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/bawang.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.item.itemName,
                style: const TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$harga/kg",
                  style: const TextStyle(
                    color: Color(0xFF78287E),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )),
            // const SizedBox(height: 8),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 6),
            //   height: 80,
            //   decoration: ShapeDecoration(
            //       shape: RoundedRectangleBorder(
            //           side: BorderSide(
            //               width: 1, color: Colors.black.withOpacity(0.2)),
            //           borderRadius: BorderRadius.circular(10))),
            //   child: Column(children: [
            //     SizedBox(height: 4),
            //     Align(
            //       alignment: Alignment.centerLeft,
            //       child: Text(
            //         "Sumber Bawang",
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 12,
            //           fontWeight: FontWeight.w700,
            //           height: 0,
            //         ),
            //       ),
            //     ),
            //     SizedBox(height: 4),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             Container(
            //               width: 45,
            //               height: 45,
            //               decoration: ShapeDecoration(
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(
            //                       22.5), // Half of the width/height to make it circular
            //                 ),
            //               ),
            //               child: ClipOval(
            //                 child: Image.asset(
            //                   'assets/fotosawah.png',
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //             Container(
            //               padding: EdgeInsets.symmetric(horizontal: 10),
            //               child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       'Sawah A',
            //                       style: TextStyle(
            //                         color: Colors.black,
            //                         fontSize: 12,
            //                         fontWeight: FontWeight.w700,
            //                         height: 0,
            //                       ),
            //                     ),
            //                     SizedBox(height: 6),
            //                     Row(
            //                       children: [
            //                         Icon(Icons.pin_drop, size: 12),
            //                         SizedBox(width: 6),
            //                         Text("Brebes, Jawa Tengah",
            //                             style: TextStyle(fontSize: 10))
            //                       ],
            //                     ),
            //                   ]),
            //             )
            //           ],
            //         ),
            //         CustomButton(
            //             text: "Kunjungi Lapak",
            //             onPressed: () {},
            //             isCustomSize: true,
            //             custHeight: 40,
            //             custWidth: 130)
            //       ],
            //     )
            //   ]),
            // ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Deskripsi Produk',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.item.itemDesc,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Color(0xFF393939),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Text(
            //     'Selengkapnya',
            //     textAlign: TextAlign.right,
            //     style: TextStyle(
            //       color: AppTheme.primaryColor,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w600,
            //       height: 0,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              height: 128,
              decoration: ShapeDecoration(
                color: AppTheme.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Informasi Panen Bawang',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(6),
                    height: 78,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'ID Produk',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              Text(
                                '#$idBarang',
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tanggal Panen',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              Text(
                                tanggalPanen,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Supply Produk di Pasar',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              Text(
                                "$jumlahSupply kg",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              )
                            ],
                          )
                        ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              text: 'Hapus Produk',
              isCustomSize: true,
              custWidth: 150,
              onPressed: () async {
                itemService.deleteItem(widget.item.id!);
                widget.onRefresh();
                Navigator.pop(context);
              },
            ),
            CustomButton(
              text: 'Ubah Produk',
              isCustomSize: true,
              isWhiteButton: true,
              custWidth: 150,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
