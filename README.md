# BoswachterApp
Hello! Deze repo bevat een stub om aan de gang te gaan met de hackathon die NAVARA in samenwerking met Natuurmonumenten organiseert. Er is alvast de basis voor een REST API die CRUD endpoints voor 'observations' ondersteunt uitgewerkt. Deze entities worden in een PostgreSQL database opgeslagen. Door middel van Docker Compose kunnen de benodigde containers gemakkelijk opgestart worden (zie instructies hieronder). De API is gebouwd met Python+FastAPI, voel je vrij om uitbreidingen te doen of veranderingen te maken waar nodig.

## Setup
Door `docker-compose up` te draaien in de root van deze repo start je de benodigde containers voor database en API. Vereiste is uiteraard dat je Docker en Docker Compose geïnstalleerd hebt. Met `docker-compose down` stop je alle aangemaakte containers weer. Door `docker-compose up` met de `--watch` vlag te draaien synchroniseren alle veranderingen aan de code van de API automatisch richting de container en wordt het serverproces herladen bij veranderingen zodat deze direct zichtbaar worden. Let op! Als je gegevens in de database zet worden deze niet persistent opgeslagen. Mocht je veranderingen aan het model van de Observation maken of andere modellen toevoegen waarvoor veranderingen in de databasestructuur nodig zijn dan is het nodig de containers te herstarten door `docker-compose down && docker-compose up --watch` te draaien.

## Gebruik
De API start op `localhost:8000`. De documentatie van de beschikbare endpoints is te vinden op `http://localhost:8000/docs`. 


Hey i made some changes