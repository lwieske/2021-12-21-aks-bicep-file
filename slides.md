---
marp: true
---

<!-- _class: invert -->

## Azure AKS

---

## Azure Bicep

* Bicep is a domain-specific language (DSL) that uses declarative syntax to
  deploy Azure resources.

* It provides concise syntax, reliable type safety, and support for code reuse

* Bicep offers the best authoring experience for your infrastructure-as-code
  solutions in Azure.

---

## Azure Bicep vs ARM Template


* You can use Bicep instead of JSON to develop your Azure Resource Manager
  templates (ARM templates). 

* The JSON syntax to create an ARM template can be verbose and require
  complicated expressions. 

* Bicep syntax reduces that complexity and improves the development experience.

* Bicep is a transparent abstraction over ARM template JSON and doesn't lose any
  of the JSON template capabilities. 

* During deployment, the Bicep CLI converts a Bicep file into ARM template JSON.

* Resource types, API versions, and properties that are valid in an ARM template
  are valid in a Bicep file.

---

## Prerequisites

* You need a Bicep file to deploy. The file must be local.

* Connect to Azure by using az login.

## Deployment scope

* You can target your deployment to a

  * resource group,

  * subscription,

  * management group, or

  * tenant.

* Depending on the scope of the deployment, you use different commands.

---

## Deployment Scopes

* To deploy to a resource group, use *az deployment group create*:

```
az deployment group create --resource-group <resource-group-name> --template-file <path-to-bicep>
```

* To deploy to a subscription, use *az deployment sub create*:

```
az deployment sub create --location <location> --template-file <path-to-bicep>
```

* To deploy to a management group, use *az deployment mg create*:

```
az deployment mg create --location <location> --template-file <path-to-bicep>

```

* To deploy to a tenant, use *az deployment tenant create*:

```
az deployment tenant create --location <location> --template-file <path-to-bicep>
```