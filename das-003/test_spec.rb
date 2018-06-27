require 'test/unit'
require './spec'

class TestDescribe < Test::Unit::TestCase   
	def test_that_it_can_pass 
		#when I have nested blocks they dislock the environment chain of that class
		#so the it method is not defined ,t
		describe 'some thing' do
		   it 'has some property' do 
		   end	   
		end
	end
	def test_it_can_fail 
		assert_raise(IndexError)do
			describe 'some failing' do
		 	it 'fails' do
			     raise IndexError
              		  end
                	end
	
		end
	end
	
end
