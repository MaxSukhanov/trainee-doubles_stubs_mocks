$LOAD_PATH.unshift(File.expand_path('lib', __dir__))

require 'human'
require 'pet'
require 'job'

describe Human do
  let(:pet) { double('pet') }
  let(:null_job) { double('job').as_null_object }
  let(:fake_job) { double('job') }
  let(:developer) { Job.new('0.044 bitcoin') }
  let(:kitty) { Pet.new('Kotka') }

  # example of pet mocking
  describe '#pets_name' do
    it 'returns mocked pet name' do
      # pass a particular value of pet's name to double of real (like Pet.new) pet
      allow(pet).to receive(:name) { 'Utopic Unicorn' }
      bob = Human.new(pet: pet)
      expect(bob.pets_name).to eq('Utopic Unicorn')
    end

    # example with instance of Pet to make sure that method works on real class
    it "returns real pet's name" do
      bob = Human.new(pet: kitty)
      expect(bob.pets_name).to eq('Kotka')
    end
  end

  # example of pet stubbing
  describe '#pet_has_name?' do
    it 'returns happy message if pet passed' do
      # pass double of real pet (like Pet.new) without name
      bob = Human.new(pet: pet)
      expect(bob.has_pet?).to eq('Has awesome pet')
    end

    it 'returns sad message if no pet passed' do
      bob = Human.new
      expect(bob.has_pet?).to eq('No pet yet;(')
    end
  end

  describe '#salary' do
    # example of job doubling to check that we can call that itself
    context 'given double as null object' do
      it 'returns job itself without error' do
        bob = Human.new(job: null_job)
        expect(bob.salary).to eq(null_job)
      end
    end

    # example of job mocking
    context 'given double job' do
      it 'returns mocked salary' do
        allow(fake_job).to receive(:salary) { "Money can't buy hapiness" }
        bob = Human.new(job: fake_job)
        expect(bob.salary).to eq("Money can't buy hapiness")
      end
    end

    # example with real job
    context 'given real job' do
      it "returns bob's real salary" do
        bob = Human.new(job: developer)
        expect(bob.salary).to eq('0.044 bitcoin')
      end
    end
  end
end
