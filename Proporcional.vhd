library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Proporcional is
port(Data_in: in std_logic_vector(7 downto 0);
     Data_out: out std_logic_vector(6 downto 0));
end Proporcional;

architecture Solucion of Proporcional is
signal temp: std_logic_vector(15 downto 0);
begin
	temp<=Data_in * "00000101";
	process(Data_in)
	begin
		if temp>"0000000001100100" then
			Data_out<="1100100";
		else		
			Data_out<=temp(6 DOWNTO 0);
		end if;
	end process;
end Solucion;
