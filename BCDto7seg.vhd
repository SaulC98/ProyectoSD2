library ieee;
use ieee.std_logic_1164.all;

entity BCDto7seg is
port(BCD: in std_logic_vector(3 downto 0);
		Catodo7: out std_logic_vector(6 downto 0));
end BCDto7seg;

architecture arq of BCDto7seg is
begin
process(BCD)
begin
	case BCD is
		when "0000" => Catodo7<="0000001";
		when "0001" => Catodo7<="1001111";
		when "0010" => Catodo7<="0010010";
		when "0011" => Catodo7<="0000110";
		when "0100" => Catodo7<="1001100";
		when "0101" => Catodo7<="0100100";
		when "0110" => Catodo7<="0100000";
		when "0111" => Catodo7<="0001111";
		when "1000" => Catodo7<="0000000";
		when "1001" => Catodo7<="0000100";
		when "1010" => Catodo7<="0001000";
		when "1011" => Catodo7<="1100000";
		when "1100" => Catodo7<="0110001";
		when "1101" => Catodo7<="1000010";
		when "1110" => Catodo7<="0110000";
		when "1111" => Catodo7<="0111000";
	end case;
end process;
end arq;
