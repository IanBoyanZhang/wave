library IEEE;
use IEEE.STD_LOGIC_1164.All;
entity carryRipple is
port ( A, B: in Std_Logic_Vector (3 downto 0 );
      Cin: in std_logic ;
      S: out Std_logic_Vector (3 downto 0);
      Cout: out std_logic);
end carryRipple;
architecture structural of carryRipple is
signal C: Std_Logic_Vector (4 downto 0);
procedure FA
  (signal c, s: out Std_Logic; signal x, y, z:in Std_Logic) is
begin c <=(x and y) or (x and z) or (y and z);
s <= x xor y xor z;
end FA;
begin
FA(C(4),S(3),A(3),B(3),C(3));
FA(C(3),S(2),A(2),B(2),C(2));
FA(C(2),S(1),A(1),B(1),C(1));
FA(C(1),S(0),A(0),B(0),C(0));
C(0)<=Cin;
Cout<=C(4);
end structural;
