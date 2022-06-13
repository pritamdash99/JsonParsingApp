# JsonParsingApp
A simple iOS App to show json parsing.

JSON - Data Representation Format , not a language.
JavaScript Object Notation.

In this format data can be represented in 2 manners either via Object or Array 

1. Object : Collection of Key Value Pairs. Where Keys are always string but values can be string, number, true/false, object , array.
eg : 
{
"name" : "Pritam"
"age" : "23"
"gender" : "male"
"married" : false
"phone": ["9898989898","9191919191"...]
}

2. Array : Collection of values in [], Values can be String, number, true / false, object , array

eg : [1,2,3,4]
["Apple", "Banana",234, true]

The response data that we get from internet will be in form of Json, in that json the data might be in array, object, array of object format.
We need to convert the response data into apropriate swift format. For that a class is given to us known as "JSONSerialization" that converts json to swift data and viceversa.

Attaching a demo of the app for a simple json format reponse :
[{
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  }, {..}, {..}]

https://user-images.githubusercontent.com/80701312/173413117-6c97f46d-98f6-4e7d-a3ff-5106bce9c810.mp4


