-------------------------------------------------------
-- Project : TKT-1212 Digitaalijärjestelmien toteutus
-- Author : Petteri Aimonen, student number 205441, group 50
-- Date : 2008-12-12
-- File : ripple_carry_adder.vhd
-- Design: Course exercise 3: Generic adder
------------------------------------------------------
-- Description : Adds two n-bit numbers to form n+1-bit output
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
	generic (
		operand_width_g: natural
	);
	
	port (
		clk	: in	std_logic;
		rst_n	: in	std_logic;
	
		-- a_in, b_in and sum_out are signed numbers (2's complement)
		a_in	: in	std_logic_vector(operand_width_g - 1 downto 0);
		b_in	: in	std_logic_vector(operand_width_g - 1 downto 0);
		sum_out	: out	std_logic_vector(operand_width_g downto 0)
	);
end entity;

------------------------------------------------------------------------------

architecture rtl of adder is
	constant outw: natural := operand_width_g + 1; -- Output width
	signal result_r: signed(operand_width_g downto 0);
begin
	-- Internal signal result_r goes to output port
	sum_out <= std_logic_vector(result_r);

	-- Synchronous process performs addition on clock edge
	sync: process(rst_n, clk)
	begin
		if (rst_n = '0') then
			result_r <= to_signed(0, outw);
		elsif rising_edge(clk) then
			result_r <= resize(signed(a_in), outw)
			            + resize(signed(b_in), outw);
		end if;
	end process;
end architecture;
