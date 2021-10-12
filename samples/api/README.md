# 'Thing' API Documentation

This is a boilerplate example of documenting a fake API. It is provided purely as an example of standarised API docs

Put details of real API(s) here, or remove this section if it's not relevant to this project.

## OpenAPI Spec

[Link to full Swagger/OpenAPI spec here](./api-spec.yaml)

## Operations

The API is RESTful and supports the following operations

| Method | Path              | Description          | Input   | Returns          |
| ------ | ----------------- | -------------------- | ------- | ---------------- |
| GET    | /api/thing        | Get all things       | None    | Array of _Thing_ |
| POST   | /api/thing        | Create a new thing   | _Thing_ | New _Thing_      |
| PUT    | /api/thing/_{id}_ | Update thing with id | _Thing_ | Updated _Thing_  |
| DELETE | /api/thing/_{id}_ | Delete thing with id | id      | Empty            |

### Status Codes

- **200** - On GET, POST and PUT, body will contain the existing/updated entity in JSON (see below)
- **204** - Upon successful deletion, no body will be returned
- **400** - Invalid request, e.g. PUT or POST
- **404** - The requested {id} was not found, no body will be returned
- **500** - Something bad happened

JSON error object will be returned on 400 and 500 errors

```json
{
  "message": "Description of the error",
  "component": "Component returning the error",
  "code": "Internal error code"
}
```

## Entity Schema

The API returns and accepts 'things' with the following entity structure
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
