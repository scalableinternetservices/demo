# frozen_string_literal: true

require 'faker'

number_of_communities = 5
number_of_submissions_per_community = 10
number_of_comments_per_submission = 20

if ActiveRecord::Base.connection.class.name.include?('SQLite3Adapter')
  sql_function_random = 'RANDOM()'
else
  sql_function_random = 'RAND()'
end

number_of_communities.times do
  next unless Community.count < number_of_communities
  community = Community.create!(name: Faker::Lorem.sentence)
  number_of_submissions_per_community.times do
    next unless Submission.count < (number_of_submissions_per_community * number_of_communities)
    submission = Submission.create!(community: community, title: Faker::Lorem.sentence, url: Faker::Internet.url)
    number_of_comments_per_submission.times do
      if Comment.count < (number_of_comments_per_submission * number_of_submissions_per_community * number_of_communities)
        parent = Random.new.rand(0..1) > 0 ? nil : submission.comments.limit(1).order(sql_function_random).take
        Comment.create!(submission: submission, message: Faker::Lorem.paragraph, parent: parent)
      end
    end
  end
end
