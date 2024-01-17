#let thesis(
  title: none,
  author: none,
  dept: none,
  year: none,
  month: none,
  day: none,
  committee: (),
  dedication: none,
  acknowledgement: [],
  abstract: [],
  doc,
) = {
  set text(font: "Linux Libertine", size: 12pt)
  show par: set block(spacing: 1.5em)
  set par(leading: 1.5em, first-line-indent: 1em)
  set page(numbering: "i", margin: (x: 1in, y: 1in), 
    paper: "us-letter",
    footer: locate(loc => {
      if counter(page).at(loc).first() > 1 [
        #align(center)[#counter(page).display("i")]
      ]
    })
  )
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }
  show math.equation: it => {
    if it.has("label") {
      math.equation(block: true,
        numbering: it1 => {
          locate(loc => {
            let count = counter(heading.where(level: 1)).at(loc).last()
            numbering("(1.1)", count, it1)
          })
        }, it)
    }
    else {
      it
    }
  }
  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      link(el.location(),
        locate(loc => {
          let count = counter(heading.where(level: 1)).at(loc).last()
          numbering("(1.1)", count, counter(math.equation).at(el.location()).at(0) + 1)
        })
      )
    }
    else {
      it
    }
  }

  grid(
    columns: (1fr),
    rows: (1fr, 1fr, 1fr),
    align(center + horizon, text(16pt)[#smallcaps([#title])]),
    align(center + horizon)[#author],
    align(center + horizon)[Submitted to the Faculty of the Gradute School \ in partial fulfillment of the requirements \ for the degree \ Doctor of Philosophy \ in the Department of #dept, \ Indiana University \ #month #year],
  )

  pagebreak()

  align(center)[Accepted by the Graduate Faculty, Indiana University, in partial fulfillment of the requirements for the degree of Doctor of Philosophy.]

  v(2em)

  [Doctoral Committee]

  v(3em)

  for member in committee {
    [
      #align(right)[#line(length: 50%, stroke: 0.5pt)]
      #v(-0.75em)
      #align(right)[#member.name, #member.title]
      #v(3em)
    ]
  }

  v(1fr)

  align(left)[#day #month #year]

  pagebreak()

  align(center + horizon)[Copyright \u{00a9} #year \ #author]

  pagebreak()

  if dedication != none {
    sym.zws
    v(-2em)
  
    align(center + horizon)[#emph[#dedication]]

    pagebreak()
  }
  
  text(15pt)[#align(center)[
    *Acknowlegements*
  ]]
  
  v(1em)
  
  [#acknowledgement]
  
  pagebreak()
  
  align(center)[#author]
  
  v(1em)
  
  align(center, text(16pt)[#smallcaps([#title])])
  
  v(1em)
  
  [#abstract]
  
  pagebreak()

  show outline: set par(leading: 0.65em)

  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    it
  }
  
  outline(indent: auto)

  pagebreak()

  outline(target: figure.where(kind: image), 
    indent: auto,
    title: [List of Figures]
  )
  
  pagebreak()
  
  outline(target: figure.where(kind: table), 
    indent: auto,
    title: [List of Tables]
  )
  
  pagebreak()

  set page(numbering: "1", 
    footer: align(center)[#counter(page).display("1")]
  )
  set heading(numbering: "1.1.1.")
  show heading: it => [
    #v(12pt)
    #it
    #v(12pt)
  ]

  show heading.where(level: 1): it => {
    set par(leading: 0.65em)
    pagebreak(weak: true)
    align(center)[Chapter 
      #locate(loc => counter(heading).at(loc).first())\
      #it.body
      #v(12pt)
    ]
  }
 
  doc
}

#let iuquote(body) = {
  set par(leading: 0.65em)
  pad(x: 30pt, y: 15pt, body)
}
