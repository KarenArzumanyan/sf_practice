echo "Add source:"
# https://apt.postgresql.org/pub/repos/apt/dists/focal-pgdg/8.4/
sudo sh -c 'echo "deb [arch=amd64]  http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
echo "Add key:"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -  
echo "Ubuntu update:"
apt-get update
echo "Install PostgreSQL 8.4:"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq postgresql-8.4
echo "Config PostgreSQL for access fromnetwork:"
echo 'listen_addresses = '"'"'*'"'" >> /etc/postgresql/8.4/main/postgresql.conf
echo 'host    all             all             0.0.0.0/0            md5' >> /etc/postgresql/8.4/main/pg_hba.conf
echo "Restart PostgreSQL:"
systemctl restart postgresql
sudo apt-get install install python3.8
sudo apt-get install python3-pip
sudo pip install psycopg2
# sudo apt install python3-django
sudo pip install django