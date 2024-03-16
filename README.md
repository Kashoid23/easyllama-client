# Easy Llama Client Gem

A Ruby gem for interacting with the Easy Llama API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easyllama-client'
```

## Usage

Before using the Easy Llama gem, make sure to set up your API token as an environment variable:

```bash
ENV['EASY_LLAMA_API_TOKEN']
```

Then, you can use the gem to interact with the Easy Llama API:

```ruby
# Retrieve all locations
EasyLlama::Client::Locations.all

# Create a new location
EasyLlama::Client::Locations.create({ name: 'New Office' })

# Retrieve all learners
EasyLlama::Client::Learners.all

# Retrieve a specific learner
EasyLlama::Client::Learners.find(1)

# Create a new learner
EasyLlama::Client::Learners.create({ first_name: 'John', middle_name: 'Doe', last_name: 'Smith', title: 'SE', email: 'test@mail.com', phone: '123-456-7890', role: 'supervisor' })

# Update a learner
EasyLlama::Client::Learners.create(1, { role: 'non-supervisor' })

# Assign a training to a learner
EasyLlama::Client.Learners.assign_training_to_learner(training_id: 1, learner_id: 1)

# Retrieve all trainings
EasyLlama::Client::Trainings.all
```

Read https://dashboard.easyllama.com/apidocs to see all available attributes

