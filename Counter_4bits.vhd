library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Counter_4bits is
port (Enable,Load: in std_logic;
		Data: in std_logic_vector(3 downto 0);
		Clock,Resetn: in std_logic;
		Q: buffer std_logic_vector(3 downto 0));
end Counter_4bits;

architecture Desarrollo of Counter_4bits is
begin
	process(Enable)
		begin
		if Resetn='0' then Q<="0000";
		elsif (Clock'event and Clock='1') then
			if (Load='1' and Enable='1') then Q<=Data;
			elsif Enable='1' then Q<=Q+1;
			end if;
		end  if;
	end process;
end Desarrollo;
