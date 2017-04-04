class Register
  Z_FLAG = 0b10000000
  N_FLAG = 0b01000000
  H_FLAG = 0b00100000
  C_FLAG = 0b00010000

  property a : UInt8,
           f : UInt8,
           b : UInt8,
           c : UInt8,
           d : UInt8,
           e : UInt8,
           h : UInt8,
           l : UInt8,
           sp : UInt16,
           pc : UInt16

  def initialize
    @a = @f = @b = @c = @d = @e = @h = @l = 0x00_u8
    @sp = @pc = 0x00_u16
  end

  def af
    (@a.to_u16 << 8) + @f.to_u16
  end

  def af=(val : UInt16)
    @a = (val >> 8).to_u8
    @f = (val & 0xff).to_u8
  end

  def bc
    (@b.to_u16 << 8) + @c.to_u16
  end

  def bc=(val : UInt16)
    @b = (val >> 8).to_u8
    @c = (val & 0xff).to_u8
  end

  def de
    (@d.to_u16 << 8) + @e.to_u16
  end

  def de=(val : UInt16)
    @d = (val >> 8).to_u8
    @e = (val & 0xff).to_u8
  end

  def hl
    (@h.to_u16 << 8) + @l.to_u16
  end

  def hl=(val : UInt16)
    @h = (val >> 8).to_u8
    @l = (val & 0xff).to_u8
  end

  macro flag(hash)
    {% for key, value in hash %}
      def set_{{key}}
        @f |= {{value}}
      end

      def reset_{{key}}
        @f &= {{value}} ^ 0xff
      end

      def flag_{{key}}
        @f & {{value}} == {{value}} ? 1 : 0
      end
    {% end %}
  end

  flag({z: Z_FLAG, c: C_FLAG, n: N_FLAG, h: H_FLAG})
end
