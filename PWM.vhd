library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PWM is 
	port(Clk: in std_logic;
		Duty_Cycle: in std_logic_vector(6 downto 0);
		Pulse: out std_logic);
end entity;

architecture simulacion of PWM is
	signal cnt: std_logic_vector(6 downto 0);
begin
process(Clk)
begin
	if (Clk'event and Clk='1')then
		if (cnt<99)then 
			cnt <=cnt +1;
		else
			cnt<=(others =>'0');
			end if;
		end if;
	end process;
	
process(Clk)
begin 
	if (Clk'event and Clk='1') then
		if (Duty_Cycle> cnt) then
			Pulse <='1';
		else
			Pulse <='0';
		end if;
	end if;
end process;

end simulacion;
