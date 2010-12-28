require 'spec_helper'

describe Hotel do
  it { should embed_many(:rooms) }
end
