# Request all of a user's UserPlants

## Example Request
`GET http://localhost:3000/api/v1/users/<user_id>/user_plants/`


## Example Response
```
{"data"=>
  [{"id"=>"415",
    "type"=>"user_plant",
    "attributes"=>
     {"user_notes"=>nil, "date_planted"=>nil, "updated_at"=>"2023-07-23T14:48:35.094Z", "created_at"=>"2023-07-23T14:48:35.094Z"},
    "relationships"=>{"plant"=>{"data"=>{"id"=>"6305", "type"=>"plant"}}}},
   {"id"=>"416",
    "type"=>"user_plant",
    "attributes"=>
     {"user_notes"=>nil, "date_planted"=>nil, "updated_at"=>"2023-07-23T14:48:35.096Z", "created_at"=>"2023-07-23T14:48:35.096Z"},
    "relationships"=>{"plant"=>{"data"=>{"id"=>"6306", "type"=>"plant"}}}},
   {"id"=>"417",
    "type"=>"user_plant",
    "attributes"=>
     {"user_notes"=>nil, "date_planted"=>nil, "updated_at"=>"2023-07-23T14:48:35.097Z", "created_at"=>"2023-07-23T14:48:35.097Z"},
    "relationships"=>{"plant"=>{"data"=>{"id"=>"6307", "type"=>"plant"}}}}],
 "included"=>
  [{"id"=>"6305",
    "type"=>"plant",
    "attributes"=>
     {"scientific_name"=>"Rerum a consequatur qui.",
      "common_name"=>"dolor",
      "sun_exposure"=>"Explicabo nisi sint.",
      "planting_time"=>"Voluptatem voluptate sit dolorem.",
      "planting_method"=>"Aut odio eum saepe.",
      "watering"=>"Sint sunt eveniet.",
      "fertilization"=>"Fugit sint qui dolorem cum quos.",
      "pruning"=>"Ut omnis voluptates amet atque quisquam.",
      "harvest_timeline"=>"Cumque quam quo.",
      "harvest_method"=>"Iusto incidunt voluptas.",
      "pests"=>"Provident maiores aut.",
      "homeopathic_remedies"=>"Magnam veritatis suscipit.",
      "spacing"=>"Aliquam sed dicta.",
      "other_notes"=>"Laboriosam voluptas iusto.",
      "plant_img_url"=>
       "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBbWdZIiwiZXhwIjpudWxsLCJwdXIiOiJib
G9iX2lkIn19--6660f1e32e5428cec0f05f1bf65fc151470c78e3/dolor.jpg"}},
   {"id"=>"6306",
    "type"=>"plant",
    "attributes"=>
     {"scientific_name"=>"Iure ut eos consequatur.",
      "common_name"=>"tenetur",
      "sun_exposure"=>"Nulla dolor ratione.",
      "planting_time"=>"Rem necessitatibus sapiente consequatur.",
      "planting_method"=>"Reprehenderit id quaerat dolores.",
      "watering"=>"Est impedit blanditiis.",
      "fertilization"=>"Distinctio repellat enim numquam illum sed.",
      "pruning"=>"Saepe ut optio deserunt aliquid officia.",
      "harvest_timeline"=>"Asperiores est nobis.",
      "harvest_method"=>"Fuga harum aspernatur.",
      "pests"=>"Tempore officiis in.",
      "homeopathic_remedies"=>"Maxime amet accusamus.",
      "spacing"=>"Itaque voluptatem architecto.",
      "other_notes"=>"Consectetur ea voluptas.",
      "plant_img_url"=>
       "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBbWtZIiwiZXhwIjpudWxsLCJwdXIiOiJib
G9iX2lkIn19--33450fe0b8d9443c3635324e4faa0773042414d3/tenetur.jpg"}},
   {"id"=>"6307",
    "type"=>"plant",
    "attributes"=>
     {"scientific_name"=>"Et omnis quas dolorum.",
      "common_name"=>"rerum",
      "sun_exposure"=>"Deserunt fugit blanditiis.",
      "planting_time"=>"Iusto laborum eum repellendus.",
      "planting_method"=>"Et sunt ut aut.",
      "watering"=>"Reiciendis ipsa sunt.",
      "fertilization"=>"Nisi optio blanditiis at porro cumque.",
      "pruning"=>"Quod atque fugiat beatae natus ut.",
      "harvest_timeline"=>"Qui odio tempora.",
      "harvest_method"=>"Ad ut laborum.",
      "pests"=>"Ipsum cum saepe.",
      "homeopathic_remedies"=>"Dolorem rerum hic.",
      "spacing"=>"Deserunt et aspernatur.",
      "other_notes"=>"Nihil dolore repudiandae.",
      "plant_img_url"=>
       "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBbW9ZIiwiZXhwIjpudWxsLCJwdXIiOiJib
G9iX2lkIn19--1dcfc61d34bf1b129a4e1a7ac608aa2cc9cee2b1/rerum.jpg"}}]}
```

