# Work Abroad

### Development Environment Setup
#### 1. Install some dependencies for Ruby version: 2.2.2p95
```
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
```
#### 2. Install Ruby with [rbenv](https://github.com/sstephenson/rbenv)
```
cd ~
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

rbenv install 2.2.2p95
rbenv global 2.2.2p95
rbenv versions
ruby -v
```
#### 3. Installing Bundler
```
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
```
#### 4. Installing Rails version: 4.2.4
```
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
gem install rails -v 4.2.4
rbenv rehash
rails -v
```
#### 5. Creating a New MySQL User
```
mysql -u root -p
GRANT ALL PRIVILEGES ON workabroad_development.* TO 'workabroad'@'localhost' IDENTIFIED BY 'Work@1971';
GRANT ALL PRIVILEGES ON workabroad_test.* TO 'workabroad'@'localhost' IDENTIFIED BY 'Work@1971';
SHOW GRANTS FOR 'workabroad'@'localhost';
exit
```
#### 6. Clone Git Repository
```
git clone https://github.com/tahmid-tanzim/work-abroad.git
```
#### 7. Run Project
 ```
 cd <path-to-project>
 bundle install
 bundle exec rake db:create db:migrate
 rails server
 ```
The Front end is developed in [React.js](https://facebook.github.io/react/) & [Flux](https://facebook.github.io/flux/).
