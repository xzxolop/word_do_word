# wordling/lib/wordling.rb
require 'pathname'
require 'set'
require 'lemmatizer'

module Wordling
  class Analyzer
    def initialize(stop_words: [], lemmatization: false)
      @stop_words = Set.new(stop_words)
      @lemmatizer = Lemmatizer.new if lemmatization
    end

    def analyze_folder(folder_path, filename_pattern = '*')
      word_frequency = Hash.new(0)
      folder = Pathname.new(folder_path)
      folder.glob("**/#{filename_pattern}.txt").each do |file|
        words = extract_words(file)
        words.each do |word|
          word_frequency[lemmatize(word.downcase)] += 1 unless @stop_words.include?(word.downcase)
        end
      end
      word_frequency
    end

    private

    def extract_words(file)
      content = File.read(file)
      content.downcase.scan(/\b\w+\b/)
    end

    def lemmatize(word)
      @lemmatizer ? @lemmatizer.lemma(word) : word
    end
  end
end