#Guide pour bien utiliser la DB


user is creator of many places. So >>

`user.places_createds` give places that user has created, it's an array
`user.places_createds << Place.find(<id_of_place>)` if you want to add a place to his array 


In the other way, if you want to know wich users had created the place >>

`place.creators` Still an array.
`place.creators << User.find(<id_of_user>)` To add a creator to a places.


NO NEED TO DO BOTH ! One of them make the job, it's a relation

user give you the number of places he created by >>

`user.place_creators_count` [ more efficiancy than  `user.places_createds.count` ]

The number of creator is given by >>

`place.creators_count`


User has also many places that he want to keep in his favorite >>

`user.liked_places` An array
To put in >>
`user.liked_places << Place.find(<id_of_places>)`
Or >>
` place.likers << User.find(<id_of_user>)`

The count of places that he likes >> 

`user.fav_places_count`

One the other side

`place.likers` Still an array

And for the number

`place.fav_places_count` 

