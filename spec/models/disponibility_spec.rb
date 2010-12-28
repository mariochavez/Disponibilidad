require 'spec_helper'

describe Disponibility do
  it { should be_embedded_in(:room).as_inverse_of(:disponibilities) }
end
