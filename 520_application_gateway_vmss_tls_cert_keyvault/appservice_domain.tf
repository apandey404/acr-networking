module "appservice_domain" {
  # source = "../."                                    # if calling module from local machine
  source = "HoussemDellai/appservice-domain/azapi" # if calling module from Terraform Registry
  version = "1.0.2"

  providers = {
    azapi = azapi
  }

  custom_domain_name = var.custom_domain_name
  resource_group_id  = azurerm_resource_group.rg.id
  dns_zone_id        = azurerm_dns_zone.dns_zone.id

  agreedby_ip_v6    = "2a04:cec0:11d9:24c8:8898:3820:8631:d83"
  agreedat_datetime = "2024-01-01T9:00:00.000Z"

  contact = {
    nameFirst = "FirstName"
    nameLast  = "LastName"
    email     = "youremail@email.com" # you might get verification email
    phone     = "+33.762954328"
    addressMailing = {
      address1   = "1 Microsoft Way"
      city       = "Redmond"
      state      = "WA"
      country    = "US"
      postalCode = "98052"
    }
  }
}

# # App Service Domain
# # REST API reference: https://docs.microsoft.com/en-us/rest/api/appservice/domains/createorupdate
# resource "azapi_resource" "appservice_domain" {
#   type                      = "Microsoft.DomainRegistration/domains@2022-09-01"
#   name                      = var.custom_domain_name
#   parent_id                 = azurerm_resource_group.rg.id
#   location                  = "global"
#   schema_validation_enabled = true

#   body = jsonencode({

#     properties = {
#       autoRenew = false
#       dnsType   = "AzureDns"
#       dnsZoneId = azurerm_dns_zone.dns_zone.id
#       privacy   = false

#       consent = {
#         agreementKeys = ["DNRA"]
#         agreedBy      = var.AgreedBy_IP_v6    # "2a04:cec0:11d9:24c8:8898:3820:8631:d83"
#         agreedAt      = var.AgreedAt_DateTime # "2023-08-10T11:50:59.264Z"
#       }

#       contactAdmin = {
#         nameFirst = var.contact.nameFirst
#         nameLast  = var.contact.nameLast
#         email     = var.contact.email
#         phone     = var.contact.phone

#         addressMailing = {
#           address1   = var.contact.addressMailing.address1
#           city       = var.contact.addressMailing.city
#           state      = var.contact.addressMailing.state
#           country    = var.contact.addressMailing.country
#           postalCode = var.contact.addressMailing.postalCode
#         }
#       }

#       contactRegistrant = {
#         nameFirst = var.contact.nameFirst
#         nameLast  = var.contact.nameLast
#         email     = var.contact.email
#         phone     = var.contact.phone

#         addressMailing = {
#           address1   = var.contact.addressMailing.address1
#           city       = var.contact.addressMailing.city
#           state      = var.contact.addressMailing.state
#           country    = var.contact.addressMailing.country
#           postalCode = var.contact.addressMailing.postalCode
#         }
#       }

#       contactBilling = {
#         nameFirst = var.contact.nameFirst
#         nameLast  = var.contact.nameLast
#         email     = var.contact.email
#         phone     = var.contact.phone

#         addressMailing = {
#           address1   = var.contact.addressMailing.address1
#           city       = var.contact.addressMailing.city
#           state      = var.contact.addressMailing.state
#           country    = var.contact.addressMailing.country
#           postalCode = var.contact.addressMailing.postalCode
#         }
#       }

#       contactTech = {
#         nameFirst = var.contact.nameFirst
#         nameLast  = var.contact.nameLast
#         email     = var.contact.email
#         phone     = var.contact.phone

#         addressMailing = {
#           address1   = var.contact.addressMailing.address1
#           city       = var.contact.addressMailing.city
#           state      = var.contact.addressMailing.state
#           country    = var.contact.addressMailing.country
#           postalCode = var.contact.addressMailing.postalCode
#         }
#       }
#     }
#   })
# }