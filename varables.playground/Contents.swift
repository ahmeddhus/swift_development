import Foundation

let myName = "Ahmed"
let yourName = "Foo"

var names = [myName , yourName]

names.append("Bar")
names.append("Baz")

let oldArr = NSMutableArray(
    array: [
        "Foo", "Bar"
    ]
)

oldArr.add("Baz")

var newArray = oldArr
newArray.add("Qux")
oldArr
newArray

let someNames = NSMutableArray(
array: [
    "Foo",
    "Bar"
    ]
)
func changeTheArray (_ array: NSArray){
    let copy = array as! NSMutableArray
    copy.add("Bazz")
}

changeTheArray(someNames)
someNames
