tf_opts=-var-file $(VAR_FILE)
plan:
	terraform plan $(tf_opts)
apply:
	terraform apply $(tf_opts)
destroy: destroy.tfplan
	terraform apply destroy.tfplan
destroy.tfplan:
	terraform plan -destroy -out destroy.tfplan $(tf_opts)

distclean:
	rm -f *.tfstate *.tfstate.backup *.tfplan

