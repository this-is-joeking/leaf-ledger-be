# Get details on a plant
## Example Request
`GET http://localhost:3000/api/v1/plants`
## Example Response
```
{
    "data": [
        {
            "id": "1",
            "type": "plant",
            "attributes": {
                "scientific_name": "Ocimum basilicum",
                "common_name": "Basil",
                "sun_exposure": "Full sun",
                "planting_time": "After the last frost in spring",
                "planting_method": "Direct sow or transplant seedlings",
                "watering": "Regular watering, keeping the soil evenly moist",
                "fertilization": "Fertilize every 4-6 weeks with a balanced organic fertilizer",
                "pruning": "Pinch off flower buds to encourage leaf growth",
                "harvest_timeline": "Harvest leaves as needed once the plant reaches 6-8 inches tall",
                "harvest_method": "Cut stems just above a pair of leaves",
                "pests": "Aphids, whiteflies, and slugs",
                "homeopathic_remedies": "Planting companion plants like marigolds or using neem oil spray",
                "spacing": "12-18 inches apart",
                "other_notes": "Basil is sensitive to cold temperatures, so protect from frost"
            }
        },
        {
            "id": "2",
            "type": "plant",
            "attributes": {
                "scientific_name": "Capsicum annuum",
                "common_name": "Jalapeno",
                "sun_exposure": "Full sun",
                "planting_time": "Late spring to early summer",
                "planting_method": "Start seeds indoors 8-10 weeks before the last frost or directly sow seeds in the garden after the danger of frost has passed",
                "watering": "Water regularly, keeping the soil consistently moist but not waterlogged",
                "fertilization": "Fertilize with a balanced fertilizer every 4-6 weeks during the growing season",
                "pruning": "Pinch off the tips of the plant when it reaches about 6-8 inches tall to encourage branching",
                "harvest_timeline": "Harvest jalapenos when they are green and fully grown, usually around 70-80 days after planting",
                "harvest_method": "Gently twist or cut the peppers off the plant",
                "pests": "Common pests include aphids, flea beetles, and spider mites",
                "homeopathic_remedies": "Spraying the plants with a mixture of water and neem oil can help deter pests",
                "spacing": "Space jalapeno plants about 12-18 inches apart",
                "other_notes": "Jalapenos thrive in well-drained soil and benefit from staking or support as they grow"
            }
        }
    ]
}
```

