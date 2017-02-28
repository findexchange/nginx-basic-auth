#!/bin/bash

touch /htpasswd

i=0
user=${USER_0}
password=${PASSWORD_0}

while [ "$user" ]; do
    printf "$user:$(openssl passwd -crypt "$password")\n" >> /htpasswd

    let "i += 1"
    user_var_name="USER_$i"
    user=${!user_var_name}
    password_var_name="PASSWORD_$i"
    password=${!password_var_name}
done

nginx -g "daemon off;"
