require 'spec_helper'

describe Message do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of :body }
  it { should belong_to :sender }
  it { should belong_to :receiver }
  it { should validate_presence_of :receiver_id }
end
