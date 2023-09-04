library ieee;
use ieee.std_logic_1164.all;

entity Sostenimiento_generic is
generic (n: integer := 5);
port (Data: in std_logic_vector(n-1 downto 0);
		En, Clock, Resetn: in std_logic;
		Q: out std_logic_vector(n-1 downto 0));
end Sostenimiento_generic;

architecture Desarrollo of Sostenimiento_generic is
begin
	process(Resetn,Clock)
		begin
		if Resetn='0' then Q<=(others=>'0');
		elsif (clock'event and clock='1') then
			if En='1' then Q<=Data;
			end if;
		end  if;
	end process;
end Desarrollo;
