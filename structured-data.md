//current max task number: T090

# in work
  - [ ] *T030*: Database sluit na upload en mapping
  - [ ] *T029*: Schema geeft meer properties in metadata terug, dan die beschikbaar zijn (owl:sameAs bioport person, het ophalen van unknown via sameAs)
  - 2TBI-demo:<br>
    Datasets uploaden, zorgen dat de GUI configurabel genoeg is en eventuele bugs fixen zodat de demo werkt
    - [X] *T084*: Summaryprops automatisch laten terugvallen op well-known predicates (zoals rdfs:label foaf:depiction etc) (misschien configureerbaar?)
    - [X] *T020*: 2tbi, RAA en bioport importplannetje waarbij bioport id's alignen
    - [X] *T021*: timbuctoo schema bug die getriggerd wordt door 2tbi data fixen
    - [X] *T022*: View configurator aanpassen zodat we links naar andere entities kunnen maken
    - [X] *T024*: Bioport mapping aanpassen en opnieuw runnen<br>
                subjecturi: http://www.biografischportaal.nl/persoon/{Bioport_id}
                type: bioportperson
                zorgen dat bij de import de rdfPrefix niet op example.org staat maar op de anansi prefix
    - [X] *T025*: RAA mapping aanpassen en opnieuw runnen<br>
                subject: gewoon een custom uri
                http://www.w3.org/2002/07/owl#sameAs {bprURL}
                type: Ambtsdrager
                viafurl als anyuri
                plus officesheld
                zorgen dat bij de import de rdfPrefix niet op example.org staat maar op de anansi prefix
    - [X] *T026*: 2TBI via sed aanpassen en importeren<br>
                sameas: {bprURL}
                sed 's|http://schema.org/Person/biografisch_portaal> "\(.*\)"^^<http://schema.org/URL>|http://www.w3.org/2002/07/owl#sameAs> <\1>|'
    - [X] *T027*: nieuwe timbuctoo releasen
    - [X] *T041*: graphiql mutation om de descriptie (title, provenance, depiction, colophon, namen van de collecties) aan te passen
    - [ ] *T023*: dataset VOID-description mutation toevoegen
    - [ ] *T028*: werk documentatie bij<br>
                - welke datatypen indexeren we als dates, 
                - hoe kun je checken of je rdf valide is
                - how to add valid describedBy data (must be rdf+xml in VOID)
  - ResourceSync v2.0:<br>
    Make our resourcesync exchange protocol use changelists
    - [X] *T053*: Update ResourceSync spec to allow for separate changelist
    - [ ] *T040*: Update ResourceSync import code to allow for separate changelist (also check if update works)
    - [ ] *T042*: Update ResourceSync generation code to provide a Changelist next to the resourcelist
    - [ ] *T043*: resourcesync client protected resources
    - [ ] *T044*: resourcesync update kunnen triggeren via graphql (dat betekent dat we per dataset moeten gaan bijhouden welke bron rs-url die had)
  - rdf_upload v2.0: rdf upload<br>
    Allow a user to do an upload throught the GUI
    - [X] *T035*: "Create dataset" optie aanmaken in GUI
    - [X] *T037*: Upload web interface in de GUI voor rdf data
    - [ ] *T039*: andere gebruikers als editor/admin kunnen toevoegen aan je dataset (graphiql)
  - tabular_upload v3.0: tabular upload<br>
    Ge-uploade tabulaire data onder een voorspelbare graphql endpoint plaatsen en niet in het overzicht van collecties tonen
    - [ ] *T031*: Ge-uploade tabulaire data onder een voorspelbare graphql endpoint plaatsen + excel data niet in het overzicht van collecties tonen
    - [ ] *T034*: graphql mutation voor applyen van jsonnet mapping die als resultaat de evt. mapping errors teruggeeft (die nu in de js gechecked worden)
    - [ ] *T036*: Upload web interface in de GUI voor csv data
    - [ ] *T038*: GUI voor het uploaden van een jsonnet & json-ld mapping (misschien wel met codemirror voor het typen ervan) + iets dat de mapping aan de juiste csv file bindt

