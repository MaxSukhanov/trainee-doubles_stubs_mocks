# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))

require 'human'
require 'pet'
require 'job'

describe Human do
  let(:bob) { described_class.new }

  describe '#pet_name' do
    let(:mocked_pet) { instance_double('Pet', name: 'Utopic Unicorn') }
    let(:kitty) { Pet.new('Kotka') }

    it 'returns mocked pet name' do
      bob.pet = mocked_pet
      expect(bob.pet_name).to eq('Utopic Unicorn')
    end

    it "returns real pet's name" do
      bob.pet = kitty
      expect(bob.pet_name).to eq('Kotka')
    end
  end

  # example of pet stubbing
  describe '#has_pet?' do
    let(:stubbed_pet) { instance_double('Pet') }
    let(:real_pet) { Pet.new('Zebra') }

    it 'returns happy message if pet passed' do
      allow(stubbed_pet).to receive(:name)
      bob.pet = stubbed_pet
      expect(bob.has_pet?).to eq("Has awesome pet #{stubbed_pet.name}")
    end

    it 'returns nil if no pet passed' do
      expect(bob.has_pet?).to be_nil
    end

    it 'returns a response with real pet name' do
      bob.pet = real_pet
      expect(bob.has_pet?).to eq('Has awesome pet Zebra')
    end
  end

  describe '#salary' do
    let(:null_job)    { instance_double('Job').as_null_object }
    let(:mocked_job)  { instance_double('Job', salary: '700$') }
    let(:stubbed_job) { instance_double('Job') }
    let(:developer)   { Job.new('0.044 bitcoin') }

    it 'returns phrase with mocked salary' do
      bob.job = mocked_job
      expect(bob.salary).to eq("I'm paid 700$ every month")
    end

    it 'returns phrase with stubbed salary' do
      bob.job = stubbed_job
      allow(stubbed_job).to receive(:salary)
      expect(bob.salary).to eq("I'm paid #{stubbed_job.salary} every month")
    end

    it "returns bob's real salary" do
      bob.job = developer
      expect(bob.salary).to eq("I'm paid 0.044 bitcoin every month")
    end
  end
end
