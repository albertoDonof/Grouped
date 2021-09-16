<h1> Grouped </h1>
Il nostro sito, Grouped, permette a studenti e professori  di gestire l’organizzazione di esami progettuali di gruppo per il corso di ingegneria informatica e automatica.


Ruoli previsti e funzionalità ad essi offerte:
    • Amministratore: ha accesso a tutte le impostazioni del sito, può rimuovere studenti, professori, progetti ed esami.
    • Studente: può cercare esami nella lista, vedere i profili di altri studenti e diventare studente project manager creando un progetto.
    • Studente Project Manager: può modificare ed eliminare un suo progetto, può aggiungere e rimuovere studenti a quest’ultimo.
    • Professore: può modificare, creare ed eliminare esami.
Per gli utenti non registrati non è prevista nessuna funzionalità.

Modalità di accesso:
    • Accesso locale: l’utente inserisce le proprie credenziali direttamente sul sito.
    • Accesso tramite Oauth di Google: l’utente si identifica tramite i servizi di Google.

Descrizione dati gestiti:
Il sito gestisce dati riguardo le seguenti entità:
    • Utente: al momento della registrazione l’utente inserisce le sue credenziali, ovvero nome, cognome, email e password (se non si registra tramite Oauth di Google). Inoltre sono presenti associazioni per gli esami e i progetti a cui partecipa lo studente.
    • Esame: per ogni esame sono indicati il nome, il codice del corso e una descrizione. Sono presenti anche associazioni per gli studenti che partecipano all’esame e i progetti relativi a quuest’ultimo.
    • Progetto: per ogni progetto sono indicati un nome, una descrizione e il nome della repository di github. Inoltre sono presenti associazioni con gli studenti che partecipano al progetto e all’esame per il quale è svolto.

Interazione con i servizi esterni:
Tramite le api di github, nella pagina di visualizzazione di un progetto, è possibile visualizzare il readme del progetto e, nel caso l’utente che lo sta visualizzando sia un professore, anche il link per scaricare la repository.

