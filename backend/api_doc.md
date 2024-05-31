
# API Documentation

## Authentication

### POST /auth/login

**Description:** Login a user and return a JWT token.

**Request:**
```json
{
  "userId": "string",
  "role": "INSTRUCTOR" | "STUDENT",
  "password": "string"
}
```

**Response:**
```json
{
  "token": "string"
}
```

**Authority:** Public

---

## Notes

### POST /notes

**Description:** Create a new note.

**Request:**
```json
{
  "noteText": "string"
}
```

**Response:**
```json
{
  "noteText": "string",
  "owner": "string"
}
```

**Authority:** Authenticated users

### GET /notes

**Description:** Get a note by the authenticated user.

**Response:**
```json
{
  "noteText": "string",
  "owner": "string"
}
```

**Authority:** Authenticated users

### PATCH /notes

**Description:** Update a note.

**Request:**
```json
{
  "noteText": "string"
}
```

**Response:**
```json
{
  "noteText": "string",
  "owner": "string"
}
```

**Authority:** Authenticated users

### DELETE /notes

**Description:** Delete a note.

**Response:**
```json
{
  "noteText": "string",
  "owner": "string"
}
```

**Authority:** Authenticated users

---

## Users

### POST /users/signup

**Description:** Create a new user account.

**Request:**
```json
{
  "username": "string",
  "password": "string",
  "email": "string",
  "role": "INSTRUCTOR" | "STUDENT"
}
```

**Response:**
```json
{
  "username": "string",
  "password": "string",
  "email": "string",
  "role": "INSTRUCTOR" | "STUDENT"
}
```

**Authority:** Public

### PATCH /users/password

**Description:** Update user password.

**Request:**
```json
{
  "oldPassword": "string",
  "newPassword": "string"
}
```

**Response:**
```json
{
  "message": "SUCCESS"
}
```

**Authority:** Authenticated users

### DELETE /users

**Description:** Delete user account.

**Response:**
```json
{
  "username": "string",
  "password": "string",
  "email": "string",
  "role": "INSTRUCTOR" | "STUDENT"
}
```

**Authority:** Authenticated users

### PATCH /users/username

**Description:** Update username.

**Request:**
```json
{
  "newUser": "string"
}
```

**Response:**
```json
{
  "username": "string"
}
```

**Authority:** Authenticated users

---

## Questions

### GET /questions

**Description:** Retrieve a list of questions.

**Response:**
```json
[
  {
    "description": "string",
    "answer": "number",
    "options": ["string"],
    "explanation": "string"
  }
]
```

**Authority:** Authenticated users

### POST /questions

**Description:** Create a new question.

**Request:**
```json
{
  "description": "string",
  "answer": "number",
  "options": ["string"],
  "explanation": "string"
}
```

**Response:**
```json
{
  "description": "string",
  "answer": "number",
  "options": ["string"],
  "explanation": "string"
}
```

**Authority:** Authenticated users with role `INSTRUCTOR`

### PATCH /questions/:num

**Description:** Update an existing question.

**Request:**
```json
{
  "description": "string",
  "answer": "number",
  "options": ["string"],
  "explanation": "string"
}
```

**Response:**
```json
{
  "description": "string",
  "answer": "number",
  "options": ["string"],
  "explanation": "string"
}
```

**Authority:** Authenticated users with role `INSTRUCTOR`

### DELETE /questions/:num

**Description:** Delete a question.

**Response:** No content

**Authority:** Authenticated users with role `INSTRUCTOR`

---

## App

### GET /

**Description:** Redirect to the home route.

**Response:** Redirect

**Authority:** Public

### GET /home

**Description:** Serve the home page.

**Response:** HTML content

**Authority:** Public
