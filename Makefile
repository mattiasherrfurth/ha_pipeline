render:
	kubectl kustomize deploy/overlays/lab

validate:
	kubectl kustomize deploy/overlays/lab | kubeconform -strict -ignore-missing-schemas -summary

deploy:
	kubectl apply -k deploy/overlays/lab
