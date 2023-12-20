INSERT INTO utenti
(email, password_hash)
VALUES
    ('mario@gmail.com',     SHA2('password1', 256)),
    ('giulia@gmail.com',	SHA2('password2', 256)),
    ('andrea@gmail.com',	SHA2('password3', 256)),
    ('laura@gmail.com', 	SHA2('password4', 256)),
    ('marco@gmail.com',		SHA2('password5', 256)),
    ('elena@gmail.com',		SHA2('password6', 256))
;

INSERT INTO ruoli
(ruolo,descrizione)
VALUES
('CLIENTE', 'Ruolo per gli utenti clienti'),
('RISTORATORE', 'Ruolo per gli utenti ristoratori'),
('FATTORINO', 'Ruolo per gli utenti fattorini');

INSERT INTO utenti_ruoli
(id_utente,id_ruolo)
VALUES
(1,1) , (2,1) , (3,2) , (4,2) , (5,3) , (6,3);

INSERT INTO profili
(id_utente,id_ruolo,nome,cognome,indirizzo,telefono,data_nascita)
VALUES
(1,1, 'Mario', 'Rossi', 'Via Guido Reni 104', '123456789', '1990-05-15'),
(2,1, 'Giulia', 'Bianchi', 'Corso Vittorio EmanueleII 180', '987654321', '1992-08-20'),
(3,2, 'Andrea', 'Verdi', 'Via Gubbio 102', '555123789', '1985-03-10'),
(4,2, 'Laura', 'Neri', 'Via Giorgio Bidone 32', '333444555', '1988-11-25'),
(5,3, 'Marco', 'Gialli', 'Via Vincenzo Lancia 138', '777888999', '1995-07-03'),
(6,3, 'Elena', 'Rosa', 'Via Perrone 10', '111222333', '1999-01-12');

INSERT INTO carte_di_credito
(id_profilo,numero_carta,scadenza_carta,titolare_carta)
VALUES
(1,"5355-8440-8843-6549","03/25","Mario Rossi");

INSERT INTO categorie_food_provider
(nome_categoria_food_provider)
VALUES
("PIZZERIA"),
("RISTORANTE"),
("TRATTORIA")
;

INSERT INTO food_provider 
(id_categoria_food_provider, id_profilo, partita_iva, nome_food_provider, prezzo_consegna, ordine_minimo, orario_food_provider)
VALUES
    (1,5, '12345678901', 'Pizzeria Bella Napoli', 3.50, 15.00, 'Orario di apertura: Lun-Ven 10:00-22:00, Sab-Dom 11:00-23:00'),
    (2,6, '98765432109', 'Ristorante Gustoso', 5.00, 20.00, 'Orario di apertura: Lun-Sab 12:00-15:00 e 18:00-22:30, Dom 12:30-16:00'),
    (3,6, '56789012345', 'Trattoria La Nonna', 4.00, 18.00, 'Orario di apertura: Lun-Dom 11:30-23:00');

INSERT INTO stati_ordine
(stato)
VALUES
("RICEVUTO"),
("IN PREPARAZIONE"),
("IN CONSEGNA"),
("CONSEGNATO");

INSERT INTO tipi_pagamento
(tipo_pagamento)
VALUES
("CONTANTI"),
("CARTA");

INSERT INTO ordini 
(id_profilo_cliente, id_profilo_fattorino, id_food_provider, id_stato, id_tipo_pagamento, orario_ordine_effettuato, orario_arrivo_previsto, orario_arrivo_effettivo, note, indirizzo_alternativo)
VALUES
    (1, 3, 1, 4, 1, '2023-12-13 12:30:00', '2023-12-13 13:15:00', '2023-12-13 13:10:00', NULL, 'Via Roma 1, Torino'),
    (1, NULL, 1, 1, 2, '2023-12-13 18:00:00', '2023-12-13 18:45:00', NULL, NULL, 'Via Garibaldi 5, Torino'),
    (2, 4, 2, 3, 1, '2023-12-14 10:00:00', '2023-12-14 11:00:00', NULL, 'Citofono: Dottore Esteban', 'Corso Vittorio Emanuele 12, Torino'),
    (1, NULL, 1, 2, 2, '2023-12-14 13:45:00', '2023-12-14 14:30:00', NULL, 'Citofono non funziona, chiamare numero', 'Via Dante 7, Torino'),
    (2, NULL, 2, 2, 1, '2023-12-15 19:30:00', '2023-12-15 20:15:00', NULL, NULL, 'Piazza Pitagora 3, Torino');
    
