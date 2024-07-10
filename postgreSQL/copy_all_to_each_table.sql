-- lihat referensi di prisma/schema.prisma sebagai model yang akan digunakan
-- copy data dari tabel "BaganAkun_All" ke tabel "BaganAkun_Akun"
DELETE FROM "BaganAkun_Akun";

INSERT INTO "BaganAkun_Akun" (id, kode_akun, uraian_akun)
SELECT
    TRIM(id),
    TRIM(akun),
    TRIM(uraian_akun)
FROM
    "BaganAkun_All"
WHERE
    LENGTH(id) = 1;

-- copy data dari tabel "BaganAkun_All" ke tabel "BaganAkun_Kelompok"
DELETE FROM "BaganAkun_Kelompok";

INSERT INTO "BaganAkun_Kelompok" (id, akun_id, kode_akun, kode_kelompok, uraian_akun)
SELECT DISTINCT
    TRIM(id),
    TRIM(akun),
    TRIM(akun),
    TRIM(kelompok),
    TRIM(uraian_akun)
FROM
    "BaganAkun_All"
WHERE
    LENGTH(id) = 2;

-- copy data dari tabel "BaganAkun_All" ke tabel "BaganAkun_Jenis"
DELETE FROM "BaganAkun_Jenis";

INSERT INTO "BaganAkun_Jenis" (id, kelompok_id, akun_id, kode_akun, kode_kelompok, kode_jenis, uraian_akun)
SELECT DISTINCT
    TRIM(id),
    TRIM(akun || kelompok),
    TRIM(akun),
    TRIM(akun),
    TRIM(kelompok),
    TRIM(jenis),
    TRIM(uraian_akun)
FROM
    "BaganAkun_All"
WHERE
    LENGTH(id) = 4;

-- copy data dari tabel "BaganAkun_All" ke tabel "BaganAkun_Objek"
DELETE FROM "BaganAkun_Objek";

INSERT INTO "BaganAkun_Objek" (id, jenis_id, kelompok_id, akun_id, kode_akun, kode_kelompok, kode_jenis, kode_objek, uraian_akun)
SELECT 
    TRIM(id),
    TRIM(akun || kelompok || jenis),
    TRIM(akun || kelompok),
    TRIM(akun),
    TRIM(akun),
    TRIM(kelompok),
    TRIM(jenis),
    TRIM(objek),
    TRIM(uraian_akun)
FROM
    "BaganAkun_All"
WHERE
    LENGTH(id) = 6;

-- copy data dari tabel "BaganAkun_All" ke tabel "BaganAkun_RincianObjek"
DELETE FROM "BaganAkun_RincianObjek";

INSERT INTO "BaganAkun_RincianObjek" (id, objek_id, jenis_id, kelompok_id, akun_id, kode_akun, kode_kelompok, kode_jenis, kode_objek, kode_rincian_objek, uraian_akun)
SELECT 
    TRIM(id),
    TRIM(akun || kelompok || jenis || objek),
    TRIM(akun || kelompok || jenis),
    TRIM(akun || kelompok),
    TRIM(akun),
    TRIM(akun),
    TRIM(kelompok),
    TRIM(jenis),
    TRIM(objek),
    TRIM(rincian_objek),
    TRIM(uraian_akun)
FROM
    "BaganAkun_All"
WHERE
    LENGTH(id) = 8;


-- copy data dari tabel "BaganAkun_All" ke tabel "BaganAkun_SubRincianObjek"
DELETE FROM "BaganAkun_SubRincianObjek";

INSERT INTO "BaganAkun_SubRincianObjek" (id, rincian_objek_id, objek_id, jenis_id, kelompok_id, akun_id, kode_akun, kode_kelompok, kode_jenis, kode_objek, kode_rincian_objek, kode_sub_rincian_objek, uraian_akun)
SELECT 
    TRIM(id),
    TRIM(akun || kelompok || jenis || objek || rincian_objek),
    TRIM(akun || kelompok || jenis || objek),
    TRIM(akun || kelompok || jenis),
    TRIM(akun || kelompok),
    TRIM(akun),
    TRIM(akun),
    TRIM(kelompok),
    TRIM(jenis),
    TRIM(objek),
    TRIM(rincian_objek),
    TRIM(sub_rincian_objek),
    TRIM(uraian_akun)
FROM
    "BaganAkun_All"
WHERE
    LENGTH(id) > 8;
