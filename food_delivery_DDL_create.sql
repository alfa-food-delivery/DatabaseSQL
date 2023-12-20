CREATE DATABASE food_delivery;
USE food_delivery;
# UTENTI
CREATE TABLE utenti (
	id_utente INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(100) NOT NULL UNIQUE,
	password_hash VARCHAR(255) NOT NULL
);
# RUOLI
CREATE TABLE ruoli (
	id_ruolo INT PRIMARY KEY AUTO_INCREMENT,
	ruolo VARCHAR(50) NOT NULL,
	descrizione VARCHAR(100)
);

# UTENTI-RUOLI (molti a molti)
CREATE TABLE utenti_ruoli (
	id_utente INT,
	id_ruolo INT,
	FOREIGN KEY (id_utente) REFERENCES utenti(id_utente),
	FOREIGN KEY (id_ruolo) REFERENCES ruoli(id_ruolo),
    PRIMARY KEY(id_utente,id_ruolo)
);

# PROFILI
CREATE TABLE profili (
	id_profilo INT PRIMARY KEY AUTO_INCREMENT,
	id_utente INT NOT NULL,
    id_ruolo INT NOT NULL,
	nome VARCHAR(100) NULL,
	cognome VARCHAR(100) NULL,
	indirizzo varchar(500),
	telefono VARCHAR(20),
	data_nascita DATE,
	FOREIGN KEY (id_utente,id_ruolo) REFERENCES utenti_ruoli(id_utente,id_ruolo)
);

# CARTE DI CREDITO
CREATE TABLE carte_di_credito (
	id_carta INT PRIMARY KEY AUTO_INCREMENT,
	id_profilo INT NOT NULL,
	FOREIGN KEY (id_profilo) REFERENCES profili(id_profilo),
	numero_carta VARCHAR(20) NOT NULL,
	scadenza_carta VARCHAR(7) NOT NULL,
	titolare_carta VARCHAR(100) NOT NULL
);

# TURNI ( FATTORINI )
CREATE TABLE turni (
	id_turno INT PRIMARY KEY AUTO_INCREMENT,
	id_profilo INT NOT NULL, #fattorino
	tipo BOOLEAN NOT NULL, # 1=TRUE=INIZIO ; 0=FALSE=FINE 
	orario TIMESTAMP NOT NULL,
	FOREIGN KEY (id_profilo) REFERENCES profili(id_profilo)
);
# CATEGORIE_FOOD_PROVIDER
CREATE TABLE categorie_food_provider (
    id_categoria_food_provider INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria_food_provider VARCHAR(100) UNIQUE NOT NULL
);

# FOOD_PROVIDER
CREATE TABLE food_provider (
    id_food_provider INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria_food_provider INT,
    id_profilo INT NOT NULL,
    partita_iva VARCHAR(20) NOT NULL,
    nome_food_provider VARCHAR(100) NOT NULL,
    prezzo_consegna DECIMAL(10, 2),
    ordine_minimo DECIMAL(10, 2),
    orario_food_provider varchar(200),
    FOREIGN KEY (id_categoria_food_provider) REFERENCES categorie_food_provider(id_categoria_food_provider),
    FOREIGN KEY (id_profilo) REFERENCES profili(id_profilo)
);

# STATI ORDINE (RICEVUTO , IN PREPARAZIONE , IN CONSEGNA , CONSEGNATO )
CREATE TABLE stati_ordine(
    id_stato INT PRIMARY KEY AUTO_INCREMENT,
    stato VARCHAR(100) NOT NULL
);

# TIPI DI PAGAMENTO ORDINE
CREATE TABLE tipi_pagamento(
	id_tipo_pagamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo_pagamento VARCHAR(100) NOT NULL
);

