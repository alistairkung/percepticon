require 'rails_helper'

RSpec.describe Score, type: :model do

  it { is_expected.to have_db_column :vector }
  it { is_expected.to have_db_column :expected }
  it { is_expected.to have_db_column :result }

  it 'has a list of starting pronouns' do
    expect(Score::STARTING_PRONOUNS).to be
  end

  it 'has a list of key words' do
    expect(Score::KEY_WORDS).to be
  end

  it 'has a list of key phrases' do
    expect(Score::KEY_PHRASES).to be
  end

end
