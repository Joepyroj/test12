# tugas

Komponen-komponen MVVM
Model:
Deskripsi: Komponen Model bertanggung jawab untuk mengelola data aplikasi. Ini mencakup logika bisnis, pengelolaan data, dan komunikasi dengan sumber data (seperti database atau API).
Contoh: Kelas Task yang merepresentasikan entitas tugas dengan atribut seperti id, title, dan isCompleted.

View:
Deskripsi: Komponen View adalah antarmuka pengguna. Ini mencakup semua elemen UI yang terlihat oleh pengguna dan berinteraksi langsung dengan pengguna.
Contoh: Widget layar tugas (TaskListScreen) yang menampilkan daftar tugas dan menyediakan antarmuka untuk menambahkan atau mengelola tugas.

ViewModel:
Deskripsi: Komponen ViewModel bertindak sebagai perantara antara Model dan View. Ini mengelola logika presentasi dan status aplikasi. ViewModel memperbarui View dengan data dari Model dan menangani tindakan pengguna yang dimulai dari View.
Contoh: Kelas TaskViewModel yang mengelola daftar tugas, menyediakan metode untuk menambah, mengubah status, dan menghapus tugas, serta memberi notifikasi kepada View tentang perubahan data.


Model <----> ViewModel <----> View

Model-ViewModel: ViewModel berkomunikasi dengan Model untuk mendapatkan data dan memperbarui status.
ViewModel-View: ViewModel memperbarui View dengan data yang relevan dan View memberi tahu ViewModel tentang tindakan pengguna.
Model-View: View tidak berinteraksi langsung dengan Model, sehingga tidak ada ketergantungan langsung antara keduanya

Dengan aplikasi ini, pengguna dapat:

Melihat Daftar Tugas: Pengguna dapat melihat daftar tugas yang telah ditambahkan.
Menambah Tugas Baru: Pengguna dapat menambah tugas baru ke dalam daftar.
Menandai Tugas Sebagai Selesai: Pengguna dapat menandai tugas yang sudah selesai dikerjakan.
Menghapus Tugas: Pengguna dapat menghapus tugas dari daftar.
Aplikasi ini dibuat menggunakan pola desain MVVM (Model-View-ViewModel) yang memisahkan antara logika bisnis (Model), tampilan (View), dan pengelolaan logika tampilan (ViewModel). Hal ini membuat aplikasi lebih modular, mudah untuk diuji, dan mudah untuk dikembangkan.

Cara Menggunakan Aplikasi
1. Melihat Daftar Tugas
   Ketika aplikasi dibuka, pengguna akan melihat daftar tugas yang sudah ada. Tugas-tugas ini ditampilkan dalam bentuk daftar dengan checkbox untuk menandai status tugas (selesai/belum selesai) dan ikon tong sampah untuk menghapus tugas.

2. Menambah Tugas Baru
   Untuk menambah tugas baru, pengguna dapat menekan tombol "Floating Action Button" (ikon +) yang berada di pojok kanan bawah layar. Ini akan membuka dialog untuk menambahkan tugas baru. Pengguna dapat memasukkan judul tugas dan menekan tombol "Add" untuk menambah tugas ke dalam daftar.

3. Menandai Tugas Sebagai Selesai
   Pengguna dapat menandai tugas sebagai selesai dengan menekan checkbox yang ada di sebelah kiri judul tugas. Ini akan mengubah status tugas menjadi selesai dan mencoret judul tugas tersebut.

4. Menghapus Tugas
   Untuk menghapus tugas, pengguna dapat menekan ikon tong sampah yang ada di sebelah kanan judul tugas. Ini akan menghapus tugas dari daftar.