# ORDINI
CREATE TABLE ordini (
    id_ordine INT PRIMARY KEY AUTO_INCREMENT,
    id_profilo_cliente INT NOT NULL, #cliente
    id_profilo_fattorino INT, #fattorino
	id_food_provider INT,
    id_stato INT,
    id_tipo_pagamento INT,
    orario_ordine_effettuato TIMESTAMP,
    orario_arrivo_previsto TIMESTAMP,
    orario_arrivo_effettivo TIMESTAMP,
    note VARCHAR(200),
    indirizzo_alternativo VARCHAR(500),
    FOREIGN KEY (id_profilo_cliente) REFERENCES profili(id_profilo),
    FOREIGN KEY (id_profilo_fattorino) REFERENCES profili(id_profilo),
    FOREIGN KEY (id_food_provider) REFERENCES food_provider(id_food_provider),
    FOREIGN KEY (id_stato) REFERENCES stati_ordine(id_stato),
    FOREIGN KEY (id_tipo_pagamento) REFERENCES tipi_pagamento(id_tipo_pagamento)
);

# CATEGORIE_PRODOTTO
CREATE TABLE categorie_prodotto (
    id_categoria_prodotto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

# PRODOTTI
CREATE TABLE prodotti (
    id_prodotto INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria_prodotto INT,
    nome VARCHAR(100) NOT NULL,
    descrizione VARCHAR(200),
    prezzo DECIMAL(10, 2),
    FOREIGN KEY (id_categoria_prodotto) REFERENCES categorie_prodotto(id_categoria_prodotto)
);

# RISTORANTI-PRODOTTI
CREATE TABLE food_providers_prodotti(
	id_prodotto INT NOT NULL,
    id_food_provider INT NOT NULL,
	FOREIGN KEY (id_prodotto) REFERENCES prodotti(id_prodotto),
	FOREIGN KEY (id_food_provider) REFERENCES food_provider(id_food_provider),
	PRIMARY KEY (id_prodotto,id_food_provider)
);

# ORDINI-PRODOTTI (tabella associativa molti a molti tra Ordini e Prodotti)
CREATE TABLE ordini_prodotti (
    id_ordine INT,
    id_prodotto INT,
    quantita INT,
    FOREIGN KEY (id_ordine) REFERENCES ordini(id_ordine),
    FOREIGN KEY (id_prodotto) REFERENCES prodotti(id_prodotto),
	PRIMARY KEY (id_ordine,id_prodotto)
);

# INGREDIENTI
CREATE TABLE ingredienti (
	id_ingrediente INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	prezzo DECIMAL(10, 2)
);

# PIATTI-INGREDIENTI (tabella associativa molti a molti tra Piatti e Ingredienti)
CREATE TABLE piatti_ingredienti (
    id_prodotto INT,
    id_ingrediente INT,
    quantita INT,
    PRIMARY KEY (id_prodotto, id_ingrediente),
    FOREIGN KEY (id_prodotto) REFERENCES prodotti(id_prodotto),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredienti(id_ingrediente)
);
# PIATTI-INGREDIENTI_RIMOSSI
CREATE TABLE piatti_ingredienti_rimossi (
    id_ordine INT,
    id_prodotto INT,
    id_ingrediente INT,
    PRIMARY KEY (id_ordine,id_prodotto,id_ingrediente),
    FOREIGN KEY (id_ordine,id_prodotto) REFERENCES ordini_prodotti(id_ordine,id_prodotto),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredienti(id_ingrediente)
);
# PIATTI-INGREDIENTI_AGGIUNTI
CREATE TABLE piatti_ingredienti_aggiunti (
    id_ordine INT,
    id_prodotto INT,
    id_ingrediente INT,
    quantita INT,
    PRIMARY KEY (id_ordine,id_prodotto,id_ingrediente),
    FOREIGN KEY (id_ordine,id_prodotto) REFERENCES ordini_prodotti(id_ordine,id_prodotto),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredienti(id_ingrediente)
);

#RECENSIONI
CREATE TABLE recensioni (
    id_recensione INT NOT NULL AUTO_INCREMENT,
    id_ordine INT,
    titolo VARCHAR(100),
    data_recensione DATE,
    numero_stelle INT NOT NULL,
    descrizione VARCHAR(250),
    PRIMARY KEY(id_recensione),
    FOREIGN KEY(id_ordine) REFERENCES ordini(id_ordine)
);