// =====================================================================


// --- 1. Globales Styling ---
#let clean_style(body) = {
  set page(
    paper: "a4",
    margin: (
      top: 3.5cm, 
      bottom: 3.0cm, 
      left: 3.5cm, 
      right: 5.0cm
    ),
    header: context {
      let after = query(selector(heading.where(level: 1)).after(here()))
      let before = query(selector(heading.where(level: 1)).before(here()))
      let current-heading = none
      
      if after.len() > 0 and after.first().location().page() == here().page() {
         current-heading = after.first()
      } else if before.len() > 0 {
         current-heading = before.last()
      }

      if current-heading != none {
        set text(size: 9pt, weight: "regular") 
        align(right, smallcaps(current-heading.body)) 
        v(-8pt)
        line(length: 100%, stroke: 0.5pt + luma(0%))
      }
    },
    footer: context {
      if page.numbering != none {
        align(center, counter(page).display(page.numbering))
      }
    },
  )
  
  set text(font: "Arial", size: 11pt, lang: "de", hyphenate: true)
  set heading(numbering: "1.1")
  show heading: set text(font: "Arial", weight: "bold", fill: luma(0%))
  show heading: set block(above: 1.5em, below: 1em)
  
  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )
  
    show figure.caption: set text(size: 9pt)

  // Design für Kapitelüberschriften (Level 1)
  show heading.where(level: 1): it => [
    #pagebreak(weak: true)
    #v(2em)
    #text(1.3em)[
      #context {
        if it.numbering != none {
          let num = counter(heading).display(it.numbering)
          grid(
            columns: (auto, 1fr),
            column-gutter: 0.5em,
            row-gutter: 1em,
            num,
            it.body
          )
        } else {
          it.body
        }
      }
    ]
    #v(1em)
  ]
  
  set par(leading: 0.65em, justify: true)
  body
}


// =====================================================================


// --- 2. Deckblatt ---
#let deckblatt(
  thema: "",
  art_der_arbeit: "",
  studiengang: "",
  autor_name: "",
  matrikelnummer: "",
  betreuer1: "",
  betreuer2: none, 
  ausgabedatum: none,
  abgabedatum: datetime.today(),
  logo: none, 
) = {
  set page(numbering: none, header: none)
  set text(font: "Arial")

  align(center)[
    #if logo != none {
      set image(width: 8cm) 
      logo
    } else {
      v(2cm)
      text(2em, weight: "bold", fill: luma(34.9%))[LOGO PLATZHALTER]
    }
    #v(0.5em)
    #text(size: 0.9em, fill: luma(21.57%), tracking: 0.5pt)[
      Institut für Duale Studiengänge
    ]
  ]

  v(2.5cm)

  align(center)[
    #text(weight: "bold")[
      #art_der_arbeit \
      Studiengang #studiengang
    ]
    
    #v(2cm)
    
    #block(width: 85%)[
      #text(1.4em, weight: "bold")[#thema]
    ]
  ]

  v(3cm)

  let label(content) = text(weight: "regular")[#content]
  let val(content) = text(fill: black)[#content] 

  pad(left: 1cm, right: 1cm)[
    #grid(
      columns: (4.5cm, 1fr),
      row-gutter: 1em,
      
      label[ErstprüferIn:], val[#betreuer1],
      label[ZweitprüferIn:], val[#if betreuer2 != none { betreuer2 } else { text(style: "italic", fill: luma(150))[entfällt] }],

      grid.cell(colspan: 2, v(1em)),

      label[Name:], val[#autor_name],
      label[Matrikelnummer:], val[#matrikelnummer],

      grid.cell(colspan: 2, v(1em)),

      label[Ausgabedatum:], val[#if ausgabedatum != none { ausgabedatum.display("[day].[month].[year]") } else { text(style: "italic", fill: luma(150))[nicht angegeben] }],
      label[Abgabedatum:], val[#abgabedatum.display("[day].[month].[year]")],
    )
  ]
}


// =====================================================================