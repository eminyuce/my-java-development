JWT Authentication Token Generator for Tm-Core-API
This Java JAR file provides a command-line utility for generating JSON Web Tokens (JWTs) that can be used for authentication in Tm-Core-API projects. This README will guide you on how to install and use this utility.

Installation
To use the JWT Authentication Token Generator from the command line, follow these steps:

Download the JAR File: Download the JAR file for the JWT Authentication Token Generator from the GitHub releases page. Make sure to download the latest version.

Store the JAR File: Place the downloaded JAR file (e.g., jwtToken.jar) in a directory of your choice.

Usage
To generate a JWT token using the command-line utility, open your terminal and run the following command:

bash
Copy code
java -jar jwtToken.jar
By default, this will generate a JWT token with the following settings:

Issuer: "your-issuer"
Subject: "your-subject"
Expiration Time: 1 hour (3600000 milliseconds)
Secret Key: "your-secret-key"
You can customize these settings by passing command-line arguments as follows:

bash
Copy code
java -jar jwtToken.jar --issuer your-issuer --subject your-subject --expiration 3600000 --secret your-secret-key
--issuer: Set the issuer of the JWT token.
--subject: Set the subject of the JWT token.
--expiration: Set the expiration time of the JWT token in milliseconds.
--secret: Set the secret key for token signing.
Once the command is executed, the JWT token will be generated and displayed in the terminal. You can then use this token for authentication in your Tm-Core-API project.

Example
Here's an example of how to generate a JWT token with custom settings:

bash
Copy code
java -jar jwtToken.jar --issuer my-app --subject user123 --expiration 7200000 --secret my-secret-key
This command will generate a JWT token with the following settings:

Issuer: "my-app"
Subject: "user123"
Expiration Time: 2 hours (7200000 milliseconds)
Secret Key: "my-secret-key"
The generated JWT token will be displayed in the terminal.

Contributing
If you would like to contribute to this project or report any issues, please visit the project's GitHub repository at https://github.com/your-repo/jwt-auth-token-generator.

License
This project is licensed under the MIT License.