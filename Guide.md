#Guide pour bien utiliser la DB


user is creator of many places. So >>

`user.places_createds` give places that user has created, it's an array

user give you the number of places he created by >>

`user.place_creators_count` [ more efficiancy than  `user.places_createds.count` ]

In the other way, if you want to know wich users had created the place >>

`place.creators` Still an array.

The number of creator is given by >>

`place.creators_count`


User has also many places that he want to keep in his favorite >>

`user.liked_places` An array

The count of places that he likes >> 

`user.fav_places_count`

One the other side

`place.likers` Still an array

And for the number

`place.fav_places_count` 

