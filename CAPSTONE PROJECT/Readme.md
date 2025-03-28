# Analisi dei Dati di Raccolta Differenziata comune Decollatura per gli anni 2021-2024

Questo repository contiene il file Power BI (`.pbix`) utilizzato per analizzare i dati relativi alla raccolta differenziata. L'obiettivo del progetto è fornire una panoramica completa e dettagliata dei dati, consentendo di monitorare le performance, identificare trend e valutare l'efficacia del sistema di gestione dei rifiuti.

📌 Panoramica del Progetto

Questo progetto analizza i dati relativi alla raccolta differenziata, partendo da file Excel contenenti informazioni annuali. L'analisi è strutturata in cinque sezioni principali all'interno del report Power BI:

* **Overview Totale Raccolta:** Visualizzazione aggregata dei dati con filtri per mese, anno e tipologia di rifiuto (EER). Include totali, variazioni YoY, medie mensili e percentuali per tipologia.
* **Qualità della Raccolta Differenziata:** Analisi specifica sui rifiuti differenziati, con filtri temporali e metriche simili all'overview totale, focalizzata sulle diverse tipologie EER.
* **Rifiuti Pro Capite:** Studio dei rifiuti prodotti per persona, con dati mensili e giornalieri e relativa variazione percentuale YoY.
* **Analisi dei Viaggi per Trasportatore:** Dettaglio sui viaggi effettuati dai vari trasportatori, con totali e medie per giorno della settimana.
* **Viaggi e Quantità per Destinazione:** Correlazione tra i viaggi effettuati e le quantità di rifiuti conferite alle diverse destinazioni.

🛠️ Funzionalità Chiave

✔ Normalizzazione dei dati da file Excel in un modello relazionale (tabella dei fatti e dimensioni). <br />
✔ Creazione di un modello dati in Power BI con relazioni tra le tabelle. <br />
✔ Sviluppo di misure DAX per calcolare metriche chiave come totali, medie, percentuali e variazioni YoY. <br />
✔ Realizzazione di visualizzazioni interattive per esplorare i dati attraverso filtri. <br />
✔ Organizzazione delle analisi in 5 pagine distinte per una consultazione mirata. <br />

📂 File Inclusi

* `CapstoneProject_DeFazioManuela_Analisi sulla raccolta differenziata.pbix`: File Power BI contenente il modello dati, le misure e le visualizzazioni.
* `README.md`: Questo file, contenente la descrizione del progetto.

🎯 Scopo

Questo progetto è stato sviluppato per analizzare in modo approfondito i dati di raccolta differenziata, fornendo insight utili per il monitoraggio delle performance e l'identificazione di aree di miglioramento nel sistema di gestione dei rifiuti.

**👣 Fasi Preliminari del Lavoro**

Prima di procedere con l'analisi in Power BI, ho seguito diverse fasi per preparare i dati:

1.  **Acquisizione dei Dati:** Ho ricevuto file Excel (`.xls`) contenenti i dati di raccolta differenziata, organizzati separatamente per ogni anno disponibile.
2.  **Esplorazione Iniziale:** Ho esaminato i file Excel per comprendere la struttura dei dati, i campi disponibili, la coerenza delle informazioni e identificare eventuali potenziali problemi (es. valori mancanti, formati inconsistenti).
3.  **Definizione del Modello Dati:** Basandomi sulla comprensione dei dati, ho concettualizzato un modello dati relazionale per ottimizzare l'analisi in Power BI. L'obiettivo era separare le informazioni sui "fatti" (le singole registrazioni di raccolta con le relative misure) dalle informazioni di contesto o "dimensioni" (trasportatori, destinatari, date, tipologie di rifiuto, residenti).
4.  **Trasformazione e Pulizia dei Dati (in Excel o Power Query):**
    * Ho consolidato i dati provenienti dai diversi file Excel in un formato più gestibile tramite Power Query.
    * Ho eseguito operazioni di pulizia per gestire eventuali incongruenze nei dati
    * Ho strutturato i dati in tabelle separate per fatti e dimensioni, identificando le chiavi primarie e le potenziali chiavi esterne per le relazioni.

**🏗️ Creazione dello Schema del Modello Dati**

Lo schema del modello dati è stato progettato seguendo un approccio tipico per l'analisi di dati transazionali, con una **tabella dei fatti** (`FATTI_Differenziata`) al centro e diverse **tabelle di dimensione** che forniscono il contesto per l'analisi:

* **`DIM Trasportatore`:** Contiene informazioni uniche sui trasportatori (ID e Nome).
* **`DIM Destinatario`:** Contiene informazioni uniche sui destinatari dei rifiuti (ID e Nome).
* **`DIM Date`:** Contiene un calendario completo con diverse granularità temporali (Anno, Mese, Giorno, ecc.) per consentire l'analisi dei trend nel tempo.
* **`DIM EER`:** Contiene la descrizione delle diverse tipologie di rifiuto (codice EER e Descrizione).
* **`DIM Residenti`:** Contiene i dati sulla popolazione residente per anno, utili per il calcolo dei rifiuti pro capite.

La **tabella dei fatti** (`FATTI_Differenziata`) contiene le singole registrazioni degli eventi di raccolta, con riferimenti (tramite chiavi esterne) alle tabelle di dimensione per contestualizzare ogni evento. Le colonne chiave nella tabella dei fatti includono la data dell'evento, il tipo di rifiuto (EER), il trasportatore, il destinatario e la quantità di peso raccolta.

Le **relazioni** tra la tabella dei fatti e le tabelle di dimensione sono di tipo **uno-a-molti**

Questo schema normalizzato permette di analizzare i dati in modo efficiente, filtrando e aggregando le informazioni per diverse dimensioni e calcolando metriche significative.

📈 Insight Chiave

* La prima pagina offre una panoramica generale sull'andamento della raccolta differenziata nel tempo e per tipologia di rifiuto.
* La seconda pagina si concentra sulla qualità della differenziata, analizzando le quantità raccolte per singola tipologia EER.
* La terza pagina permette di valutare la produzione di rifiuti pro capite e la sua evoluzione.
* La quarta pagina fornisce informazioni dettagliate sull'attività dei diversi trasportatori.
* L'ultima pagina mette in relazione i viaggi con le quantità di rifiuti conferite alle varie destinazioni.

ℹ️ Origine dei Dati

I dati originali per questa analisi provenivano da file Excel (`.xls`) contenenti informazioni suddivise per anno. È stato necessario un processo di normalizzazione per creare un modello dati relazionale efficiente in Power BI.
