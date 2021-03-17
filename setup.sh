echo "Running apt update"
sudo apt update

echo "Installing utilities" 
sudo DEBIAN_FRONTEND=noninteractive apt install build-essential python wget curl git zip unzip -y

echo "Add Erlang Solutions repository"
wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb

echo "Running apt update"
sudo apt update

echo "Installing the Erlang/OTP platform and all of its applications:"
sudo DEBIAN_FRONTEND=noninteractive apt install esl-erlang -y

echo "Installing Elixir"
sudo DEBIAN_FRONTEND=noninteractive apt install elixir -y

echo "Installing Hex package manager"
mix local.hex --force

echo "Intalling Phoenix framework 1.5.8"
mix archive.install hex phx_new 1.5.8 --force

echo "Adding Nodejs repo"
curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -

echo  "Installing Nodejs"
sudo DEBIAN_FRONTEND=noninteractive apt install -y nodejs

echo "Installing Postgres"
sudo DEBIAN_FRONTEND=noninteractiv apt install postgresql -y

echo "Starting  Postgres"
sudo service postgresql start

echo "Changing Postgresql default password for user 'postgres' to 'postgres'"
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'postgres';"

echo "Starting inotify-tools ( required for code reload) "
sudo DEBIAN_FRONTEND=noninteractiv apt install inotify-tools -y