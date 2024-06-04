require 'word_do_word'

RSpec.describe Wordling::Analyzer do
  describe '#analyze_folder' do
    let(:analyzer) { Wordling::Analyzer.new(stop_words: ['the', 'and'], lemmatization: false) }
    let(:folder_path) { 'spec/test_data' }

    it 'returns word frequency hash' do
      expected_result = { 'cat' => 3, 'dog' => 3, 'chasing' => 2, 'barking' => 2, 'at' => 1 , 'is'  => 4,'mouse'=>1}
      result = analyzer.analyze_folder(folder_path)
      expect(result).to eq(expected_result)
    end

    it 'returns word frequency hash for files matching the pattern' do
      expected_result = { 'cat' => 1, 'dog' => 2, 'chasing' => 1, 'barking' => 1,'is'=>2}
      result = analyzer.analyze_folder(folder_path, 'text1*')
      expect(result).to eq(expected_result)
    end
    context 'without stopwords' do
      let(:analyzer) { Wordling::Analyzer.new(stop_words: [], lemmatization: true) }
      it 'returns word frequency without stop words' do
        expected_result = {"at"=>1, "bark"=>2, "be"=>4, "cat"=>3, "chase"=>2, "dog"=>3, "mouse"=>1, "the"=>7}
        result = analyzer.analyze_folder(folder_path)
        expect(result).to eq(expected_result)
      end
    end

    context 'with lemmatization enabled' do
      let(:analyzer) { Wordling::Analyzer.new(stop_words: ['the', 'and'], lemmatization: true) }

      it 'returns word frequency hash with lemmatization' do
        expected_result = { 'cat' => 3, 'dog' => 3, 'chase' => 2, 'bark' => 2,'at' => 1 , 'be'  => 4,'mouse'=> 1}
        result = analyzer.analyze_folder(folder_path)
        expect(result).to eq(expected_result)
      end
    end
  end
end