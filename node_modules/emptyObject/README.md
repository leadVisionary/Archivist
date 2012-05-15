emptyObject
===========

A simple empty object microlib for Node (for those times when _ is too heavyweight)

Usage (in Javascript)
============
```javascript
emp = require('emptyObject')

if({}.isEmpty()){
        console.log("Yep, it worked");
}
else
{
        console.log("It didn't work!");
}
```