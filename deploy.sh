# deploy.sh
docker build -t mitchm101/multi-client:latest -t mitchm101/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t mitchm101/multi-server:latest -t mitchm101/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t mitchm101/multi-worker:latest -t mitchm101/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push mitchm101/multi-client:latest
docker push mitchm101/multi-server:latest
docker push mitchm101/multi-worker:latest

docker push mitchm101/multi-client:$SHA
docker push mitchm101/multi-server:$SHA
docker push mitchm101/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server-mitchm101/multi-server:$SHA
kubectl set image deployments/client-deployment client-mitchm101/multi-client:$SHA
kubectl set image deployments/worker-deployment worker-mitchm101/multi-worker:$SHA