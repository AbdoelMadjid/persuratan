CREATE TABLE `surat_keluar_revisi` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`tanggal` DATETIME NULL DEFAULT NULL,
	`id_surat` INT(11) NULL DEFAULT NULL,
	`id_pengguna` INT(11) NULL DEFAULT NULL,
	`isi_revisi` TEXT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB;

ALTER TABLE `surat_keluar` ADD COLUMN `flag_revisi` ENUM('Y','N') NOT NULL DEFAULT 'N' AFTER `flag_del`;

