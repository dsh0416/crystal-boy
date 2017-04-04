class CPU
  module Logic
    macro logic_8bit(names)
      {% for name in names %}
        def inc_{{name}}
          register.{{name}} += 1
          register.{{name}} & 0xff == 0x0 ? register.set_z : register.reset_z
          register.{{name}} & 0xf == 0x0 ? register.set_h : register.reset_h
          register.reset_n
        end

        def dec_{{name}}
          register.{{name}} -= 1
          register.{{name}} & 0xff == 0x0 ? register.set_z : register.reset_z
          register.{{name}} & 0xf == 0x0 ? register.set_h : register.reset_h
          register.reset_n
        end

        def sub_{{name}}
          result = register.a - register.{{name}}
          result & 0xff == 0x0 ? register.set_z : register.reset_z
          (register.a ^ register.b ^ result) & 0x100 == 0x100 ? register.set_c : register.reset_c
          (register.a ^ register.b ^ result) & 0x10 == 0x10 ? register.set_h : register.reset_h
          register.set_n
          register.a = result
        end

        def and_{{name}}
          result = register.a & register.{{name}}
          result & 0xff == 0x0 ? register.set_z : register.reset_z
          register.reset_c
          register.reset_n
          register.set_h
          register.a = result
        end

        def or_{{name}}
          result = register.a | register.{{name}}
          result & 0xff == 0x0 ? register.set_z : register.reset_z
          register.reset_c
          register.reset_h
          register.reset_n
          register.a = result
        end

        def xor_{{name}}
          result = register.a ^ register.{{name}}
          result & 0xff == 0x0 ? register.set_z : register.reset_z
          register.reset_c
          register.reset_h
          register.reset_n
          register.a = result
        end

        def cp_{{name}}
          result = register.a - register.{{name}}
          result & 0xff == 0x0 ? register.set_z : register.reset_z
          register.a < register.{{name}} ? register.set_c : register.reset_c
          (result & 0xf) > (register.a & 0xf) ? register.set_h : register.reset_h
          register.set_n
        end

        def add_a_{{name}}
          result = register.a + register.{{name}}
          result & 0xff == 0x0 ? register.set_z : register.reset_z
          (register.a ^ register.b ^ result) & 0x100 == 0x100 ? register.set_c : register.reset_c
          (register.a ^ register.b ^ result) & 0x10 == 0x10 ? register.set_h : register.reset_h
          register.reset_n
          register.a = result
        end

        def adc_a_{{name}}
          carry = register.flag_c
          result = register.a + register.{{name}} + carry
          result & 0xFF == 0x0 ? register.set_z : register.reset_z
          result > 0xFF ? register.set_c : register.reset_c
          (register.a & 0xF) + (register.{{name}} & 0xF) + carry > 0xF ? set_h_flag : reset_h_flag
          register.reset_n
          register.a = result
        end
      {% end %}
    end

    logic_8bit [b, c, d, e, h, l, a]
  end
end