INSERT INTO categorie_prodotto (nome)
VALUES
    ('PIZZA'),
    ('PRIMO PIATTO'),
    ('SECONDO PIATTO'),
    ('ANTIPASTO'),
    ('DOLCE'),
    ('BIBITA');

INSERT INTO prodotti 
(id_categoria_prodotto, nome, descrizione, prezzo)
VALUES
    (1, 'Margherita', 'Pizza con pomodoro, mozzarella e basilico', 8.50),
    (1, 'Capricciosa', 'Pizza con pomodoro, mozzarella, funghi, prosciutto cotto e olive', 10.00),
    (2, 'Spaghetti Carbonara', 'Pasta con uova, pancetta, pecorino e pepe nero', 12.00),
    (2, 'Risotto ai Funghi', 'Risotto con funghi porcini e parmigiano', 14.50),
    (3, 'Filetto di Manzo', 'Filetto di manzo alla griglia con contorno di patate', 18.00),
    (3, 'Salmone alla Griglia', 'Salmone fresco alla griglia con verdure', 16.50),
    (4, 'Bruschetta', 'Pane tostato con pomodoro, aglio e basilico', 6.00),
    (4, 'Insalata Caprese', 'Mozzarella, pomodoro e basilico con olio di oliva', 7.50),
    (5, 'Tiramisù', 'Dolce italiano con mascarpone, caffè e savoiardi', 9.00),
    (5, 'Panna Cotta', 'Dolce cremoso con fragole e salsa di frutti di bosco', 8.00);
    
INSERT INTO food_providers_prodotti (id_prodotto, id_food_provider)
VALUES
    (1, 1), -- Associazione del prodotto con l'id 1 al food provider con l'id 1
    (2, 1), -- Associazione del prodotto con l'id 2 al food provider con l'id 1
    (3, 2), -- Associazione del prodotto con l'id 3 al food provider con l'id 2
    (4, 2), -- Associazione del prodotto con l'id 4 al food provider con l'id 2
    (5, 3), -- Associazione del prodotto con l'id 5 al food provider con l'id 3
    (6, 3), -- Associazione del prodotto con l'id 6 al food provider con l'id 3
    (7, 1), -- Associazione del prodotto con l'id 7 al food provider con l'id 1
    (8, 1), -- Associazione del prodotto con l'id 8 al food provider con l'id 1
    (9, 2), -- Associazione del prodotto con l'id 9 al food provider con l'id 2
    (10, 3); -- Associazione del prodotto con l'id 10 al food provider con l'id 3
    
INSERT INTO ordini_prodotti (id_ordine, id_prodotto, quantita)
VALUES
    (1, 1, 2), -- Associazione dell'ordine con l'id 1 al prodotto con l'id 1 e quantità 2
    (1, 3, 1), -- Associazione dell'ordine con l'id 1 al prodotto con l'id 3 e quantità 1
    (2, 2, 1), -- Associazione dell'ordine con l'id 2 al prodotto con l'id 2 e quantità 1
    (2, 5, 3), -- Associazione dell'ordine con l'id 2 al prodotto con l'id 5 e quantità 3
    (3, 4, 2), -- Associazione dell'ordine con l'id 3 al prodotto con l'id 4 e quantità 2
    (3, 7, 1), -- Associazione dell'ordine con l'id 3 al prodotto con l'id 7 e quantità 1
    (4, 10, 2), -- Associazione dell'ordine con l'id 4 al prodotto con l'id 10 e quantità 2
    (4, 8, 3), -- Associazione dell'ordine con l'id 4 al prodotto con l'id 8 e quantità 3
    (5, 6, 1), -- Associazione dell'ordine con l'id 5 al prodotto con l'id 6 e quantità 1
    (5, 9, 2); -- Associazione dell'ordine con l'id 5 al prodotto con l'id 9 e quantità 2

