class User < ActiveRecord::Base
  has_gritter_notices

  default_scope order('id')
end
