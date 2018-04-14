# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

users = [{ name: 'Kyle',      email: 'ktbh4jc@gmail.com', username: 'ktbh4jc'  },
         { name: 'Example 1', email: 'User1@example.com', username: 'example1' },
         { name: 'Example 2', email: 'User2@example.com', username: 'example2' },
         { name: 'Example 3', email: 'User3@example.com', username: 'example3' },
         { name: 'Example 4', email: 'User4@example.com', username: 'example4' },
         { name: 'Example 5', email: 'User5@example.com', username: 'example5' }]

users.each do |user|
  u = User.new(name: user[:name], email: user[:email], username: user[:username], password: 'foobar',
               password_confirmation: 'foobar')
  u.save
end
