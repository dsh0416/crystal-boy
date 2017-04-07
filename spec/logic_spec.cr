require "./spec_helper"
require "cpu"

cpu = CPU.new

macro logic_8bit(names)
  {% for name in names %}
    it "should increase {{name}}" do
      cpu.register.{{name}} = 0x0_u8
      cpu.inc_{{name}}
      cpu.register.{{name}}.should eq 0x1
    end

    it "should decrease {{name}}" do
      cpu.register.{{name}} = 0x1_u8
      cpu.dec_{{name}}
      cpu.register.{{name}}.should eq 0x0
    end

    it "should sub a and {{name}}" do
      cpu.register.a = 0x2_u8
      cpu.register.{{name}} = 0x1_u8
      cpu.sub_{{name}}
      cpu.register.a.should eq 0x1
    end

    it "should and a and {{name}}" do
      cpu.register.a = 0x1_u8
      cpu.register.{{name}} = 0x1_u8
      cpu.and_{{name}}
      cpu.register.a.should eq 0x1
    end

    it "should or a and {{name}}" do
      cpu.register.a = 0x0_u8
      cpu.register.{{name}} = 0x1_u8
      cpu.or_{{name}}
      cpu.register.a.should eq 0x1
    end

    it "should xor a and {{name}}" do
      cpu.register.a = 0x1_u8
      cpu.register.{{name}} = 0x2_u8
      cpu.xor_{{name}}
      cpu.register.a.should eq 0x3
    end

    it "should cp a and {{name}}" do
      cpu.register.a = 0x1_u8
      cpu.register.{{name}} = 0x2_u8
      cpu.cp_{{name}}
      cpu.register.f = 0b01110000_u8
    end

    it "should add a and {{name}}" do
      cpu.register.a = 0x1_u8
      cpu.register.{{name}} = 0x2_u8
      cpu.add_a_{{name}}
      cpu.register.a = 0x3_u8
    end

    it "should adc a and {{name}}" do
      cpu.register.set_c
      cpu.register.a = 0x1_u8
      cpu.register.{{name}} = 0x2_u8
      cpu.add_a_{{name}}
      cpu.register.a = 0x4_u8
    end
  {% end %}
end

describe "Logic" do 
  logic_8bit([b, c, d, e, h, l])
end

