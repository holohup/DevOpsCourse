docker build -t holohup/frontend frontend
docker build -t holohup/backend backend
docker push holohup/frontend
docker push holohup/backend
