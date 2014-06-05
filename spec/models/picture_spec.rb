require 'rails_helper'

RSpec.describe Picture, :type => :model do
  it { should have_property :title }
  it { should have_property :description }
  it { should have_property :file }
  it { should have_many :comments}
end
