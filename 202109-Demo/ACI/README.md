# How to run this example

## Modify the public.variables.tfvars file with the following changes:
	1. Create a certificate to be used for authentication to ACI

	 	I like this example:
```
    openssl req -new -newkey rsa:4096 -days 36500 -nodes -x509 \
    	-keyout ~/certs/terraform.key \
    	-out ~/certs/terraform.crt \
    	-subj '/CN=myTerraformACIExample/O=Your Company/C=US'
```

	2. Change the "apic" variable to reflect the IP or FQDN of your APIC

	3. Ensure that the "cert_name" variable matches a certificate name associated with a local user in the APIC local user configuration. This is just a case sensitive name, and not a path. The contents of the crt file created above should be associated with this user certificate configuration. 
	
	4. Ensure that the private_key variable matches the path to the private key you generated. 
	
	5. Ensure the user_name is a local user in the APIC referenced in the "apic" variable. This should be the same user that the certificate is associated with in step 4. 

	This demo requires an L3 out (referenced by DN), subnet for the Bridge domain being created, and a VMM Domain (Referenced by DN). You must also update these before this demo will work.

## Once all requirements are met, run the following commands:

```
	terraform init -var-file public.variables.tfvars
	terraform plan -var-file public.variables.tfvars
	terraform apply -var-file public.variables.tfvars

```
