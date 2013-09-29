actions :enable, :disable

attribute :docroot, :default => true
attribute :variables

def initialize(*args)
  super
  @action = :enable
end
