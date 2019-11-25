# frozen_string_literal: true

class User < ApplicationRecord
  before_create :
  has_secure_password
end
