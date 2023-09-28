# meta-programming and Object()
> this is just an example not a library to use as-is

> ⚠️ there is a bug
```python
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
    car_obj["dynamic"] = "string"

    db.dump()
    db.delete(user1^)
    car_obj["dynamic"] = 1.0
    db.dump()

    print(db.unique_id_exist(car_obj["owner"][0]))
```
# output
```python
[[1, 2, 3, 4, 5]]
------db_dump-------
[['_type', 'user'], ['uuid', 0], ['name', ['bob']], ['favorite numbers', [[1, 2, 3, 4, 5]]]]
[['_type', 'car'], ['uuid', 1], ['wheels', [4]], ['owner', [0]], ['dynamic', ['string']]]
------db_dump-------
[['_type', 'car'], ['uuid', 1], ['wheels', [4]], ['owner', [0]], ['dynamic', [1.0]]]
False

