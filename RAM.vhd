library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RAM is
generic (n: integer := 5);
port (Data: in std_logic_vector(n-1 downto 0);
		Address: in std_logic_vector (3 downto 0);
		R_W,Clock: in std_logic;
		Q: out std_logic_vector(n-1 downto 0));
end RAM;

architecture solucion of RAM is
type Ram_table is array (0 to 15) of std_logic_vector(n-1 downto 0);
signal Rammemory: Ram_table;
begin
	process(R_W,Clock,Address)
	begin
		if (Clock'event and Clock='1') then
			if R_W='1' then 
				rammemory(conv_integer(Address))<=Data;
			end if;
		end if;
	end process;
	Q<= Rammemory(conv_integer(Address));
end solucion;
