-- lihat referensi di prisma/schema.prisma sebagai model yang akan digunakan

-- copy data dari tabel "BaganAkun_All" ke tabel "BaganAkun_Akun"
DELETE FROM "BaganAkun_Akun";

INSERT INTO "BaganAkun_Akun" (id, uraian_akun)
SELECT akun, uraian_akun
FROM "BaganAkun_All"
WHERE kelompok NULL;

-- copy data dari tabel "BaganAkun_All" ke tabel "BaganAkun_Kelompok"
DELETE FROM "BaganAkun_Kelompok";

INSERT INTO "BaganAkun_Kelompok" (id, akun_id, uraian_kelompok)
SELECT kelompok, akun, uraian_kelompok
FROM "BaganAkun_All"
WHERE objek NULL;

-- copy data dari tabel "BaganAkun_All" ke tabel "BaganAkun_Objek"
DELETE FROM "BaganAkun_Objek";

INSERT INTO "BaganAkun_Objek" (id, akun_id, kelompok_id, uraian_objek)
SELECT objek, akun, kelompok, uraian_objek
FROM "BaganAkun_All"
WHERE rincian_objek NULL;

-- copy data dari tabel "BaganAkun_All" ke tabel "BaganAkun_RincianObjek"
DELETE FROM "BaganAkun_RincianObjek";

INSERT INTO "BaganAkun_RincianObjek" (id, akun_id, kelompok_id, objek_id, uraian_akun)
SELECT rincian_objek, akun, kelompok, objek, uraian_akun
FROM "BaganAkun_All"
WHERE sub_rincian_objek NULL;

-- copy data dari tabel "BaganAkun_All" ke tabel "BaganAkun_SubRincianObjek"
DELETE FROM "BaganAkun_SubRincianObjek";

INSERT INTO "BaganAkun_SubRincianObjek" (id, akun_id, kelompok_id, objek_id, rincian_objek_id, uraian_akun)
SELECT sub_rincian_objek, akun, kelompok, objek, rincian_objek, uraian_akun
FROM "BaganAkun_All";