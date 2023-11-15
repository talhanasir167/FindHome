# README

# Thirdhoem Rails Application

Thirdhoem is a revolutionary new application combining the latest in AI, ML, GPT, SEO, VR, and ROYGBIV. It only needs to be built first. Follow the instructions below to get started.

## Prerequisites

- Ruby version: 3.1.2
- Rails version: >=7.0.4.2

## Getting Started

1. Clone this repository to your local machine.

2. Jump into the repository with the command "cd thirdhoem-ha"

3. Run following commands step by step
    - bundle install
    - rails db:create
    - rails db:migrate
    - rails db:seed

4. Populate properties using API (steps given with API docs down) and run job to sync the property data

5. After that run the rake task with the following command to populate the interest score
    - rake user_properties:populate_scores

6. Now run the Rails sever by "rails s"

Hurrayyy.... All set now. You are Good to Go!

## Notes
For future 
- we can add sidekiq and get data from api and run the sync job on daily basis to keep data up-to-dated
- We can add rubocop

## Instructions

The muckety-mucks at Thirdhome want an internal use application to view the contents of one of our Property listing APIs. We have built a frontend for consuming the "discounted weeks" API. This application has a service in `lib/` and two jobs that can be used to sync with our API and load relevant data into the tables that we've already defined in this repository.  We've also provided a way to browse a list of available properties as well as a way to view each property individually, with its available weeks. Please start by using these jobs to load the relevant data into your data. You may need to review the schema and/or the views to confirm that you have all of the correct model properties.

### Building a Recommendation System

Beyond this basic functionality, a critical piece of this is building the ability to recommend properties to Users.  We have a seed file that should generate a set of users with different interests.  We want you to build a recommendation system that will match each user with properties that match the User's interests. In the interface, we would like a page that would display the top 3 properties for each user, ordered by how closely the property matches the interests of the user.  The various interests are listed below and are somewhat vague.  Defining a reasonable algorithm to match properties is part of the exercise.


User travel interests include:
- Cabo San Lucas
- Urban
- Spring Break
- December Holiday Travel
- Family Travel
- Mountains
- Golf
- Only Good Reviews

Feel free to add necessary gems, tables, relationships, columns, etc., to achieve the project goals.

### Stretch Goals

If you complete the above tasks quickly, consider adding these features:

- Display a list of up to 3 nearby properties on the Property page, defined as properties within 50 miles.
- Improve the frontend HTML/CSS to enhance the user experience.

## User Interest-based Property Matching ( Recommendation System )

Matching user interests can be accomplished through several fields, with the following fields being particularly relevant:

- Reviews
- Description
- Interest places
- Property type
- View from property

The most effective approach involves consolidating the relevant data into a single string, allowing for a direct comparison against the interests of each user. To support this process, a bridge table named user_property_score has been implemented, which includes a score field. This score indicates the number of user interests identified within properties across all user preferences.

## Nearby Properties

To identify nearby properties, the 'geocoder' gem is utilized. This gem facilitates the retrieval of user coordinates based on their city, with a fallback to state coordinates when needed.

The calculation of the distance in miles between the user's location and the property coordinates is implemented. In cases where no properties are found within a 50-mile radius, a message is displayed: "There are no nearby properties within a 50-mile range.". Distance can be update by constants.rb file.

Lastly, subtle UI enhancements have been made to improve navigation and elevate user interaction.

## Assumptions

- Assuming that reviews with a property rating greater than 2.5 will be included in the "only_good_reviews" interest.

### Unit Testing with RSpec

Unit testing is crucial for maintaining code quality and ensuring that the application functions as expected. RSpec, a popular testing framework for Ruby, is used to write and run unit tests for the application. Below are the steps to run the unit tests using RSpec.

- Install RSpec: Begin by adding the rspec-rails gem to your Gemfile. Run the following commands:
    - "bundle install"
    - "rails generate rspec:install"

- Run Specific Test Cases: To execute a specific test case, use the following command:
    -rspec <filename>

