# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))

require 'human'
require 'pet'
require 'job'

describe Human do
  let(:mocked_pet)  { instance_double('Pet', name: 'Utopic Unicorn') }
  let(:stubbed_pet) { instance_double('Pet') }
  let(:null_job)    { instance_double('Job').as_null_object }
  let(:mocked_job)  { instance_double('Job', salary: "Money can't buy hapiness") }
  let(:developer)   { Job.new('0.044 bitcoin') }
  let(:kitty)       { Pet.new('Kotka') }
  let(:bob)         { described_class.new }

  # example of pet mocking
  describe '#pets_name' do
    it 'returns mocked pet name' do
      bob.pet = mocked_pet
      expect(bob.pets_name).to eq('Utopic Unicorn')
    end

    # example with instance of Pet to make sure that method works not only with a mock
    it "returns real pet's name" do
      bob.pet = kitty
      expect(bob.pets_name).to eq('Kotka')
    end
  end

  # example of pet stubbing
  describe '#pet_has_name?' do
    it 'returns happy message if pet passed' do
      # pass double of real pet (like Pet.new) without name
      bob.pet = stubbed_pet
      expect(bob.has_pet?).to eq('Has awesome pet')
    end

    it 'returns sad message if no pet passed' do
      expect(bob.has_pet?).to eq('No pet yet;(')
    end
  end

  describe '#salary' do
    # example of job doubling to check that we can call that itself
    it 'returns job itself without error' do
      bob.job = null_job
      expect(bob.salary).to eq(null_job)
    end

    # example of job mocking
    it 'returns mocked salary' do
      bob.job = mocked_job
      expect(bob.salary).to eq("Money can't buy hapiness")
    end

    # example with instance of job
    it "returns bob's real salary" do
      bob.job = developer
      expect(bob.salary).to eq('0.044 bitcoin')
    end
  end
end
