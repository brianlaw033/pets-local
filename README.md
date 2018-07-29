# Pets Local

This application is api only. I use Postman to test them.

## Getting Started

### Prerequisites

ruby 2.4.3

rails 5.2

### Installation

Install the gems

```
bundle
```

Then config the `database.yml` to suit your needs

Finally, setup the database

```
rails db:create db:migrate db:seed
```
## API

### POST /pets

Add a new pet to the system, with all the properties described above


Example JSON file to send

```
{
	"pet": {
		"name": "IT",
		"age": 1,
		"species": "dog",
		"breed": "spaniel",
		"available_from": "2018-07-29"
	}
}
```

### GET /pets/{id}

Fetch the pet by ID

### GET /pets/{id}/matches

Get an array of "matching" customers for the given pet

### POST /customers

Add a new customer to the system

Together with their preferences for pets

Example JSON file to send

```
{
	"customer": {
		"customer_preference_attributes": {
			"age": "1..5",
			"species": ["cat", "rabbit"],
			"breed": []
		}
	}
}
```

### GET /customers/{id}/matches

Get an array of "matching" Pets for the given customer


### POST /customers/{id}/adopt?pet_id={pet_id}

The Customer adopts the given Pet

The Pet and Customer should no longer appear in /matches queries