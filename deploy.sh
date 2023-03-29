#!/bin/sh
helm repo add cassandra https://charts.bitnami.com/bitnami
helm delete cassandra --wait || true
helm install cassandra cassandra/cassandra \
	--wait \
	--set dbUser.user=cassandra \
	--set dbUser.password=cassandra

sh -x ./verify.sh