-Run All Test Cases: To run all your tests, simply use the rspec command:
    -rspec

### Guidelines

- Tests are encouraged, but we'd rather see feature completion if it's a tradeoff between them.
- Gems are fine, but we'd rather see code that you write.
- Don't spend more than 4 hours on this.

### Evaluation Factors

We'll be evaluating the PR based on the following criteria:
- Functionality - The code should work according to the requirements without bugs
- Completeness - Edge cases are considered and, if not handled, acknowledged in comments
- Style - Code written in consistent and idiomatic ruby. We like the [Shopify style guide](https://ruby-style-guide.shopify.dev/), but it should just be consistent
- Performance - Code and queries should be performant

### Api authentication

The API uses an Authorization header to authenticate requests. It expects the following format:
`Authorization: Token token="#{api_token}"`. Your api_token is `uxFR0gP0nMwomi0ynDkA`.

## Endpoint Example Responses

### Availabilities#index
https://exchange.staging.thirdhome.com/api/v3/availabilities
```
[
  {
    "id": 160595,
    "starts_on": "2023-03-10",
    "ends_on": "2023-03-17",
    "reserve_keys": 3,
    "property_id": 29637,
    "reserve_price": 695.0
  },
  {
    "id": 160652,
    "starts_on": "2023-03-10",
    "ends_on": "2023-03-17",
    "reserve_keys": 3,
    "property_id": 29637,
    "reserve_price": 695.0
  },
  {
    "id": 160709,
    "starts_on": "2023-03-10",
    "ends_on": "2023-03-17",
    "reserve_keys": 3,
    "property_id": 29637,
    "reserve_price": 695.0
  }
]
```

### Availabilities#show
https://exchange.staging.thirdhome.com/api/v3/availabilities/173912
```
{
    "id": 173912,
    "starts_on": "2023-03-11",
    "ends_on": "2023-03-18",
    "reserve_keys": 3,
    "property_id": 26205,
    "reserve_price": 695.0
}
```
### Properties#show
https://exchange.staging.thirdhome.com/api/v3/properties/26205
```
{
    "id": 26205,
    "name": "Grand Luxxe Deluxxe One Bedroom at Vidanta Riviera Maya",
    "street1": "KM 48 Carretera Federal ",
    "street2": "",
    "city": "Playa del Carmen",
    "zip": "77712",
    "country_code": "MX",
    "lat": "20.76531601",
    "lng": "-86.95400238",
    "property_style": "Condo",
    "property_type": "Beach",
    "max_occupancy": 4,
    "baths": 2,
    "square_feet": 1227,
    "levels": 1,
    "description": "Grand Luxxe DeLuxxe One Bedroom at Vidanta Riviera Maya\r\n\r\n**Please note:  due to Covid, maximum occupancy for this unit is being reduced to 4 adults.\r\n\r\nNestled in the midst of the tropical Mayan Jungle, Vidanta Riviera Maya is an experience like no other, where luxury vacationing meets the pristine, natural beauty of the Caribbean Sea and/or Mayan jungle. With over 1000 acres of paradise, it is the perfect destination for your next beach escape. \r\n\r\nThe One Bedroom Deluxxe features one bedroom with a king-size bed and in-room TV, a gourmet kitchen with breakfast bar, an attached dining room with formal dining table and sideboard, a living room with two sleeper sofas and a TV, two bathrooms and one Jacuzzi tub, and a private terrace, complete with outdoor lounge furniture.\r\n\r\nA vacation at Vidanta Riviera Maya offers access to plenty of five-star amenities, such as acres of luxurious pools, the Spatium Spa and fitness center, and an array of casual and fine dining. Babysitting services are available at an extra cost.  Golf enthusiasts will love the access to a Jack Nicklaus-designed, 18-hole championship golf course, and there’s also a theater that houses Joya, a permanent Cirque du Soleil production that features a unique dining experience and a show unlike any other in the world. Golf and spa packages are both available for your purchase. \r\n\r\nA plethora of activities will be available to you during your stay, including cooking classes, salsa lessons, poolside activities, and the opportunity to book tours so you can explore the entirety of the Riviera Maya! Step back in time and explore the Mayan ruins of Tulum and Chichén Itzá, or discover the mysteries of Río Secreto. Shopping and delicious restaurants abound on Quinta Avenida in Playa Del Carmen, the perfect spot for a lively afternoon stroll. With so much to experience, you won’t want to miss a single thing!\r\n\r\nIntroducing Jungala, the luxury boutique waterpark of which you have always dreamt but never before experienced. Dedicated concierges, lush tropical surroundings, private cabanas, and some of the best water rides in the world, Jungala has it all, without the lines, crowds, or hassle of your traditional park. See Additional Fees below for pricing.\r\n\r\n*Please note that the photos included herein are representative of Vidanta and not the actual unit you may be reserving. Interiors, views, layout and decor will vary by unit.",
    "view_from_property": "The Caribbean Sea and/or Mayan jungle",
    "nearest_airport": "Cancun International Airport",
    "distance_from_airport": "30 minutes by car",
    "created_at": "2019-08-16T15:57:29.000Z",
    "updated_at": "2023-02-22T12:19:05.000Z",
    "availability_updated_at": "2023-02-22T12:19:05.000Z",
    "bedrooms_count": 1,
    "additional_fees": "$300 USD WEEKLY RESORT FEE PER UNIT, INCLUDES:\r\n• Welcome Cocktail\r\n• Digital Newspaper\r\n• Gym Access\r\n• Collective Internal Transportation \r\n• Basic Wi-Fi Internet \r\n• Local Telephone Calls\r\n• Safe\r\n• Cover to Santuario Entertainment Plaza\r\n• Daily Housekeeping Service\r\n\r\nNOTE: Resort Fees, if paid up front, are non-refundable.\r\n \r\n ADDITIONAL FEES\r\n• Valet parking: $100 MXN per car per night\r\n• A government-imposed lodging tax (3%).  ($1-4 usd on average per night)\r\n• A government-imposed environmental/infrastructure impact fee: Maximum $52 MXN per unit, per night (Approximately $1-3 per night USD)\r\n \r\nNote: You may request that your bill at checkout be calculated and paid in US dollars.",
    "map_zoom": 5,
    "state": "Quintana Roo",
    "amenities": {
        "gated_community": "Gated Community",
        "satellite_cable_tv": "Satellite/Cable TV",
        "covered_parking": "Covered Parking",
        "concierge_service": "Concierge Service",
        "dvd_player": "DVD Player",
        "laundry_service": "Laundry Service",
        "high_speed_internet": "High Speed Internet",
        "wireless_internet": "Wireless Internet",
        "espresso_machine": "Espresso Machine",
        "outdoor_pool": "Outdoor Pool",
        "air_conditioning": "Air Conditioning",
        "gym_or_workout_facility": "Workout Facility",
        "elevator": "Elevator",
        "crib": "Crib",
        "guarded_gate": "Staffed Guard Gate",
        "pets_allowed_with_host_approval": false,
        "handicap_accessible": true
    },
    "contact": {
        "full_name": "Vidanta Customer Service",
        "email": "customerservice@vidanta.com",
        "phone": "1 800 292 9446"
    },
    "activities": {
        "arts": true,
        "equestrian": false,
        "fishing": true,
        "golf": true,
        "hiking": false,
        "shopping": true,
        "skiing": false,
        "watersports": true,
        "wine_tasting": false
    },
    "interest_places": [
        "Step back in time and explore the mysteries surrounding the amazing Mayan ruins at Tulum and Chichen Itza",
        "Very few places in the world boast the perfect conditions for an underground river, so make sure you don't miss your chance to see one in person at Rio Secreto.",
        "Akumal Beach is a gorgeous, serene beach popular with locals, featuring a barrier reef that calms the waters, making this area great for snorkeling!",
        "Stroll down the lively street of Quinta Avenida in Playa Del Carmen, featuring boutique shops and delicious, local restaurants.",
        "Serving up delicious coffee and scrumptious pastries, Cafe Antoinette is great for a rest during long days exploring the area!"
    ],
    "interest_activities": [
        "Cirque du Soleil JOYÀ - This incredible show combines culinary and performing arts in an intimate theater setting, and will thoroughly engage your senses. ",
        "Nicklaus Par Three Experience - Crafted by one of the legendary masters of the game, this is one of the world's most beautiful short courses.",
        "Tulaka Diving - Get up close and personal with incredible sea creatures during a dive!"
    ],
    "bedrooms": [
        "King"
    ],
    "photos": [
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300132/extra_large/Vidanta-riviera-maya-grand-luxxe-accommodations-jungle-suite-1.jpg?1654083588",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300131/extra_large/Vidanta-riviera-maya-grand-luxxe-accommodations-jungle-suite-4.jpg?1654083588",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300133/extra_large/Vidanta-riviera-maya-grand-luxxe-accommodations-jungle-suite-2.jpg?1654083588",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300134/extra_large/Vidanta-riviera-maya-grand-luxxe-accommodations-jungle-suite-3.jpg?1654083588",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300135/extra_large/Vidanta-RivieraMaya-NicklausCourse-2.jpg?1654083588",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300136/extra_large/Vidanta-RivieraMaya-BlueFish.jpg?1654083588",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300137/extra_large/Vidanta-RivieraMaya-Salum-LaSombrita-1.jpg?1654083588",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300138/extra_large/Vidanta-RivieraMaya-NicklausCourse.jpg?1654083589",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300139/extra_large/Vidanta-RivieraMaya-CirqueduSoleilTheater.jpg?1654083589",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300140/extra_large/Vidanta-RivieraMaya-Spatium.jpg?1663366639",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300137/extra_large/Vidanta-RivieraMaya-Salum-LaSombrita-1.jpg?1654083588",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300141/extra_large/Vidanta-RivieraMaya-Salum-1.jpg?1654083589",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300142/extra_large/Vidanta-RivieraMaya-LaCantina.jpg?1654083589",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300143/extra_large/Vidanta-RivieraMaya-Salum-4.jpg?1654083589",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300144/extra_large/Vidanta-RivieraMaya-Salum-3.jpg?1654083589",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300145/extra_large/Vidanta-RivieraMaya-Salum-2.jpg?1654083590",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300146/extra_large/Vidanta-RivieraMaya-TheBeachClub-1.jpg?1654083590",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300147/extra_large/Vidanta-RivieraMaya-TheBeachClub-2_%281%29.jpg?1654083590",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300148/extra_large/Vidanta-RivieraMaya-MayanSanctuaryAerial.jpg?1654083590",
        "https://d32shz49xjgddt.cloudfront.net/uploads/sources/300149/extra_large/Vidanta-RivieraMaya-TheBeachClub-2.jpg?1654083590"
    ],
    "reviews": [
        {
            "title": "Awesome",
            "body": "Beautiful property and beautiful resort!!!\r\nWould definitely go back again and again...\r\nThe food is exceptionally good.\r\nThe only 2 problems we had:\r\n1) the property is huge....you either walk for miles and miles or you got to wait for the little golf cart to come pick you up...but they are not that frequent.\r\n2) the resort is 40 minutes south of Cancun so every time you have to go to Cancun, it is a very expensive taxi ride.",
            "rating": 5,
            "reviewer_name": "Romina Colucci",
            "stay_date": "2020-07-05"
        },
        {
            "title": "RT",
            "body": "Very nice suite. Great cleaning staff. Very good food choices and quality. Good value on food and drink. Very marginal WIFI, kept getting booted off and having to re-access it. Very friendly and courteous staff. Lots of walking and fairly confusing trail layout - but also very pleasant walkways. On property shuttles were pretty mediocre - confusing system, and lots of waiting for them. Joya was awesome - great food and fantastic entertainment. Will go again.",
            "rating": 4,
            "reviewer_name": "Roman Taffe",
            "stay_date": "2021-01-09"
        }
    ]
}
```

