# Healios

## 1. Project background

This project is a code test from Healios for a rails application to generate shorten url

### Functional Requirement

- Users can register
- The user must be able to create a short version of a URL
- The user must be able to navigate to the long version of the url by using the shortened version
- URLs must belong to a registered user
- Please count and display to the user how many times the URL has been used
- Please include a read.me that details how to
  - Install and run the app
  - Any additional information you want to convey about the app
- Please show your working in your commit history


## 2. Setup Dev Machine

### install postgresql

```bash
brew install postgresql
```

### ruby 2.7.2

```bash
rvm install 2.7.2
rvm use 2.7.2
```

### configure env

```bash
cp sample/env_samples/.env_dev .env
```

## 3. Running the application

### install dependencies

```

$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
$ rails s
```

### running test cases

```
$ rspec
```
