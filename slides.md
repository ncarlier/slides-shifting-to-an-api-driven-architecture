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

In this presentation, we’re going to talk about API design, Web API design and how it relates to software architecture.
Because designing an API must be thought of carefully. It is highly visible, exposed to the outside and acts as a contract between you and your users. If you want it to be successful and to last, it must be carefully designed upfront with backward compatibility in mind.

Let’s start with this wonderful story “Le petit prince” from Antoine de Saint Exupery. We propose to  change a little the story line, today is the API Day and the “Petit prince” doesn’t want us to draw a sheep but anAPI, if possible a beautiful API.
So what are the guiding questions to draw a beautiful API?

----

## For which scope?

- Public?
- Private?

Note:

First of all, what is the scope of my API? 
- Is it a public one: open to everybody on the Web? With people not registered in advance
- Conversely, is it a private one: dedicated to a well-known population, inside a defined organization, with direct control over the context.
This question relates to security and versioning strategy.

----

## For which consumer?

- An human?
- A machine?
- A thing?

Note:

I must design my API for my clients, the consumers not for me.
So who are they:
- human-beings requiring a lot flexibility in terms of interaction and dialog
- Machines following a well-defined protocol
- a thing, Mobile Apps requiring a lot flexibility in terms of data access
This question relates to the protocol, the data format.

----

## For what purpose?

- Technical or business?
- Manage resources (CRUD)?
- Trigger actions?
- Publish/subscribe events (Streaming)?
- ...

Note:

Now that I know them, I must ask my users, what they want to do with the AP, what are there expecations:
- Which kind of exchange? Technical-oriented (exchanging raw-data) or business-oriented (with well-defined  use cases)?
- Is it about doing CRUD (Create Read Update Delete) operations on business entities (called resources in the API jargon)?
- Is it to trigger actions on a server or on actuators?
- Is it event-based with publication and subscription mechanisms?
This question relates to the paradigm of the API.


----

<!-- .slide: data-background="img/black-cloud-bg.jpg" class="sauron" -->

## Don't bother me! I want...

![little-prince](img/sauron.png)

> An API to rule them all, one API to find them, One API to bring them all and
> in the darkness bind them.

Note:

Not all API architectures are built in the same way.
Functional Requirements AND non-functional requirements have a strong impact on
your design.
In this presentation, we will try to give you a brief overview of concepts and
tools useful to build an API oriented architecture adapted to your requirements.

---

<!-- .slide: class="no-dot section" -->

![Paradigm](img/paradigm.svg)

### Select your **paradigm**

- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Operation
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Resource
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Data
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Function

Note:

Let's choose our first concept: the paradigm. Are we concerned by a model based
on operation, resource, data or function?

----

### Operation

> About apply an operation on something

Note:

It's...
Basically, you call a remote procedure. You get the point, we're talking about
RPC in a more technical way.

----

### Operation (RPC): Technologies

