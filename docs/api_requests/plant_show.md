# Get details on a plant
## Example Request
`GET http://localhost:3000/api/v1/plants/5`
## Example Response
```
{
    "data": {
        "id": "5",
        "type": "plant",
        "attributes": {
            "scientific_name": "Ocimum basilicum",
            "common_name": "Basil",
            "sun_exposure": "Full sun",
            "planting_time": "After the last frost date in the spring",
            "planting_method": "Direct sow or transplant seedlings",
            "watering": "Regular and consistent watering to keep the soil evenly moist",
            "fertilization": "Fertilize every 4-6 weeks with a balanced fertilizer",
            "pruning": "Pinch off the top leaves regularly to encourage bushier growth",
            "harvest_timeline": "Harvest leaves as needed once the plant reaches 6-8 inches tall",
            "harvest_method": "Pinch off leaves at the stem",
            "pests": "Common pests include aphids, spider mites, and whiteflies",
            "homeopathic_remedies": "Spray plants with a solution of water and dish soap to deter pests",
            "spacing": "Plant seeds or seedlings 6-12 inches apart",
            "other_notes": "Basil is an annual herb that can be grown in containers or raised beds. It prefers warm temperatures and well-draining soil."
        }
    }
}
```

