# Quiz-App

Quiz-App is a dynamic mobile application designed to engage both students and instructors through interactive quizzes and note-taking functionalities. The app features role-based access control, allowing instructors to create, edit, and delete questions while students can answer questions, receive instant feedback, and manage their personal notes. This application is implemented using the Bloc (Business Logic Component) pattern for state management, ensuring a clear separation between the presentation layer and the business logic, which enhances maintainability and testability.

## Features

1. **User Authentication**:
   - Sign up, login, logout.
   - Change username or password.
   - Delete account.

2. **User Authorization**:
   - Sign up, login, logout, change username or password, delete account, reading and answering questions for all users.
   - Creating, updating, and deleting questions for instructors only.
   - Creating, viewing, updating, and deleting notes for all users.

3. **Question Interaction**:
   - Read and answer questions.
   - Receive instant feedback on answers.

4. **Personal Note Management**:
   - Create, read, update, and delete personal notes.
   
5. **Instructor Privileges**:
   - Only instructors can create, edit, and delete questions.

## State Management with Bloc

The application utilizes the Bloc pattern for state management, ensuring a clear separation of concerns and a unidirectional data flow. This approach enhances the scalability and maintainability of the codebase.

### Benefits of Using Bloc

- **Separation of Business Logic**: The Bloc pattern allows you to separate business logic from UI components, making the code more modular and easier to test.
- **Unidirectional Data Flow**: Ensures a predictable state management system by having a single direction for data flow.
- **Reusability**: Business logic can be reused across different parts of the application.

### Structure

- **Blocs**: Contain the business logic and handle events to produce new states.
- **Events**: Represent the actions that can occur in the application (e.g., user login, question answered).
- **States**: Represent the various states of the application (e.g., authenticated, quiz loaded, feedback received).

## Members

| Name                 | ID          |
| -------------------- | ----------- |
| `Abdulselam Abdurehman` | `UGR/2455/14` |
| `Daniel Asrat`           | `UGR/4100/14` |
| `Jemil Shikuri`          | `UGR/4296/14` |
| `Metsnanat Asfaw`        | `UGR/7631/12` |
