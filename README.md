<div align="center">
  <h1>Tea Service API</h1>
</div>

## Table of Contents
- [Project Overview](#project-overview)
- [Setup](#setup)
- [Endpoints](#endpoints)
- [Schema](#schema)

## Project Overview

This is an API to expose endpoints for a tea subscription service. It fulfills the take home project requirement for graduation from Mod 4 at Turing School of Software and Design

## Setup
This application uses Ruby 2.7.2 and Rails 5.2.8.1

1. Clone the repository
2. Navigate into the root directory
3. Install gem packages: `bundle install`
4. Setup the database: `rails db:{drop,create,migrate}`
6. Run `rails s` to start the server

## Endpoints

- ### Fetch User's Subscriptions
<details close>
<summary>Fetch All of One User's Subscriptions</summary>
<br>

GET /api/v1/subscriptions
  
  | Path Parameter        | Type          |  |
  | ------------- |:-------------:| -----:|
  | customer_id      | integer | Required |
  
  Example:
  ```
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Shanika's Dianhong Subscription",
                "price": 20.0,
                "status": "cancelled",
                "frequency": 4,
                "customer_id": 1,
                "tea_id": 9
            }
        },
        {..},
        {..}
    ]
}
  ```
<br> 
</details>


- ### Create New Subscription
<details close>
<summary>Create a New Subscription for a User</summary>
<br>

POST /api/v1/subscriptions
  
  | Path Parameter        | Type          |  |
  | ------------- |:-------------:| -----:|
  | customer_id      | integer | Required |
  | tea_id      | integer | Required |
  | frequency      | integer | Required |
  | title     | string | Optional |
  
  Example:
  ```
{
    "data": {
        "id": "3",
        "type": "subscription",
        "attributes": {
            "title": "Jerica's Tieluohan Subscription",
            "price": 20.0,
            "status": "active",
            "frequency": 4,
            "customer_id": 4,
            "tea_id": 5
        }
    }
}
  ```
<br> 
</details>

- ### Cancel a Subscription
<details close>
<summary>Cancel a User's Subscription</summary>
<br>

PATCH /api/v1/subscriptions
  
  | Path Parameter        | Type          |  |
  | ------------- |:-------------:| -----:|
  | id      | integer | Required |
  
No Response Given, Status 204 If Successful
<br> 
</details>


- ### Fetch All Teas
<details close>
<summary>Get all teas in the database</summary>
<br>

GET /api/v1/teas

  No Params Required
  
Example:
  ```
  {
    "data": [
        {
            "id": "1",
            "type": "tea",
            "attributes": {
                "title": "English Afternoon",
                "description": "Song of the Mounds of Mundburg",
                "temperature": 205,
                "brew_time": "2-4 mins",
                "unit_price": 45
            }
        },
        {..},
        {..}
    ]
  }
  
  ```
<br> 
</details>

## Schema

<img width="864" alt="Screen Shot 2023-03-02 at 10 39 19 AM" src="https://user-images.githubusercontent.com/108320490/222508515-9e517507-edee-4496-90c2-3713550a6ae4.png">

