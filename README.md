# dev-setup
This is a bash script file to setup the applications and services.

#  To run this bash file
1. In terminal navigate to the folder where  this file(dev-setup.sh) is present.
2. run "./dev-setup.sh"

Now it will start installing the applications and server

-------------------------------------------------------------------------------------------------------------------------------

# To configure kibana
1. On browser open "http://localhost:5601"
2. It will ask for enrollment token, 
    To get the enrollment token run "sudo /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana"
    Above command will return something like"eyJ2ZXIiOiI4LjYuMiIsImFkciI6WyIxOTIuMTY4LjEuMTAwOjkyMDAiXSwiZmdyIjoiOWZnY2x5Tm5BQkFBQUFBQUFBQUFBQT09In0="
    
3. Now it will ask for 'verificatin token', to get 'verificatin token' run "sudo /usr/share/kibana/bin/kibana-verification-code"
    Above command will returnsomething like "Your verification code is: 123456"
    
4. Now it will ask for "UserName" and "Password"
    Enter "UserName" as "elastic"
    we do nto know the password so we will reset the password by running "sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic"
    Above command will return something like 
    "Password for the [elastic] user successfully reset.
    New value: R27lNPk*nWJ589tFm-aT"

# To configure MySQL user
1. To set root user password, run "sudo mysql -u root"
   Now run "ALTER USER 'root'@localhost IDENTIFIED WITH mysql_native_password BY 'YOUR_NEW_PASSWORD';"
   Then run "FLUSH PRIVILEGES;"
