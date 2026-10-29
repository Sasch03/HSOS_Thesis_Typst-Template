#import "template.typ": clean_style, deckblatt

#set document(
  title: "PLATZHALTER",
  author: ("PLATZHALTER")
)

#show: clean_style


// =====================================================================


// A. Das Deckblatt
#deckblatt(
  thema: "PLATZHALTER",

  art_der_arbeit: "Bachelorarbeit",
  studiengang: "PLATZHALTER",
  
  autor_name: "PLATZHALTER",
  matrikelnummer: "PLATZHALTER",
  
  betreuer1: "PLATZHALTER",
  betreuer2: "PLATZHALTER", 
  
  ausgabedatum: datetime(year: 2026, month: 10, day: 29),
  abgabedatum: datetime(year: 2026, month: 10, day: 29),
  
  logo: image("pictures/logo_hsos.svg", width: 9cm) 
)


// =====================================================================


// B: Sperrvermerk


#pagebreak()

#heading(level:2, numbering: none, outlined: false)[Sperrvermerk]

Die vorliegende Prüfungsleistung mit dem Titel „PLATZHALTER“ beinhaltet vertrauliche Daten. Sie darf nur vom Verfasser, von denen am Prüfungsverfahren beteiligten Personen einschließlich des mit der Verwaltung des Prüfungsvorgangs befassten Hochschulpersonals und vom Unternehmen PLATZHALTER eingesehen werden.

Eine Veröffentlichung und Vervielfältigung der vorliegenden Prüfungsleistung, auch in Teilen,  ist nur mit Zustimmung des Verfassers, des hochschulischen Gutachters und des Unternehmens PLATZHALTER gestattet.

Dritten darf diese Prüfungsleistung nur mit der ausdrücklichen Genehmigung des Verfassers, des hochschulischen Gutachters und des Unternehmens PLATZHALTER zugänglich gemacht werden.


// =====================================================================


// C: Abstract / Kurzzusammenfassung ---

#pagebreak()

#heading(level: 2, numbering: none, outlined: false)[Kurzzusammenfassung]
PLATZHALTER 
#v(2em) // Abstand zwischen den beiden Abschnitten

#heading(level: 2, numbering: none, outlined: false)[Abstract]
PLATZHALTER

#pagebreak()


// =====================================================================


// D. Verzeichnisse
#outline(title: "Inhaltsverzeichnis", indent: auto)
#pagebreak()

#outline(
  title: "Abbildungsverzeichnis",
  target: figure.where(kind: image),
)
#pagebreak()

#outline(
  title: "Tabellenverzeichnis",
  target: figure.where(kind: table),
)
#pagebreak()

#heading(level: 1, numbering: none, outlined: false, "Abkürzungsverzeichnis")
#grid(
  columns: (80pt, 1fr),
  row-gutter: 1.5em,
  align: (left + horizon, left + horizon),
  [*HSOS*],    [Hochschule Osnabrück],

)


// =====================================================================


// F. Hauptteil

#pagebreak()

#set page(numbering: "1")
#counter(page).update(1)


// =====================================================================


// =====================================================================
// KAPITEL 1: EINLEITUNG
// =====================================================================

= Einleitung
PLATZHALTER

== Motivation und Relevanz
PLATZHALTER

== Problemstellung
PLATZHALTER

== Zielsetzung und Forschungsfragen der Arbeit
PLATZHALTER



// =====================================================================
// KAPITEL 2: ANALYSE DES IST-ZUSTANDS
// =====================================================================

= Analyse des Ist-Zustands
PLATZHALTER

== Unterkapitel
PLATZHALTER

=== Unterkapitel des Unterkapitels
PLATZHALTER



// =====================================================================
// KAPITEL 3: STAND DER FORSCHUNG UND THEORETISCHE GRUNDLAGEN
// =====================================================================

= Stand der Forschung und theoretische Grundlagen
PLATZHALTER