# up next
  - overdracht jauco
    - [ ] *T063*: overdracht beheerservices Timbuctoo instantie -- password etc.
    - [ ] *T066*: overdracht GUI
  - [ ] *T045*: Migratiegids in data.huygens
  - [ ] *T051*: sortering van results? alfabetisch mogelijk?
  - [ ] *T052*: Remove hsid from frontend URI (aka: fix major security leak)
  - [ ] *T054*: configuratie van links naar buiten toe (e.g. geonames, url met afbeelding, obituary url)
  - [ ] *T055*: order of facet blocks in view is not the same as configured
  - [ ] *T056*: possibility to position diffent fields in screen view on horizontal axis (so it seems to be a 'string')
  - [ ] *T057*: data-issues in DWC:<br>
              - year '4242'
              - gender caps
              - source dataset missing
              - <html> tags
  - [ ] *T058*: k8s scripts bugs bekijken
  - [ ] *T060*: count o.i.d. op previous-next cursors zodat je weet waar je bent
  - [ ] *T062*: mapping: generate provenance
  - [ ] *T064*: elasticsearch indexen backoff if error
  - [ ] *T065*: direct indexeren na upload gaat niet goed --> trigger te vroeg
  - [ ] *T067*: test server with db backups
  - [ ] *T068*: search in all datasets
  - [ ] *T070*: remove ':' after field label in screen view
  - [ ] *T071*: from record view a 'back button' to list of results
  - [ ] *T072*: re-ordering (and selection) of collection blocks/rectangles in dataset view 
  - [ ] *T074*: herstructureren dataset + stores
  - [ ] *T075*: requestlogging GoReplay
  - [ ] *T076*: promoted mutation in graphQL --> testen op DWC op data.huygens
  - [ ] *T077*: persistent IDs (handle) voor entiteiten >> op welk niveau? >> inschatting tijd v dit issue?
  - [ ] *T078*: mee scrollen van facet menubalk bij lange resultaten lijst
  - [ ] *T080*: 1 clock voor Timbuctoo
  - [ ] *T081*: view screen config: ingevoerde label zichtbaar (vgl. facet config)
  - [ ] *T082*: problemen met ':' in ID-veld van csv na mapping --> dubbele uri encoding FE
  - [ ] *T083*: verkorte URLs voor dataset namen
  - [ ] *T085*: JsonLD edit endpoint naar nieuwe generate log (dataset overzetten) --> herstartbaar na reboot
  - [ ] *T086*: dataset name toevoegen logging import
  - [ ] *T087*: gegenereerde metadata moet content ook meegeven 
  - [ ] *T088*: resourcesync API via graphQL exposen (list data from url and import dataset)
  - [ ] *T089*: volgorde van naamselementen in resultaten lijst (bv. "Pieter Winter van jonkheer" moet zijn "jonkheer Pieter van Winter")
  - [ ] *T090*: aantal personen in DWC in Anansi is de helft van aantal personen DWC in data.huygens 

# archive
  - [X] *T073*: delete upload falende csv gaat fout --> er blijft een bestand hangen
  - [X] *T069*: volgende Timbuctoo release dataset config aanpassen --> na merge refactor-storage
  - [X] *T061*: problemen mount k8s --> hoge belasting?
  - [X] *T059*: indexer job (SOLR) van Women Writers werkt niet
  - data_huygens v1: Data Huygens toonbaar maken
    - T002: [X] import data BioPort
    - T003: [X] vervangen plaatje
    - T004: [X] colophon en beschrijving omdraaien in de dataset overview
    - T005: [X] plaatje DWC fixen; naar https://
    - T006: [X] provenanceInfo_body markdown/opmaak fixen in de dataset overview (zie charterportaal)
    - T007: [X] configuratie data BioPort
    - T008: [X] geen Timbuctoo-logo + tekst = Data Huygens ING
    - T009: [X] vervangen teksten boilerplate
    - T010: [X] fonts van boilerplate
    - T011: [X] favicon in tabblad >> Timbuctoo logo
    - T012: [X] deel van intro tekst verplaatsen
    - T013: [X] zichtbaarheid van 'own datasets' configureerbaar maken; op data.huygens niet zichtbaar instellen
    - T015: [X] nieuwe metadata file + afbeelding
    - T016: [X] afbeelding bibliotheek data.huygens = https://commons.wikimedia.org/wiki/File:Rijksmuseum_library_02.jpg
    - [X] *T050*: repository.huygens.knaw.nl redirect niet meer naar https://repositorytemp.jauco.nl/static/graphiql

  - browseable_datasets v2: Een dataset direct na het uploaden al redelijk bladerbaar krijgen
    - [X] *T014*: fix rdfs:label autoconfig

  - toogdag 2018: werk voor de toogdag
    - [X] *T017*: import data 2TBI - uit Nodegoat
    - [X] *T018*: check of de 2TBI data die nu door nodegoat gepubliceerd wordt valide is
    - [X] *T019*: 2TBI dates als daterange-facet werkt niet. Check of het een mapping of EDTF-fout is
    - [X] *T032*: Anansi: dataset Places (=Gemeentegeschiedenis, nlgis & the other one) -- als featured dataset
    - [X] *T033*: Anansi: dataset Concepts (= data DIAMANT) -- als featured dataset
    - [X] *T049*: Anansi: dataset Persons (=DWC + BioPort) -- als featured dataset

# projects
  Emlo:
    functional_manager: "Arno Bosse" <arno.bosse@oxford.edu.uk>
    requirements:
      EMLO_AUTH: Allow login integration with their systems
        delivered: no
        deadline: 2008-12-14
        description: ''
        references:
          quote: ''
          document: ''
          page: ''
