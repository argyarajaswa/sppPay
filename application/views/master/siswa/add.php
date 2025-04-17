<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h3 class="m-0 text-dark">Tambah Data Siswa</h3>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Master Data</li>
                        <li class="breadcrumb-item active">Data Siswa</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg">
                    <div class="card mt-3 mb-3">
                        <!-- Tambahkan di bagian atas card-body, sebelum form -->
                        <div class="card-title mt-3 ml-2">
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#importModal">
                                <i class="fas fa-file-import"></i> Import dari CSV
                            </button>
                        </div>
                        <div class="card-body col-lg-6">
                            <form method="post" action="<?= base_url('masterdata/add_siswa') ?>">
                                <div class="form-group">
                                    <label for="NISN">NISN</label>
                                    <input type="text" class="form-control" id="NISN" name="NISN">
                                    <span class="text-secondary ml-2">NISN harus 10 digit.</span> <br>
                                    <?= form_error('NISN', '<small class="text-danger ml-2">', '</small>'); ?>
                                </div>
                                <div class="form-group">
                                    <label for="NIS">NIS</label>
                                    <input type="text" class="form-control" id="NIS" name="NIS">
                                    <span class="text-secondary ml-2">NIS harus 8 digit.</span> <br>
                                    <?= form_error('NIS', '<small class="text-danger ml-2">', '</small>'); ?>
                                </div>
                                <div class="form-group">
                                    <label for="nama">Nama Lengkap</label>
                                    <input type="text" class="form-control" id="nama" name="nama">
                                    <?= form_error('nama', '<small class="text-danger ml-2">', '</small>'); ?>
                                </div>
                                <div class="form-group">
                                    <label for="kelas">Kelas</label>
                                    <select class="form-control" id="kelas_id" name="kelas_id">
                                        <option value="">-- Pilih Kelas --</option>
                                        <?php foreach ($kelas as $row) : ?>
                                            <option value="<?= $row->ID_KELAS ?>"><?= $row->NAMA_KELAS ?></option>
                                        <?php endforeach ?>
                                    </select>
                                    <?= form_error('kelas_id', '<small class="text-danger ml-2">', '</small>'); ?>
                                </div>
                                <div class="form-group">
                                    <label for="spp">Tahun Ajaran</label>
                                    <select class="form-control" id="spp_id" name="spp_id">
                                        <option value="">-- Pilih Tahun ajaran --</option>
                                        <?php foreach ($spp as $row) : ?>
                                            <option value="<?= $row->ID_SPP ?>"><?= $row->TAHUN ?></option>
                                        <?php endforeach ?>
                                    </select>
                                    <?= form_error('spp_id', '<small class="text-danger ml-2">', '</small>'); ?>
                                </div>
                                <div class="form-group">
                                    <label for="alamat">Alamat</label>
                                    <textarea class="form-control" id="alamat" name="alamat" rows="3"></textarea>
                                    <?= form_error('alamat', '<small class="text-danger ml-2">', '</small>'); ?>
                                </div>
                                <div class="form-group">
                                    <label for="no_telp">No.Telp</label>
                                    <input type="text" class="form-control" id="no_telp" name="no_telp">
                                    <span class="text-secondary ml-2">Nomor Telepon maksimal 13 digit.</span> <br>
                                    <?= form_error('no_telp', '<small class="text-danger ml-2">', '</small>'); ?>
                                </div>
                                <div class="form-group" id="tempo">
                                    <label for="tempo">Jatuh Tempo</label>
                                    <input type="date" class="form-control" id="tempo" name="tempo" value="<?= date('Y-m-d', strtotime("2025-05-20")) ?>">
                                    <span class="text-secondary ml-2">Jatuh tempo digunakan untuk pembayaran spp siswa dari satu semester sesuai tahun pelajaran dengan format mm/dd/yy.</span> <br>
                                    <?= form_error('tempo', '<small class="text-danger ml-2">', '</small>'); ?>
                                </div>
                                <button type="submit" class="btn btn-primary">Tambah <i class="fas fa-plus"></i></button>
                                <a href="<?= base_url('masterdata/siswa') ?>" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Kembali</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</div>
<!-- /.content-wrapper -->
 <!-- Tambahkan modal untuk import CSV di bagian bawah content-wrapper, sebelum footer -->
<div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-labelledby="importModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="importModalLabel">Import Data Siswa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="<?= base_url('masterdata/import_siswa') ?>" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Unduh Template CSV</label>
                        <div>
                            <a href="<?= base_url('assets/templates/template_siswa.csv') ?>" class="btn btn-info btn-sm">
                                <i class="fas fa-file-download"></i> Download Template
                            </a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="csv_file">Pilih File CSV</label>
                        <input type="file" class="form-control-file" id="csv_file" name="csv_file" accept=".csv" required>
                        <small class="text-muted">Format file harus CSV dengan kolom: NISN, NIS, NAMA, ID_KELAS, ID_SPP, ALAMAT, NO_TELP, TEMPO</small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Import Data</button>
                </div>
            </form>
        </div>
    </div>
</div>
<footer class="main-footer">
    <strong>Copyright &copy; <?= date('Y') ?> Created by <a href="https://www.instagram.com/argyarf_/">Argya Rajaswa</a>.</strong>
    All rights reserved.
</footer>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="<?= base_url('assets/') ?>js/jquery.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<?= base_url('assets/adminlte/') ?>plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<?= base_url('assets/adminlte/') ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="<?= base_url('assets/adminlte/') ?>plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="<?= base_url('assets/adminlte/') ?>dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<?= base_url('assets/adminlte/') ?>dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?= base_url('assets/adminlte/') ?>dist/js/demo.js"></script>
<!-- Data table -->
<script src="<?= base_url('assets/adminlte/') ?>plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?= base_url('assets/adminlte/') ?>plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {

        show_data();



        function show_data() {
            $.ajax({
                type: 'ajax',
                url: '<?php echo site_url('masterdata/list_siswa') ?>',
                async: true,
                dataType: 'html',
                success: function(data) {
                    $('#show_data').html(data);
                    $('#dataTable').DataTable();
                }
            });
        }
    });
</script>

</body>

</html>