== Unterkapitel
PLATZHALTER

=== Unterkapitel des Unterkapitels
PLATZHALTER



// =====================================================================
// KAPITEL 4: METHODIK UND KONZEPTION
// =====================================================================

= Methodik und Konzeption
PLATZHALTER

== Unterkapitel
PLATZHALTER

=== Unterkapitel des Unterkapitels
PLATZHALTER



// =====================================================================
// KAPITEL 5: BEISPIELKAPITEL
// =====================================================================

= Beispielkapitel
PLATZHALTER

== Literatur zitieren
So wird Literatur zitiert:
#footnote([Vgl. @beispiel2026]).

== Bild einfügen
So wird ein Bild eingefügt:

#figure(
  image("pictures/HS-OS-Logo-no_back.png", width: 95%),
  caption: [Logo der Hochschule Osnabrück [Keine eigene Darstellung].], 
) <eval_bar_chart>



// =====================================================================
// KAPITEL 6: KRITISCHE REFLEXION UND DISKUSSION
// =====================================================================

= Kritische Reflexion und Diskussion
PLATZHALTER

== Methodische Reflexion 
PLATZHALTER

== Diskussion der Ergebnisse 
PLATZHALTER

== Übertragbarkeit und Praxisrelevanz
PLATZHALTER

== Limitationen
PLATZHALTER



// =====================================================================
// KAPITEL 7: FAZIT UND AUSBLICK
// =====================================================================

= Fazit und Ausblick
PLATZHALTER

== Zusammenfassung der wesentlichen Erkenntnisse
PLATZHALTER

== Handlungsempfehlungen
PLATZHALTER

== Ausblick auf künftige Erweiterungen
PLATZHALTER



// =====================================================================


#pagebreak()
#set heading(numbering: none)


// =====================================================================


#bibliography(
  "literature.bib", 
  title: "Literaturverzeichnis",
  style: "apa"
)


// =====================================================================

// --- ERGÄNZUNG: Anhang ---
#pagebreak()
#heading(level: 1, outlined: false)[Anhang]

#heading(level: 2, outlined: false)[Anhang 1: \ PLATZHALTER]
#figure(
  image("pictures/HS-OS-Logo-no_back.png", width: 80%),
  caption: "PLATZHALTER", 
) <anhang1>

#v(2em)



// =====================================================================

#pagebreak()
#heading(level: 1, outlined: false)[Selbstständigkeitserklärung]

Hiermit erkläre ich an Eides statt, dass ich die vorliegende Arbeit selbstständig und ohne Benutzung anderer als der angegebenen Hilfsmittel angefertigt habe; die aus fremden Quellen direkt oder indirekt übernommenen Gedanken sind als solche kenntlich gemacht.

Die Arbeit wurde bisher in gleicher oder ähnlicher Form keiner anderen Prüfungsbehörde vorgelegt und auch noch nicht veröffentlicht.

Darüber hinaus erkläre ich, dass generative Systeme der Künstlichen Intelligenz (KI) als unterstützende Hilfsmittel bei der Erstellung dieser Arbeit zum Einsatz kamen. Die Nutzung erfolgte zweckorientiert im Rahmen der Literatur- und Informationsrecherche, zur Optimierung von Rechtschreibung und Grammatik sowie punktuell als Formulierungshilfe. Zudem wurden KI-gestützte Werkzeuge zur Unterstützung bei der Entwicklung und Optimierung von Programmcode eingesetzt. Sämtliche maschinell generierten Ergebnisse und Code-Komponenten wurden von mir eigenständig überprüft, kritisch bewertet und in die eigene Eigenleistung integriert.

#v(3cm)
#grid(
  columns: (1fr, 1fr),
  gutter: 2cm,
  [
    #line(length: 100%, stroke: 0.5pt)
    Ort, Datum
  ],
  [
    #line(length: 100%, stroke: 0.5pt)
    Unterschrift
  ]
)