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

myAcc = Account.new('tmr',3_000_000)
myAcc.withdraw(1234,4_000_000)
myAcc.deposit(1234,500_000)
myAcc.withdraw(1234,3_500_000)
myAcc.display_balance(1234)
