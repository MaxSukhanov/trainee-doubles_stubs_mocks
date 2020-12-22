# frozen_string_literal: true

class Human
  attr_accessor :pet, :job

  def initialize(job: nil, pet: nil)
    @job = job
    @pet = pet
  end

  def has_pet?
    return "Has awesome pet #{@pet.name}" if @pet
  end

  def pet_name
    return @pet.name if @pet
  end

  def salary
    return "I'm paid #{@job.salary} every month" if @job
  end
end
