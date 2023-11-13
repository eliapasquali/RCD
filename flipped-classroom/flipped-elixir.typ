// 1) Pick a concurrent programming language that they like or know best and refresh their understanding of the principal concurrency features in that language;
// 2) Study and understand the definition and implications of scalability provided in sections 1-2 of this document (pages 1-12 of resource #4 attached to lecture #4 in the course schedule);
// 3) Reflect on whether and how (selected) concurrency features in the chosen language appear to be scalable according to the definition understood at point 2;
// 4) Report their findings in a short presentation of maximum 4 minutes in duration that shall:
//      - outline the understood definition of scalability (1 slide);
//      - introduce the concurrency feature(s) studied for this work (1 slide);
//      - state and motivate the proposed verdict on the scalability of the studied concurrency feature (1 slide).

#import "@preview/polylux:0.3.1": *
#import "unipd.typ": *

#show: unipd-theme.with(
  author: "Elia Pasquali",
  title: "Elixir concurrency model",
  date: "06/11/2023"
)

#set text(font: (
  "Noto Sans",
  "Segoe UI",
  "roboto",
  "Helvetica Neue",
  "Cantarell",
  "sans-serif",
))

#title-slide(
  title: "Elixir concurrency model",
  subtitle: [ Flipped classroom \ Runtimes for Concurrency and Distribution ],
)

// #centered-slide(
//   title: "Outline" 
// )[
//   #polylux-outline()
// ]

#slide(
  title: "Definition of scalability",
  new-section: "Scalability"
)[
  Scalability is the ability of a system to handle a workload that can change during time, managing its resources by applying cost-effective strategies for extending system's capabilities.

  A scalable system should:
  
  - guarantee no performance loss when _demand_ (users) or _complexity_ (nodes) increases.
  
  - when the system is distributed the _state should remain consistent_ and identical between nodes at all times.
  
  - be _easy to operate_ on for humans at any size of it.
]

#slide(
  title: "Elixir and its concurrency",
  new-section: "Elixir model"
)[
  #side-by-side(columns: (1fr, 1fr),
    [
      *Language characteristics*

      - Functional approach 
      
      - Concurrent and scalable

      - Erlang compatible (runs on BEAM, the Erlang VM)

      #align(
        bottom + left,
        image("images/elixir-logo.svg", height: 40% )
      )
    ],
    [
      *Concurrency feature*

      - Actor model:
        - _Shared nothing concurrent programming_
        - Message passing

      - Lightweight processes
        - Not OS threads

      - Fault tolerant:
        - _"Let is crash"_ philosophy

      - `Agents` and `Tasks` for particular operation
    ]
  )
]

#slide(
  title: "Is it a good model?",
  new-section: "Conclusion"
)[
  - *Performance*: lightweight processes, hundreds of thousands concurrently use all machine resources efficiently (_vertical scaling_)

  - *Cost*: _spawning_ new processes is an easy and low cost operation

  - *Operability*: the system will "regulate" itselft on certain events. This is achieved with fault tolerance and message passing

  - *Usability*: since it is based on the Erlang VM, serving an amount of user that could shrink and grow in any moment its not a problem

  - *Replica consistency*: messagge passing and the functional approach the shared state is minimized
]































// #slide(
//   title: "Is this model good?",
//   new-section: "Conclusion"
// )[
//   1. _Scalability is the ability to handle increased workload (without adding resources to a system)_
//   It spawns new Elixir's process based on the quantity of the requests at a fixed moment

//   2. _Scalability is the ability to handle increased workload by repeatedly applying a cost-effective strategy for extending a system's capacity._
//   Using threads lighter than OS processes is it possible to continue spawning them without caring about resource (withing certain limits)
// ]
