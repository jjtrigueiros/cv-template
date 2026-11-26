#let accent = rgb("#45818e")
#let muted = rgb("#666666")
#let rule-color = rgb("#b7b7b7")
#let font = "TeX Gyre Heros"

#let _icon-files = (
  linkedin: "icons/linkedin.svg",
  github: "icons/github.svg",
  mail: "icons/mail.svg",
  location: "icons/map-pin.svg",
)

#let icon(name) = box(
  baseline: 15%,
  image(
    bytes(
      read(_icon-files.at(name))
        .replace("currentColor", muted.to-hex())
        .replace("stroke-width=\"2\"", "stroke-width=\"1.6\""),
    ),
    format: "svg",
    height: 1.05em,
  ),
)

// Main page layout
#let cv(
  name: "",
  contacts: (),
  body,
) = {
  set document(title: name + " – CV", author: name)
  set page(paper: "a4", margin: (x: 1.4cm, top: 1.4cm, bottom: 1.2cm))
  set text(font: font, size: 9.5pt, lang: "en")
  set par(leading: 0.68em, spacing: 0.68em)
  set list(
    marker: box(height: 0.65em, align(horizon, square(size: 0.28em, fill: black))),
    indent: 0.4em,
    body-indent: 1.4em,
    spacing: 0.68em,
  )

  show heading.where(level: 1): it => block(above: 1.7em, below: 1.1em)[
    #text(size: 11.5pt, weight: "bold", fill: accent, it.body)
    #v(-0.55em)
    #line(length: 100%, stroke: 0.6pt + rule-color)
  ]

  text(size: 21pt, weight: "bold", upper(name))
  v(0.5em)
  text(size: 11pt, fill: muted, contacts.join([ | ]))
  v(-0.3em)

  body
}

// A contact item for the header
#let contact(icon-name, label, url: none) = {
  icon(icon-name)
  h(0.25em)
  if url != none { link(url, underline(label)) } else { label }
}

// A dated entry, meant to be followed by bullet points
#let entry(
  title: "",
  org: "",
  date: "",
  body,
) = block(above: 2.1em, breakable: false)[
  #text(size: 10pt)[*#title* | #org #h(1fr) #date]
  #v(0.35em)
  #body
]

// Bold suffix for a bullet, e.g. `- Maintained a project #stack[Python, SQL]`.
#let stack(items) = [ – *#items*]
