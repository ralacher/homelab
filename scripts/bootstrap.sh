#/bin/bash
swapoff -a 

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -

add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
add-apt-repository "deb https://baltocdn.com/helm/stable/debian/ all main"

apt update
apt install kubeadm kubelet kubectl docker-ce docker-ce-cli containerd.io helm

kubeadm init
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
