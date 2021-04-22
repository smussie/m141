# Mongodb

## Installation
in linux
```bash
sudo apt install mongodb mongo-tools
```

Some terms and definitions on Mongodb

* __Document__ - a way to organize and store data as a set of field-value pairs.
> Every document must have a __unique _id__ value
"_id" unique identifier for a document in a colletion.
### ObjectID()
Default value for the __"_id"__ field unless otherwise specified.
__Example__:
- "_id": ObjectId("5ecf1b710ca9222e6a46cab")
- "_id": "710ca922"
- "_id": "101-EXG-27"


* __Field__ - a unique identifier for a datapoint.

* __Value__ - data related to a given identifier.

* __Collection__ - an organized store of documents in MongoDB, usually with common fields between documents. There can be many collections per database and many documents per collection.

## ATLAS
- __Replica Set__ - a few connected machines that store the same data to ensure that if something happens to one of the machines the data will remain intact. Comes from the word replicate - to copy something.

- __Instance__ - a single machine locally or in the cloud, running a certain software, in our case it is the MongoDB database.

- __Cluster__ - group of servers that store your data.

https://www.mongodb.com/cloud/atlas

### Connecting to mongodb
URI (Uniform Resources Identifier)
**_SRV connection string_** - a specific format used to establish a (__secure__) connection between your application and a MongoDB instance
Target **_database name_**
mongodb+srv://user:password@clusterURI.mongodb.net/database

show dbs

use sample_training

show collections

### Insert
db.inspections.insert([ { "test": 1 }, { "test": 2 }, { "test": 3 } ])

> __Note__: The default order of insertion is according to their list order.
db.inspections.insert([{ "_id": 1, "test": 1 },{ "_id": 1, "test": 2 },
                       { "_id": 3, "test": 3 }])
This will produce an error for test2 as it have the same _id value as test1, but won't say anything about 3
__to avoid that__ we add { "ordered": false } so as all the documents with unique _id will be inserted while all other documents with the duplicate _id will produce their own error.

db.inspections.insert([{ "_id": 1, "test": 1 },{ "_id": 1, "test": 2 },
                       { "_id": 3, "test": 3 }],{ "ordered": false })

### Update
#### One
updateOne()
This updates the first query match it finds.
#### Many
updateMany()
This updates all the query match found.

Update all documents in the zips collection where the city field is equal to "HUDSON" by adding 10 to the current value of the "pop" field.
```js
db.zips.updateMany({ "city": "HUDSON" }, { "$inc": { "pop": 10 } })
```
Update a single document in the zips collection where the zip field is equal to "12534" by setting the value of the "pop" field to 17630.
```js
db.zips.updateOne({ "zip": "12534" }, { "$set": { "pop": 17630 } })
```
Update one document in the grades collection where the student_id is ``250`` *, and the class_id field is 339 , by adding a document element to the "scores" array.
```js
db.grades.updateOne({ "student_id": 250, "class_id": 339 },
                    { "$push": { "scores": { "type": "extra credit",
                                             "score": 100 }
                                }
                     })
```

### Deleting
Once delete is executed, remember data is gone for good. So pay attention.
#### One
deleteOne() here must set __"_id": <id-value>__ else we risk of deleting one of a few or one of many documents that we
Similar to updateOne() and findOne()

#### Many
deleteMany()
Similar to updateMany() and find()
```js
db.inspections.deleteOne({ "test": 3 })
```
* To Delete a collection we use drop
```js
show collections
// Drop the inspection collection
db.inspection.drop()
```


### Find
findeOne() : returns only one while find() returns many.
```js
db.zips.find({"state": "NY"})

db.zips.find({"state": "NY"}).count()

db.zips.find({"state": "NY", "city": "ALBANY"})

// .pretty() make it look nice__
db.zips.find({"state": "NY", "city": "ALBANY"}).pretty()
```

__it__ : Iterates through the cursor
__cursor__: A pointer to a result set of a query
__pointer__: A direct access of the memory location

### Importing and Exporting
```js
mongodump --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"

mongoexport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --collection=sales --out=sales.json

mongorestore --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"  --drop dump

mongoimport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --drop sales.json
```

## MQL operators

### Update Operators
Enable us to modify data in the database
Example: $inc, $set, $unset

### Querry Operators
Provide additional ways to locate data within the database
__$ had multiple uses__
- Precedes MQL operators
- Precedes Aggregation pipeline stages
- Allows access to Field Values
#### Comparison operators
Specifically allow us to find data with in a certain range.

| Option | Description | Symbol  |
| :------:| :-----------:|:-------:|
| $eq |  EQual to | = |
| $ne | Not Equal to | != |
| $gt | Greatr Than | > |
| $lt | Less than | < |
| $gte | Greater Than or Equal to | >= |
| $lte | Less Than or Equal to | <= |

> __Syntax:__ { <field> : { <operator>: <value>} }


```js
db.trips.find({ "tripduration": { "$lte" : 70 },
                "usertype": { "$ne": "Subscriber" } }).pretty()
```

#### Logic Operators
They allow us  to be more granular in our search for data.

| Option | Description |
|:------:| -----------:|
| $and |  Match all of the specified  query clauses |
| $or | At least one of the query clauses is matched|
| $nor | Fail to match both give clauses |
| $not | Negates the query requirement |

> **Syntax:** {<operator>: [{statement1},{statement2},...]}

But __Not__ is different, it simply negates what is infront of it
{$not: {statement}}
* $and
```js
{sector : "Mobile food Vendor - 881", result: "Warning"}
```
is the same as
```js
{"$and": [{sector : "Mobile food Vendor - 881"}, {result: "Warning"}]}
```

```js
db.routes.find({ "$and": [ { "$or" :[ { "dst_airport": "KZN" },
                                    { "src_airport": "KZN" }
                                  ] },
                          { "$or" :[ { "airplane": "CR2" },
                                     { "airplane": "A81" } ] }
                         ]}).pretty()
```
```js
db.inspections.find({"$and": [{"sector":"Cigarette Retail Dealer - 127"}, {"$or": [{"date":"Feb 20 2015"}, {"date": "Feb 21 2015"}]}]}).pretty()


mongoimport --collection='mycollectionname' --file='doc/bla.json'
```
Or
```bash
cat *.json | mongoimport --collection="mycollection"
```

or
```js
mongoimport --collection='fields_option' --file=without_header_row.csv --type=csv --fields="starttime","stoptime","gender"

db.zips.find({"$and": [{"pop": {"$gt": 5000}}, {"pop": {"$lt": 1000000}}]}).count()
```
