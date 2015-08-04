--<ScriptOptions statementTerminator=";"/>

CREATE TABLE kullanici (
	ID INT NOT NULL,
	ADI VARCHAR(255),
	DURUM INT,
	SOYADI VARCHAR(255),
	PRIMARY KEY (ID)
) ENGINE=InnoDB;

