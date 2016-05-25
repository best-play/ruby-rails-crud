# README

### Installation

`bundle install`

Setup all `.sample` files

`rake db:migrate`

`rails s`


Using
---

**POST /api/session**

Make new session.

*Request*
```json
{
     "username": "admin",
     "password": "admin"
 }
```
*Response*

```json
{
     "token": "YOUR_TOKEN_HERE"
 }
```

You must add your token to all requests by adding Authorization header.

---
**DELETE /api/session**

Remove current session token

*Response*

`nil`

---

**GET /api/users**

Fetch all users.

*Response*

```json
{
  "users": [
    {
      "id": 4,
      "username": "user",
      "email": "user@user.com"
    },
    {
      "id": 6,
      "username": "user2",
      "email": "user2@user.com"
    }
  ]
}
```
---

**POST /api/users**

Create new user.

*Request*
```json
{
    "email": "admin@admin.com",
    "username": "admin",
    "password": "admin"
}
```
*Response*

```json
{
  "id": 10,
  "username": "admin",
  "email": "admin@admin.com"
}
```
---


**GET /api/users/:id**

View user profile where `:id` is the user id.

*Response*

```json
{
  "id": 10,
  "username": "admin",
  "email": "admin@admin.com"
}
```
---


**PUT /api/users/:id**

Change user profile where `:id` is the user id.

*Request*
```json
{
    "email": "admin@admin.com",
    "username": "admin",
    "password": "admin"
}
```

*Response*

```json
{
  "id": 10,
  "username": "admin",
  "email": "admin@admin.com"
}
```
---


**DELETE /api/users/:id**

Remove user where `:id` is the user id.

*Response*

`nil`

---


**GET /api/images**

Fetch all user's images.



```json
{
  "images": [
    {
      "id": 13,
      "image": "/uploads/13/foto-priroda-1.jpg"
    },
    {
      "id": 14,
      "image": "/uploads/14/foto-priroda-2.jpg"
    },
    {
      "id": 15,
      "image": "/uploads/15/foto-priroda-3.jpg"
    }
  ]
}
```
---

**POST /api/images**

Uploading new image by user.

*Request*
```json
{
    "image": "LINK_TO_IMAGE"
}
```

*Response*

```json
{
  "id": 16,
  "image": "LINK_TO_SAVED_IMAGE"
}
```
---

**DELETE /api/images/:id**

Remove image where `:id` is the user id.

*Response*

`nil`

---

Typical Errors
---

If record not found.

*Response*
```json
{
  "error": {
    "message": "Entity not found"
  }
}
```
---

If user not unauthorized.

*Response*
```json
{
  "error": {
    "message": "User not authorized"
  }
}
```
---

Other validation errors (example).

*Response*
```json
{
  "error": {
    "message": {
      "password": [
        "can't be blank"
      ],
      "username": [
        "can't be blank"
      ],
      "email": [
        "can't be blank"
      ]
    }
  }
}
```
---