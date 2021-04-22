
// This script can be run by
// mongo mongodbcreate-db.js
// or load("myjstest.js")

//create the madMen database and connect to it
var db = connect('127.0.0.1:27017/madMen'),
    allMadMen = null;
// simply use <database_name>
print('Database Created')

//b.createCollection(name, options)
// https://www.tutorialkart.com/mongodb/mongodb-create-collection/
// db.<collection_name>.drop()

//create the names collection and add documents to it
// db.<collection_name>.insert(<document>)
db.names.insert({'name' : 'Don Draper'});
db.names.insert({'name' : 'Peter Campbell'});
db.names.insert({'name' : 'Betty Draper'});
db.names.insert({'name' : 'Joan Harris'});

emoji = decodeURI(escape("\xF0\x9F\x91\x8C"))
// 👌
db.tuto.insert({reaction:emoji})
db.tuto.findOne()
db.customers.insertMany(
  [
      { name: "Midhuna", age: 23, cars: [ "BMW 320d", "Audi R8" ], place:"Amaravati" },
      { name: "Akhil", age: 24, cars: [ "Audo A7", "Agera R" ], place:"New York" },
      { name: "Honey", age: 25, cars: [ "Audi R8" ] }
  ]
)
print("Documents created")
// show collections
//set a reference to all documents in the database
allMadMen = db.names.find();

//iterate the names collection and output each document
while (allMadMen.hasNext()) {
   printjson(allMadMen.next());
}

//search for the document whose name property is: "Don Draper"
db.names.find().forEach( function(thisDoc) {
  if(thisDoc.name === 'Don Draper'){
    //update the record that contains "Donald Draper" and change it to "Dick Whitman"
    db.names.update( { "_id" : thisDoc._id }, { "name": "Dick Whitman" } );
    print('* Updated document: ' + thisDoc._id);
  };
});

print('* All documents')
db.names.find().forEach( function(thisDoc) {
  if(thisDoc.name === 'Dick Whitman'){
    //remove the record that contains "Dick Whitman"
    db.names.remove({ "_id" : thisDoc._id });
  };
});

// Drop the database
db.dropDatabase()

// https://blog.kevinchisholm.com/javascript/mongodb/getting-started-with-mongo-shell-scripting-basic-crud-operations/
