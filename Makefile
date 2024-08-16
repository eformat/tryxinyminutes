REGISTRY ?= quay.io
REPOSITORY ?= $(REGISTRY)/eformat/tryxinyminutes

IMG := $(REPOSITORY):latest

podman-build:
	podman build . -t ${IMG} -f Containerfile

podman-push: podman-build
	podman push ${IMG}

ocp:
	oc new-project tryxinyminutes
	oc new-app ${IMG}
	oc expose svc/tryxinyminutes --port=3000
