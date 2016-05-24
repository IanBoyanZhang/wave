library IEEE;
use IEEE.STD_LOGIC_1164.All;
ENTITY carryRipple_tb IS
  END carryRipple_tb;
ARCHITECTURE cr_tb OF carryRipple_tb IS
COMPONENT carryRipple
port(A,B:in Std_Logic_Vector(3 downto 0);
  Cin:in std_logic;
  S: out Std_Logic_Vector (3 downto 0);
  Cout: out std_logic);
END COMPONENT;

   SIGNAL A: Std_Logic_Vector (3 downto 0);
   SIGNAL B: Std_Logic_Vector (3 downto 0);
   SIGNAL Cin: std_logic;
   SIGNAL S: Std_Logic_Vector (3 downto 0);
   SIGNAL Cout: std_logic;
   SIGNAL CHECK: std_logic;
   SIGNAL AUX: Std_Logic_Vector (4 downto  0);
Procedure CHECKER
(signal CHECK: out std_logic;
 signal Cout: in std_Logic; 
 signal S:in Std_Logic_Vector (3 downto 0 ); 
 signal AUX:in Std_Logic_Vector (4 downto 0)) is
BEGIN CHECK <= (Cout xnor AUX(4)) and (S(3) xnor AUX(3)) and (S(2) xnor
  AUX(2)) and (S(1) xnor AUX(1)) and (S(0) xnor AUX(0));
END CHECKER;
BEGIN
  u0: carryRipple PORT MAP (A,B,Cin,S,Cout);
  A <= "1000" after 0 ns,"0000" after 10 ns,"1111" after 20 ns,"1010"
after 30 ns, "0000" after 50 ns;
  B <= "0111" after 0 ns,"1100" after 10 ns,"0001" after 20 ns,"0010"
after 30 ns, "0000" after 50 ns;
  Cin <= '0' after 0 ns,'1' after 10 ns,'1' after 20 ns,'0' after 30 ns,
'0' after 50 ns;
AUX <= "01111" after 0 ns,"01101" after 10 ns,"10011" after 20 ns,"01100" after
30 ns, "00000" after 50 ns;
CHECKER (CHECK, Cout, S, AUX);
END cr_tb;
