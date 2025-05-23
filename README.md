````markdown
# 📊 Sistem Pengelolaan Nilai Mahasiswa - Database

Dokumentasi ini menjelaskan struktur database dan proses implementasi sebagai bagian dari pengembangan Sistem Informasi Pengelolaan Nilai Mahasiswa. Proyek ini dikembangkan menggunakan MySQL dan berfokus pada penyimpanan serta pengelolaan data nilai akademik mahasiswa.

## 📅 Timeline Pengerjaan

### Hari ke-1: Perancangan ERD dan Identifikasi Entitas
- Menentukan entitas dan atribut penting: `Dosen`, `Kelas`, `Prodi`, `Mahasiswa`, `Mata_Kuliah`, `Nilai`, dan **User**.
- Merancang ERD (Entity Relationship Diagram).
- Studi kasus yang digunakan adalah sistem penilaian nilai mahasiswa.

### Hari ke-2: Implementasi Struktur Database
- Membuat database `SINilai` beserta tabel-tabel:
  - `dosen`, `kelas`, `prodi`, `mahasiswa`, `mata_kuliah`, `nilai`, `user`
- Menentukan tipe data dan relasi antar tabel menggunakan `FOREIGN KEY`.
- Menambahkan **trigger** untuk menghitung `nilai_akhir` dan `status` secara otomatis:

```sql
DELIMITER //
CREATE TRIGGER hitung_nilai_akhir
BEFORE INSERT ON nilai
FOR EACH ROW
BEGIN
    SET NEW.nilai_akhir = (NEW.tugas + NEW.uts + NEW.uas) / 3;
    IF NEW.nilai_akhir >= 50 THEN
        SET NEW.status = 'Lulus';
    ELSE
        SET NEW.status = 'Tidak Lulus';
    END IF;
END;
//
DELIMITER ;
````

* Menambahkan tabel user untuk kebutuhan login:

```sql
CREATE TABLE user (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'mahasiswa', 'dosen') NOT NULL
);
```

### Hari ke-3: Pembuatan Query Join

* Membuat query `JOIN` antara beberapa tabel untuk ditampilkan di frontend/backend:

```sql
SELECT 
    n.kode_matkul AS "Kode Mata Kuliah", 
    mk.nama_matkul AS "Nama Mata Kuliah", 
    mk.sks AS "Jumlah SKS", 
    n.nilai_akhir AS "Nilai", 
    n.status AS "Status Kelulusan"
FROM nilai n
JOIN mahasiswa m ON n.npm = m.npm
JOIN mata_kuliah mk ON n.kode_matkul = mk.kode_matkul;
```

### Hari ke-4: Pembuatan View

* Membuat `VIEW` agar query kompleks dapat dipanggil lebih efisien oleh frontend/backend:

```sql
CREATE VIEW v_nilai_mahasiswa AS
SELECT 
    n.kode_matkul AS "Kode Mata Kuliah", 
    mk.nama_matkul AS "Nama Mata Kuliah", 
    mk.sks AS "Jumlah SKS", 
    n.nilai_akhir AS "Nilai", 
    n.status AS "Status Kelulusan"
FROM nilai n
JOIN mahasiswa m ON n.npm = m.npm
JOIN mata_kuliah mk ON n.kode_matkul = mk.kode_matkul;
```

## 🗃️ Struktur Tabel

* **user(username, password, role)**
* **dosen(nidn, nama\_dosen)**
* **kelas(kode\_kelas, nama\_kelas)**
* **prodi(id\_prodi, nama\_prodi)**
* **mahasiswa(npm, nama\_mhs, kode\_kelas, id\_prodi)**
* **mata\_kuliah(kode\_matkul, nama\_matkul, semester, sks)**
* **nilai(id\_nilai, npm, kode\_matkul, nidn, tugas, uts, uas, nilai\_akhir, status)**

## 🔐 Relasi Antar Tabel

* `mahasiswa` ➝ `kelas`, `prodi`
* `nilai` ➝ `mahasiswa`, `mata_kuliah`, `dosen`
* `user` tidak memiliki foreign key, digunakan untuk autentikasi sistem

## 🧪 Testing & Evaluasi

* Telah dilakukan pengujian dengan insert data dummy untuk keperluan pengujian sistem.
* Menggunakan Postman untuk menguji data API yang ditampilkan dari query atau view.

## 🙋 Kontribusi

Role: **Database Engineer**
Tugas:

* Merancang ERD
* Membuat database dan tabel
* Menyusun relasi antar tabel
* Menambahkan trigger dan view
* Membuat tabel `user` untuk login
* Bekerja sama dengan frontend/backend untuk keperluan query

---

📁 **Direktori Terkait**

* `database/ERD.png` - Gambar diagram ERD ![Pengelolaan nilai drawio (1)](https://github.com/user-attachments/assets/66ce1786-7ef9-46f4-9414-38ffa1606e3b)

* `database/schema.sql` - File SQL untuk pembuatan tabel dan trigger
* `database/seed.sql` - File insert data dummy
* `database/views.sql` - File pembuatan view

---

```

Kalau kamu butuh file `schema.sql`, `seed.sql`, atau `ERD.png`-nya juga sekalian aku buatin, tinggal bilang ya, biar sekalian rapi semua ❤️
```
