## My implementation of the 2nd homework

There are separate CI and CD actions, and a third full_flow action to wrap them all.

### CI
- Ignores pushes to main, since noone should push to main
- On other pushes, it builds the image and pushes it to Dockerhub
- Around 5% is cached using github cache (and Docker BuildX)

### CD

- Deploys to the server
- Does a smoke test
- Sends a telegram notification


## My implementation of the 1st homework

Three decisions were made:

1) The database (notes.json file) was made persistent through docker mapping - in case we would like to do a backup, or persist between docker purges and server reboots. So the server has two files now: docker-compose.yml and notes.json which is mapped inside the *backend* container
2) Both frontend and backend Dockerfiles introduce an unprivileged user to run - it adds some Dockerfile code overhead to fix permissions, but is safer
3) Since it is a CRS, the nginx is inside the frontend container - no need to introduce the 3rd service, everything’s static
4) new feature! self-signed certificates now promote https!


## 📸 Screenshots

| Site | Terminal |
|:--------:|:-------:|
| ![App Screenshot](./img/1.png) | ![Terminal Screenshot](./img/2.png) |

# DevOps Course project

This is a playground project consisting of a frontend (React) and a backend (Node.js/Express) apps for deployment training.

---

## 🚀 Getting Started

### 🔧 Prerequisites

Make sure you have the following installed:

- [Node.js](https://nodejs.org/)
- npm (comes with Node.js)

---

## 📦 Install & Run

### ▶️ Frontend
```bash
cd frontend
npm install
npm start
```
### ▶️ Backend
```bash
cd backend
npm install
node index.js
```
---
