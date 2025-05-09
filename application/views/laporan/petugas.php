<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Petugas</title>
    <link rel="stylesheet" href="<?= $_SERVER['DOCUMENT_ROOT'] ?>/spp/assets/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        header img {
            position: absolute;
            top: 10px;
        }

        header h2 {
            position: absolute;
            top: -15px;
            left: 50px;
            font-size: 18px;
            line-height: 25px;
            text-transform: uppercase;
        }

        header h2 span {
            font-size: 12px;
            font-style: regular;
            line-height: 15px;
            text-transform: capitalize;
        }

        section#konten {
            position: absolute;
            top: 125px;
        }

        span.email {
            text-transform: lowercase;
        }

        .hr1 {
            margin-top: 15px;
            border-color: grey;
        }


        .hr2 {
            border: 1px solid black;
            margin-top: -15px;
        }

        .ttd p {
            position: relative;
            left: 70%;
        }
    </style>
</head>

<body>
    <header class="p-0">
        <img src="<?php echo $_SERVER['DOCUMENT_ROOT'] ?>/spp/assets/img/logo_smk.png" class="img-fluid" alt="" width="90">
        <h2 class="ml-5 text-center">Pemerintah Keargyaan Negara<br>Dinas Abal-Abal<br>Sekolah Menengah Kejuruan Negeri Mojoagung<br><span>Kelompok : Indonesia Emas<br>Program Keahlian : Teknik Komputer & Informatika dan Rekayasa Perangkat Lunak<br>Jl.Raya Veteran, Miagan - Mojoagung - Jombang Telp./Fax : (0336) 11223344 <br><span class="email"><b></b></span></span></h2>
    </header><br><br>

    <section id="konten">
        <hr class="hr1">
        <hr class="hr2">
        <h3 class="text-center mb-2">Data Petugas</h3>

        <table class="table table-bordered">
            <thead class="table table-primary">
                <tr>
                    <th>No</th>
                    <th>Nama Petugas</th>
                </tr>
            </thead>
            <tbody>
                <?php $no = 1;
                foreach ($petugas as $p) : ?>
                    <tr>
                        <td><?= $no++ ?></td>
                        <td><?= $p->NAMA_PETUGAS ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <div class="ttd">
            <p>Kabupaten Jombang, <?= date('d F, Y') ?><br>Administrator</p>
            <br>
            <br>
            <p>______________________</p>
        </div>
    </section>
</body>

</html>