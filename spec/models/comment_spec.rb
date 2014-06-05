require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it { should have_property :content }
  it { should have_property :picture_id }
  it { should validate_presence_of :content }
  it { should belong_to :picture }
end
