require "./spec_helper"
require "cpu/register"

register = Register.new

describe "Register" do
  it "combines a and f" do
    register.af = 522_u16
    register.a.should eq 2_u8
    register.f.should eq 10_u8
    register.af.should eq 522_u16
  end

  it "combines b and c" do
    register.bc = 522_u16
    register.b.should eq 2_u8
    register.c.should eq 10_u8
    register.bc.should eq 522_u16
  end

  it "combines d and e" do
    register.de = 522_u16
    register.d.should eq 2_u8
    register.e.should eq 10_u8
    register.de.should eq 522_u16
  end

  it "combines h and l" do
    register.hl = 522_u16
    register.h.should eq 2_u8
    register.l.should eq 10_u8
    register.hl.should eq 522_u16
  end

  it "set flags" do
    register.f = 0_u8
    register.set_z
    register.f.should eq 0b10000000
    register.set_n
    register.f.should eq 0b11000000
    register.set_h
    register.f.should eq 0b11100000
    register.set_c
    register.f.should eq 0b11110000
  end

  it "reset flags" do
    register.reset_z
    register.f.should eq 0b01110000
    register.reset_n
    register.f.should eq 0b00110000
    register.reset_h
    register.f.should eq 0b00010000
    register.reset_c
    register.f.should eq 0b00000000
  end
end
