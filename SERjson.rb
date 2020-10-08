# Serialization with JSON
require 'json'

class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
      @name = name
      @balance = balance
  end
  def display_balance(pin_number)
      puts pin_number == @pin ?
      "Balance: #{balance}" :
      pin_error
  end
  def withdraw(pin_number, amount)
      if amount > balance
          puts too_much
      else
          if pin_number == pin
              @balance -= amount
              puts "Withdrew #{amount}. New balance: #{balance}"
          else
              pin_error
          end
      end
  end
  def deposit(pin_number, amount)
      if (pin_number == pin)
          @balance += amount
          puts "Deposited #{amount}. New balance: #{balance}"
      else
          pin_error
      end
  end
  # Only below here is different
  def to_json
    JSON.dump({
      :name => @name,
      :balance => @balance
    })
  end
  def self.from_json(string)
    data = JSON.load string
    self.new(data['name'], data['balance'])
  end
  # Only above here is inserted
  private
  def pin
      @pin = 1234
  end
  def pin_error
      "Access denied: incorrect PIN."
  end
  def too_much
      "You cannot withdraw more than you have."
  end
end

# Testing JSON
a = Account.new('John',1_000_000)
puts a.to_json

b = Account.from_json(a.to_json)
puts b.name
puts b.balance
# Testing code has ended