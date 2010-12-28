require 'spec_helper'

describe Room do
  it { should be_embedded_in(:hotel).as_inverse_of(:rooms) }

  it { should embed_many(:disponibilities) }
end
