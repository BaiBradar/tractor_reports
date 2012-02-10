class Report < ActiveRecord::Base
  belongs_to :user, :tractor_drivers, :lands, :operation, :tractors
end
