library ieee;
use ieee.std_logic_1164.all;

entity Decoder_monedas is
port (Monedas : in std_logic_vector(5 downto 0); -- Entradas
		Valor : out std_logic_vector(6 downto 0)); --Salidas
end Decoder_monedas;

architecture comportamiento of Decoder_monedas is
begin
	Valor <= "1100100" when Monedas(5) = '1' else -- código de mayor prioridad
				"0110010" when Monedas(4) = '1' else
				"0011001" when Monedas(3) = '1' else
				"0001010" when Monedas(2) = '1' else
				"0000101" when Monedas(1) = '1' else
				"0000001" when Monedas(0) = '1' else
				"0000000";
end comportamiento;
