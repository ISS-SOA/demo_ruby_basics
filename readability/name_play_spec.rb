require 'minitest/autorun'
require 'minitest/rg'
require_relative 'name_play.rb'

describe 'Full names are properly abbreviated' do
  it 'should work with a single middle name' do
    _(formal_name('Soumya Coder Ray')).must_equal 'Soumya C. Ray'
  end

  it 'should work with more than one middle name' do
    _(formal_name('Soumya Grand Master Coder Ray')).must_equal 'Soumya G. M. C. Ray'
  end

  it 'should not alter a name with no middle name' do
    _(formal_name('Soumya Ray')).must_equal 'Soumya Ray'
  end
end
