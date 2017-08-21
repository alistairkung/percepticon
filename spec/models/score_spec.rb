require 'rails_helper'

RSpec.describe Score, type: :model do
  let(:subject)      { described_class.new }
  let(:score_params) { { 'title' => 'test headline' } }
  let(:output)       { %w[1 0 0 0] }

  it { is_expected.to have_db_column :vector }
  it { is_expected.to have_db_column :expected }
  it { is_expected.to have_db_column :result }

  describe 'Initialisation' do
    it 'has a list of starting pronouns' do
      expect(described_class::STARTING_PRONOUNS).to be
    end

    it 'has a list of key words' do
      expect(described_class::KEY_WORDS).to be
    end

    it 'has a list of key phrases' do
      expect(described_class::KEY_PHRASES).to be
    end
  end

  describe '#parse' do
    context 'good inputs' do
      it 'turns a string into a vector' do
        subject.parse(score_params)
        expect(subject.vector).to eq output
      end

      it 'saves the result' do
        expect { subject.parse(score_params) }.to change { Score.count }.by 1
      end
    end

    context 'bad inputs' do
    end
  end
end
