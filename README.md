# Typst Vorlage für Abschlussarbeiten an der Hochschule Osnabrück

Diese Vorlage richtet sich an Studierende der Fakultät **Management, Kultur und Technik (MKT)** der Hochschule Osnabrück, die ihre Abschlussarbeit mit Typst schreiben möchten.

Die Anleitung führt dich von der Einrichtung bis zur PDF Ausgabe. Du benötigst keine LaTeX Kenntnisse. Für den Einstieg genügen ein Texteditor, die Erweiterung Tinymist und grundlegende Kenntnisse der Typst Schreibweise.

> **Wichtig:** Die Vorlage ist eine Hilfestellung, keine Zusicherung der formalen Zulässigkeit. Prüfe die aktuellen Vorgaben deines Studiengangs und die Absprachen mit deinen Prüfenden. Insbesondere Zitierstil, Deckblatt, Erklärungen und Abgabeformat müssen zu deiner Arbeit passen.

## Inhalt

- [Schnellstart](#schnellstart)
- [Versionen und Kompatibilität](#versionen-und-kompatibilität)
- [Projektstruktur](#projektstruktur)
- [Einrichtung](#einrichtung)
- [Tatsächlich implementierte Gestaltung](#tatsächlich-implementierte-gestaltung)
- [Die Vorlage anpassen](#die-vorlage-anpassen)
- [Formatierungen und wissenschaftliche Inhalte](#formatierungen-und-wissenschaftliche-inhalte)
- [PDF erstellen](#pdf-erstellen)
- [Fehlerbehebung](#fehlerbehebung)
- [Checkliste vor der Abgabe](#checkliste-vor-der-abgabe)
- [Fehler melden und Verbesserungen beitragen](#fehler-melden-und-verbesserungen-beitragen)
- [Weiterführende Dokumentation](#weiterführende-dokumentation)

## Schnellstart

1. Installiere **VS Code oder VSCodium** und die Erweiterung **Tinymist Typst**.
2. Lade dieses Repository über **Code → Download ZIP** herunter und entpacke es. Alternativ kannst du es mit Git klonen:

   ```sh
   git clone https://github.com/Sasch03/hsos_typst_thesis_template.git
   cd hsos_typst_thesis_template
   ```

3. Öffne den **gesamten Projektordner** im Editor, nicht nur eine einzelne Datei.
4. Öffne `main.typ` und starte die Vorschau über das Vorschau Symbol oder die Befehlspalette mit `Strg + Umschalt + P`. Suche dort nach den Vorschau Befehlen von Tinymist.
5. Ersetze die Beispieldaten und Beispielinhalte durch deine eigenen Angaben.
6. Erstelle eine PDF und kontrolliere das Ergebnis.

Für eine unabhängig vom Editor reproduzierbare PDF Ausgabe installierst du zusätzlich die Typst CLI. Die Schritte stehen unter [Einrichtung](#einrichtung).

## Versionen und Kompatibilität

**Mit dieser Vorlage erfolgreich getestete Typst Version: noch einzutragen.**

In den bereitgestellten Dateien `main.typ` und `template.typ` ist keine Compiler Version festgelegt. Aus dem Code allein lässt sich eine erfolgreich getestete Version nicht bestimmen. Die Dateien importieren keine externen Typst Pakete; erforderlich sind die lokalen Vorlagendateien, Schriftarten, Bilder und die Literaturdatei.

Trage die Version nach einer erfolgreichen vollständigen Kompilierung in die folgende Tabelle ein. Eine ungetestete Mindestversion wird nicht angegeben:

| Angabe | Status |
| --- | --- |
| Erfolgreich getestete Typst Version | Noch einzutragen |
| Getestete Tinymist Version | Noch einzutragen |
| Datum des letzten vollständigen Tests | Noch einzutragen |

Die Version deiner separat installierten Typst CLI prüfst du mit:

```sh
typst --version
```

**Tinymist und die Typst CLI sind nicht dasselbe.** Tinymist stellt die integrierte Sprachunterstützung und Vorschau bereit. Eine zusätzliche Typst CLI wird für die grundlegende Tinymist Nutzung nicht pauschal vorausgesetzt. Editor und Terminal können unterschiedliche Compilerstände verwenden.

Für eine laufende Abschlussarbeit empfiehlt es sich, einen funktionierenden Stand von Vorlage, Erweiterung und Compiler festzuhalten. Prüfe nach Aktualisierungen insbesondere Seitenumbrüche, Verzeichnisse und Literaturangaben.

## Projektstruktur

Die zentralen Bestandteile des Repositorys sind:

| Datei oder Ordner | Zweck |
| --- | --- |
| `main.typ` | Einstiegspunkt der Arbeit; hier beginnst du mit deinen Anpassungen. |
| `template.typ` | Vorlagenlogik und Gestaltung. Änderungen können das gesamte Dokument beeinflussen. |
| `literature.bib` | Literaturdatenbank im BibTeX Format. |
| `pictures/` | Abbildungen und grafische Ressourcen. |
| `fonts/` | Im Projekt abgelegte Schriftdateien. |
| `main.pdf` | Vorhandene Beispielausgabe beziehungsweise lokal erzeugte PDF. |

Die bereitgestellte `main.typ` referenziert insbesondere `pictures/logo_hsos.svg`, `pictures/HS-OS-Logo-no_back.png` und den Literaturschlüssel `beispiel2026`. Diese Ressourcen müssen vorhanden sein oder ihre Verwendungen müssen ersetzt werden.

Bearbeite zuerst `main.typ`. Ändere `template.typ` nur dann, wenn eine benötigte Einstellung nicht bereits über den vorhandenen Vorlagenaufruf erreichbar ist.

## Einrichtung

### 1. Editor und Tinymist installieren

Du kannst **VS Code** oder **VSCodium** verwenden.

1. Öffne die Erweiterungsansicht mit `Strg + Umschalt + X`.
2. Suche nach **Tinymist Typst** von **myriad-dreamin**.
3. Installiere die Erweiterung.
4. Öffne den Projektordner und anschließend `main.typ`.

VSCodium verwendet standardmäßig Open VSX. Falls die Erweiterung dort nicht verfügbar ist oder eine bestimmte Version benötigt wird, kannst du eine passende `.vsix` Datei aus den offiziellen Tinymist Veröffentlichungen installieren. Verwende dazu in der Erweiterungsansicht **… → Aus VSIX installieren…**. Achte auf Betriebssystem und Prozessorarchitektur.

Vermeide mehrere gleichzeitig aktive Typst Spracherweiterungen, wenn sich Vorschau oder Diagnosemeldungen gegenseitig stören.

### 2. Typst CLI installieren

Die CLI ermöglicht es, die PDF direkt im Terminal zu erstellen und die Kompilierung unabhängig vom Editor zu prüfen.

#### Windows

Empfohlene Installation mit winget:

```powershell
winget install --id Typst.Typst --exact
```

Öffne danach ein neues Terminal und prüfe:

```powershell
typst --version
```

Alternativ kannst du das zu deinem System passende Archiv von der [offiziellen Veröffentlichungsseite](https://github.com/typst/typst/releases) herunterladen. Entpacke es und füge den Ordner mit `typst.exe` deiner Umgebungsvariable `PATH` hinzu.

#### Linux

Verwende den Paketmanager deiner Distribution, sofern dort eine geeignete Version angeboten wird. Beispiele:

```sh
# Arch Linux
sudo pacman -S typst

# Nix: temporäre Umgebung
nix-shell -p typst
```

Für andere Distributionen stehen auf der [offiziellen Veröffentlichungsseite](https://github.com/typst/typst/releases) vorkompilierte Programme bereit. Wähle das Archiv passend zu Betriebssystem und Prozessorarchitektur, entpacke es und lege die ausführbare Datei in einem Verzeichnis deines `PATH` ab.

Mit einer aktuellen Rust Toolchain ist alternativ möglich:

```sh
cargo install --locked typst-cli
```

Prüfe anschließend:

```sh
typst --version
```

Die verfügbaren Paketversionen unterscheiden sich je nach Distribution und Veröffentlichung. Eine Installation über den Paketmanager garantiert daher nicht automatisch dieselbe Version wie auf einem anderen Rechner.

#### Hinweis zu Flatpak

Bei einer Flatpak Installation des Editors kann die Sandbox den Zugriff auf Projektdateien, Schriftarten oder Programme einschränken. Eine auf dem Host installierte Typst CLI ist dadurch nicht automatisch im Editor ausführbar.

Prüfe zunächst die konkrete Fehlermeldung und die benötigten Zugriffsrechte. Verwende bei Bedarf eine native Editorinstallation. Eine pauschale Freigabe des gesamten Host Dateisystems ist für den Einstieg nicht erforderlich.

### 3. Schriftarten prüfen

Die im Dokument angeforderten Schriftarten müssen für den jeweiligen Compiler erreichbar sein. Ein Ordner `fonts/` allein garantiert noch nicht, dass Editor und CLI ihn verwenden.

Für die CLI kannst du den Projektordner ausdrücklich angeben:

```sh
typst fonts --font-path fonts
typst compile --font-path fonts main.typ main.pdf
```

Für Tinymist müssen die Schriftarten ebenfalls verfügbar sein. Prüfe dafür die Schriftpfade in den Einstellungen deiner installierten Erweiterung oder installiere die benötigten Schriftarten für dein Benutzerkonto.

Ersetze eine vorgeschriebene Schrift nicht unbemerkt durch eine andere. Unterschiedliche Schriften verändern unter anderem Zeilenumbrüche und Seitenumfang.

## Tatsächlich implementierte Gestaltung

Die folgenden Angaben stammen aus `template.typ` und `main.typ`:

| Bereich | Implementierung |
| --- | --- |
| Papierformat | A4 |
| Seitenränder | Oben 3,5 cm, unten 3 cm, links 3,5 cm, rechts 5 cm |
| Grundschrift | Arial, 11 pt |
| Dokumentsprache | Deutsch (`lang: "de"`), automatische Silbentrennung aktiviert |
| Absatzgestaltung | Blocksatz; zusätzlicher Zeilenabstand über `leading: 0.65em` |
| Überschriften | Hierarchische Nummerierung mit `"1.1"`, Arial, fett, Schwarz (`luma(0%)`) |
| Kapitelüberschriften | Beginn auf neuer Seite über einen schwachen Seitenumbruch; Darstellung mit `1.3em`, Nummer und Text in einem Raster |
| Bild- und Tabellenbeschriftungen | 9 pt über eine Regel für `figure.caption` |
| Kopfzeile | Dynamische Überschrift der Ebene 1, rechtsbündig in Kapitälchen, 9 pt, mit Trennlinie |
| Fußzeile | Zentrierte Seitenzahl, sofern eine Seitennummerierung aktiviert ist |
| Codeblöcke | Heller Hintergrund, 10 pt Innenabstand, 4 pt Eckenradius, volle Breite |
| Deckblatt | Eigene Funktion `deckblatt(...)`, ohne Kopfzeile und Seitennummer |
| Literatur | BibTeX Datei `literature.bib`, Zitierstil `apa` |

**Hinweis zum Zeilenabstand:** `leading: 0.65em` steuert den Abstand zwischen den Begrenzungen benachbarter Textzeilen. Der Wert ist kein Zeilenabstandsfaktor wie in einer Textverarbeitung und belegt allein keinen exakt 1,5-fachen Zeilenabstand.

### Vorhandener Dokumentaufbau

`main.typ` enthält bereits:

1. PDF Metadaten mit Titel und Autor
2. Deckblatt für eine Bachelorarbeit
3. Sperrvermerk
4. Kurzzusammenfassung und Abstract
5. Automatisches Inhaltsverzeichnis
6. Automatisches Abbildungsverzeichnis
7. Automatisches Tabellenverzeichnis
8. Manuell gepflegtes Abkürzungsverzeichnis
9. Hauptteil mit sieben Beispielkapiteln und Unterkapiteln
10. Literaturverzeichnis im APA Stil
11. Anhang mit Beispielabbildung
12. Selbstständigkeitserklärung mit einem Absatz zur KI Nutzung

### Seitenzahlen und Kapitelwechsel

Vor dem Hauptteil ist im bereitgestellten Code keine Seitennummerierung aktiviert. Das Deckblatt unterdrückt seine Seitennummer ausdrücklich. **Eine römische Nummerierung des Vorspanns ist nicht implementiert.**

Zu Beginn des Hauptteils werden arabische Seitenzahlen aktiviert und der Seitenzähler auf 1 gesetzt. Die Nummerierung läuft anschließend durch Literaturverzeichnis, Anhang und Selbstständigkeitserklärung weiter.

Alle Überschriften der Ebene 1 erhalten durch die Gestaltung einen schwachen Seitenumbruch. Damit beginnen Hauptkapitel auf einer neuen Seite; auf einer bereits leeren Seite soll kein zusätzlicher Umbruch entstehen. Die Regel gilt auch für unnummerierte Überschriften dieser Ebene.

Sperrvermerk, Kurzzusammenfassung und Abstract verwenden Ebene 2 und sind mit `outlined: false` vom Inhaltsverzeichnis ausgeschlossen. Auch das Abkürzungsverzeichnis, der Anhang, seine Beispielüberschrift und die Selbstständigkeitserklärung sind ausdrücklich ausgeschlossen. Prüfe die gewünschte Aufnahme dieser Bestandteile in dein Inhaltsverzeichnis.

Die Kapitelgliederung ist ein Beispiel und keine verbindliche Vorgabe. Ein automatisches Abkürzungsmanagement oder eine automatische Anhangnummerierung ist nicht eingebunden.

## Die Vorlage anpassen

### PDF Metadaten

Ersetze zuerst die Platzhalter in `main.typ`:

```typst
#set document(
  title: "Titel deiner Arbeit",
  author: "Vorname Nachname",
)
```

Die PDF Metadaten und die Angaben auf dem Deckblatt werden im aktuellen Code **getrennt** gepflegt. Eine Änderung von `thema` aktualisiert nicht automatisch den Dokumenttitel.

### Deckblatt konfigurieren

Die Funktion `deckblatt(...)` stellt diese Parameter bereit:

| Parameter | Inhalt beziehungsweise Verhalten |
| --- | --- |
| `thema` | Titel der Arbeit |
| `art_der_arbeit` | Art der Arbeit; im Beispiel Bachelorarbeit |
| `studiengang` | Bezeichnung des Studiengangs |
| `autor_name` | Name der einreichenden Person |
| `matrikelnummer` | Matrikelnummer als Text |
| `betreuer1` | Name für das Feld „ErstprüferIn“ |
| `betreuer2` | Name für das Feld „ZweitprüferIn“; bei `none` erscheint „entfällt“ |
| `ausgabedatum` | Optionaler Typst Datumswert; bei `none` erscheint „nicht angegeben“ |
| `abgabedatum` | Typst Datumswert; ohne Angabe wird das aktuelle Datum verwendet |
| `logo` | Bildinhalt; bei `none` erscheint ein sichtbarer Platzhalter |

Geburtsdatum, Geburtsort, Adresse, Studiengruppe und Modul sind in dieser Thesisvorlage **keine Deckblattparameter**.

Beispiel für einen vollständigen Aufruf:

```typst
#deckblatt(
  thema: "Titel deiner Arbeit",
  art_der_arbeit: "Bachelorarbeit",
  studiengang: "Dein Studiengang",
  autor_name: "Vorname Nachname",
  matrikelnummer: "123456",
  betreuer1: "Name der erstprüfenden Person",
  betreuer2: "Name der zweitprüfenden Person",
  ausgabedatum: datetime(year: 2026, month: 10, day: 29),
  abgabedatum: datetime(year: 2027, month: 1, day: 29),
  logo: image("pictures/logo_hsos.svg", width: 9cm),
)
```

Die Datumswerte sind reine Beispiele und keine Vorgabe zur Bearbeitungsdauer. Trage deine tatsächlich festgelegten Termine ein. Beide Daten werden im Format Tag.Monat.Jahr ausgegeben. Für eine reproduzierbare Abgabe solltest du das Abgabedatum ausdrücklich setzen.

Der Deckblatttext „Institut für Duale Studiengänge“ ist in `template.typ` fest hinterlegt. Er ist nicht als Parameter konfigurierbar. Prüfe, ob diese Zuordnung zu deinem Studiengang passt. Ebenso sind Schrift, Seitenränder und deutsche Beschriftungen im Code festgelegt; eine allgemeine Sprachumschaltung ist nicht implementiert.

### Sperrvermerk anpassen

Der Sperrvermerk ist als Textabschnitt in `main.typ` enthalten, nicht als optionale Vorlagenfunktion. Ersetze dort den Arbeitstitel und die Unternehmensplatzhalter. Der Titel wird nicht automatisch aus den Deckblattangaben übernommen.

Kläre mit den zuständigen Ansprechpersonen, ob ein Sperrvermerk benötigt wird und welcher Wortlaut verwendet werden soll. Falls keiner benötigt wird, entferne den Abschnitt einschließlich seines zugehörigen Seitenumbruchs.

### Abkürzungen pflegen

Das Abkürzungsverzeichnis ist eine manuelle Tabelle aus `#grid(...)`. Ergänze jeweils ein Paar aus Abkürzung und Erläuterung:

```typst
[*HSOS*], [Hochschule Osnabrück],
[*DMS*], [Dokumentenmanagementsystem],
```

Sortierung und Vollständigkeit musst du selbst prüfen. Eine automatische Erfassung aus dem Fließtext findet nicht statt.

### Literatur, Anhang und Erklärung prüfen

- Die Literatur wird am Ende mit `#bibliography("literature.bib", title: "Literaturverzeichnis", style: "apa")` eingebunden.
- Das Beispiel zitiert innerhalb einer Fußnote mit `#footnote([Vgl. @beispiel2026])`. Der APA Zitierstil bleibt dabei aktiv. Wenn für deine Arbeit APA Belege im Fließtext verlangt werden, verwende beispielsweise `@beispiel2026` direkt im Satz statt der gezeigten Fußnote. Stimme die konkrete Zitierweise ab.
- Ersetze die Anhangtitel und Abbildungen durch deine eigenen Inhalte.
- Die Selbstständigkeitserklärung enthält konkrete Aussagen über die Verwendung von KI. Übernimm diese nicht ungeprüft: Der Text muss deiner tatsächlichen Arbeitsweise und den für deine Abgabe geltenden Vorgaben entsprechen.

### Inhalte und Gestaltung trennen

Schreibe deine Inhalte möglichst in `main.typ` oder in eingebundenen Kapiteldateien. Die grundlegende Gestaltung bleibt in `template.typ`.

Für längere Arbeiten kannst du einen eigenen Ordner `chapters/` anlegen und Kapitel einbinden:

```typst
#include "chapters/01-einleitung.typ"
#include "chapters/02-grundlagen.typ"
#include "chapters/03-methodik.typ"
```

Diese Dateien sind ein Strukturvorschlag und müssen von dir angelegt werden.

## Formatierungen und wissenschaftliche Inhalte

Typst unterstützt die folgenden Elemente. Die Beispiele zeigen **allgemeine Typst Syntax**, keine zusätzlich nachgewiesenen Sonderfunktionen dieser Vorlage. Das konkrete Erscheinungsbild wird durch die Regeln in `template.typ` bestimmt.

Die bereits eingebundenen Bestandteile sind unter „Tatsächlich implementierte Gestaltung“ beschrieben. Weitere Typst Funktionen lassen sich ergänzen, sind aber nicht automatisch Bestandteil der Vorlage.

### Überschriften, Hervorhebungen und Listen

```typst
= Einleitung
== Ausgangssituation
=== Abgrenzung

Ein Absatz mit *fetter* und _kursiver_ Hervorhebung.

- Erster Listenpunkt
- Zweiter Listenpunkt

+ Erster nummerierter Schritt
+ Zweiter nummerierter Schritt
```

Eine Leerzeile beginnt einen neuen Absatz. Die Nummerierung der Überschriften hängt von den Einstellungen der Vorlage ab.

### Abbildungen und Querverweise

Lege beispielsweise `beispiel.png` in `pictures/` ab:

```typst
#figure(
  image("pictures/beispiel.png", width: 80%),
  caption: [Beispiel einer Abbildung.],
) <abb-beispiel>

Wie in @abb-beispiel dargestellt, ...
```

Verwende Querverweise statt manuell eingetragener Abbildungsnummern. Ergänze Quellenangaben entsprechend den für deine Arbeit geltenden Vorgaben.

### Tabellen

```typst
#figure(
  table(
    columns: (1fr, 1fr),
    table.header([Merkmal], [Beschreibung]),
    [Format], [PDF],
    [Werkzeug], [Typst],
  ),
  caption: [Übersicht der verwendeten Werkzeuge.],
) <tab-werkzeuge>

Die Übersicht steht in @tab-werkzeuge.
```

### Formeln

```typst
Eine Formel im Fließtext: $E = m c^2$.

Eine abgesetzte Formel:

$ E = m c^2 $
```

### Literatur und Zitate

Pflege deine Quellen in `literature.bib`. Ein beispielhafter Eintrag sieht so aus:

```bibtex
@book{beispiel2026,
  author    = {Mustermann, Erika},
  title     = {Beispieltitel zur Demonstration},
  year      = {2026},
  publisher = {Beispielverlag}
}
```

Dieser Eintrag ist fiktiv und dient ausschließlich der Syntaxdemonstration.

Im Text zitierst du über den Schlüssel:

```typst
Eine beispielhafte Aussage mit Quellenverweis @beispiel2026.
```

Ein Literaturverzeichnis wird grundsätzlich so eingebunden:

```typst
#bibliography("literature.bib")
```

**Füge den Aufruf nicht zusätzlich ein, wenn die Vorlage das Literaturverzeichnis bereits erzeugt.** Prüfe den vorhandenen Aufruf und den eingestellten Zitierstil. Ein funktionierender Quellenverweis bedeutet noch nicht, dass der Stil den Vorgaben deiner Prüfenden entspricht.

### Inhaltsverzeichnis und weitere Verzeichnisse

Die Vorlage bindet diese Verzeichnisse bereits ein:

```typst
#outline(title: "Inhaltsverzeichnis", indent: auto)

#outline(
  title: "Abbildungsverzeichnis",
  target: figure.where(kind: image),
)

#outline(
  title: "Tabellenverzeichnis",
  target: figure.where(kind: table),
)
```

Füge diese Aufrufe nicht zusätzlich ein. Bilder und Tabellen werden über entsprechend typisierte `figure(...)` Elemente erfasst. Eine nackte `image(...)` oder `table(...)` ohne umschließendes `figure(...)` erzeugt keinen solchen Verzeichniseintrag. Das Tabellenbeispiel oben ist bereits entsprechend aufgebaut.

Auch Abbildungen im Anhang können im Abbildungsverzeichnis erscheinen: Der aktuelle Filter schließt sie nicht aus. Kontrolliere Reihenfolge, Beschriftungen und Seitenzahlen in der fertigen PDF.

Das Abkürzungsverzeichnis wird dagegen manuell gepflegt.

### Fußnoten und Seitenumbrüche

```typst
Ein Satz mit ergänzender Anmerkung.#footnote[Text der Fußnote.]

#pagebreak()
```

Setze manuelle Seitenumbrüche sparsam ein. Nutze keine wiederholten Leerzeilen, um Inhalte auf eine bestimmte Seite zu verschieben.

## PDF erstellen

### Einmalig kompilieren

Führe den Befehl im Projektordner aus:

```sh
typst compile --font-path fonts main.typ main.pdf
```

### Bei Änderungen automatisch kompilieren

```sh
typst watch --font-path fonts main.typ main.pdf
```

Beende die Überwachung mit `Strg + C`.

### PDF aus dem Editor exportieren

Nutze den PDF Export von Tinymist. Ob bei jedem Speichern automatisch eine PDF geschrieben wird, hängt von der Exportkonfiguration ab. Eine aktualisierte Live Vorschau ist nicht automatisch der Nachweis, dass auch die PDF Datei auf dem Datenträger aktuell ist.

Öffne vor der Abgabe die tatsächlich erzeugte `main.pdf` in einem separaten PDF Betrachter.

## Fehlerbehebung

### `typst` wird im Terminal nicht gefunden

- Öffne nach der Installation ein neues Terminal.
- Prüfe, ob die Installation erfolgreich war.
- Kontrolliere, ob der Ordner mit dem ausführbaren Programm in `PATH` enthalten ist.
- Beachte: Eine funktionierende Tinymist Vorschau belegt nicht, dass eine separate Typst CLI installiert ist.

### Die Vorschau bleibt leer

- Öffne den vollständigen Projektordner.
- Starte die Vorschau für `main.typ`, nicht versehentlich für eine Kapiteldatei.
- Prüfe die erste Fehlermeldung in der Problemansicht.
- Kontrolliere Dateipfade, importierte Dateien und Schriftarten.
- Prüfe, ob mehrere Typst Erweiterungen gleichzeitig aktiv sind.

### Schriftarten fehlen oder das Layout sieht anders aus

- Prüfe die im Vorlagencode angeforderten Schriftfamilien.
- Kontrolliere mit `typst fonts --font-path fonts`, welche Schriften die CLI findet.
- Vergleiche die Schriftverfügbarkeit in Tinymist und CLI.
- Vergleiche die verwendeten Compilerstände.

### Abbildungen oder Kapitel werden nicht gefunden

- Prüfe Schreibweise und Dateiendung.
- Achte insbesondere unter Linux auf Groß- und Kleinschreibung.
- Verwende relative Pfade innerhalb des Projekts.
- Prüfe bei verschobenen Dateien auch die zugehörigen Verweise.

### Literaturverweise funktionieren nicht

- Stimmen Zitierschlüssel im Text und in `literature.bib` überein?
- Ist die BibTeX Syntax vollständig, insbesondere bei Klammern und Kommata?
- Wird die richtige Literaturdatei eingebunden?
- Ist das Literaturverzeichnis bereits durch die Vorlage vorhanden?

### Vorschau und exportierte PDF unterscheiden sich

- Speichere alle geänderten Dateien.
- Exportiere die PDF erneut.
- Prüfe, ob du die richtige PDF Datei geöffnet hast.
- Vergleiche Compilerstände, Schriftpfade und Einstiegspunkt von Editor und CLI.

## Checkliste vor der Abgabe

- [ ] Persönliche Angaben und Titel sind vollständig und korrekt.
- [ ] Alle Beispieltexte und Platzhalter wurden entfernt.
- [ ] Gestaltung und Zitierstil entsprechen den vereinbarten Vorgaben.
- [ ] Ausgabedatum und Abgabedatum sind korrekt eingetragen.
- [ ] Sperrvermerk und KI Angaben wurden auf Erforderlichkeit und Richtigkeit geprüft.
- [ ] Alle benötigten Verzeichnisse sind vorhanden und nicht doppelt eingebunden.
- [ ] Abbildungen und Tabellen haben passende Beschriftungen und Quellenangaben.
- [ ] Literaturverweise und Querverweise werden korrekt aufgelöst.
- [ ] Seitennummerierung und Seitenumbrüche wurden geprüft.
- [ ] Anhang und erforderliche Erklärungen sind enthalten und inhaltlich abgestimmt.
- [ ] Die PDF wurde nach der letzten Änderung neu erstellt und separat geöffnet.
- [ ] Dateiname, Dateiformat und weitere Abgabebedingungen sind erfüllt.
- [ ] Eine Sicherung des vollständigen Projekts ist vorhanden.

## Fehler melden und Verbesserungen beitragen

Nutze die Issues dieses Repositorys für reproduzierbare Fehler und konkrete Verbesserungsvorschläge. Gib möglichst Folgendes an:

- Betriebssystem
- Typst CLI Version, falls verwendet
- Editor und Tinymist Version
- vollständige Fehlermeldung
- betroffene Datei beziehungsweise ein möglichst kleines Beispiel
- erwartetes und tatsächliches Verhalten

Veröffentliche keine vertraulichen Inhalte deiner Abschlussarbeit, personenbezogenen Angaben oder internen Unternehmensdaten. Ein anonymisiertes Minimalbeispiel reicht meistens aus.

## Weiterführende Dokumentation

- [Typst Tutorial](https://typst.app/docs/tutorial/)
- [Typst Syntaxreferenz](https://typst.app/docs/reference/syntax/)
- [Typst Installation und CLI](https://github.com/typst/typst#installation)
- [Typst Veröffentlichungen](https://github.com/typst/typst/releases)
- [Tinymist Dokumentation](https://myriad-dreamin.github.io/tinymist/)
- [Tinymist Veröffentlichungen](https://github.com/Myriad-Dreamin/tinymist/releases)

Die offiziellen Dokumentationen erläutern die allgemeinen Typst und Tinymist Funktionen. Die konkreten Einstellungen dieser Vorlage ergeben sich aus `main.typ` und `template.typ`.
