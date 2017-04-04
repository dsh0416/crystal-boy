require "cpu/register"
require "cpu/logic"

class CPU
  getter register : Register = Register.new
  include CPU::Logic
end
