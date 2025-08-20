# 🗓️ Schedule Maker

A simple task scheduling web application that lets users add, manage, and track their tasks — built using **JSP**, **Servlets**, and **MySQL**.

---

## 🚀 Features

- ✅ Add new tasks (Title, Description, Status)
- 📋 View all tasks categorized as:
  - **Pending**
  - **Completed**
  - **Deleted**
- 🔁 Move tasks between statuses:
  - Mark Pending ➝ Completed
  - Mark Completed ➝ Pending
  - Mark Pending/Completed ➝ Deleted
- 🧹 Permanently delete tasks from the Deleted list
- 🔔 Success messages for every status update
- 🌐 Fully responsive UI with Bootstrap

---

## 🧰 Tech Stack

| Layer       | Technology                |
|-------------|----------------------------|
| Frontend    | HTML, CSS, Bootstrap, JSP |
| Backend     | Java Servlets (JSP + JDBC)|
| Database    | MySQL                     |
| Server      | Apache Tomcat             |
| IDE         | Eclipse                   |

---

## 🏗️ Project Structure

Java_Schedule_Maker_Project
│
├── src
│ └── main
│ ├── java
│ │ └── com
│ │ └── test
│ │ ├── db
│ │ │ ├── DBConnection.java
│ │ │ └── task_db.sql
│ │ └── servlets
│ │ ├── AddTaskServlet.java
│ │ └── UpdateStatusServlet.java
│ │
│ └── webapp
│ ├── META-INF
│ ├── WEB-INF
│ ├── addTask.jsp
│ ├── completedTasks.jsp
│ ├── deletedTasks.jsp
│ ├── index.css
│ ├── index.jsp
│ └── pendingTasks.jsp
│
├── build
│
└── Web App Libraries

🙋‍♂️ Author
 👤 Chaitanya Barappadi
 📧 chaitanya.barappadi07@gmail.com
 🏫 BVC College of Engineering
