require 'rails_helper'

RSpec.describe Score, type: :model do
  it { is_expected.to have_db_column :vector }
  it { is_expected.to have_db_column :expected }
  it { is_expected.to have_db_column :result }
end
