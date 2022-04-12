CHARTS_UPLOADER = docker.io/kubegems/charts-uploader:latest

package:
	 rm -rf charts/*.tgz
	 bash generate_repo.sh

dry-run:
	 bash helm_dry_run.sh

build:
	 docker build -t $(CHARTS_UPLOADER) -f Dockerfile .

build-push:
	 docker build -t $(CHARTS_UPLOADER) -f Dockerfile .
	 docker push $(CHARTS_UPLOADER)

init-chartmuseum:
	 bash init_chartmuseum.sh

apply:
	#kubectl delete job charts-uploader
	kubectl create job charts-uploader --image=$(CHARTS_UPLOADER)
