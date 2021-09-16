<h1> Grouped-Progetto Lassi</h1>
Il nostro sito, Grouped, permette a studenti e professori  di gestire l’organizzazione di esami progettuali di gruppo per il corso di ingegneria informatica e automatica.



<h2> Ruoli previsti e funzionalità ad essi offerte: </h2>
<ul>
    <li> Amministratore: ha accesso a tutte le impostazioni del sito, può rimuovere studenti, professori, progetti ed esami. </li>
    <li> Studente: può cercare esami nella lista, vedere i profili di altri studenti e diventare studente project manager creando un progetto. </li>
    <li> Studente Project Manager: può modificare ed eliminare un suo progetto, può aggiungere e rimuovere studenti a quest’ultimo. </li>
    <li> Professore: può modificare, creare ed eliminare esami.
</ul>
Per gli utenti non registrati non è prevista nessuna funzionalità.

<h2> Modalità di accesso: </h2>
<ul>
    <li> Accesso locale: l’utente inserisce le proprie credenziali direttamente sul sito.</li>
    <li> Accesso tramite Oauth di Google: l’utente si identifica tramite i servizi di Google.</li>
</ul>
<h2> Descrizione dati gestiti: </h2>
Il sito gestisce dati riguardo le seguenti entità:
<ul>
    <li> Utente: al momento della registrazione l’utente inserisce le sue credenziali, ovvero nome, cognome, email e password (se non si registra tramite Oauth di Google). Inoltre sono presenti associazioni per gli esami e i progetti a cui partecipa lo studente. </li> 
    <li> Esame: per ogni esame sono indicati il nome, il codice del corso e una descrizione. Sono presenti anche associazioni per gli studenti che partecipano all’esame e i progetti relativi a quuest’ultimo.</li>
    <li> Progetto: per ogni progetto sono indicati un nome, una descrizione e il nome della repository di github. Inoltre sono presenti associazioni con gli studenti che partecipano al progetto e all’esame per il quale è svolto. </li>
</ul>
<h2> Interazione con i servizi esterni: </h2>
Tramite le api di github, nella pagina di visualizzazione di un progetto, è possibile visualizzare il readme del progetto e, nel caso l’utente che lo sta visualizzando sia un professore, anche il link per scaricare la repository.

<h1> Mockup </h1>

![story_board](https://user-images.githubusercontent.com/57904745/133673358-2a0523f3-7569-47d0-ac9a-2577b067c9ec.png?)
