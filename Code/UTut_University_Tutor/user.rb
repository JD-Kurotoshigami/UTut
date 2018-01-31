class User
     attr_accessor :username

     def initialize(attributes = {})
          @name  = attributes[:username]
     end
end