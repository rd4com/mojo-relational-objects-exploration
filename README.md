
# meta programming and builtin.object
> this is just an example not a library to use as-is
```
fn main() raises:
    var db = Db()
    
    var user1 = db.object("user")
    user1["name"] = "bob"
    user1["favorite numbers"] = [1,2,3,4]
    
    if user1.has_field("favorite numbers"):
        user1["favorite numbers"][0].append(5)
        print(user1["favorite numbers"])

    var car_obj = db.object("car")
    car_obj["wheels"] = 4
    car_obj["owner"] = user1.unique_id()

    db.dump()
    db.delete(user1^)
    db.dump()

    print(db.unique_id_exist(car_obj["owner"][0]))
```
# so far
- [x] create objects with unique ids
- [x] remove objects from "db"
- [x] add fields
- [x] change values
- [x] change field type
