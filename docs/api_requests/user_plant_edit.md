# Edit a UserPlant
## Example Request
`PATCH http://localhost:3000/api/v1/users/<user_id>/user_plants/<user_plant_id>?user_notes=<user_notes>&date_planted=<date>`
At least one of the two params should be passed as they are the only thing that can be edited on a user_plant
`user_notes` is a string, any custome notes the user wants connected to their plant
`date_planted` is a date passed in the format `YYYY-MM-DD`

## Example Response
```
{"data"=>
  {"id"=>"246",
   "type"=>"user_plant",
   "attributes"=>
      {"user_notes"=>"I could not keep this plant alive last year",
      "date_planted"=>"2023-07-20",
      "updated_at"=>"2023-07-23T14:10:56.470Z",
      "created_at"=>"2023-07-23T14:10:56.443Z"},
   "relationships"=>
      {"plant"=>
        {"data"=>{"id"=>"6027", "type"=>"plant"}}
      }
  }
}
```

