library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FrequencyGenerator is
	Port (Resetn, Clk: in std_logic;
		   Clk_1Hz, Clk_100Hz: out  STD_LOGIC);
end FrequencyGenerator;

architecture Behavioral of FrequencyGenerator is
signal counter_1Hz : std_logic_vector(25 downto 0) := (others => '0'); -- 26bit
signal counter_100Hz: std_logic_vector(18 downto 0) := (others => '0'); --18 bits

constant COUNT1_1Hz : integer := 50000000;   -- 50e6 / 1
constant COUNT1_100Hz : integer := 500000;   -- 50e6 / 100

constant COUNT2_1Hz : integer := 25000000;   -- 50e6 / 2
constant COUNT2_100Hz : integer := 250000; --50000000;   -- 50e6 / 1

begin
	process(Resetn,Clk)
	begin
		if Resetn='0' then counter_1Hz<= (others=>'0');
		elsif (Clk'event and Clk = '0') then
			if counter_1Hz < COUNT1_1Hz -1 then
				counter_1Hz <= counter_1Hz + 1;
			else
				counter_1Hz <= (others=>'0');
			end if;
		 end if;
	end process;
	
	process(Clk)
	begin
		if counter_1Hz < COUNT2_1Hz then
			Clk_1Hz <= '1';
		else
			Clk_1Hz <= '0';
		end if;
	end process;
	
	process(Resetn,Clk)
	begin
		if Resetn='0' then counter_100Hz<= (others=>'0');
		elsif (Clk'event and Clk = '0') then
			if counter_100Hz < COUNT1_100Hz -1 then
				counter_100Hz <= counter_100Hz + 1;
			else
				counter_100Hz <= (others=>'0');
			end if;
		end if;
	end process;

	process(Clk)
	begin
		if counter_100Hz < COUNT2_100Hz then
			Clk_100Hz <= '0';
		else
			Clk_100Hz <= '1';
		end if;
	end process;

end Behavioral;
