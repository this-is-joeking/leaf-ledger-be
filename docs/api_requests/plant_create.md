# Get details on a plant
## Example Request
`POST http://localhost:3000/api/v1/plants?name=sun flower`
## Example Response
```
{
    "data": {
        "id": "4",
        "type": "plant",
        "attributes": {
            "scientific_name": "Helianthus annuus",
            "common_name": "Sunflower",
            "sun_exposure": "Full sun",
            "planting_time": "Late spring to early summer",
            "planting_method": "Direct sow the seeds into the prepared raised garden bed",
            "watering": "Regular watering, keeping the soil consistently moist but not waterlogged",
            "fertilization": "Fertilize with a balanced fertilizer once a month",
            "pruning": "Remove faded flowers to encourage continuous blooming",
            "harvest_timeline": "Around 70-100 days after planting",
            "harvest_method": "Cut the mature flower heads when the back of the flower turns yellow",
            "pests": "Common pests include aphids, caterpillars, and snails",
            "homeopathic_remedies": "Spraying a mixture of water and dish soap can help control aphids. Handpicking caterpillars and snails is also effective.",
            "spacing": "Plant seeds about 6-12 inches apart",
            "other_notes": "Sunflowers are known for their tall and striking appearance. They can grow up to 10 feet tall, so make sure to provide support if needed.",
            "plant_img_url": "http://localhost:3000//rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--ff9771a29ea1a123cfdf43ce57e916ee5e0e3b92/Sunflower.jpg
        }
    }
}
```

