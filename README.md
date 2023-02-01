# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch` 
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.

## Notes

1. `npm install -g hana-cli` is open-source sample utility. It creates a `package.json` file in the `db` folder.  
2. `hana-cli` createModule for creating the module.
3. `cds bind -2 yt03-db-inst:SharedDevKey` to bind CAP to the HDI Service.
4. `cds watch --profile hybrid` to run the app locally & use the binding configuration to connect to our remote HANA database.
5. `cds add approuter` to install the approuter. This module is very important as it will become the entry point for your application. 
    Every request coming to this module will be routed into the different backend services. Since the web module will be receiving the requests and routing them into the proper processing backend services, such as the OData service you have just tested, it will also be responsible for enforcing authentication.
    These routing logic is done by an application called approuter. You can see the Node.js module being called as the starting script for the web module as defined in the file package.json.
    <br> ref. https://www.npmjs.com/package/@sap/approuter
    <br>

    ```
    {
      "source": "^/(.*)$",
      "target": "$1",
      "destination": "srv-api",
      "authenticationType": "xsuaa",
      "csrfProtection": true
    }
    ```
    Among other information, this configuration is declaring that requests containing the pattern `^/(.*)$` are routed to a destination called srv-api. This destination was defined by the wizard in the mta.yaml file and points the service layer of our CAP application.

6. `cds compile srv/ --to xsuaa > xs-security.json` updates the xs-security.json with the scopes & the roles from the srv folder.
7. `cf create-service xsuaa application yt03-auth -c xs-security.json` to create the xsuaa service instance.
8. `cf create-service-key yt03-auth default` to create the service key.
9. `cds bind -2 yt03-auth:default` to bind it with the security XSUAA service.


