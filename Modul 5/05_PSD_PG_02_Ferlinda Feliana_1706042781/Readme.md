# Read Me

Program ini merupakan program Vending Machine khusus untuk Snicker Bar dengan harga IDR 10000.

## Cara Penggunaan

Ada tiga lembar uang yang bisa digunakan untuk mengeluarkan Snicker Bar: IDR 5000, IDR 10000, dan IDR 20000. Ketiga lembar uang itu dinyatakan dalam kode dibawah ini

```
00 -> IDR 0 (tidak ada masukkan)
01 -> IDR 5000
10 -> IDR 10000
11 -> IDR 20000
```

Program telah diatur agar bisa memberikan kembalian.

## Finite State Machine

Program ini mengambil input berupa clock, reset, dan uang yang dimasukkan. Keluaran pada Mealy machine ini berupa kembalian dengan kode lembar uang seperti pada bagian Cara Penggunaan. Program akan berjalan saat CLK bernilai '1' dan reset jika RST bernilai '1'.

![alt tag](https://github.com/GeraldoMartua/PraktikumPSD/blob/master/Modul%205/05_PSD_PG_02_Ferlinda%20Feliana_1706042781/05_PSD_PG_FSM_02_Ferlinda%20Feliana_1706042781.png?raw=true)

## Wave Form

Trial dilakukan dengan ModelSim, melakukan percobaan dengan beberapa masukkan:

```
Clock 1-5:
- Uang masuk 1 = IDR 5000 (01)
- Uang masuk 2 = IDR 20000 (11)
- Kembali = IDR 5000 (01) + IDR 10000 (10)
- Snicker 1

Clock 6-9:
- Uang masuk 1 = IDR 5000 (01)
- Uang masuk 2 = IDR 10000 (10)
- Kembali = IDR 5000 (01) 
- Snicker 1

Clock 10-12:
- Uang masuk 1 = IDR 5000 (01)
- Uang masuk 2 = IDR 5000 (01)
- Kembali = IDR 0 (00) 
- Snicker 1

Clock 13-14:
- Uang masuk 1 = IDR 5000 (01)
- Kembali = IDR 0 (00) 
- Snicker 1

Clock 15:
- Uang masuk 1 = IDR 10000 (10)
- Kembali = IDR 0 (00) 
- Snicker 1

Clock 16-18:
- Uang masuk 1 = IDR 20000 (11)
- Kembali = IDR 10000 (10) 
- Snicker 1
```

![alt tag](https://github.com/GeraldoMartua/PraktikumPSD/blob/master/Modul%205/05_PSD_PG_02_Ferlinda%20Feliana_1706042781/05_PSD_PG_Wave_02_Ferlinda%20Feliana_1706042781.png?raw=true)

