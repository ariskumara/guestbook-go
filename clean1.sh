#Setup Env Vars
export REGION=$1
export NODE_ROLE_NAME=$2
export CLUSTER_NAME=$3

set +x
echo "========================"
echo "------CLEANUP BEGIN-----"
echo "========================"
set -x

rm alb-ingress-controller.yaml
kubectl delete svc/guestbook-blue svc/guestbook-green svc/redis-master-blue svc/redis-master-green svc/redis-slave-blue svc/redis-slave-green svc/redis-slave svc/redis-master -n guestbook-ns
kubectl delete deploy/guestbook-blue deploy/guestbook-green deploy/redis-master-blue deploy/redis-master-green deploy/redis-slave-blue deploy/redis-slave-green -n guestbook-ns
kubectl delete ingress alb-ingress -n guestbook-ns
kubectl delete deploy alb-ingress-controller -n kube-system
set +x
echo "======================"
echo "------CLEANUP END-----"
echo "======================"
set -x