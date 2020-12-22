# frozen_string_literal: true

class Pet
  attr_reader :name

  def initialize(name = 'myname')
    @name = name
  end
end
