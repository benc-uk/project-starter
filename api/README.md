# 'Thing' API Documentation

This is an example of some API documentation. Put more details here

## OpenAPI Spec

[Link to full Swagger/OpenAPI spec here](./api-spec.yaml)

## Operations

The API is RESTful and supports the following operations

```bash
GET    /api/thing       - Get all things
GET    /api/thing/{id}  - Get a single thing by id
POST   /api/thing       - Create a new thing
PUT    /api/thing/{id}  - Update thing with id
DELETE /api/thing/{id}  - Delete thing with id
```

### Status Codes

- 200 - On GET, POST and PUT will contain the existing/updated entity
- 204 - Upon successful deletion
- 400 - Invalid request, e.g. PUT or POST
- 404 - The requested {id} was not found, no body will be returned
- 500 - Something bad happened

## Entity Schema

The API returns and accepts things with the following entity structure
[JSON schema is here](./schema.json)

```ts
Thing {
  id:     string    // An id of this thing
  title:  string    // Title of the thing, 50 char max
  count:  number    // Count of the things
  tags:   string[]  // List of tags
}
```

## Security

Notes on security & authentication, headers, JWT etc

## Notes

Details of content types, special things to mention, edge cases etc.
