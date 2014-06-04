require 'rails_helper'

RSpec.describe Picture, :type => :model do
  it { should have_property :title }
  it { should have_property :description }
  it "has a picture"

end
