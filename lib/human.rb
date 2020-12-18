class Human
  def initialize(job: 'No job', pet: nil)
    @job = job
    @pet = pet
  end

  def has_pet?
    @pet.nil? ? 'No pet yet;(' : 'Has awesome pet'
  end

  def pets_name
    return @pet.name if @pet
  end

  def salary
    @job.salary
  end
end
