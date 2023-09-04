library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BinBCD16 is
port(B: in std_logic_vector(15 downto 0);
     Decena_mil: out std_logic_vector(3 downto 0);
	  Unidad_mil: out std_logic_vector(3 downto 0);
	  Centena: out std_logic_vector(3 downto 0);
	  Decena: out std_logic_vector(3 downto 0);
	  Unidad: out std_logic_vector(3 downto 0));
end BinBCD16;

architecture solucion of BinBCD16 is
begin
	bcd1: process(B)
		variable z: std_logic_vector(34 downto 0);
		begin
			for i in 0 to 34 loop
				z(i) := '0';
			end loop;
			z(18 downto 3) :=B;
			
			for i in 0 to 12 loop
				if z(19 downto 16) > 4 then
					z(19 downto 16) := z(19 downto 16) + 3;
				end if;
				if z(23 downto 20) > 4 then
					z(23 downto 20) := z(23 downto 20) + 3;
				end if;
				if z(27 downto 24) > 4 then
					z(27 downto 24) := z(27 downto 24) + 3;
				end if;
				if z(31 downto 28) > 4 then
					z(31 downto 28) := z(31 downto 28) + 3;
				end if;
				z(34 downto 1) := z(33 downto 0);
			end loop;
		
		Decena_mil<= '0' & z(34 downto 32);
		Unidad_mil<=z(31 downto 28);
		Centena<=z(27 downto 24);
		Decena<=z(23 downto 20);
		Unidad<=z(19 downto 16);
	end process bcd1;
end solucion;
