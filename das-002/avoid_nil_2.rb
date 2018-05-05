################################ That is another way for avoiding nil ###################################

#1# invert the object relationship 
	## this happened here by putting(calling) the subscription into the person class not vice versa (putting(calling) the person into Subscription.
#2# guard against nils in a manual attribute reader 
	## this happened accordingly if  we define custom attribute reader method that raises an exception if the attribute does not exist 

#3# introduce new domain concepts 	
	## by introducing subscriber domain

######################################## The details goes here ###########################################

#@1# 
# every thing would be inside out 
class Person_1
   
end 

class Subscription_1
	attr_reader :person
	@person  = Person_1.new 
end 

subscription = Subscription_1.new
person = subscription.person
###########################################################

#@2#
# Here we want to are just localizing the failure instead of raising nil a better solution for that in @3 section 
class Person_2

	def subscribe! 
		@subscription = Subscription_2.new
	end 
	
	def subscription
		@subscription or raise NoSubscriptionError
	end 
end 

class NoSubscriptionError < Exception 
end 

class Subscription_2 
end 

person = Person_2.new 
if false
	person.subscribe!
end 
	puts person.subscription
###########################################################

#@3#
class Person_3 
	def subscribe
		Subscriper.new(Subscription_3.new)
	end 
	
end 

class Subscriber
	attr_reader :subscription
	def initialize(subscription)
		@subscription = subscription 
	end 
end 



class Subscription_3 
end 

person = Person_3.new 
if true 
	subscriber = person.subscribe
	puts subscriber.subscription
end 


