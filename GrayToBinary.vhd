library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GrayToBinary is
    Port ( Gray : in STD_LOGIC_VECTOR(7 downto 0);
           Binary : out STD_LOGIC_VECTOR(7 downto 0));
end GrayToBinary;

architecture Behavioral of GrayToBinary is
begin
    process(Gray)
        variable bin_value : STD_LOGIC_VECTOR(7 downto 0);
    begin
        bin_value := (others => '0');
        bin_value(7) := Gray(7);
        
        for i in 6 downto 0 loop
            bin_value(i) := (bin_value(i+1) xor Gray(i));
        end loop;
        
        Binary <= bin_value;
    end process;
end Behavioral;
