library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Distancia is
port(A, B: in std_logic_vector(7 downto 0);
     C: out std_logic_vector(7 downto 0));
end Distancia;

architecture Solucion of Distancia is
begin
	C<= A-B when A>B else B-A;
end Solucion;
