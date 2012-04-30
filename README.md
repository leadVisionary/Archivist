<h1>On Archetypes</h1>
An initial prototype for the <strong>Archivist</strong> archetype of the <em>Personify</em> reference model.
An archetype is a meta-level pattern encountered in many different applications. 
Archetypes provide general functionality usually required by many applications.

<p>For example, applications often store data in databases. Traditionally, this meant Object-Relational Mapping (ORM). Such applications would often use an <a href="http://martinfowler.com/eaaCatalog/activeRecord.html" target="_blank">Active Record</a> (e.g. Ruby on Rails) or a <a href="http://martinfowler.com/eaaCatalog/dataMapper.html" target="_blank">Data Mapper</a> (e.g. Java Hibernate) to manage data persistence to long-term storage.</p> 

<p>Personify manifests this as the <strong>Archivist</strong> archetype.</p> 
<h1>Archivist</h1>
<p>Like an archivist (a historian) in a castle, the <strong>Archivist</strong> archtype personifies the responsibility of storing information into long term storage.</p>

<p>An <strong>Archivist</strong> are responsible for knowing</p> 
- where to store things (A StorageLocation)  
- what to store (An Archive)
- how to store it (An ArchivingStrategy)

<p>An <strong>Archivist</strong> provides these basic services:</p>
- Create(data)
- Read(id)
- Update(id, newData)
- Delete(id)

<p>A particular type of <strong>Archivist</strong>, for example a MongoDBArchivist, would extend the <strong>Archivist</strong> archetype through an application of the <a href="http://addyosmani.com/blog/decorator-pattern/" target="_blank">Decorator pattern</a> and explicitly devise its own StorageLocation, Archives, and ArchivingStrategies by extending the base interfaces and providing their own implemenations.</p>

<p>The directory content of <strong>Archivist</strong> follows rzr style, adhering to the principles of <a href="http://domaindrivendesign.org/" target="_blank">Domain Driven Design</a> by defining a Bounded Context called domain/ by convention. The domain has separate modules, though it is a rzr guiding principle that blades (plugin components) be as minimalistic as possible. Hence, the <strong>Archivist</strong> has one module, archivist/.</p>

<p>Each module has an Aggregate Root, conventionally named for the module (in this case, Archivist.coffee). The Aggregate root exposes the agents the module provides for external interface. Modules in rzr style are Agents, though they may not always be very smart.</p>

<p>A dumb Agent may function much like an ideal <a href="http://java.sun.com/blueprints/patterns/FrontController.html" target="_blank">Front Controller</a> in a traditional Model-View-Controller application, forming an API for the services it provides and delegating requests appropriately.</p> 

<p>More intelligent agents may use reasoning engines to examine their current context, ensure the safety and validity of the information they have been provided, and align their actions with their models of the world, their beliefs, and their goals.</p>

<p>The <strong>Archivist</strong> archetype is intentionally dumb. Or, perhaps more kindly, naive. It is expected that domain specific agents will decorate it with intelligence, which is usually domain specific in nature.</p>

<p>The <strong>Archivist</strong> archetype strives to be <a href="http://www.infoq.com/presentations/Simple-Made-Easy" target="_blank">Simple and Easy</a>, following Rich Hickey's definition. It provides simple CRUD to the external world.</p> 

<p><strong>Archivists</strong> really should not do more than this. Following the <a href="www.objectmentor.com/resources/articles/srp.pdf" target="_blank">Single Responsibility Principle</a>, they are intended to be specialized agents within an organization, requested by others to store data. If feature functionality beyond the simple use case "Store Information X in Place Y by doing Z" starts to creep into your implementation, YOAR DOING IT WRONG. Refactor that logic elsewhere.</p>    
