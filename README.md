# Easy Llama Client Gem

A Ruby gem for interacting with the Easy Llama API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easyllama-client', '>= 0.2.3'
```

## Usage

Before using the gem, you need to set the API token:

```ruby
EasyLlama::Client.api_token = ENV['EASY_LLAMA_API_TOKEN']
```

Then, you can use the gem to interact with the Easy Llama API:

```ruby
# Fetch all business locations
EasyLlama::Client.locations.all
EasyLlama::Client.locations.all(page: 2)

# Add a new business location
EasyLlama::Client.locations.create({ name: 'New Office' })

# Fetch all active learners
EasyLlama::Client.learners.all
EasyLlama::Client.learners.all(page: 2)

# Add a new learner
EasyLlama::Client.learners.create({ first_name: 'John', middle_name: 'Doe', last_name: 'Smith', title: 'SE', email: 'test@mail.com', phone: '123-456-7890', role: 'supervisor' })

# Find learner by ID
EasyLlama::Client.learners.find(1)

# Archive a learner
EasyLlama::Client.learners.archive(1)

# Update a learner
EasyLlama::Client.learners.update(1, { role: 'non-supervisor' })

# Assign a training to a learner
EasyLlama::Client.learners.assign_training_to_learner(training_id: 1, learner_id: 1)

# Unassign a training from a learner
EasyLlama::Client.learners.unassign_training_from_learner(learner_training_id: 1, learner_id: 1)

# Fetch all courses/trainings
EasyLlama::Client.trainings.all
EasyLlama::Client.trainings.all(page: 2)

# Fetch all assigned courses
EasyLlama::Client.learner_trainings.where(page: 2, learner_id: 1, training_id: 1, status: 'completed', sort: '-completed_at')
```

Read https://dashboard.easyllama.com/apidocs to see all available attributes

