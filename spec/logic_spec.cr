require "./spec_helper"
require "cpu"

cpu = CPU.new

describe "Logic" do
  it "should increase b" do
    cpu.register.b = 0x0_u8
    cpu.inc_b
    cpu.register.b.should eq 0x1
  end

  it "should decrease b" do
    cpu.register.b = 0x1_u8
    cpu.dec_b
    cpu.register.b.should eq 0x0
  end

  it "should sub a and b" do
    cpu.register.a = 0x2_u8
    cpu.register.b = 0x1_u8
    cpu.sub_b
    cpu.register.a.should eq 0x1
  end

  it "should and a and b" do
    cpu.register.a = 0x1_u8
    cpu.register.b = 0x1_u8
    cpu.and_b
    cpu.register.a.should eq 0x1
  end

  it "should or a and b" do
    cpu.register.a = 0x0_u8
    cpu.register.b = 0x1_u8
    cpu.or_b
    cpu.register.a.should eq 0x1
  end

  it "should xor a and b" do
    cpu.register.a = 0x1_u8
    cpu.register.b = 0x2_u8
    cpu.xor_b
    cpu.register.a.should eq 0x3
  end

  it "should cp a and b" do
    cpu.register.a = 0x1_u8
    cpu.register.b = 0x2_u8
    cpu.cp_b
    cpu.register.f = 0b01110000_u8
  end

  it "should add a and b" do
    cpu.register.a = 0x1_u8
    cpu.register.b = 0x2_u8
    cpu.add_a_b
    cpu.register.a = 0x3_u8
  end

  it "should adc a and b" do
    cpu.register.set_c
    cpu.register.a = 0x1_u8
    cpu.register.b = 0x2_u8
    cpu.add_a_b
    cpu.register.a = 0x4_u8
  end
end

