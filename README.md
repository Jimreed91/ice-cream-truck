# Project Name
> Outline a brief description of your project.
> Live demo [_here_](https://www.example.com). <!-- If you have the project hosted somewhere, include the link here. -->

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Screenshots](#screenshots)
* [Setup](#setup)
* [To Do](#to-do)
* [Endpoints](#endpoints)

<!-- * [License](#license) -->


## General Information
- Ice cream truck API
- Manages the inventory and sales of an icecream truck or fleet of icecream trucks
- API calls can be made to check stock levels and profit or to place an order


## Technologies Used
- Ruby on Rails 6
- Rspec
- FactoryBot
- SimpleCov


## Screenshots

![Image](https://i.ibb.co/pnJX2v4/icecreamrspec.png)


## Setup
Assuming you have Ruby and RoR set up already....
- Clone the repo
- run 'bundle install' to install gems
- run 'rails db:create db:migrate db:seed' to set up the database
- run 'rails s' to launch the dev server
- run 'rspec' to test everything is working

## To do
- Implement restocking endpoint
- Use Active record Transaction block to secure order transactions
- Implement create truck entpoint

# Endpoints
## Truck
### GET /trucks/
-Returns total profit of all trucks
-Lists each truck along with its current profit
- Response example:
```
{
"total_profit": 3100,
    "trucks": [
        {
            "truck": {
                "id": 1,
                "profit": 2000,
                "created_at": "2022-10-12T14:50:26.674Z",
                "updated_at": "2022-10-12T14:50:26.674Z"
            }
        },
        {
            "truck": {
                "id": 2,
                "profit": 1100,
                "created_at": "2022-10-12T16:57:25.816Z",
                "updated_at": "2022-10-12T16:57:25.816Z"
            }
        },
}
```
### GET /trucks/:id
-Returns a truck by id with full details of its generated profit and remaining stock
```
{
    "truck": {
        "truck_id": 1,
        "profit": 4800,
        "icecreams": [
            {
                "flavour": "Pistachio",
                "in_stock": 0
            },
            {
                "flavour": "Chocolate",
                "in_stock": 22
            }
        ],
        "snackbars": [
            {
                "name": "Kitkat",
                "in_stock": 27
            }
        ],
        "shaved_ices": [
            {
                "name": "Peach",
                "in_stock": 15
            }
        ]
    }
}
```

## Product
### POST /products/
- Creates a new product for the icecream truck to sell
- Request body: 
```{
    "product":{
        "type": "Icecream",
        "price": "150",
        "name": "Rum and Raisin"
    }
```
### PUT /products/:id
- Edits the details of an existing product by id
- Request body:
 ```{
    "product":{
        "type": "Icecream",
        "price": "150",
        "name": "Chunky Bacon"
    }
```
### GET /products/
- Returns all products
- Response example: 
 ```
 {
    "products": [
        {
            "id": 1,
            "price": 100,
            "name": "Pistachio",
            "created_at": "2022-10-12T14:50:26.535Z",
            "updated_at": "2022-10-12T14:50:26.535Z"
        },
        {
            "id": 2,
            "price": 50,
            "name": "Chocolate",
            "created_at": "2022-10-12T14:50:26.548Z",
            "updated_at": "2022-10-12T14:50:26.548Z"
        },

        {
            "id": 6,
            "price": 50,
            "name": "Kitkat",
            "created_at": "2022-10-12T14:50:26.619Z",
            "updated_at": "2022-10-12T14:50:26.619Z"
        }
        ]
 }
 ```

### GET /products/:id
- Returns one product by id
- Response example : 
```
{
        {
            "id": 6,
            "price": 50,
            "name": "Kitkat",
            "created_at": "2022-10-12T14:50:26.619Z",
            "updated_at": "2022-10-12T14:50:26.619Z"
        }
}
```

## Order

### POST /trucks/:id/orders
- Creates a new order with pending status
- Request body :
 ```
 "order": {
             "order_products_attributes": [{ "quantity": 3,
                                           "product_id": 1 },
                                         { "quantity": 2,
                                           "product_id": 2 }]
           }
 ```
 - Response example :
  ```
  {
    "id": 16,
    "truck_id": 1,
    "total": 400,
    "status": "pending",
    "created_at": "2023-01-26T13:48:58.273Z",
    "updated_at": "2023-01-26T13:48:58.273Z"
}
  ```
### PUT /orders/:id
- Updates an existing order if it is still pending
- Request body :
 ```
 {
   order: {
              order_products_attributes: [{ id: 1,
                                            quantity: 1,
                                            product_id: 1 }]
            }
 }
 
 ```
 ### PATCH /orders/:id
 - Confirms the order and carries out transaction to update truck inventory and profit
 - If there is sufficient stock to fill the order "ENJOY" is sent as the response
 - If stock is insufficient "SO SORRY" is returned
