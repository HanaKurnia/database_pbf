DELIMITER //

CREATE TRIGGER hitung_nilai_akhir
BEFORE INSERT ON nilai
FOR EACH ROW
BEGIN
    -- Hitung nilai akhir sebagai rata-rata dari tugas, uts, dan uas
    SET NEW.nilai_akhir = (NEW.tugas + NEW.uts + NEW.uas) / 3;
    
    -- Tentukan status berdasarkan nilai akhir
    IF NEW.nilai_akhir >= 50 THEN
        SET NEW.status = 'Lulus';
    ELSE
        SET NEW.status = 'Tidak Lulus';
    END IF;
END;

//
DELIMITER ;
