-- ==========================================
-- 1. BUAT DATABASE
-- ==========================================

DROP DATABASE IF EXISTS perpustakaan;
CREATE DATABASE perpustakaan;
USE perpustakaan;


-- ==========================================
-- 2. TABEL AWAL PEMINJAMAN
-- ==========================================

CREATE TABLE PEMINJAMAN (
    No_Pinjam VARCHAR(10),
    Tgl_Pinjam DATE,
    NIS VARCHAR(10),
    Nama_Siswa VARCHAR(50),
    Kelas VARCHAR(10),
    Kode_Buku VARCHAR(10),
    Judul_Buku VARCHAR(100),
    Pengarang VARCHAR(50),
    Kategori VARCHAR(30),
    Tgl_Kembali DATE
);


-- ==========================================
-- 3. TABEL SISWA
-- ==========================================

CREATE TABLE SISWA (
    NIS VARCHAR(10) PRIMARY KEY,
    Nama_Siswa VARCHAR(50),
    Kelas VARCHAR(10)
);


-- ==========================================
-- 4. TABEL BUKU
-- ==========================================

CREATE TABLE BUKU (
    Kode_Buku VARCHAR(10) PRIMARY KEY,
    Judul_Buku VARCHAR(100),
    Pengarang VARCHAR(50),
    Kategori VARCHAR(30)
);


-- ==========================================
-- 5. TABEL PEMINJAMAN 3NF
-- ==========================================

CREATE TABLE PEMINJAMAN_3NF (
    No_Pinjam VARCHAR(10) PRIMARY KEY,
    Tgl_Pinjam DATE,
    NIS VARCHAR(10),
    Tgl_Kembali DATE,
    FOREIGN KEY (NIS) REFERENCES SISWA(NIS)
);


-- ==========================================
-- 6. TABEL DETAIL PEMINJAMAN
-- ==========================================

CREATE TABLE DETAIL_PEMINJAMAN (
    No_Pinjam VARCHAR(10),
    Kode_Buku VARCHAR(10),
    PRIMARY KEY (No_Pinjam, Kode_Buku),
    FOREIGN KEY (No_Pinjam)
        REFERENCES PEMINJAMAN_3NF(No_Pinjam),
    FOREIGN KEY (Kode_Buku)
        REFERENCES BUKU(Kode_Buku)
);


-- ==========================================
-- 7. INSERT DATA SISWA
-- ==========================================

INSERT INTO SISWA
(NIS, Nama_Siswa, Kelas)
VALUES
('12345', 'Bimbi', 'XI RPL'),
('12346', 'Andi', 'XI RPL'),
('12347', 'Siti', 'XI RPL');


-- ==========================================
-- 8. INSERT DATA BUKU
-- ==========================================

INSERT INTO BUKU
(Kode_Buku, Judul_Buku, Pengarang, Kategori)
VALUES
('B001', 'Pemrograman PHP', 'Andi', 'Pemrograman'),
('B002', 'Basis Data', 'Budi', 'Teknologi'),
('B003', 'Pemrograman Web', 'Citra', 'Pemrograman');


-- ==========================================
-- 9. INSERT DATA PEMINJAMAN
-- ==========================================

INSERT INTO PEMINJAMAN_3NF
(No_Pinjam, Tgl_Pinjam, NIS, Tgl_Kembali)
VALUES
('P001', '2026-09-09', '12345', '2026-09-16'),
('P002', '2026-09-09', '12346', '2026-09-16'),
('P003', '2026-09-09', '12347', '2026-09-16');


-- ==========================================
-- 10. INSERT DETAIL PEMINJAMAN
-- ==========================================

INSERT INTO DETAIL_PEMINJAMAN
(No_Pinjam, Kode_Buku)
VALUES
('P001', 'B001'),
('P002', 'B002'),
('P003', 'B003');


-- ==========================================
-- 11. CEK SEMUA TABEL
-- ==========================================

SHOW TABLES;


-- ==========================================
-- 12. CEK DATA SISWA
-- ==========================================

SELECT * FROM SISWA;


-- ==========================================
-- 13. CEK DATA BUKU
-- ==========================================

SELECT * FROM BUKU;


-- ==========================================
-- 14. CEK DATA PEMINJAMAN
-- ==========================================

SELECT * FROM PEMINJAMAN_3NF;


-- ==========================================
-- 15. CEK DETAIL PEMINJAMAN
-- ==========================================

SELECT * FROM DETAIL_PEMINJAMAN;