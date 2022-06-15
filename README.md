# TF-AZ - Terraform Azure Linux

From https://docs.microsoft.com/en-us/azure/developer/terraform/create-linux-virtual-machine-with-infrastructure


## Run & Verify the results

Run `terraform apply` to apply the execution plan to your cloud infrastructure.

`terraform apply`

To use SSH to connect to the virtual machine, do the following steps:

1. Run [terraform output](https://www.terraform.io/cli/commands/output) to get the SSH private key and save it to a file.

    ```console
    terraform output -raw tls_private_key > id_rsa
    ```

1. Run [terraform output](https://www.terraform.io/cli/commands/output) to get the virtual machine public IP address.


    ```console
    terraform output public_ip_address
    ```

1. Use SSH to connect to the virtual machine.

    ```console
    ssh -i id_rsa azureuser@<public_ip_address>
    ```

Don’t forget to destroy your Terraform environment with `terraform destroy` if you no longer need it.

## To change admin user and ssh key

Under `plan`:

```
computer_name  = "myvm"
    admin_username = "ubuntu"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "ubuntu"
	public_key = file("~/.ssh/id_rsa.pub")
    }
```

## To change from Ubuntu to Debian

```sh
$ az vm image list-offers -p debian -l eastus | grep name
    "name": "debian-10",
    "name": "debian-10-daily",
    "name": "debian-11",
    "name": "debian-11-daily",
    "name": "debian-12-daily",
    "name": "debian-sid-daily",

$ az vm image list -p debian -l eastus --offer debian-11 --all | grep sku | sort -u
    "sku": "11",
    "sku": "11-backports",
    "sku": "11-backports-gen2",
    "sku": "11-gen2",
```
