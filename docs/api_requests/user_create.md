# Create a User (also used for login functionailty)
## Example Request
`POST http://localhost:3000/api/v1/users/`
Request body is the response from Google OAuth on the front end.
## Example Request Body
```
{"data"=>
  { "email": "j.king92@gmail.com",
    "family_name": "King",
    "given_name": "Joe",
    "id": "117833646270849236918",
    "locale": "en",
    "name": "Joe King",
    "picture": "https://lh3.googleusercontent.com/a/AAcHTte67VPNyMFcu7IzIp485r8W69YTEUlxJzhNx8sc-EQ2Tjs=s96-c",
    "verified_email": true
  }
}
```
## Example Response
```
{"data"=>
  {"id"=>"102",
   "type"=>"user",
   "attributes"=>
    {"gid"=>"117833646270849236918",
     "email"=>"j.king92@gmail.com",
     "name"=>"Joe King",
     "picture"=>
      "https://lh3.googleusercontent.com/a/AAcHTte67VPNyMFcu7IzIp485r8W69YTEUlxJzhNx8sc-EQ2Tjs=s96-c"
    }
  }
}
```
