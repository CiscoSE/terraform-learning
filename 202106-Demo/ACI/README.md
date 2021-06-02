This terraform example is system specific, and not intended to run as is on other systems. In most cases, changing the locals in the aci-provider.tf file is all that is required to try this on a different system. Change the following values to create an operation terraform example environment:

* apic - Can be the ip or FQDN of the APIC you want to create the tenant on.
* cert_key - Needs to match the name (case sensitive) of the certificate associated in the account on the apic. This is not a name within the certicate itself, but the name given to the certificate in the APIC under the user configuration
* private_key - This is a file system path to the private key file associated with the public certificate saved in the APIC.
* user_name - The user name to logon to the apic with. Must be the same account that holds the certificate referenced in the cert_key.
* vmm_domain_dn - The DN for the VMM domain to map to. This has only been tested with the VMWare vmm domain.
* subnet_75 - This is a subnet that gets associated with the demo bridge domain
* l3_out - The DN for the L3 out that you want mapped to the bridge domain
