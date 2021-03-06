```ruby
class RegisterAccountCommand < Commandos::IAmACommand
  values do
    string :identity
    string :password
    string :password_confirmation
  end

  validates_presence_of \
    :identity,
    :password,
    :password_confirmation

  validate \
    :password_confirmation!

private
  def password_confirmation!
    unless password_confirmation == password
      errors.add :password_confirmation, "doesn't match password"
    end
  end
end

class RegisterAccountHandler
  def initialize(command)
    @command = command 
  end

  def call
    return command unless command.valid?
    account_to_register = Account.new command.attributes
    account_to_register.save!
  end
end


class AccountCommandRegistry < IAmACommandRegistry
  def initialize
    register RegisterAccountCommand, handler: RegisterAccountHandler
  end
end

class AccountService
  def initialize
    @dispatcher = Commandos::Dispatcher.new registry: AccountCommandRegistry.new
  end

  def register_account(safe_params)
    dispatcher.dispatch RegisterAccountCommand.new safe_params
  end

private
  attr_reader :dispatcher
end
```
