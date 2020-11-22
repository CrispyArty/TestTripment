# README

This is a test application for Tripment

## Install
```
bundle install
rails db:create db:migrate
```

## Run the application
```
rails s
```

## Run parser for medical procedures
```
rails parse_procedures
```

## Endpoint for medical procedures
```
/procedures?q={query}
```

## Run tests
```
rspec
```