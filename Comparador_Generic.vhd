library ieee;
use ieee.std_logic_1164.all;

entity Comparator_Generic is
	generic (n: integer := 5);
	port ( A,B: in std_logic_vector(n-1 downto 0);
		 AMayorB,AIgualB,AMenorB: out std_logic);
end Comparator_Generic;

architecture solucion of Comparator_Generic is
begin
	AMayorB<='1' when (A>B) else '0';
	AIgualB<='1' when (A=B) else '0';
	AMenorB<='1' when (A<B) else '0';
end Solucion;
