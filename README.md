<div align="center">
  <h1>Tea Service API</h1>
</div>

## Table of Contents
- [Project Overview](#project-overview)
- [Setup](#setup)
- [Endpoints](#endpoints)
- [Schema](#schema)
- [Gems](#gems)

## Project Overview

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
