module Commandos
  class FakeCommandRegistry < IAmACommandRegistry
    def initialize
      register FakeCommand, handler: FakeHandler
    end
  end
end