INSERT INTO ingredienti (nome, prezzo)
VALUES
    ('Pomodoro', 2.50),
    ('Mozzarella', 3.00),
    ('Funghi', 2.20),
    ('Prosciutto Cotto', 4.00),
    ('Olive', 1.80),
    ('Pasta', 2.00),
    ('Uova', 1.50),
    ('Pancetta', 3.50),
    ('Pecorino', 2.80),
    ('Pepe Nero', 1.20);

INSERT INTO piatti_ingredienti (id_prodotto, id_ingrediente, quantita)
VALUES
    (1, 1, 2), -- Associazione del prodotto con l'id 1 all'ingrediente con l'id 1 in quantità 2
    (1, 2, 1), -- Associazione del prodotto con l'id 1 all'ingrediente con l'id 2 in quantità 1
    (1, 5, 3), -- Associazione del prodotto con l'id 1 all'ingrediente con l'id 5 in quantità 3
    (2, 1, 2), -- Associazione del prodotto con l'id 2 all'ingrediente con l'id 1 in quantità 2
    (2, 2, 1), -- Associazione del prodotto con l'id 2 all'ingrediente con l'id 2 in quantità 1
    (2, 3, 2), -- Associazione del prodotto con l'id 2 all'ingrediente con l'id 3 in quantità 2
    (3, 6, 1), -- Associazione del prodotto con l'id 3 all'ingrediente con l'id 6 in quantità 1
    (3, 7, 2), -- Associazione del prodotto con l'id 3 all'ingrediente con l'id 7 in quantità 2
    (3, 8, 1), -- Associazione del prodotto con l'id 3 all'ingrediente con l'id 8 in quantità 1
    (4, 6, 2), -- Associazione del prodotto con l'id 4 all'ingrediente con l'id 6 in quantità 2
    (4, 9, 1); -- Associazione del prodotto con l'id 4 all'ingrediente con l'id 9 in quantità 1

INSERT INTO piatti_ingredienti_rimossi (id_ordine, id_prodotto, id_ingrediente)
VALUES
    (1, 1, 3), -- Ingrediente con id 3 rimosso dal piatto con id 1 nell'ordine 6
    (2, 2, 5), -- Ingrediente con id 5 rimosso dal piatto con id 2 nell'ordine 7
    (3, 4, 7), -- Ingrediente con id 7 rimosso dal piatto con id 3 nell'ordine 8
    (4, 8, 6), -- Ingrediente con id 6 rimosso dal piatto con id 4 nell'ordine 9
    (5, 6, 9); -- Ingrediente con id 9 rimosso dal piatto con id 5 nell'ordine 10

INSERT INTO piatti_ingredienti_aggiunti (id_ordine, id_prodotto, id_ingrediente, quantita)
VALUES
    (1, 1, 7, 2), -- Ingrediente con id 7 aggiunto al piatto con id 1 nell'ordine 1 con quantità 2
    (2, 2, 10, 1), -- Ingrediente con id 10 aggiunto al piatto con id 2 nell'ordine 2 con quantità 1
    (3, 4, 8, 3), -- Ingrediente con id 8 aggiunto al piatto con id 3 nell'ordine 3 con quantità 3
    (4, 8, 1, 2), -- Ingrediente con id 1 aggiunto al piatto con id 4 nell'ordine 4 con quantità 2
    (5, 6, 4, 1); -- Ingrediente con id 4 aggiunto al piatto con id 5 nell'ordine 5 con quantità 1

INSERT INTO recensioni (id_ordine, titolo, data_recensione, numero_stelle, descrizione)
VALUES
    (1, 'Eccellente servizio!', '2023-12-16', 5, 'Servizio rapido e cibo delizioso. Consiglio vivamente questo ristorante.'),
    (2, 'Buona esperienza', '2023-12-17', 4, 'Buon cibo, consegna puntuale. Piccoli miglioramenti possibili.'),
    (3, 'Molto soddisfatto', '2023-12-18', 5, 'Tutto perfetto, cibo ottimo e tempi di consegna rispettati.'),
    (4, 'Da migliorare', '2023-12-19', 3, 'Cibo freddo alla consegna, dovrebbero migliorare la temperatura del cibo durante il trasporto.'),
    (5, 'Servizio lento', '2023-12-20', 2, 'Ordine arrivato in ritardo e cibo non molto caldo. Molto deludente.');
