--QUERY SELECT

--1- Selezionare tutte le software house americane (3)
--select * from software_houses where country = 'United states'

--2- Selezionare tutti i giocatori della città di 'Rogahnland' (2)
--select * from players  where city = 'Rogahnland'

--3- Selezionare tutti i giocatori il cui nome finisce per "a" (220)
--select * from players  where name  LIKE '%a'

--4- Selezionare tutte le recensioni scritte dal giocatore con ID = 800 (11)
--select * from reviews  where player_id = '800'

--5- Contare quanti tornei ci sono stati nell'anno 2015 (9)
--select COUNT(id) from tournaments  where year = '2015'

--6- Selezionare tutti i premi che contengono nella descrizione la parola 'facere' (2)
--select * from  awards where description LIKE '%facere%'

--7- Selezionare tutti i videogame che hanno la categoria 2 (FPS) o 6 (RPG), mostrandoli una sola volta (del videogioco vogliamo solo l'ID) (287)
--select videogame_id from  category_videogame where category_id = '2' or category_id = '6' Group by videogame_id

--8- Selezionare tutte le recensioni con voto compreso tra 2 e 4 (2947)
--select * from  reviews where rating >= 2 and  rating <= 4 


--9- Selezionare tutti i dati dei videogiochi rilasciati nell'anno 2020 (46)
 --select * from  videogames  where release_date like '%2020%'

--10- Selezionare gli id dei videogame che hanno ricevuto almeno una recensione da stelle, mostrandoli una sola volta (443)
 --select videogame_id FROM reviews WHERE rating IS NOT NULL  AND rating = 5  GROUP BY videogame_id

--*********** BONUS ***********

--11- Selezionare il numero e la media delle recensioni per il videogioco con ID = 412 (review number = 12, avg_rating = 3)
 --select count(videogame_id) as numero ,AVG(rating) as media from reviews where videogame_id = 412

--12- Selezionare il numero di videogame che la software house con ID = 1 ha rilasciato nel 2018 (13
  --select count(id) as numero from videogames where software_house_id = 1 and DATEPART(year, release_date) = 2018 

--QUERY CON GROUPBY

--1- Contare quante software house ci sono per ogni paese (3)
  --select COUNT(id) as software_house_tot, country from software_houses group by country

--2- Contare quante recensioni ha ricevuto ogni videogioco (del videogioco vogliamo solo l'ID) (500)
  --select COUNT(id) as tot,videogame_id  from reviews group by videogame_id

--3- Contare quanti videogiochi hanno ciascuna classificazione PEGI (della classificazione PEGI vogliamo solo l'ID) (13)
  --select COUNT(pegi_label_id) as numero_giochi from pegi_label_videogame group by pegi_label_id order by pegi_label_id

--4- Mostrare il numero di videogiochi rilasciati ogni anno (11)
  --select COUNT(DATEPART(year, release_date)) as numero_giochi_anno, DATEPART(year, release_date) as anno from videogames group by  DATEPART(year, release_date)

--5- Contare quanti videogiochi sono disponbiili per ciascun device (del device vogliamo solo l'ID) (7)
   --select COUNT(videogame_id) as videogiochi_disponibili , device_id  from device_videogame group by  device_id 



--6- Ordinare i videogame in base alla media delle recensioni (del videogioco vogliamo solo l'ID) (500)
    --select AVG(rating) as media ,videogame_id from reviews group by videogame_id order by videogame_id


--QUERY CON JOIN

--1- Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)
     --select distinct player_id, players.name, players.lastname, players.nickname, players.city  from players join reviews on players.id = reviews.player_id 

--2- Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)
     --select distinct videogame_id from videogames
     --join tournament_videogame
     --on videogame_id = tournament_videogame.videogame_id
     --join tournaments
     --on tournament_videogame.tournament_id = tournaments.id
     --where tournaments.year = 2016

--3- Mostrare le categorie di ogni videogioco (1718)
     --select  videogames.id, videogames.name, categories.name as categoria
     --from videogames
     --join category_videogame
     --on  videogames.id = category_videogame.videogame_id
     --join categories
     --on category_videogame.category_id = categories.id
     --order by videogames.id
    

--4- Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)
     --select software_houses.id, software_houses.name
     --from software_houses 
     --join videogames
     --on  software_house_id = videogames.software_house_id
     --where DATEPART(year, videogames.release_date) >= 2020
     

--5- Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)

--6- Selezionare categorie e classificazioni PEGI dei videogiochi che hanno ricevuto recensioni da 4 e 5 stelle, mostrandole una sola volta (3363)

--7- Selezionare quali giochi erano presenti nei tornei nei quali hanno partecipato i giocatori il cui nome inizia per 'S' (474)

--8- Selezionare le città in cui è stato giocato il gioco dell'anno del 2018 (36)

--9- Selezionare i giocatori che hanno giocato al gioco più atteso del 2018 in un torneo del 2019 (3306)


--*********** BONUS ***********

--10- Selezionare i dati della prima software house che ha rilasciato un gioco, assieme ai dati del gioco stesso (software house id : 5)

--11- Selezionare i dati del videogame (id, name, release_date, totale recensioni) con più recensioni (videogame id : 398)

--12- Selezionare la software house che ha vinto più premi tra il 2015 e il 2016 (software house id : 1)

--13- Selezionare le categorie dei videogame i quali hanno una media recensioni inferiore a 1.5 (10)