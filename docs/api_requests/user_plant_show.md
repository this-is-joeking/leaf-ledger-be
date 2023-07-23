# Request a UserPlant
## Example Request
`GET http://localhost:3000/api/v1/users/<user_id>/user_plants/<user_plant_id>`


## Example Response
```
{"data"=>
  {"id"=>"245",
   "type"=>"user_plant",
   "attributes"=>
    {"user_notes"=>"my first plant",
     "date_planted"=>"2023-04-01",
     "updated_at"=>"2023-07-23T14:06:41.102Z",
     "created_at"=>"2023-07-23T14:06:41.102Z"},
   "relationships"=>
      {"plant"=>
        {"data"=>
          {"id"=>"6026", "type"=>"plant"}
        }
      }
    },
 "included"=>
  [{"id"=>"6026",
    "type"=>"plant",
    "attributes"=>
     {"scientific_name"=>"Est laudantium suscipit repellat.",
      "common_name"=>"voluptatem",
      "sun_exposure"=>"Alias aut dolores.",
      "planting_time"=>"Amet ea necessitatibus placeat.",
      "planting_method"=>"Doloribus accusamus aut provident.",
      "watering"=>"Eos quis nihil.",
      "fertilization"=>"Qui rerum a reprehenderit in omnis.",
      "pruning"=>"Similique ut voluptate animi est quidem.",
      "harvest_timeline"=>"Provident ipsum et.",
      "harvest_method"=>"Fugiat beatae qui.",
      "pests"=>"Qui facilis laudantium.",
      "homeopathic_remedies"=>"Dolores assumenda voluptatum.",
      "spacing"=>"Voluptatibus debitis fuga.",
      "other_notes"=>"Ipsum totam quo.",
      "plant_img_url"=>
       "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBbElYIiwiZXhwIjpudWxsLCJwdXIiOiJib
G9iX2lkIn19--e6b2d06ca931b9ad9173a054d1aa314ce50fb9b2/voluptatem.jpg"}}]}
```

