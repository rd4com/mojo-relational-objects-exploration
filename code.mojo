struct Db:
    var storage: object
    var idx:Int
   
    def __init__(inout self):
        self.idx = 0
        #free_idxs = [] when delete pop theses ?
        self.storage = object([])
     
    fn __getitem__(self, i:object ) raises -> object: 
        print(i)
        return object()
    
    def dump(inout self):
        print("------db_dump-------")
        for r in range(self.storage.__len__()):
            print(self.storage[r])
            
    def delete(inout self,owned obj: db_object_wrapper):
        var newdb = object([])
        var i = object(0)
        while i < self.storage.__len__():
            if self.storage[i][1][1] != obj.data[1][1]:
                newdb.append(self.storage[i])
            i+=1
        self.storage=newdb


    fn __len__(self) raises  -> Int:
        return self.storage.__len__()

    fn object(inout self,o:object) raises -> db_object_wrapper:
        var tmp = object([])

        var tmp2 = object([])
        tmp2.append("_type")
        tmp2.append(o)
        tmp.append(tmp2)
        
        tmp2=object([])
        tmp2.append("uuid")
        tmp2.append(self.idx)
        tmp.append(tmp2)

        self.idx+=1
        self.storage.append(tmp)

        return db_object_wrapper(tmp)
    fn unique_id_exist(self,unique_id:object) raises -> Bool:
        var i = object(0)
        while i < self.storage.__len__():
            if self.storage[i][1][1] == unique_id:
                return True
            i+=1
        return False
    
struct db_result:
    var value: object
    var success: Bool
    def __init__(inout self,o:object):
        self.value = o[1]
        if o[0] == True:
            self.success = True
        else:
            self.success = False
struct db_object_wrapper:
    var data: object
    def __init__(inout self,o:object):
        self.data = o
    def __getitem__(inout self,k):
        var i = 0
        while i<self.data.__len__():
            if self.data[i][0]==k:
                return self.data[i][1]
            i+=1
    def has_field(inout self,k):
        var i = 0
        while i<self.data.__len__():
            if self.data[i][0]==k:
                return True
            i+=1
        return False
                    
    def __setitem__(inout self,k,v):
        var i = 0
        while i<self.data.__len__():
            if self.data[i][0]==k:
                var tmp=object([])
                tmp.append(v)
                self.data[i][1]=tmp
                return
            i+=1
        var tmp = object([])
        tmp.append(k)
        var tmp2 = object([])
        tmp2.append(v)
        tmp.append(tmp2)
        self.data.append(tmp) 
    fn unique_id(self) raises -> object:
        return self.data[1][1]
