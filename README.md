# Dynamics 365 WebApp

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fthomasonsignup%2Fd365deploy%2Fmaster%2Fdynamics365Deploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

This template creates a Dynamics365 Web Approval Application.

# Dynamics 365 WebApp Update

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fthomasonsignup%2Fd365deploy%2Fmaster%2Fdynamics365Update.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

This template updates an existing Dynamics365 Web Approval Application.


# Instructions (Important! Follow all instructions)

# Create ExFlow Web Approval Web Service.

First Run the "Dynamics 365 WebApp" by pressing the "Deploy to Azure" button.

Fill in the Basics to select an existing or create a new resourcegroup in the selected region.

Enter a deployment name, the name needs to be 3 - 24 characters long.
If a name with a character count less than 24 characters is entered, the template with append a randomly created set of characters to make the string 24 characters.

Fill in the "App Service Plan Name" or leave blank to have it be the same as the deploymentname above.

Fill in the Dynamics365Uri with the url to your D365 environment.

Fill in the Package URI, create the Package URI by visiting https://exflowpackagemanager.azurewebsites.net/ and enter your ExFlowUserSecret and press "GENERATE URL".
Copy the newly created URI from the page into the "Package URI" in the template.

Click purchase once all necessary parameters have been filled in.

# Create Azure AD Application

Once the Web App has been deployed successfully you will need to create an Azure AD application to allow it to communicate with Dynamics 365.

Run the powershell script "dynamics365AadApp.ps1" by copying the name of the web application into the "$DeploymentName" variable and run it from the Azure Portal Powershell Cloud Shell

This will create the Azure AD Application, generate a password and supply Client ID and Password to the Web Application Settings.

You can now login to your Web Approval Application by browsing to it from the link found in the "URL" property under the Overview for the Web Application.

# Update the Web Application

When there are upgrade available for the ExFlow Web Application you can deploy them through the "Deploy to Azure" button under "Dynamics 365 WebApp Update" and supply the resourcegroup, deployment name and a newly created Package URI.
