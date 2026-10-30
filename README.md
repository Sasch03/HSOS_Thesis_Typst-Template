# Typst Vorlage für Abschlussarbeiten – HS Osnabrück (MKT)

Diese Vorlage richtet sich an Studierende der Fakultät **Management, Kultur und Technik (MKT)** der Hochschule Osnabrück, die ihre Bachelorarbeit, Masterarbeit oder wissenschaftliche Ausarbeitung mit Typst schreiben möchten.

Eine vorgebaute Vorschau-Datei (`main.pdf`) liegt diesem Repository bereits bei, damit du dir das fertige Ergebnis direkt auf GitHub anschauen kannst.

> **Wichtig:** Die Vorlage dient als Orientierungshilfe. Prüfe vor Abgabe stets die konkreten formellen Vorgaben deines Studiengangs und deiner Prüfenden (z. B. Zitierstil, Deckblattangaben, Sperrvermerk).

---

## Inhalt

* [Schnellstart](#schnellstart)
* [Implementierte Formatierungsmaßstäbe](#implementierte-formatierungsmaßstäbe)
* [Installation von Typst (Windows & Linux)](#installation-von-typst-windows--linux)
* [PDF Erstellung über Terminal / CMD](#pdf-erstellung-über-terminal--cmd)
* [Projektstruktur & Konfiguration](#projektstruktur--konfiguration)
* [Support & Issues](#support--issues)
* [Weiterführende Dokumentation](#weiterführende-dokumentation)

---

## Schnellstart

1. Schau dir optional die beiliegende `main.pdf` im Repository an, um das finale Layout zu prüfen.
2. Installiere **VS Code** (oder VSCodium) und die Erweiterung **Tinymist Typst** (*myriad-dreamin*).
3. Lade dieses Repository herunter (oder klone es via `git clone`) und öffne den **gesamten Projektordner** im Editor.
4. Öffne `main.typ` und starte die Live-Vorschau von Tinymist (`Strg + Umschalt + P` → Tinymist Preview).
5. Ersetze die Beispieldaten auf dem Deckblatt und schreibe deine Arbeit in `main.typ` oder ausgelagerten Kapiteln.

---

## Implementierte Formatierungsmaßstäbe

Die Vorlage setzt folgende formelle Vorgaben und Standard-Layouts um:

| Parameter | Umgesetzter Standard | Anmerkung / Typst-Code |
| :--- | :--- | :--- |
| **Papierformat** | DIN A4 | `paper: "a4"` |
| **Seitenränder** | Oben: 3,5 cm \| Unten: 3,0 cm <br> Links: 3,5 cm \| Rechts: 5,0 cm | Bietet rechts genug Platz für Korrekturanmerkungen der Prüfenden. |
| **Schriftart & -größe** | Arial, 11 pt | Modernes, gut lesbares Serifless-Layout. |
| **Sprache & Trennung** | Deutsch (`lang: "de"`), Silbentrennung aktiv | `hyphenate: true` |
| **Zeilenabstand** | Erhöht (`leading: 0.65em`) | Entspricht optisch ca. 1,5-fachem Zeilenabstand. |
| **Absatzformat** | Blocksatz (`justify: true`) | Saubere Satzkanten im Hauptteil. |
| **Kapitelüberschriften** | Nummeriert (`1.1`), Fett, Schwarz | Hauptkapitel (Ebene 1) beginnen automatisch auf einer neuen Seite. |
| **Kopfzeile** | Dynamische Kapitelbezeichnung + Trennlinie | Zeigt stets die aktuelle Ebene-1-Überschrift an (rechtsbündig, 9 pt). |
| **Fußzeile** | Seitenzahlen zentriert | Arabische Seitenzahlen ab dem Hauptteil (Zählerreset auf S. 1). |
| **Zitierstil** | APA-Stil (`style: "apa"`) | Über `literature.bib` eingebunden. |
| **Verzeichnisse** | Inhalts-, Abbildungs- & Tabellenverzeichnis | Werden automatisch aus `#figure(...)`-Elementen generiert. |
| **Code-Blöcke** | Grauer Hintergrund (`luma(245)`), abgerundet | Syntax-Highlighting für Programmiercode und Konfigurationen. |

---

## Installation von Typst (Windows & Linux)

Damit du Typst über die Kommandozeile (Eingabeaufforderung / Terminal) nutzen kannst:

### Windows

```powershell
winget install --id Typst.Typst --exact
```

### Linux

* **Arch Linux:** `sudo pacman -S typst`
* **Nix:** `nix-shell -p typst`
* **Cargo (Rust):** `cargo install --locked typst-cli`

Prüfe die Installation im Terminal mit: `typst --version`

---

## PDF erstellen

### 1. Über die Typst CLI (Terminal / Eingabeaufforderung)

Für die Verwendung unter Windows und Linux kann Typst separat als Command-Line-Tool installiert werden.

Öffne eine Eingabeaufforderung (`cmd` unter Windows) oder ein Terminal direkt im Projektverzeichnis und führe folgenden Befehl aus:

```sh
typst compile main.typ main.pdf
```

Möchtest du, dass die PDF bei jeder gespeicherten Änderung im Hintergrund automatisch neu gebaut wird, nutze:

```sh
typst watch main.typ main.pdf
```

### 2. PDF aus dem Editor exportieren (VS Code / Tinymist)

Nutze alternativ den integrierten PDF-Export von Tinymist im Editor. 

> **Tipp:** Eine vorgebaute und beispielhafte `main.pdf` ist bereits im Projektverzeichnis vorhanden. Öffne die final erzeugte PDF vor der Abgabe immer in einem separaten PDF-Viewer, um Seitenumbrüche, Verzeichnisse und Formatierungen zu prüfen.

---

## Projektstruktur & Konfiguration

| Datei / Ordner | Zweck & Funktion |
| :--- | :--- |
| **`main.pdf`** | Vorgebaute Vorschau-PDF zur direkten Ansicht auf GitHub. |
| **`main.typ`** | Einstiegspunkt deiner Arbeit (Metadaten, Deckblatt, Kapitel, Erklärungen). |
| **`template.typ`** | Layout-Logik (Ränder, Kopfzeilen, Nummerierungen). *Ggf. unangetastet lassen.* |
| **`literature.bib`** | BibTeX-Datei für all deine Quellen und Literaturangaben. |
| **`pictures/`** | Ordner für Grafiken, Logos und Abbildungen. |
| **`fonts/`** | Lokale Schriftdateien für das Projekt. |

### Deckblatt anpassen

In `main.typ` kannst du das Deckblatt direkt über die Funktion `deckblatt(...)` konfigurieren:

```typst
#deckblatt(
  thema: "Titel deiner Bachelorarbeit",
  art_der_arbeit: "Bachelorarbeit",
  studiengang: "Wirtschaftsinformatik",
  autor_name: "Max Mustermann",
  matrikelnummer: "123456",
  betreuer1: "Prof. Dr. Erstprüfer",
  betreuer2: "Prof. Dr. Zweitprüfer",
  ausgabedatum: datetime(year: 2026, month: 10, day: 01),
  abgabedatum: datetime(year: 2027, month: 01, day: 15),
  logo: image("pictures/logo_hsos.svg", width: 9cm),
)
```

---

## Support & Issues

Hast du Darstellungsfehler gefunden, fehlen dir Funktionen oder hast du **Anregungen zur Verbesserung der Thesis-Vorlage**?

> **Bitte öffne direkt hier auf GitHub ein Issue**, damit wir die Vorlage für alle Studierenden der HS Osnabrück kontinuierlich verbessern können!

---

## Weiterführende Dokumentation

Für tiefergehende Formatierungen (komplexe Tabellen, mathematische Formeln, spezielle Ausrichtungen) schau in die offizielle Typst-Dokumentation:

* [Offizielle Typst Dokumentation](https://typst.app/docs/) – Vollständige Referenz aller Befehle.
* [Typst Tutorial](https://typst.app/docs/tutorial/) – Schritt-für-Schritt-Guide für wissenschaftliches Schreiben.
* [Tinymist Dokumentation](https://myriad-dreamin.github.io/tinymist/) – Tipps und Konfigurationen für VS Code.