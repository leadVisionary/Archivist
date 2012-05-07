<h1>Archivist: Abstract Data Manager archetype for the Personify framework</h1> 
<h1>On Archetypes</h1>
<p>An initial prototype for the <strong>Archivist</strong> archetype of the <em>Personify</em> reference model. An archetype is a meta-level pattern encountered in many different applications. Archetypes provide general functionality usually required in various contexts.</p>

<p>For example, applications often store data in databases. Traditionally, this meant Object-Relational Mapping (ORM). Such applications would often use an <a href="http://martinfowler.com/eaaCatalog/activeRecord.html" target="_blank">Active Record</a> (e.g. Ruby on Rails) or a <a href="http://martinfowler.com/eaaCatalog/dataMapper.html" target="_blank">Data Mapper</a> (e.g. Java Hibernate) to manage data persistence to long-term storage.</p> 

<p>Personify manifests this as the <strong>Archivist</strong> archetype.</p> 
<h1>Archivist</h1>
<p>Like an archivist (a historian) in a castle, the <strong>Archivist</strong> archtype personifies the responsibility of storing information into long term storage.</p>

<p>An <strong>Archivist</strong> is responsible for knowing</p> 
- where to store things (An Archive)  
- what to store (A Record)

<p>An <strong>Archivist</strong> provides these basic services:</p>
- Create(data) returns an Record with an id that wraps the data
- Read(id) returns the Record with the specified id, or an empty Record if none found
- Update(id, newData) returns the updated Record if newData validates. May throw a ValidationError if it does not
- Delete(id) returns the removed Record

<h1>Specializations</h1>
<p>A particular type of <strong>Archivist</strong>, for example a MongoDBArchivist, would extend the functionality of the <strong>Archivist</strong> archetype through an application of the <a href="http://addyosmani.com/blog/decorator-pattern/" target="_blank">Decorator pattern</a> and explicitly devise its own Archives and providing their own implemenations.</p>

<p>Archives are recommended to correspond to Data Mappers, encapulating the persistence layer explicitly by exposing CRUD interface and then wiring up the underlying implementation accordingly.</p>

<h1>Source Layout and contents</h1>
<p>The directory content of <strong>Archivist</strong> adheres to the principles of <a href="http://domaindrivendesign.org/" target="_blank">Domain Driven Design</a> by defining a Bounded Context called domain/ by convention. The domain may have separate modules, though it is a guiding principle that components be as minimalistic as possible. Hence, the <strong>Archivist</strong> has one module, archivist/.</p>

<p>Each module has an Aggregate Root, conventionally named for the Module (in this case, Archivist.coffee). The Module contains the standard DDD components of Models and Services. Factories and Repositories are option, though the beta applications in <em>Personify</em> have delegated those responsiblities to other Agents (the <strong>Archivist</strong> is the Repository handler).  The Aggregate root exposes the agents the module provides for external interface. Modules in rzr style are Agents, though they may not always be very smart.</p>

<h1>More on Agent Implementation</h1>
<p>A dumb Agent may function much like an ideal <a href="http://java.sun.com/blueprints/patterns/FrontController.html" target="_blank">Front Controller</a> in a traditional Model-View-Controller application, forming an API for the services it provides and delegating requests appropriately.</p> 

<p>More intelligent agents may use reasoning engines to examine their current context, ensure the safety and validity of the information they have been provided, and align their actions with their models of the world, their beliefs, and their goals.</p>

<p><em>Personify</em> Agents are entities with stated contracts, similar to <a href="http://c2.com/cgi/wiki?DesignByContract" target="_blank">Design By Contract</a>. These contracts are written in a <a href="http://c2.com/cgi/wiki?DomainSpecificLanguage" target="_blank">Domain Specific Language</a> for contract generation. These contracts outline their Beliefs, Capabilities, and Commitments. Beliefs expressed in the contracts become  manifested in the <a href="http://martinfowler.com/eaaCatalog/domainModel.html" target="_blank">Domain Model</a>, which is updated and used by the Agent's Brain to update according to change in context and carry out actions.</p> 

<h1>Archivist Intent</h1>
<p>The <strong>Archivist</strong> archetype is intentionally naive. Domain specific agents should decorate it with context-specific intelligence.</p>

<p>The <strong>Archivist</strong> archetype strives to be <a href="http://www.infoq.com/presentations/Simple-Made-Easy" target="_blank">Simple and Easy</a>, following Rich Hickey's definition. It provides simple CRUD to the external world.</p> 

<p><strong>Archivists</strong> really should not do more than this. Following the <a href="www.objectmentor.com/resources/articles/srp.pdf" target="_blank">Single Responsibility Principle</a>, they are intended to be specialized agents within an organization, requested by others to store data.</p>
<p>If feature functionality beyond the simple use case "Store Information X in Place Y by doing Z" starts to creep into your implementation, YOAR DOING IT WRONG. Refactor that logic elsewhere.</p>
