# Create a UserPlant (aka add to a users garden)
## Example Request
`POST http://localhost:3000/api/v1/users/<user_id>/user_plants?plant_id=<plant_id>`
## Example Response
```
{"data"=>
  {"id"=>"249",
   "type"=>"user_plant",
   "attributes"=>
      {"user_notes"=>nil, "date_planted"=>nil, "updated_at"=>"2023-07-23T14:14:11.518Z", "created_at"=>"2023-07-23T14:14:11.518Z"},
   "relationships"=>
      {"plant"=>
        {"data"=>{"id"=>"6030", "type"=>"plant"}}
      }
  }
}
```

