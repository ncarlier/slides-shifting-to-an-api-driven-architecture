---
title: Shifting to an API-Driven Architecture
css: css/index.css
watch: true
revealOptions:
    transition: 'linear'
---

### >> (ing) to an <br/> **API-Driven** **Architecture**

---

## About us

----

<!-- .slide: class="about" -->

- ![@jefrajames](img/jefrajames.jpg) <!-- .element: class="desaturate" -->
  - **Jean-Francois James**
  - <i class="fa fa-twitter"></i> [@jefrajames](https://twitter.com/jefrajames)
  - <i class="fa fa-pencil"></i> [Worldline engineering Blog](https://blog.worldline.tech)
- ![@ncarlier](img/ncarlier.jpg)
  - **Nicolas Carlier**
  - <i class="fa fa-twitter"></i> [@ncarlier](https://twitter.com/ncarlier)
  - <i class="fa fa-github"></i> [github.com/ncarlier](https://github.com/ncarlier)
  - <i class="fa fa-pencil"></i> [Worldline engineering Blog](https://blog.worldline.tech)

----

<!-- .slide: data-background="img/worldline-bg.jpg" -->

![Worldline](img/worldline-logo.png)

---

<!-- .slide: class="little-prince" -->

## Draw me an API

![little-prince](img/little-prince.png)

Note:

bla bla bla

----

## For which scope?

- Public?
- Private?

----

## For which consumer?

- An human?
- A machine?
- A mobile device?

----

## For what purpose?

- Technical or business?
- Manage resources (CRUD)?
- Trigger actions?
- Publish/subscribe events (Streaming)?

----

<!-- .slide: data-background="img/black-cloud-bg.jpg" class="sauron" -->

## Don't bother me! I want...

![little-prince](img/sauron.png)

> An API to rule them all, one API to find them, One API to bring them all and
> in the darkness bind them.

---

### Select your paradigm

<!-- .slide: class="no-dot" -->

- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Operation
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Resource
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Data

----

### Operation (RPC)

> About apply an operation on something

----

### Operation: Technologies

- RMI (just kidding)
- SOAP (no kidding... almost)
- [gRPC](https://grpc.io/) (based on [Protocol Buffers](https://developers.google.com/protocol-buffers/))
- [Apache Thrift](https://thrift.apache.org/)
- [Apache Avro](http://avro.apache.org)

----

### Operation: Key features

- Highly typed
- Code generation
- Documentation generation
- Efficient/Modular serialization implementation
- Efficient/Modular transport mechanism

----

### Resource

> About resource manipulation

----

### Resource: Technologies

- REST (representational state transfer)
- REST SOUP (basically SOAP with JSON)

----

### Resource: Key features

- Web friendly
- Human readable
- Cacheability
- Uniform interface

----

### Data

> About structured data manipulation

----

### Data: Technolog~~ies~~y

<!-- .slide: class="no-dot" -->

- ![GraphQL](img/graphql-logo.svg)
- [GraphQL](http://graphql.org/) by Facebook

----

### Data: Key features

- "It's Graphs All the Way Down"
- Query and Mutation
- Client friendly

---

### Select your data protocol

<!-- .slide: class="no-dot" -->

- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Human friendly
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Machine friendly

----

### Human friendly

Textual data protocol:

- &lt;XML/&gt;
- {JSON}

----

### Textual protocol (JSON)

- Easy to read/debug/trace...
- Ideal for web apps

- Still performant... **but**:
  - Weakly typed (without schema)
  - Heavy bandwidth (without compression)
  - Heavy memory footprint (at scale)

----

### Machine friendly

Binary data protocol:

- [Protobuf](https://developers.google.com/protocol-buffers/)
- [Apache Avro](https://avro.apache.org/)
- [MessagePack](https://msgpack.org/): *"It's like JSON but fast and small."*

----

### Binary protocol

- Very efficient (bandwidth, CPU, memory)
- Safe (Highly typed, structured)
- Ideal for... machines
- **But** Hard to read/debug

---

### Select your access control:

<!-- .slide: class="no-dot" -->

- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Free 2 play
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> API key
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Token based
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> x509

----

## Free 2 Play

- but restricted
- rate limiting
- IP restriction
- ...

----

## API Key

- clever for some needs
- Basic auth

----

## Token based

- OAuth2
- OpenID Connect
- Macaroon


---

## Select your documentation:

<!-- .slide: class="no-dot" -->

- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Auto generated
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Self carried
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Semi-auto generated

----

## Auto generated

- WSDL
- WADL
- Protocol definition

----

## Self carried

- "Affordance"
- HAL / HATEOAS

----

## Semi-auto generated

- RAML
- Swagger
- OpenAPI

----

## **But**, this is not enough!

> Most of the time, you have to provide a clean and human readable **online**
> documentation.

---

## Select your tooling:

<!-- .slide: class="no-dot" -->

- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> API management
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> IAM
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Service registry

----

## What is API management

- API gateway (AuthN/AuthZ/Trafic control/Routing/Logging/Analytics/Monitoring/Transformation)
- Analytic platform (TSDB/RT Monitoring)
- Development portal (CMS, Clinet registration)
- Facade API (aggregation/composition/transformation/micro routing)

----

## What is NOT API management

- API beautyfier/performer
- API translator
- About business logic
- Firewall

----

## Here come the  competitors

<!-- .slide: class="no-dot logos" -->

- ![APIGee](img/apigee-logo.svg)
- ![Tyk.io](img/tyk-logo.svg)
- ![Kong](img/kong-logo.png)
- ![Netflix Zuul](img/zuul-logo.svg)

---

## Select your API architecture:

<!-- .slide: class="no-dot" -->

- <i class="fa fa-check-square-o"></i> Like Gandalf (Wisely)
- <i class="fa fa-square-o"></i> Like Sauron

# Thanks!