- RMI (just kidding)
- SOAP (no kidding... almost)
- [gRPC](https://grpc.io/) (based on [Protocol Buffers](https://developers.google.com/protocol-buffers/))
- [Apache Thrift](https://thrift.apache.org/)
- [Apache Avro](http://avro.apache.org)
- [TChannel](https://github.com/uber/tchannel)...

Note:

The technologies around the operational model are undoubtedly the oldest and
therefore the most mastered.
We are talking about...

SOAP is still widely used. Although not particularly appreciated because of its
verbosity and its old fashion tooling, SOAP is still today a reliable and well
known service contract between two industrial actors.

But in IT, performance and efficiency matter. This is why alternatives have
emerged to bring significant gains on these aspects.

We can find...
We still have a service contract, but less verbose and using much more efficient
underlying technology: like structured data, binary protocols.

For the record, gRPC is widely used by google's internal services. Thrift is
used by high performant products like Cassandra. And Uber created his own open
protocol for his internals: TChannel.

----

### Operation: Key features

- Highly typed
- Code generation
- Documentation generation
- Efficient/Modular serialization implementation
- Efficient/Modular transport mechanism

Note:

Here the key features of the operational model:
This is highly typed, therefore you reduce errors and facilitate tooling such as
code and documentation generators.
Resource usage is a first class concern. Therefore data serialization and data
transport are efficient.

----

### Resource

> About resource manipulation

Note:

Another well known paradigm is the resource manipulation.
This was mainly brought by REST....

----

### Resource: Technologies

- RESTful (representational state transfer): structured access to resources
- RESTAwful SOUP (basically SOAP with JSON): less structured

<!-- .element: class="more" --> [OCTO refcard](https://blog.octo.com/strategie-d-architecture-api/)

Note:

REST is mostly an "architectural style" built upon Web technologies.
It's a structured access to resources.

A less structured design commonly used is to mix the operational and resource
models.
In a lack of a decent recipe, you will get a REST SOUP that is awful (from a
code and usage point of view).
We will get back to it in a moment.

----

### Resource: Key features

- Web friendly
- Human readable
- Uniform interface

Note:

Resource model have those key features:
It's Web friendly because build on top of web technologies. Therefore you inherit
some powerful features like cache management, security, routing, etc.
Most of the time JSON is used as data protocol. Therefor it is human readable
and as a result easy to debug or understand.
It's an uniform interface that simplifies and decouples the architecture,
which enables parts to evolve independently.

----

### Quick FOCUS on REST  (1/2)

- It is an **architecture style** for network-based Software specified by [Dr. Roy Fielding in 2000](http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm)
- Mostly about stateless servers and structured access to resource (business entities)

Note:

REST has become the most popular choice for API development. It stands for “representational state transfer,” and is basically an architecture style for network-based software specified by Dr. Roy Fielding in 2000.
His dissertation is about 160 pages long, it is not that easy to read and many people haven’t done it have their own idea of what REST is, often leading to confusion and disagreement.
To make a long story short, REST is mostly about stateless servers and structured access to resources. Typically a resource is a business entity from the domain you’re working on:
- It can be a ticket in a reservation system,
- Or an invoice in a billing system.
Clients and servers exchange the states of these resources using a representation such as JSON.
These representations are then potentially modifiable, with actions and relationships discoverable via hypermedia. Hypermedia is fundamental to REST, and is just the concept of providing links to other resources. REST is designed to be hypermedia driven

----

### Quick FOCUS on REST  (2/2)

Based on **6 big principles**:

- Client/Server
- Stateless
- Cache
- Uniform interface
- Layered system
- Code on demand (optional)

Note:

Here are the 6 constraints or principles that fundamentally define a REST-architecture style.
- Client-server client and server applications MUST be able to evolve separately without any dependency on each other.
- Stateless: REST APIs are stateless. Each call contains all of the data necessary to process it, including security data.  
- Cache:  more exactly client-cache. Because a stateless API can increase request overhead, a REST API should be designed to encourage the storage of cacheable data. This means that when data is cacheable, the response should indicate that it can be stored up to a certain time (expires-at). 
- Uniform Interface: The key to the client-server decoupling is having a uniform interface that allows independent evolutions of  both. This interface should provide a standardized means of communicating, typically using HTTP with URI resources, CRUD operations (Create, Read, Update, Delete) and JSON. REST doesn’t prescript to use HTTP, but if you do it recommends to utilize HTTP features whenever possible, instead of inventing conventions.
- Layered system: the system can be made of different layers such as FWs, proxies, Load balancers, routers to improve scalability and security. All the client knows is the API, not the different layers.
- Code on demand: is optional. It enables the server to transfer logic to the client. It has not been widely adopted due to security concern.

----

### Data

> About structured data manipulation

Note:

REST is cool but have some drawbacks.
Such as: multiplicity of endpoints, over or under data fetching, some
rigidity...
So let's move on another emerging paradigm: the data manipulation.
This was mainly brought by GraphQL ...

----

### Data: Technolog~~ies~~y

<!-- .slide: class="no-dot" -->

- ![GraphQL](img/graphql-logo.svg)
- [GraphQL](http://graphql.org/) by Facebook

Note:

REST APIs have shown to be too inflexible to keep up with the rapidly changing
requirements of the clients that access them.

GraphQL was created by FB in response of particular concerns:
- the multiplicity of endpoints in relation of the myriad of client apps.
- the over/uder data fetching regarding the true need of the client app

The specification and the Reference Implementation have been developed by Facebook. There are different implementations such as graphql-java.
Let's have a closer look to the technology.

----

### Deep (not so) dive into GraphQL (1/2)

Concepts:

- "It's Graphs All the Way Down"
- Schema definition Language (SDL)
- Fetching relevant data with Query
- Writing data with Mutations
- Realtime updates with subscriptions
- Single endpoint

<!-- .element: class="more" --> [Node tutorial](https://medium.com/@tomlagier/scaffolding-a-rock-solid-graphql-api-b651c2a36438)

Note:

A contract is established between the consumers and the provider in the form of a schema (written in SDL) defining datatypes, queries and mutations.
A single endpoint is able to serve all queries and mutations. 
It delegates the operations to resolvers which are the glue with business logic.
On each request consumers specifies exactly which data they want to get back. This prevents under and over data fetching.

----

### Deep (not so) dive into GraphQL (2/2)

![GraphQL example](img/graphql-query.png)

Note:

This is a typical GraqhQL query. It consists in retrieving data from a given user.
The client provides the userid and the data it wants to get back: the user name, the list of posts and the 3 last followers.
In the answer, we can see the exact needed data. 
A key challenge on the server side is the efficiency of the Data Loading mechanism in place. A naive approach can lead to poor performance and scalability. Batching requests and caching results are recommended as with the FaceBook  DataLoader.

---

<!-- .slide: class="no-dot section" -->

![H vs M](img/human-vs-machine.svg)

### Select your **data protocol**

- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Human friendly
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Machine friendly


Note: n

Move on to our second topic: the selection of the data protocol.
As you can imagine the way you transmit data matter.
Basically you have the choice to be human or machine friendly.
The choice will depends who is your consumer and what are your constraints
regarding bandwidth and performance.

----

### Human friendly

Textual data protocol:

- &lt;XML/&gt;
- YAML:
- {JSON}

Note: n

Textual data protocols are well known and mainly those.
XML is gradually replaced by JSON. More concise and readable.
YAML is even more concise and readable but a little bit harder to parse by
machines.

----

### Textual protocol (JSON)

- Easy to read/debug/trace...
- Ideal for web apps

- Still [performant](http://blog.ippon.fr/2016/09/26/formats-et-methodes-de-serialisation-rest/)... **but**:
  - Weakly typed (without schema)
  - Heavy bandwidth (without compression)
  - Heavy memory footprint (at scale)

Note:

So the key features are: ...
But there are some drawbacks that you should consider..

----

### Machine friendly

Binary data protocol:

- [Protobuf](https://developers.google.com/protocol-buffers/)
- [Apache Avro](https://avro.apache.org/)
- [MessagePack](https://msgpack.org/): *"It's like JSON but fast and small."*
- ...

Note: n

Here we are the alternative: the binary data protocol
These protocols are popular on Android (as with protobuf), for internal
services communication, or for date serialization of well known products
such as Hadoop, Cassandra, Redis, etc..

----

### Binary protocol

- Very efficient (bandwidth, CPU, memory)
- Safe (Highly typed, structured)
- Ideal for... machines and heavy load
- **But** Hard to read/debug

Note:

Binary protocols are undoubtedly very effective in terms of resource
utilization.
They are also reliable to use because they are highly typed and defined by
schemas.
It's a very good choice for machine 2 machine communication and when performance
matter.

BUT, they are difficult to read and debug.
Therefore, it may not be a good idea to use this type of protocol a mainstream
external interface.

---

<!-- .slide: class="no-dot section" -->

![Access Granted](img/access-granted.svg)

### Select your <br/> **access control**:

- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Free 2 play
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> API key
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Token based
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> x509

Note: n

Move on to our next topic: the selection of the access control mechanism.

----

## Free 2 Play

- Public... but restricted:
  - Rate limiting
  - IP restriction
  - Usage monitoring
  - ...

Note:

In other words, no authentication. Public API.
But not having an AuthN mechanism does not mean not setting up some level of
access control.
Such as a rate limiting filter that protects the API from abuse.
An IP ban system for suspicious users.
An appropriate monitoring system showing us the detailed use of our API.
etc.


----

## API Key

- Not very secure... but ideal for some needs
- Good practices:
  - Hashing the key into your datastore
  - Obtains the key with strong AuthN mechanism
  - Use it for a limited scope of the API (reads, non sensitive actions, etc.)
  - With basic-auth over SSL

Note:

API key is a single secret sent to the server as credentials.
It's a very poor way to authenticate someone.
BUT, it's still something common to use in order to facilitate the inegration of
other services. It's very simple to use.
But you have to follow some good practices.

----

## Token based

- [OAuth2](https://tools.ietf.org/html/rfc6749)
  (About AuthZ ... not AuthN)
- [OpenID Connect](http://openid.net/connect)
  (OAuth2 on steroids with AuthN and JWT)
- Macaroon

Note:

A more secure way to access an API is by using token based standard.
A old one is OAuth2. It's supported by almost all API providers.
It's an authorization framework that enables a 3rd-party application to obtain
limited access to an HTTP service.
A more modern protocol is OpeID Connect. To be quick, it's OAuth2 on steroids
with AuthN support and JWT.
Macaroon is...

----

## x509

- For **true sensitive** API...
- ... when hardware is required
- Using software certificate, maybe you should consider tokens.

Note:

x509 is mainly used by industrial, health and banking sector.
Where API are very sensitives.
It requires materials, and additional infrastructure (for PKI).
If not material, please...

---

<!-- .slide: class="no-dot section" -->

![RTFM](img/rtfm.svg)

### Select your **documentation**:


- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Auto generated
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Self carried
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Semi-auto generated

Note: jf

...

----

## Auto generated

- WSDL
- WADL
- Protocol definition

Note: jf

...

----

## Self carried

- "Affordance"
- HAL / HATEOAS

Note: jf

...

----

## Semi-auto generated

- RAML
- Swagger
- OpenAPI

Note:

RAML: stands for RESTful API Modeling Language.  It promotes a top-down spec-driven approach covering the whole lifecycle: design, build, test, document, share. Design can be made in an iterative manner, and be tested and simulated without any development to gather user feedbacks. Once the design is validated, development can start
RAML was released in 2013. Mulesoft has been its main contributor with support from Paypal, CISCO … It was clearly the most consistent and complete approach until a recent date.
Swagger: is the most popular solution. It provides documentation tied directly to the source code. It is very well integrated with frameworks. 
Open API Initiative is managed by the Linux Foundation since 2015. It is based on the Swagger 3.0 specification. In April 2017, Mulesoft, the main sponsor of RAML, has decided to join it. So we can expect a convergence.

----

## **But**, this is not enough!

> Most of the time, you have to provide a clean and human readable **online**
> documentation.

Note: jf

...

---

<!-- .slide: class="no-dot section" -->

![Versions](img/versions.svg)

### Select your <br/> **versioning strategy**:

- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> GET /v2/products
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Accept: application/vnd.myname.v2+json
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> X-API-Version: 2

<!-- .element: class="more" --> [REST versioning](http://www.baeldung.com/rest-versioning)

Note:

Versioning should be consider at the early stage of development.
Even if you don't yet plan an upcoming version.
It's a signal to your consumers that the API will evolve. Therfore they have to
be ready to evolve too.

Versioning APIs is much more subtle than versioning software. Because upgrading an API version just breaks the compatibility and requires significant efforts both on the server and client sides.
It is a necessary evil and is important to plan for.
Version upgrades must be used only for backward-incompatible changes.
In particular, avoid it for:
1.	Addition of resources: consumers can ignore them if they wish
2.	Addition of data in the response: for the same reason
3.	Changed technologies on the server: which be hidden by the uniform interface.

From a technical standpoint, REST versioning can be achieved in 3 different ways, none of them being perfect:
1.	By including the version number in the URI: for instance http://myhost/v1/user. This is the most convenient approach technically speaking but with some drawbacks: large URI footprint, all or nothing approach,
2.	Using a specific HTTP header: such as “api-version”, URIs are preserved, but this approach is not supported by any standard,
3.	Using Content-type: for instant “application/json+v1” (request Accept, response Content-Type), URIs are preserved but custom content types are difficult to manage and test. 
4.	No versioning remains possible for a private API.



Versioning an API needs the ability to have a consistent and stable interface.

Where to put this version? As you want you have the choice.
What's is more important is to offer a stable interface and the ability to
support 2 different version at same moment (please consider feature flipping).

---

<!-- .slide: class="no-dot section" -->

![Tooling](img/tooling.svg)

### Select your tooling:


- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> API management
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> IAM
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> CMS
- <!-- .element: class="fragment" --> <i class="fa fa-square-o"></i> Service registry

Note:

And here we are our last topic. The tooling.
A good API architecture rely on several more or less big tools.
We can find...

----

## About API management...

- API gateway (AuthN/AuthZ/Trafic control/Routing/Logging/Analytics/Monitoring/Transformation)
- Analytic platform (TSDB/RT Monitoring)
- Development portal (CMS, Client registration)
- Facade API (aggregation/composition/transformation/micro routing)

Note:

A rapid focus about API management. It's about...

----

## It's nothing about...

- API beautyfier/performer (don't put lipstick on a pig... don't)
- API translator (SOAP to SOUP)
- About business logic
- Firewall

Note:

And the warnings! Because we many miss usage.
It's not ...

----

## Here come the competitors!

<!-- .slide: class="no-dot logos" -->

- ![APIGee](img/apigee-logo.svg)
- ![Tyk.io](img/tyk-logo.svg)
- ![Kong](img/kong-logo.svg)
- ![Netflix Zuul](img/zuul-logo.svg)

Note:

And we can tell that we have the choice.
A full feature closed solution that also make the coffee.
A full feature open solution that growing.
A limited but efficient open solution.
And a very good Framework in case you want to built your own.

---

## Select your API architecture:

<!-- .slide: class="no-dot" -->

- <i class="fa fa-check-square-o"></i> Like Gandalf (Wisely)
- <i class="fa fa-square-o"></i> Like Sauron

# Thanks!


