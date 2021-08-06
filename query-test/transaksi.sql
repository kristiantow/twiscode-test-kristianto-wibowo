/*==1==*/

CREATE TABLE t_transaksi(
    id SERIAL PRIMARY KEY,
    tanggal_order timestamp(0) without time zone DEFAULT now(),
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    tanggal_pembayaran timestamp(0) without time zone,

    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(0) without time zone
);

INSERT INTO t_transaksi 
  (id,tanggal_order,status,tanggal_pembayaran) 
VALUES 
  ('1','2020-12-01 11:30:00','pending',NULL),
  ('2','2020-12-02 11:30:00','lunas','2020-12-06 12:35:00'),
  ('3','2020-12-03 11:30:00','lunas','2020-12-08 13:33:00');

/*==2==*/

CREATE TABLE d_transaksi(
    id SERIAL PRIMARY KEY,
    id_transaksi integer,
    harga integer,
    jumlah_barang integer,
    subtotal integer,

    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(0) without time zone
);

INSERT INTO d_transaksi 
  (id_transaksi,harga,jumlah_barang,subtotal) 
VALUES
  ('1',1000,2,2000),
  ('1',2500,3,7500),
  ('2',6000,4,24000),
  ('3',5000,1,5000),
  ('3',2000,4,8000);

/*==3==*/

select t_transaksi.id, t_transaksi.tanggal_order, t_transaksi.status, t_transaksi.tanggal_pembayaran, sum(d_transaksi.subtotal)as total, sum(d_transaksi.jumlah_barang) 
from t_transaksi
join d_transaksi on d_transaksi.id_transaksi = t_transaksi.id
group by t_transaksi.id, t_transaksi.tanggal_order, t_transaksi.status, t_transaksi.tanggal_pembayaran
order by t_transaksi.id
