

FactoryBot.define do
  factory :property do
    sequence(:name) { |n| "Property #{n}" }
    external_id { 22659 }
    primary_photo_url { "https://dn82xs5t7fk7h.cloudfront.net/uploads/sources/253596/extra_large/vidanta-nuevo-vallarta-accommodations-grand-luxxe-master-1.jpg?1654070521" }
    city { "Nuevo Vallarta" }
    country_code { "MX" }
    state { "Nayarit" }
    lat { 38.6920451 }
    lng { -75.4013315 }
    amenities do
      [
        "gated_community:Gated Community",
        "satellite_cable_tv:Satellite/Cable TV",
        "covered_parking:Covered Parking",
        "concierge_service:Concierge Service",
      ]
    end

    description do
      "Grand Luxxe Master Room at Vidanta Nuevo Vallarta\r\n\r\n*PLEASE NOTE: The mandatory resort fee is increasing at Vidanta. The new fees will apply to any reservations made May 15th, 2023 and beyond. Please see the \"Additional Fees\" section below. \r\nIn addition, per a new Vidanta policy, THIRDHOME members will be limited to one (1) reservation every three (3) years. This policy will also go into effect for reservations made from May 15, 2023 and beyond.\r\n\r\nClick on the following link to watch Catherine Zeta-Jones, Mark Wahlberg and Jaime Camil, three leading Hollywood stars, share their love for Vidanta, how they experience their perfect vacation, and make a big announcement about the future of entertainment. https://youtu.be/NVoqivarLeg\r\n\r\nNestled between the Pacific and the Sierra Madre Mountains along the Ameca River, Vidanta Nuevo Vallarta offers the ultimate resort vacation within 2,500 acres of tropical beach paradise. \r\n\r\nThe Master Room features one bedroom with a king-size bed or two double beds, a private terrace, and one bathroom with Jacuzzi tub. Occupancy: 2 adults, 2 kids.\r\n\r\nAmenities in the room include a coffee maker, hair dryer, iron, ironing board, microwave, minibar, safe deposit box, and tv.\r\n\r\n\r\nVidanta Nuevo Vallarta is the largest of the Vidanta destinations, and has been carefully cultivated to provide a high-end experience full of options: 40 plus restaurants and lounges, three golf courses and a golf academy, a shopping plaza, two indulgent spas, beautiful beaches, and countless pools. \r\n\r\nEverything you could ever need for a magical vacation can be found within the resort and its amenities. Miles of wooden jungle pathways connect five resort hotels to an endless array of amenities. Some of the best golf in the world can be found at The Nayar Course, The Norman Signature Course, and The Lakes Course. \r\n\r\nFind yourself immersed in activities, games, and nightly entertainment. Take a dip at one of the stunning pools with an Aqua Park, Lazy River, or two wave pools. You will have choices of multiple world-class restaurants or gourmet markets to prepare your own delicious meals. The entire time you are at Vidanta, you will find yourself surrounded by immaculate gardens, lakes, and the beach.\r\n\r\n*Please note that the photos included herein are representative of Vidanta and not the actual unit you may be reserving. Interiors, views, layout and decor will vary by unit."
    end
    view_from_property { "Sierra Madre Mountains and Banderas Bay" }
    nearest_airport { "Licenciado Gustavo Díaz Ordaz International Airport" }
    distance_from_airtport { "15 minutes by car" }
    bedrooms_count { 1 }
    activities do
      {
        "arts" => true,
        "golf" => true,
        "hiking" => false,
        "skiing" => false,
      }
    end
    interest_places do
      [
        "Puerto Vallarta Malecón - Take a walk along Puerto Vallarta’s boardwalk...",
        "Nearby, you'll find a collection of intriguing towns to explore...",
        "Almaverde Farm - Take a tour of this 40-acre farm yielding over 65 types...",
        "Banderas Bay is the seventh-largest natural bay in the world, and considered..."
      ]
    end
    interest_activities do
      [
        "Head out to some of the finest Golfing in the world...",
        "Tequila Tour - Become a tequila connoisseur and learn the finer points...",
        "You can spend an entire day shopping at all the high-end boutique shops...",
        "Popular ocean activities include surfing, wind surfing, fishing, kayaking..."
      ]
    end

    reviews do
      [
        {
          "body" => "The rooms are nicely appointed. ...",
          "title" => "Prefer Cabo!",
          "rating" => 4,
          "stay_date" => "2022-01-22",
          "reviewer_name" => "Dave and Penny Bertsch"
        },
      ]
    end
  end
end
