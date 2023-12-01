#import "iu_dissertation.typ": thesis, iuquote

#show: doc => thesis(
  title: [Research on the Quantum Theory],
  author: [Louis De Broglie],
  dept: [Physics],
  year: [1925],
  month: [January],
  day: [19],
  committee: (
    (
      name: "Paul Langevin",
      title: "Ph.D."
    ),
  ),
  dedication: none,
  acknowledgement: lorem(100),
  abstract: lorem(100),
  doc
)

= The Phase Wave
#lorem(100)

$ psi(bold(r), t) = 1/(sqrt(2 pi planck.reduce)) e^(-i / planck.reduce p x) $

== The Relation Between Quantum and Relativity Theories
#lorem(100)

#figure(table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: horizon,
    [], [*Area*], [*Parameters*],
    [Cylinder],
    $ pi h (D^2 - d^2) / 4 $,
    [
      $h$: height \
      $D$: outer radius \
      $d$: inner radius
    ],
    [Tetrahedron],
    $ sqrt(2) / 12 a^3 $,
    [$a$: edge length]
  ),
  caption: [My awesome table],
)

== Phase and Group Velocities
#lorem(200)

== Phase Waves in Spacetime
#lorem(200)

= The Principles of Maupertuis and Fermat
#lorem(200)

== Motivation
#lorem(200)

#iuquote[#lorem(100)]
