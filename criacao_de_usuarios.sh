#!/bin/bash

echo "Apagando usuários, grupos e diretórios caso existam..."
userdel -r -f carlos 2> /dev/null
userdel -r -f maria 2> /dev/null
userdel -r -f joao 2> /dev/null
userdel -r -f debora 2> /dev/null
userdel -r -f sebastiana 2> /dev/null
userdel -r -f roberto 2> /dev/null
userdel -r -f josefina 2> /dev/null
userdel -r -f amanda 2> /dev/null
userdel -r -f rogerio 2> /dev/null
groupdel -f GRP_ADM 2> /dev/null
groupdel -f GRP_VEN 2> /dev/null
groupdel -f GRP_SEC 2> /dev/null
rm -rf /publico 2> /dev/null
rm -rf /adm 2> /dev/null
rm -rf /ven 2> /dev/null
rm -rf /sec 2> /dev/null

echo "Criando grupo e usuários do Administrativo..."
groupadd GRP_ADM
useradd -c "Carlos - Administrativo" -m -p $(openssl passwd -crypt Senha123) -s /bin/bash -G GRP_ADM carlos
useradd -c "Maria - Administrativo" -m -p $(openssl passwd -crypt Senha123) -s /bin/bash -G GRP_ADM maria
useradd -c "Joao - Administrativo" -m -p $(openssl passwd -crypt Senha123) -s /bin/bash -G GRP_ADM joao

echo "Criando grupo e usuários de Vendas..."
groupadd GRP_VEN
useradd -c "Debora - Vendas" -m -p $(openssl passwd -crypt Senha123) -s /bin/bash -G GRP_VEN debora
useradd -c "Sebastiana - Vendas" -m -p $(openssl passwd -crypt Senha123) -s /bin/bash -G GRP_VEN sebastiana
useradd -c "Roberto - Vendas" -m -p $(openssl passwd -crypt Senha123) -s /bin/bash -G GRP_VEN roberto

echo "Criando grupo e usuários do Secretariado..."
groupadd GRP_SEC
useradd -c "Josefina - Secretariado" -m -p $(openssl passwd -crypt Senha123) -s /bin/bash -G GRP_SEC josefina
useradd -c "Amanda - Secretariado" -m -p $(openssl passwd -crypt Senha123) -s /bin/bash -G GRP_SEC amanda
useradd -c "Rogerio - Secretariado" -m -p $(openssl passwd -crypt Senha123) -s /bin/bash -G GRP_SEC rogerio

echo "Criando diretórios e especificando as permissões e grupos..."
mkdir /publico
chmod 777 /publico

mkdir /adm
chown -R root:GRP_ADM /adm
chmod 770 /adm

mkdir /ven
chown -R root:GRP_VEN /ven
chmod 770 /ven

mkdir /sec
chown -R root:GRP_SEC /sec
chmod 770 /sec

echo "FIM!!!"