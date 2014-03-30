class Ticket < ActiveRecord::Base
	belongs_to :project

	# created by 'rails g model ticket title:string description:text project:references'
	# The project:references part defines an integer column for the tickets table called 
	# project_id in the migration that creates the tickets table. It will also define 
	# an index on this column, so that lookups for the tickets for a specific project 
	# will be faster.

	validates :title, presence: true
	validates :description, presence: true,
							length: { minimum: 10 }
end
