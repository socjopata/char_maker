class ArmamentRequirement < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
end
