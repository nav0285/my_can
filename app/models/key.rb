class Key < ActiveRecord::Base
   before_save :authenticate_key

   attr_accessible :val

   def authenticate_key
      if val=="one"
          true
      else
          false
      end
   end
end
