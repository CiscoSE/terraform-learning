# How to run this example

-  Modify the public.variables.tfvars file with the following changes:
	- Create a certificate to be used for authentication to ACI

	 I like this example:
```
    openssl req -new -newkey rsa:4096 -days 36500 -nodes -x509 \
    	-keyout ~/certs/terraform.key \
    	-out ~/certs/terraform.crt \
    	-subj '/CN=myTerraformACIExample/O=Your Company/C=US'
```
- 
	- Change the apic variable to reflect the IP or FQDN of your APIC
	- Ensure that the certificate name matches a certificate name assocated with a local user in the APIC local user configuration
	- Ensure that the private key matches the private key you generated to 
