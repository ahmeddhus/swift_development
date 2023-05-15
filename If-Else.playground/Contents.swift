import Foundation

let myName = "Ahmed"
let myAge = 20
let yourName = "Foo"
let yourAge = 19

if myName == "ahmed" {
    "Yout name is \(myName)"
} else {
    "Oops, I guessed it wrong"
}

if myName == "Ahmed" {
    "Now, I guessed it correctly"
} else if myName == "Foo" {
    "Are you Foo?"
} else {
    "Okay I give up"
}

if "Ahmed" == myName {
    "An uncommon way of doing this"
}

if myName == "Ahmed" && myAge == 30 {
    "Name is Ahmed and age is 20"
} else if myAge == 20 {
    "I only guessed the age right"
} else {
    "I don't know what I'm doing"
}

if myAge == 20 || myName == "Foo" {
    "Either age is 20, name is Foo or both"
} else if myName == "Ahmed" || myAge == 20 {
    "It's too late to get in this clause"
}

if myName == "Ahmed"
    && myAge == 22
    && yourName == "Foo"
    || yourAge == 19 {
    "My name is Ahmed and I'm 22 and your name is Foo...OR... you are 19"
}

if  (myName == "Ahmed" && myAge == 22)
        &&
        (yourName == "Foo" || yourAge == 19){
    "My name is Ahme and I'm 22... AND... your name is Foo or you are 19"
} else {
    "Hmmm, that didn't work so well"
}

