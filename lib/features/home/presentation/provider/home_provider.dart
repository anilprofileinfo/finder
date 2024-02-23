import 'dart:convert';

import 'package:finder/features/home/domain/entities/stories_entity.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  static const data = {
    "data": [
      {
        "id": "abc123",
        "location": "Goa",
        "description":
            "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content. The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it's seen all around the web; on templates, websites, and stock designs. Use our generator to get your own, or read on for the authoritative history of lorem ipsum.",
        "images": [
          "https://images.pexels.com/photos/302769/pexels-photo-302769.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        ],
        "hotels": [
          {"hotelName": "Baga Resort", "hotelLocation": "Near Baga Beach"},
          {"hotelName": "Palolem Resort", "hotelLocation": "Near Baga Beach"}
        ],
        "foods": [
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"},
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"}
        ],
        "user": {
          "userName": "Anil",
          "userImage":
              "https://cdn.pixabay.com/photo/2020/05/09/13/29/photographer-5149664_1280.jpg"
        },
        "created_at": "2020-12-11T20:44:52.000Z"
      },
      {
        "id": "abc1234",
        "location": "Goa",
        "description":
            "A beautiful place to vist, cool beaches and vintage streets",
        "images": [
          "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        ],
        "hotels": [
          {"hotelName": "Baga Resort", "hotelLocation": "Near Baga Beach"},
          {"hotelName": "Palolem Resort", "hotelLocation": "Near Baga Beach"}
        ],
        "foods": [
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"},
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"}
        ],
        "user": {
          "userName": "Anil",
          "userImage":
              "https://cdn.pixabay.com/photo/2017/08/06/12/06/people-2591874_1280.jpg"
        },
        "created_at": "2020-11-11T20:44:52.000Z"
      },
      {
        "id": "abc12345",
        "location": "Goa",
        "description":
            "A beautiful place to vist, cool beaches and vintage streets",
        "images": [
          "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        ],
        "hotels": [
          {"hotelName": "Baga Resort", "hotelLocation": "Near Baga Beach"},
          {"hotelName": "Palolem Resort", "hotelLocation": "Near Baga Beach"}
        ],
        "foods": [
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"},
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"}
        ],
        "user": {
          "userName": "Anil",
          "userImage":
              "https://cdn.pixabay.com/photo/2020/05/09/13/29/photographer-5149664_1280.jpg"
        },
        "created_at": "2020-10-11T20:44:52.000Z"
      },
      {
        "id": "abc123456",
        "location": "Goa",
        "description":
            "A beautiful place to vist, cool beaches and vintage streets",
        "images": [
          "https://images.pexels.com/photos/302769/pexels-photo-302769.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        ],
        "hotels": [
          {"hotelName": "Baga Resort", "hotelLocation": "Near Baga Beach"},
          {"hotelName": "Palolem Resort", "hotelLocation": "Near Baga Beach"}
        ],
        "foods": [
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"},
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"}
        ],
        "user": {
          "userName": "Anil",
          "userImage":
              "https://cdn.pixabay.com/photo/2017/08/06/12/06/people-2591874_1280.jpg"
        },
        "created_at": "2020-9-11T20:44:52.000Z"
      },
      {
        "id": "abc1234567",
        "location": "Goa",
        "description":
            "A beautiful place to vist, cool beaches and vintage streets",
        "images": [
          "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        ],
        "hotels": [
          {"hotelName": "Baga Resort", "hotelLocation": "Near Baga Beach"},
          {"hotelName": "Palolem Resort", "hotelLocation": "Near Baga Beach"}
        ],
        "foods": [
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"},
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"}
        ],
        "user": {
          "userName": "Anil",
          "userImage":
              "https://cdn.pixabay.com/photo/2020/05/09/13/29/photographer-5149664_1280.jpg"
        },
        "created_at": "2020-8-11T20:44:52.000Z"
      },
      {
        "id": "abc12345678",
        "location": "Goa",
        "description":
            "A beautiful place to vist, cool beaches and vintage streets",
        "images": [
          "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        ],
        "hotels": [
          {"hotelName": "Baga Resort", "hotelLocation": "Near Baga Beach"},
          {"hotelName": "Palolem Resort", "hotelLocation": "Near Baga Beach"}
        ],
        "foods": [
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"},
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"}
        ],
        "user": {
          "userName": "Anil",
          "userImage":
              "https://cdn.pixabay.com/photo/2020/05/09/13/29/photographer-5149664_1280.jpg"
        },
        "created_at": "2020-8-11T20:44:52.000Z"
      },
      {
        "id": "abc123456789",
        "location": "Goa",
        "description":
            "A beautiful place to vist, cool beaches and vintage streets",
        "images": [
          "https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        ],
        "hotels": [
          {"hotelName": "Baga Resort", "hotelLocation": "Near Baga Beach"},
          {"hotelName": "Palolem Resort", "hotelLocation": "Near Baga Beach"}
        ],
        "foods": [
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"},
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"}
        ],
        "user": {
          "userName": "Anil",
          "userImage":
              "https://cdn.pixabay.com/photo/2020/05/09/13/29/photographer-5149664_1280.jpg"
        },
        "created_at": "2020-7-11T20:44:52.000Z"
      },
      {
        "id": "abc1234567890",
        "location": "Goa",
        "description":
            "A beautiful place to vist, cool beaches and vintage streets",
        "images": [
          "https://images.pexels.com/photos/169191/pexels-photo-169191.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        ],
        "hotels": [
          {"hotelName": "Baga Resort", "hotelLocation": "Near Baga Beach"},
          {"hotelName": "Palolem Resort", "hotelLocation": "Near Baga Beach"}
        ],
        "foods": [
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"},
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"}
        ],
        "user": {
          "userName": "Anil",
          "userImage":
              "https://cdn.pixabay.com/photo/2020/05/09/13/29/photographer-5149664_1280.jpg"
        },
        "created_at": "2020-6-11T20:44:52.000Z"
      },
      {
        "id": "abc01223456789",
        "location": "Goa",
        "description":
            "A beautiful place to vist, cool beaches and vintage streets",
        "images": [
          "https://images.pexels.com/photos/247298/pexels-photo-247298.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        ],
        "hotels": [
          {"hotelName": "Baga Resort", "hotelLocation": "Near Baga Beach"},
          {"hotelName": "Palolem Resort", "hotelLocation": "Near Baga Beach"}
        ],
        "foods": [
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"},
          {"foodName": "Fist Fry", "restaurantName": "Fish Deck"}
        ],
        "user": {
          "userName": "Anil",
          "userImage":
              "https://cdn.pixabay.com/photo/2020/05/09/13/29/photographer-5149664_1280.jpg"
        },
        "created_at": "2020-5-11T20:44:52.000Z"
      }
    ],
    "pagination": {
      "total_records": 100,
      "current_page": 1,
      "total_pages": 10,
      "next_page": 2,
      "prev_page": null
    }
  };

  int _count = 0;

  int get count => _count;

  final List<Data> _listData = [];

  List<Data> get listData => _listData;


  HomeProvider(){
    fetchStories();
  }

  void fetchStories(){
    StoriesEntity storiesEntity = StoriesEntity.fromJson(data);
    debugPrint('postsTest ${storiesEntity.data!.length}');
    _listData.addAll(storiesEntity.data!);
    notifyListeners();
  }

}
