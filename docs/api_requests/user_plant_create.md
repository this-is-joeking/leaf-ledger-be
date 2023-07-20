# Create a UserPlant (aka add to a users garden)
## Example Request
`POST http://localhost:3000/api/v1/users/<user_id>/user_plants?plant_id=<plant_id>`
## Example Response
```
{"data"=>
  {"id"=>"22",
   "type"=>"user_plant",
   "attributes"=>
    {"user_id"=>96,
     "plant_id"=>1807,
     "user_notes"=>nil,
     "date_planted"=>nil,
     "updated_at"=>"2023-07-20T19:26:52.024Z",
     "created_at"=>"2023-07-20T19:26:52.024Z"
     }
  }
}
```

